Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971FC26FA57
	for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 19:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767124716; cv=none; b=GIT2agem1lbnEoA2Ae7wP5bqLVEpTLkwFG3IunqlFNtN/GGGAGgUPvsum0q8ZFoeGuS1/mOGp6YcIUCJjMa+2DHpFVwc/8w+HJ6+jCYvzFlLaB3XB87jESAun6UtAf9VkHz3AWHRlyGXrXj12CF/hpO6zxMcQNcOXLNwsbJQLMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767124716; c=relaxed/simple;
	bh=wuouABNtno/my3xxB41xPlJVygP/E24Aj/Ddg3O+3RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SV2IxapOBnp+l1lpy5UX8Oh/HflstTqpFjyZkzmc8xgKX0FRbyzQxlBSHOC8xCtfdzdj8HpdpCn9r8j717fSCFJ08NbeRmAXfI9XCjmvgHyHXkElbHk3cjgUVNa2/ggsfJp67D3j6dn6MC7/Pv6OpgNlhwJhdnD/OaW/hLT6Y2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+w/gLqu; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+w/gLqu"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso8592711137.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 11:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767124713; x=1767729513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY9DKWu7ggurjBP9bHM5tPTMCGUI+TAaWzZpacbdf+Y=;
        b=b+w/gLqu3czndoutILXlJOf2JSpO8qzaMBn71mQwFhhuPN9kYPdb5fv5G0QogCi43O
         96JmNvVwtlmvMrZfRm+VJ00SpA1DYpDCjF4qVEitUtXTfd8zEtR1+WZvwwhIbOuo/cUO
         ilJ5WB/lp+mOi5LjljtlnGBvBmdH1E+IvyRH3vLpHygXNhHjq1cPjFfOtI2HxPT0MAuh
         3a69CdPDv4InvcTpMt5q4odjUOqCISgvQflitypc7eQq/rSKQKPldWClvYHCxCc+kZIl
         hRZJviVcdfADdk65t77dBElnloW9PmGKG2KPAQxE5YU3dAlCS5WsLOMa8KtNhOVZCsJb
         8aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767124713; x=1767729513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eY9DKWu7ggurjBP9bHM5tPTMCGUI+TAaWzZpacbdf+Y=;
        b=di79oVxP5PlgqImx1784Ztdkf1pCNA+O49TNuVO4gxuNnJ/UX0bdkp6p+Q0RrLsc6N
         tpBWBkkU5z5m3aaLkMO6R/iRSBBN1nRa5y43rqYz9DaWbg28kVqfXDTPh60xPHh3C2ad
         Ksh+Z7Y9aaSIqJnJ1hm2vxSdaF3Hj6p14IAP52WDTN5LreWeadFueAY4wgt93dyrH7/w
         I1zbEDt5dGw3dMT1T7uLEOU+kiIpIG1Ngqq5+QCue9vF04GlFEXWtHcka4TnQF1A10Z+
         FurAEiYhycvkMRsmkFazyj1NNIQqXKuU89gR4s0LdycYDIv01M1UvRUCKY/WTczoxP+U
         k/sw==
X-Forwarded-Encrypted: i=1; AJvYcCVoB+DiHQ/v7eyYKICecVbH+r1FAJM5gHCD0Vs8Qu37YKNEhBNEHKt4ru6gtmDC4iJOwZQxSFdbXRlFVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHiiShH48SPRb6qBTdeJUTCoZMBoVeEmj25EXdavvBWbOs4IAM
	R5d22MYyagyaWqtniTQzzuHxzrIkKdU9Nb8+n920nfKDFEsEZjWMvb7Ini+l9Q==
X-Gm-Gg: AY/fxX4HTfNlrRj3GUXWQ1KADRxQnZOVg8QzgAMDthI37O34Qd0NP/9/fKu454K07VH
	mhn1Q6CvRLZyJ2HCcU20b4VzpAuah3YaqwhuX+vHoJsjq23AQX/dS0jFkGLJ2cXPBuU7p5s6FOU
	TESPUj9nRqIaq2B4DaVMO6Q6bNrF+bujyTNOgmNppCrD3L7wXoSbkeSw5H1Lc3faLjJmPiqYAzS
	9sUnhYyvPWXsEGCKW/zzZ5PTZ+OQDWSzHfLob7zNF69iO/V6fIZ2M2DVYxOTGCt7MYsP1t/uVPe
	eZF8GYT7/bpL6HhD3m/hiKAOzizzu+XxtUpun+NrDzzV9utI7LhowMfJ1xHj0mc99njuswc+zwY
	s+9ZX6js40hHam8GAcqwnaVB8/7aSSaKT/Fx0Qj6ytcjhwU7zekHKriFvS4HVbWjH1RSkAHMqUj
	nWZIAEomiVBa5ccV0shWnO4eAiNZRb/JxDnjDqKeKPsPOIboTkV8t2+VBh1wse3QhMm/XoNB/Lw
	IMd04DEIXiMNPFlbJFzDw==
X-Google-Smtp-Source: AGHT+IHNSjL6XO/9GG+VQ4LJ4CyetXEzcsFuGnG9Kdw0+OI361O47497s5aMUrTFKuua6BqPpBWyVQ==
X-Received: by 2002:a05:6a20:549d:b0:35f:84c7:4012 with SMTP id adf61e73a8af0-3769f92fca1mr31561858637.29.1767118275492;
        Tue, 30 Dec 2025 10:11:15 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:11:15 -0800 (PST)
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
Subject: [PATCH 5/6] dt-bindings: sound: google,goldfish-audio: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:30 +0000
Message-ID: <20251230181031.3191565-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20251230181031.3191565-1-visitorckw@gmail.com>
References: <20251230181031.3191565-1-visitorckw@gmail.com>
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
2.52.0.358.g0dd7633a29-goog

