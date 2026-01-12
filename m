Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F57082F
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 20:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768249556; cv=none; b=bOBxplPGCqJBET9cuuPXLjtM1mTanGpxmycaZEVUIK8zWdTcThqUG5dZcoYGas7vRDM6AycxwHZrzGNzTvazd/D9CAvwtIwESLz0EH2hINcjFqIIMo6bOlej0x3pgFe565X0g5GD3DrNoRtz+0/Yc6JG8EKbR00gAL2K6o0581I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768249556; c=relaxed/simple;
	bh=GTLyrTF/q6Eyc9fZ3Fa8bSl/4UWeB/Vses9dYwQVfyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOVTEXyFQ1gZUltA9pk9iw7W/rQyfOWymq0HSGmgogr366B2lwu8HvbeN1PHu7H6X2geLMEj3Ze8a/MFiDu6I1ran4iDc11fkNar5ss18wiRWPm5eeqiEWuQBnjb8tv3aGkwsUuhxz1+i4YErmEf1chfwTogUpX+k8/hTSaMJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bkc939PH; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bkc939PH"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-65d0f5fb26aso3163963eaf.2
        for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 12:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768249554; x=1768854354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL3a/4UaA+a8Zff5y8gdtJeilEUr13wkA6OARJeIofo=;
        b=Bkc939PHzAaRntqww8iMUdbS0UBcz9i4COfBUiyQ+KLbsAPsBMj4EKTC24WL4lvr25
         MTXAu526Gu6/vQ3jhYlXUq6c/dc2jFs74cTPFDlb7h4p8cQHwt6FRcI/rCqMksOncU+d
         2z+Q39F0h7AFAetENkcUIWnEiIh/pt2xgmzX44YAOZQdQ/IXHN0ZWG6qZuET7d9MgpJP
         3/gFYTom4hs+x8V05uYjWwsiVyxwyHpCfRPcnbxnNncjFdfHKh3+7oOjnDjMKK8tJJSE
         876NELHTKVp4LaKstU9Uzxpw61IhD+5CU10M+SiJSbhMkDGhjFM11Sq5DzPgiwCvBVLm
         MplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768249554; x=1768854354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oL3a/4UaA+a8Zff5y8gdtJeilEUr13wkA6OARJeIofo=;
        b=FmW2TOp2lHJcwHq3TeVZgaJTSXiuT4qjrJItuCCDQPTPH/asWOUU2cx+QrjI/pvkCV
         RRtrpjMnr5NYJZyhwkhqZe1tnLumMY76hScmIwqe8gLZwrs7SZ16piZvklEdEvSMuvT+
         KJUGsD7xh9RYdPHX+Edr7QZRDXSz0EOBIVd7kqrmK2TReSSKO5uNZyEubRNtBUlGgiWm
         Gbv8qu8dH219KTj59o92sTP8dE8xtix8kY7Ufx44DanQavb+5yULWys7KGQrRXVb4Rqr
         c8+3l+O20x8aIw+WYCo7tWmp5VW1bFRIhtkkoMFsy0v4/CmkVkxqz0vbCLWC4FVytBc9
         q1Zg==
X-Forwarded-Encrypted: i=1; AJvYcCX/DhJzfjp3sjKR2wH1gW95bJ2IU20YylyXClTumcvOT3rZ4v7dKndTFHmXDq7Zp4WvOyi1o2DbznYing==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI6ICXxM7DOekjPUqz7ijiCknAOgEB1CzkBTuVoSzmUsO6uErc
	rZbwv0GpkKVXOrXu7WvpyfzDiNJUNmJ1PbSjG21POWYJPXYaQJS7t3jKDKVPvw==
X-Gm-Gg: AY/fxX70cZCt2ahdqimfJwy7Q+PV3HpwtsUuc+3aGMNjq5qAo4vgPd5QZRLdtDoPEpq
	/vRveYBznN4Cx4PC9raXAUfQwfaSNX1xTB7srGq6OZUCo1p35rSiwyl15HMQ+NeGWItWYKyIVbH
	gRaSaDmhBFypUl53tQU+u8MBn8HYnFq/K7ULKHe2r2UspU0VpOAnORBisu4SrqDSjT/cCaI271p
	rVwtz8NvbkAyGKssyXCMyB3zytjccra3PgBICZihtDSuXcfP7J/zFu0VTGC8nCtOV+CBhwscUOM
	aePpsPmb6i3ca6YZ8ylRJMnvfVHYmt4dmdaxxgSoGx70YpJ6SUT6zbozRWxSteeo9oMjIJuUVSy
	ujkQmARIPL0nWS6jy2kZHfC7aYaB0CHpjw3qH0VR0kOXWyDEZRr7JeZh5Ns9OpZk9ZkUn012Sxi
	R/FVae+myK5daci8q1wAvG3q2DhwWH7juc2RZcX2s94wYX4cLfw1OE1cO1m47xD5hUxdbpf/659
	op/YBHjrycaaBdS5JPH3w==
X-Google-Smtp-Source: AGHT+IFAodgf1HCpii8yqntRagZFeymJlZlYuy8XB+cGQHdG7vRM/mtdZt981BYzjdhg5eNahHLaYQ==
X-Received: by 2002:a05:6a21:6d8c:b0:35f:6e12:1862 with SMTP id adf61e73a8af0-3898f94c400mr17035763637.19.1768243912001;
        Mon, 12 Jan 2026 10:51:52 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:51:51 -0800 (PST)
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/6] dt-bindings: serial: google,goldfish-tty: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:39 +0000
Message-ID: <20260112185044.1865605-2-visitorckw@gmail.com>
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

Convert the Google Goldfish TTY binding to DT schema format.
Move the file to the serial directory to match the subsystem.
Update the example node name to 'serial' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- None.

 .../devicetree/bindings/goldfish/tty.txt      | 17 --------
 .../bindings/serial/google,goldfish-tty.yaml  | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/tty.txt
 create mode 100644 Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/tty.txt b/Documentation/devicetree/bindings/goldfish/tty.txt
deleted file mode 100644
index 82648278da77..000000000000
--- a/Documentation/devicetree/bindings/goldfish/tty.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish TTY
-
-Android goldfish tty device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-tty" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_tty@1f004000 {
-		compatible = "google,goldfish-tty";
-		reg = <0x1f004000 0x1000>;
-		interrupts = <0xc>;
-	};
diff --git a/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
new file mode 100644
index 000000000000..0b702c8657c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/google,goldfish-tty.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Goldfish TTY
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+
+description:
+  Android goldfish TTY device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-tty
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
+    serial@1f004000 {
+        compatible = "google,goldfish-tty";
+        reg = <0x1f004000 0x1000>;
+        interrupts = <0xc>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

