Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1970C3ACA5A
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 09:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866338; cv=none; b=d+Z7ERgoPztmXIl/Cah5MfRL1fajkQPGMypVt/1B9oBIFCp5kcoO0nFrgJNz1bTrfNlnN5sqs4LsZgH4MuPSWeOXyqJRUrFzN4gyGjMorSuQR/UaY137bZ02h5mZWHqLmCDLoS9hOKGWAEKLOXv1S9NscIR3AmV3tjG1qo55Nl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866338; c=relaxed/simple;
	bh=Hgv7QBj2VJ/Dph4tylg9AUwEbK+W2yWO3bKu+SnomLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7bQuQdT4e3yLQKuyxLrANQo7Pri2d6iw9T2tCU7TSf+UWUgIBks/FYdUUc37IqKFu1wd/fMOap0JSxBrBWsm3PdOpwV6ePkd8Bk0Mi3kzLYI2BECMNkEhKM+oRFH9bS6lAoRFk1M27NaZNYamv88ti+Oh1j3TIq2D6G/L4Tp6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bl6DGUkO; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bl6DGUkO"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-93f63c8592cso1157242241.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Jan 2026 01:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767866331; x=1768471131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0UMQNQize8y0H61kPqmNx/nuhGzGL/JdEumTcbx0Oc=;
        b=bl6DGUkOaR8DM2K/f+pWDr2rypIibUAApIt+rG84MnAGqWmzdpvk7fIlAyBh5vimv2
         unpmUeDBcc9tgO7EWaUm66R/SqSnsHL0+em2Fu0mKj4pSub7m3ic+GrnTf5XYD6tnbmr
         aq5qm/MaBYhI9cZ1n3sR4HP899XW/nBqCqUPpJSYYcGGCP77u8+ZHzYG0UM8tDo/GVe9
         51ODWcGARfVqr7/Xi1dYXXAbeQKexae6tKrjj+VxK37liqqsfLNbQ3C3qJE9kh4wnbcw
         LJKZGwmmx8w8n7SFKqa+i/VVs71IyOLxTy1xVGGSxprtP5C+ZY0f9opAbRriRN5Xtgfh
         mBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866331; x=1768471131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0UMQNQize8y0H61kPqmNx/nuhGzGL/JdEumTcbx0Oc=;
        b=eS1D50EMpdJQkVs8Ylh3KH1oUZqZfNSTA69SPSBtP2IjH2XsrMQJPhRX8Oh7TFvpGl
         MtI5qYEVVqguFOZXBR3O7DzOc8Dk0Bq4DprMMopOEDUXmOqCychOZ9QrunExfxaNAdGF
         cZyDZPjazcpAEEqoEI7hF41M91AS9fTi9wdiBUaN87jyj0XYatOL4fD52NDMfXEVcvUP
         Q17QEgeyxxBO+AsMUrarw/HOcEgDSlvLbZCbvsnJnrMPOckPrVaEFooWRHGdEKIs4awB
         VcUxGt5YRLWZu997+jEFiZpHEaCoZdewhRMWgskcyEqFG3ZVaFoEBnBSmZVuzHHwQl2l
         mjEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaa2OBOxAp48j9PH/y8YgSh60WeBM/cP87W/P9eGSjGXqzh/NEMxUnPVI6nFDdM4CzR/g347GeEalIVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztN9MpQOu9if3fruzVGf2OBG+1EO8l9KSLq7cmnyobWvlGFPZY
	7xrvemTqwXttrv6it3EOZ65wNzQE3DcYCkFPEeid5alhpSrJ8TmW+LgH6BAatg==
X-Gm-Gg: AY/fxX5Wzr4fSs9pLa8GwRjt54SeUC10iQnTJSMBxSZFVy2pStHvzvtrrBqZQaIzHmT
	7OhDw7SwSqLM69KjFZy3EHnGFWo2scN15So8Mdh43CKAgGw1H66kSkxhUmunZc2WcrsGKxM+sCI
	4zE7WggLVWAwmcZFsbbfGKpeCUQS9F7i3Qq9kq8vKDslbTcgYgOnCbLZVcK3deG9iTIR9F3t4oL
	h0MB5zfqcuF+oyHAuuXIm72MG9TKbovjlHFBSfE6Rnu6UYRjTX/Q435Yt8mkfux8v+inRorgstX
	7YYn78T3qWnJE5Z3E6dDFnyKTcRFjT30HIjdxIBVzMA/QAGIcAXoZf0wiXdqz/vfFkYWb3qXLYz
	3Cn4Q2QMqRhH1UitmMqFpMHGJ4FOm3vy3lcXEX+vB/pHdMyR6aOo4xubw3tN8NA6gwF9uGXAd6A
	RpYaofgtKl+4BvcJgMNsR9mM2stRjiObJS8gJ7AR6fgdmn7MBARJeaqiACMa7taYf/X9QBXnqIm
	gbK4Bvzt5yPPaowqXW7AN8hIuKxt7vC
X-Google-Smtp-Source: AGHT+IHZ2UUjx42RRlWVNMw3b1W04C9piTrC4WnPU6SDQCVTlKuzNskyckz41dtty4xhtSX8347Scw==
X-Received: by 2002:a17:90b:53d0:b0:34a:c671:50df with SMTP id 98e67ed59e1d1-34f5f95c745mr7519717a91.17.1767859772019;
        Thu, 08 Jan 2026 00:09:32 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:31 -0800 (PST)
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
	krzysztof.kozlowski@oss.qualcomm.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 5/6] dt-bindings: sound: google,goldfish-audio: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:35 +0000
Message-ID: <20260108080836.3777829-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260108080836.3777829-1-visitorckw@gmail.com>
References: <20260108080836.3777829-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Android Goldfish Audio binding to DT schema format.
Move the file to the sound directory to match the subsystem.
Update the example node name to 'sound' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- None.

 .../devicetree/bindings/goldfish/audio.txt    | 17 ---------
 .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/audio.txt b/Documentation/devicetree/bindings/goldfish/audio.txt
deleted file mode 100644
index d043fda433ba..000000000000
--- a/Documentation/devicetree/bindings/goldfish/audio.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Audio
-
-Android goldfish audio device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-audio" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_audio@9030000 {
-		compatible = "google,goldfish-audio";
-		reg = <0x9030000 0x100>;
-		interrupts = <0x4>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
new file mode 100644
index 000000000000..e0b26c1f7b8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,goldfish-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Audio
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android goldfish audio device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-audio
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
+    sound@9030000 {
+        compatible = "google,goldfish-audio";
+        reg = <0x9030000 0x100>;
+        interrupts = <0x4>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

