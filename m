Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E4B280324
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 20:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250614; cv=none; b=lr8FZr36Ada1gvP7jRe/ydR5qzPHp5mvrrUNbETjLC9MU9y/vEfzDxFrPJqP9ZoW9HhcozAETt8MXb0dOBHZzvgjQzsJ/gleJvHeQalFX+5ne/sKrerEZQweTHv4608+AqDlUC1l2avb57TGST5unGAKRxu6IUuzIjn8pIcGp50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250614; c=relaxed/simple;
	bh=R975+6cFhZbxfj7AcmB2qCDxz2fjGpYeQFlJNfAlsrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtMQdu2Ff6F/I6ygm8LrQFdJSSKFW4ek5k4G6OjkFs2J9Of+r+/OxdpJ8W2bMPU4z8aTeOd9rFYlOxJjXe8UhKeS4nZBD7eKqsWDxDPIGBj6UaATB9pWcIIepI0e6LpJQuLJEpyf09CnNRbq9CG61ri0q1SBMV60dlDevXFddQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZktjRwV8; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZktjRwV8"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3f0ec55ce57so4753731fac.2
        for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 12:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768250612; x=1768855412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcjtfYLr/hzQ7i+u9m84wCmIOhDfx7TiS5rWTLTDi7o=;
        b=ZktjRwV8kGJTlNGNArAYFX54+iBvoRwDCWa+eCw572P9SMhUaFH1RDpQM4xHXbIaqO
         SG+xw3lP6hnfrnUbMSXAkuQa6P9snPBWh5XZYY3tJdg1SQ9TOs2zGSX11NvdIkTaARYb
         d6XvAq2lhc7H402k91dJ7wVRbFyFjxAFRnNz2RzTieErXmjtT0NOo3bZ9XsI+Vg4wRqe
         Rm1t2n2DtsAfNqUNEjQdPUEY6EpucEs177vL/7tiswIa8LpqKswTIdLmV+jdvCIX2JD7
         M+kfnp+znIoAn5W8IriZnjb6SvDcP1X28NBMynnZNPZIUE1hGSkfOtAnADID4HkYYy2y
         iNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768250612; x=1768855412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcjtfYLr/hzQ7i+u9m84wCmIOhDfx7TiS5rWTLTDi7o=;
        b=HZQx+Y4q4A9Bl448hxwkx9cHI16JNsypVorvZSbh1iPiicWRrQfixzrO6aEe9eZG9c
         +iqM7sUrjIBTRcaptgWx1ZmMeCiQEghWjeNapQMvZbYukWpMIwwkJrDxyD5PEiuXhs9l
         /p8pqXF0kUSjnDySlXOimBn5uwrQ+1v1KaeHJPNaSpSm7+OUr8p9N+0ajVGC1m88uYzX
         9Pbda6W/QSJYs+JdUbk6QHevtPTt2SgqcFIOjY8k1AsUDY29ELrS3JpY1z+0x40xxg5/
         XktJNtB+EtHVKj+v+BFt4ixpHGdREyudt/dC5g3v7qf46hZZN1YYHAwHWXuoo4tk2ZiA
         kDxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfPCZHfh0GhviacWI+0AST+M7p9pfvlOLpOe3xdKZKJI5zexp2Pm2/bTGYSzu9uxDK1TPCFaIum+3s0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW9YxmZK6TQrBy1w/T60we9h0c7v/oSXpuADSJNqDQC9P9HMpU
	AJMoBAViyx3aeQl89RawTGxejnEens+bbW6P6ENMQLDnPuiDFo3PMGxK
X-Gm-Gg: AY/fxX6BSr8bMoPgM7b/k4oYhhtHxQhDsW8bchpUHMciNxHJ5p+sK7sxmPP4yYE8Vwf
	c74tfPdkcONLqsksHk5+JR0jDfjM7uaxk8WgoVKbIwwMwO39VRgvHWmzKMcpkLpWsjsrPzDpbcU
	/RGcLLjxBkCSHX1PEyf1KbuP700g1dzrTOYWg99y6mjjCf/y2U/O37pgrKtlcfluHHJVwqcgoWr
	jMSuRojLkVAnBCw/73BgGJk7xx7dAKl8qzeZGf4O8e/nSlTQAAXe8GEZUVZbjs06rm03xSrMdre
	DxrO7JrFivRhd5H8aIEz62q8epxatMKyDE6HYKdDqIvTriDqDUHQJIoI7A8IRF+EHxUzBjSuyvN
	oWK/tWaLUWoSAzz95yl1v05/XR4Q93Dwrjg1PH1QHIBmV1CudSYCygFKRSsdr+wlE7BvIoxYDv5
	wipa87/TlxgCDDFKPFIxxkoQ3+Kn+H5Yf89eyy2e3cAosXeyghmrurKtpKZTrDiunhlon2LyRd/
	lXmo5q/xZS5OOKipBYCD84MZaEatATh
X-Google-Smtp-Source: AGHT+IEhhjkMRhLtfe06HmVUiVLdJt4MdPUnRHhK5mx9O/EoN/yul2X9MrifSFUaAnpKZe76DRHW3A==
X-Received: by 2002:a05:6a20:430f:b0:366:14ac:8c72 with SMTP id adf61e73a8af0-3898f9db825mr17301674637.72.1768243931042;
        Mon, 12 Jan 2026 10:52:11 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:52:10 -0800 (PST)
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
Subject: [PATCH v3 5/6] dt-bindings: sound: google,goldfish-audio: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:43 +0000
Message-ID: <20260112185044.1865605-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260112185044.1865605-1-visitorckw@gmail.com>
References: <20260112185044.1865605-1-visitorckw@gmail.com>
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
Changes in v3:
- Use decimal format for interrupts in the example.

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
index 000000000000..d395a5cbc945
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
+        interrupts = <4>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

