Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6596AEEBB
	for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 19:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767123934; cv=none; b=AwrzbEDuqqJx0hC7C6wsLrkxlUKUsy3e+aEry+bicXKD3iRoF0t3ZuboCvNSU3kvYZxIDRaabCeMhvWiPYZwqpJmGNbLZRMGVprbJ2YfoUbjQTO+9KAP9DRa9RZQXG4Bnhg6ihLTSXjKDh0NOdSKYjOkyRtf6MlcUGiGJ4UPKU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767123934; c=relaxed/simple;
	bh=dBZA5ta8Wg18huaW0x593dUQGODH+A9HatruQgqiYAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuksgIsWMtJYe1OAm4yOv0lAcuEapTqbyMzhj/G72W5CbLRmPK2zo09qXMrP42y7Ua/nzmATQIMO24xnfeQtzgGDm6i6kbV4We5HsD5jAIKgXDcgP8p5146YUaXDGt9oCndWasBwc+GPOuJrtLYXk6Jpy+WRE2i5HDHMkxm3p84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMNASHqE; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMNASHqE"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8bc53dae8c2so1573029885a.2
        for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 11:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767123932; x=1767728732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cweyuKIwKmSRdsl/r/hQ+dHMBlDfUCmP+2wWQS89QfI=;
        b=JMNASHqESEsxrMc21LET71CJaYmWv76uKrKwnQmdmXgajFAB3i96Z/GjqrBRhsgrCe
         htKgM9CE3WYJSEZ3d6u/nYHECjIqMaTwaFGGwjDCyJWWrYxBgzhP5PnxHc162BK/tjT4
         EthBsbDuGQdoNLJRTfBw3eLBi0n1rqsKCpFgeggAV+pyifsqa4rFHfecK8s7irqgsB9O
         mjneyysJrNq1YNrJryeG+14OO62zkE+k8oJmrkPoVT2nrInRW0cn6frQrx3yY3B8PCuE
         zpfWWuoP3AbfoV+huTFyad98NQWGSihtZ8XeZ5bqnS6ewEl6LGWbfuugfmZ0Kmg1CniP
         /Seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767123932; x=1767728732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cweyuKIwKmSRdsl/r/hQ+dHMBlDfUCmP+2wWQS89QfI=;
        b=ecG9y9zQytJ2pMJNDMg2nMzZKzs7ZizowSocGFna5ffPnPbn0QD6+Wyof7Gfcq7n/U
         P2VrjSyjKmgJZ/0y6wBhC63CbW6zXe6dOjKlwCHR94DFEF0PSMDYSgmMCd9gMbwOElt+
         0gwRNLaXmWgssaDbzVp0r5ZdY116miolDi4IggnfVSR8LmqnlxZdkJqVTvPB/Hn1fpAb
         Zxi+rK1c7tUlVUdkh/V5ttqzIyShHJgjbC7bJvhXTZoX60wUp69OTNDMjZ4l/WjsiE70
         JkXjJtMJO2+isWu9UjuJpvK/zXuI5f3OLnLU9HXJ3Xv8/Dt78DJI5c4zU1VxB8hDyJkn
         zlBg==
X-Forwarded-Encrypted: i=1; AJvYcCUysfqZHZbwlQumAbRdGqcUPBcBEVXSwPQFz1pj5iaMqtMAO7Q3LLVp0ON3cARrexzuGSn9wniK5N97Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPcJwzuretwT27hmkyjGGGojU/Jo7IZm4Kx16gD5b/MNzdvbol
	mSiKFAqwXTprqzSlFWAfv+A524ZL4vYU3A+33+BdtMK3Nja5IjIBSkCT6shUPQ==
X-Gm-Gg: AY/fxX7lRyrfUJIU7T205YYpYrU/4gJCzQpdRJDfYt3b+8oo5bBdisl0OXnELtQvyjp
	yjpOUZ+A2x8vilB/iKLl43npQDV+shT2Oduvg1OzR2SxQL4kpbdlfZKDqFaXCDbbElbxjhqDX9Q
	etaT2sSxMhoSiZBFA0EnHOahqRRu7yRYZnuK4ugNEVPvB7gKZ5RPIuWzrAdhgwzaIBCwfw4g8Mv
	ZMGJ2n6DpgdTeKolkeOfsnzI8lCUvAqyml8Qfxa5YgkG0+JSs6cCtb6bWEQsgOsbtWRUtHLA+t/
	cvNBOj6e/peW8XSgX9YiIyeas24dRvdILSroVbP/2YMLA4R30mosIJqJZzeuabNgo5X8L/6YvOt
	UQDDF+WeDfe1zEaQL7Kp1ydzk/UmLN9FI5rooP+2KjgRmLocQW6fWPrtBF9CSrjD/fK7i8gMmAZ
	367GkYO5exzdDGRqqH/RNInIsEk5HzW+6BI82AzKwtYdQjIjVvRvW/FEbmsz/cbpumjdYPh9Gfi
	wl+UstJFJHMAQoxEyJFJw==
X-Google-Smtp-Source: AGHT+IEV2tPzXOwPHApBAgjAbkeJhyeb+ZtfRECHHa+IQaEP0X/+BdIgcNvcf3mgMft3lyGdkE/kaA==
X-Received: by 2002:a17:90b:2584:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34e9220204dmr25951440a91.36.1767118265942;
        Tue, 30 Dec 2025 10:11:05 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:11:05 -0800 (PST)
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
Subject: [PATCH 3/6] dt-bindings: input: google,goldfish-events-keypad: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:28 +0000
Message-ID: <20251230181031.3191565-4-visitorckw@gmail.com>
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

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/events.txt   | 17 ---------
 .../input/google,goldfish-events-keypad.yaml  | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
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
index 000000000000..348cf18d3d24
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
@@ -0,0 +1,38 @@
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
+additionalProperties: false
+
+examples:
+  - |
+    keypad@9040000 {
+        compatible = "google,goldfish-events-keypad";
+        reg = <0x9040000 0x1000>;
+        interrupts = <0x5>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog

