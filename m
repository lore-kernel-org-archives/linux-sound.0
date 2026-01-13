Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA86E38BDD3
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302196; cv=none; b=YGTAgIbNgjdXYmmi2ftvS6aRb4R4rOCcEfe36NbEVfhxjNRcpCtLvZlD+K01vSaBo57pb8ahIGGBCL+jdhsIGgKUpdNwSob/gQxIDDpPXFVy2jBIV+Xw9Tes5OROookh9YWjmiZvpDbDpSe7OD0K8mH0hGqI92uWch5XIN/q2eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302196; c=relaxed/simple;
	bh=6pLYfVuIQXu+6i9yGbsc8JllWJct6Sa1co6E2UbDaRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ga/v/C03cVkOjJJ140mpA6AeJIQyDEBufHAloUWmVOLbSkQpIXDv1b/3G7zqcBOtWwpOMVVJG5YkwO0fofkN2m6EKgL3mXn11lmc9BPudqtqpSI+zv/DGah213Inw5tC6j5UYKotiK2MRdUb9aq/XhiPUBSmV9fMWwAHZlq6E4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQQhyWK9; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQQhyWK9"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4f1899960f0so80661341cf.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 03:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768302193; x=1768906993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyUyxp8wAgf/XnChDYwKqc2QzM4UH8wRrO9JxGpfnDE=;
        b=JQQhyWK94YnlhOLzKHz/WhPuETdltL4ymqjwjRyh8CRZd+1aGYUXc7W7AoVzadrygF
         RgomtvzrzK7DmNmqbqjAMaREsQ48eUU637HuNjv1zjbtDMstsVO2ou96SuMQGQ5+id5l
         nxu8krvqfrdwA3A/s85ioJstV01arkOLYZEm8kI0Ia3Mw02VWocPfOoDVEPG6KwUWiYe
         DCkAhzKoG5ZNxX56KzV8XqIVJJrABP6iyJUs8G6savJCo6bkRb3DdrZ9kBdCS9MiJMlc
         uEsa6/SyWWKuGYm8yddltTKUtVNwRpMykrgIYVn1+jTSFsLXubM69V//V7+rzwUSOSgf
         KWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302193; x=1768906993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zyUyxp8wAgf/XnChDYwKqc2QzM4UH8wRrO9JxGpfnDE=;
        b=CiB9kBrJseTAsuacnji1Zc26VAaLxNP6fk62nyUtmpmKp1Ozo2v3hfi9xhodqqBEUx
         aii2BZ8vcgzaa29RZLfJJ9/0SskORDNH9seYLQXleGWIaJ427BRnUgk2DyvE0H6U3lvk
         f9rSdYI5Gs6z/9g0VzVnHQ9otPjikUxR2qqv19azpVV7U1SlZT3vwNH0Wr3jyhuiahX6
         0cOb10s8lfpNPr6F28PYeZfVdtTAZB2ckWs3+U55zufidCY7eCFL3N4EdGF1kvn8xLLT
         Y5RL4TVJZzf7ZE6+CYJNI7uALR2EbZVUzPeZeodLwq7JzD0XDDL6ohsg4o+PAD7ttLIO
         OoPA==
X-Forwarded-Encrypted: i=1; AJvYcCX8DVl5LFha3Cu3saMcs9HmFhOKmZULA+p2P5QdVMUFv7+ol5zczWJkCUQHfiiBBnteaFcH1TCG+4EbOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPq+rx62vZbskxbGTTpy1p209mySk6JXdYc/vfqKPifad9fEyd
	LLou3cD5PaG58f062oHgeyh+yxSdVd2IXlFn3gQ+SvS6+qrDp7efik4VRqdF8g==
X-Gm-Gg: AY/fxX6Y/GUaPQ8kBOpjGKw2zly74/l98Jfqn+neQS3Pk9OFAuN64ZQTxwZEsawy84L
	E8PFsBSlEl5hwJDgDqGmS9GON0F7Jr2GUJZjE/3RSXpKegMOnJU8IkGZfWLG/NcFfF+vO+z2MLA
	9L/zSVqdiwgLp6a83yW7ZyUJphozql4jlf321rOHzyEd6tPsZr9EGpd004I137BUUqg8+S58IWq
	6eAENHZjSGtJeeLvMTOhXBpWygW250kp8gkHZM/5fIqfVQZp9hdYT5gHgleRJHyMAvPIwuMM6ux
	TL5Y0myvrJ019Erx8GLfGDhfJ2GoSpOi0eiUt5oQKM0tBYjsNvkhjg3bJLcZywcTfxpzfqGhaGs
	8yopqQXwRhhGU/StMiIiaE22Ig9W5jTyzNMqE5uHRvg1wF2BEpUZIS89gjE6sIS6gg3n+/Dxkmp
	hqfn2aJ9sD3Ztov4+r6HkRA7b1KwCU/y6WpjaEhMDXtklcci8DieQVXtbsTfBFw4/SRS7hu6kbs
	3lXQV2QjI+C04/IIoPlRw==
X-Google-Smtp-Source: AGHT+IEQYBKDIx5Gyb5nb9QDIlP5wjHoYpr1ATatTX3/LBRfDVJ6GHb1+HOoMcW7bBTYInLSSSdvlw==
X-Received: by 2002:a17:90b:1c07:b0:32e:1b1c:f8b8 with SMTP id 98e67ed59e1d1-34f68cdda94mr20382740a91.26.1768296395660;
        Tue, 13 Jan 2026 01:26:35 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:35 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	sre@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v4 3/6] dt-bindings: input: google,goldfish-events-keypad: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:59 +0000
Message-ID: <20260113092602.3197681-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113092602.3197681-1-visitorckw@gmail.com>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/events.txt   | 17 --------
 .../input/google,goldfish-events-keypad.yaml  | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/events.txt
 create mode 100644 Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/events.txt b/Documentation/devicetree/bindings/goldfish/events.txt
deleted file mode 100644
index 5babf46317a4..000000000000
--- a/Documentation/devicetree/bindings/goldfish/events.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Events Keypad
-
-Android goldfish events keypad device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-events-keypad" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish-events@9040000 {
-		compatible = "google,goldfish-events-keypad";
-		reg = <0x9040000 0x1000>;
-		interrupts = <0x5>;
-	};
diff --git a/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml b/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
new file mode 100644
index 000000000000..4e3a010a70c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/google,goldfish-events-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Events Keypad
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: input.yaml#
+
+description:
+  Android goldfish events keypad device generated by android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-events-keypad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    keypad@9040000 {
+        compatible = "google,goldfish-events-keypad";
+        reg = <0x9040000 0x1000>;
+        interrupts = <5>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

