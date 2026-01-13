Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868CA38FEFB
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296422; cv=none; b=EZnPrrsJvUgkEEQKl5+qieywBL9xoI2tweYki6cZx7j6B/50QkwO0ZKKFClbbNVVCj/TfwJaXAdG/BRycJguUuoVdeGjCjX+4xby9qWNQZcJUu5SfVq7Z6S+U9q6lsPJgVsiR/911kXFUMjLdbVTA1WojH3fors9K+gAXqNZnlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296422; c=relaxed/simple;
	bh=+L8oRv6c4uzxGnAOgO1ncLSet2u2lLn2QoYO/8E8mV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTXd8RX91nlhc9NsOZfW0dTcFroW1YgKt/F++GbTQDKASEU0AqBZWqne9fJ4O3RKhY+lf1VHh8Dkyjd4bkdbk5v9rOqqML59NgQ03NBkMMzO2ST4z47EqlTeHyPnSbkZmcJNA1wx+g+JlvMBPvOcFiWPTu+vwDeA+Wy02DCRDF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kySEflIu; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kySEflIu"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso5203602a91.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 01:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768296409; x=1768901209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aq61suyXUukebztJUE3K7EWOiO6kPR6U4DExpN7jb1o=;
        b=kySEflIuUilN0f+EMaydKBA+7sgyMwOtjXgaAgqis3XYlF8IEIrAIyWTXjmQ9vPspd
         qEfbh4uf7kSUOL45OkXUhCBp316mYLdJOJM3q4Q6o/sGcJ35XMyytep6RHqisQ7Whjo2
         4wqLZma26ll0xwmeRdVR1RzDW1aBP3twbXfbReM4SSW1lnyVrf1q1Rl9bhiPhF/Ltz56
         2FMco47ydttcGqeJLFTNQVcn021tvufj/XJbkJ8MJNsaW34/kGyz4M8jLma+wFDhfBxr
         wmlFndAULJe3xYfMhZDJS2jdxrhyWZVz6qU7cD5bT3PUVzAOiRkWL6a+2HKk3iU78oRC
         CtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296409; x=1768901209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aq61suyXUukebztJUE3K7EWOiO6kPR6U4DExpN7jb1o=;
        b=ry0xPXTmfQ25tf0/FQZuxiKjbYZ+yh4LHbi2Aw1ybT0C8dw97pnwHX51BfT97jDfk3
         RTVt+LUVPPfpIEtDwjd0ePS1YQVMzUZCUcMBJ6k3zruADRH2K0mo2GZt7bWT536mmkOZ
         m8V80qigetrelWl/Sy5kWzmcTB/imr0FMxo+22QdMFWpFFQePWkBkCY/zDHJq71jenFJ
         fvIRTaFLWgI4Yd83Qs5WZSeZR4izopsqrzklosTfZIRadTmPRk1i3mREvJqswMiT4KBc
         yCjUzBNjd1iyr1YMmspiVj2pMPG492wBJ15GYED8n3zPWsoW5LyVWlcE8BmM9jUpQA3b
         yeRg==
X-Forwarded-Encrypted: i=1; AJvYcCVw1h497+k5FZa5yz/popQsQMkz5sB686TxB6+f1ttjy3/WanCKuuUKRMOZqTApLXWTVvDfKmrPV1bIFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJv/mptaLpnkbrPbd7YDAtwkItR+EyDkXqBz60hA0sHCxs5gK3
	x0Tf8E/XIJwBf1eAYlg+jifuUDzS2FlO2ehkhwXUn8XyHCs1Jc/MJBLk
X-Gm-Gg: AY/fxX6MZV8iFwv8Ot1wRb4eKZXzlKudE1zeVtwZ4uoBjRXdHw9bLoirEyLYA2WEJ4X
	iZs8ZFYuuuMybNYb033KFyd0AzCXmVGWaL7iVToB4I2kptaZbtLg64nE2LoErKymkrlW3H2pORz
	DfVgIlV4c7BBxC96F8NrVrmUWrYBF/5Mrkh47heh3Nk8aoojONqDXq/jMu7nF1UpGDpWnwJhIsX
	DAPY9srlI4aS6QxDj0Zqf3vji9U9iyidLT6fUFCNbz7zvJRzKtSNsOyITwUzYxPIn7Zr+nOFMZF
	L5rrJlD13jVC6WXAyBVK/P/RxCjpDdqTCjrppQks12/+k35ekvJBZ17J2bND36hD15rEB8sBJQT
	gmSJ/4q4eMc1KhAvLYL9hKeyeTfp7nuMGObNo2/M5Ib6C2uoD5qfyo6OXl3bmTPOB8AJhGiOn9e
	DjZWLxSZYvXZBW3ZKBCE85bDu91fbzY4jMufCzDYcesiHUB8Y5+6AgJHt/DEN7BO22a2p5iSp4T
	ztYtmlQOh17lfM/cvOpRA==
X-Google-Smtp-Source: AGHT+IFysOWrChXhSoJPQJFZ+6qYg/6GiILncbhIBk3UgY6IvdbI61uVn8gPqLHEqaP0DqKTMcvR7g==
X-Received: by 2002:a17:90b:2647:b0:340:dd2c:a3f5 with SMTP id 98e67ed59e1d1-34f68c30870mr18506943a91.3.1768296409472;
        Tue, 13 Jan 2026 01:26:49 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:49 -0800 (PST)
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
Subject: [PATCH v4 6/6] dt-bindings: display: google,goldfish-fb: Convert to DT schema
Date: Tue, 13 Jan 2026 09:26:02 +0000
Message-ID: <20260113092602.3197681-7-visitorckw@gmail.com>
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

Convert the Android Goldfish Framebuffer binding to DT schema format.
Update the example node name to 'display' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../bindings/display/google,goldfish-fb.txt   | 17 ---------
 .../bindings/display/google,goldfish-fb.yaml  | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.txt
 create mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.yaml

diff --git a/Documentation/devicetree/bindings/display/google,goldfish-fb.txt b/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
deleted file mode 100644
index 751fa9f51e5d..000000000000
--- a/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish framebuffer
-
-Android Goldfish framebuffer device used by Android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-fb"
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	display-controller@1f008000 {
-		compatible = "google,goldfish-fb";
-		interrupts = <0x10>;
-		reg = <0x1f008000 0x100>;
-	};
diff --git a/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml b/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
new file mode 100644
index 000000000000..36ed77cbbcd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/google,goldfish-fb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Framebuffer
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android Goldfish framebuffer device used by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-fb
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
+additionalProperties: false
+
+examples:
+  - |
+    display@1f008000 {
+        compatible = "google,goldfish-fb";
+        reg = <0x1f008000 0x100>;
+        interrupts = <16>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

