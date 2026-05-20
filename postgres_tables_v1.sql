CREATE TABLE IF NOT EXISTS business_rules_v1 (
  id SERIAL PRIMARY KEY,
  request_type VARCHAR(100) NOT NULL,
  description TEXT,
  required_fields JSONB,
  email_to VARCHAR(255),
  email_subject_template TEXT,
  response_style VARCHAR(100),
  confidence_threshold NUMERIC(4,3) DEFAULT 0.75,
  extra_instructions TEXT,
  priority INT DEFAULT 100,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS requests_log_v1 (
  id SERIAL PRIMARY KEY,
  session_id VARCHAR(255),
  canal VARCHAR(50),
  message_user TEXT,
  request_type VARCHAR(100),
  summary TEXT,
  score_confiance NUMERIC(4,3),
  needs_clarification BOOLEAN,
  missing_fields JSONB,
  extracted_data JSONB,
  action_recommandee VARCHAR(100),
  email_to VARCHAR(255),
  proposed_email_subject TEXT,
  generated_email_body TEXT,
  status VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO business_rules_v1 (
  request_type, description, required_fields, email_to, email_subject_template, response_style, confidence_threshold, extra_instructions, priority, is_active
) VALUES
('reservation', 'Demande de réservation', '["nom","date"]', 'resa@demo.local', 'Nouvelle demande de réservation', 'professionnel', 0.75, 'Vérifier date et nombre de personnes si disponible.', 1, true),
('commande', 'Demande de commande ou réapprovisionnement', '["nom","produit_service","quantite"]', 'commandes@demo.local', 'Nouvelle demande de commande', 'professionnel', 0.80, 'Vérifier produit, quantité et délai souhaité.', 2, true),
('ticket_support', 'Problème client ou demande SAV', '["nom","details_libres"]', 'support@demo.local', 'Nouveau ticket support', 'professionnel', 0.70, 'Identifier si urgence et impact client.', 3, true),
('candidature', 'Réception d\'une candidature ou CV', '["nom"]', 'rh@demo.local', 'Nouvelle candidature reçue', 'professionnel', 0.70, 'Identifier poste recherché et coordonnées si présentes.', 4, true),
('demande_generique', 'Demande générale', '["details_libres"]', 'contact@demo.local', 'Nouvelle demande client', 'professionnel', 0.65, 'Demander la précision minimale nécessaire avant action.', 99, true);
