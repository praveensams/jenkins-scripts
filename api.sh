curl --request POST \
          --url https://api.sendgrid.com/v3/mail/send \
            --header 'authorization: Bearer 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' \
              --header 'Content-Type: application/json' \
                --data '{"personalizations": [{"to": [{"email": "praveensams16@gmail.com"}],"cc": [{"email":"sambath.p@extra.com"}, {"email":"noreplyhybris@gmail.com"}, {"email":"pallei.p@extra.com"},{"email":"goshika.k@extra.com"},{"email":"poojary.t@extra.com"},{"email":"kancha.a@extra.com"} ]}], "from": {"email": "praveensams16@gmail.com"},"subject":"Mobile app is not working", "content": [{"type": "text/plain", "value": "Issue with mobile app"}]}'
