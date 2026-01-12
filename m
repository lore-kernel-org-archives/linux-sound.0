Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06CB33F8CE
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250516; cv=none; b=Ir923EzXRUNJHvA92NreNPMCc93A6ybtqUPr2MKvV5kn11UQSuioPQeMVKkalMohFVPmP+ltINZMG3rREPp3uPUsVZm2+sMRnJ0gpTC6iBQ/jSOOwhgLESug+5dExSCjfApb9Fz1Ben4l7tZLK3ApGp/o8UncxDLLEUZHESfTrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250516; c=relaxed/simple;
	bh=1cgc9CyPLdaamTqWSH/prcaGYr4QsO4nAqSVaUroafU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s58QFghomRZpVsEI1rca5asxq1jPGbStm7QbF0Ks7XeNoIgAxPVfALnnb/oRC0EQ9SQSBp03zcCVpyKrksNX/VnJjuVSVZo9gF4XVmoxCFcAz0k8MsxO7OYb94gzyDUh25MeO6j7p/cYzNYgMgq2QjsEwM9++m0Kn6bTTxQklD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neCkfXSe; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neCkfXSe"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-65f66a770cbso2166143eaf.1
        for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 12:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768250514; x=1768855314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0PErH3A+TCXfgL5PR8asxXBIGBytLNSMzZeGmnD/jY=;
        b=neCkfXSehanFAxs4vuLwlXa5/BqzdQ+KAI2OXR3LbpgXtqgmosOhJMb0ECngnkUh2Y
         Cfr10s6s6wDFV8MUHCxDrQDGr4+Yf8ZwnFS75Xn/1GogKVz1C5sXS133+NVVRRvnrDxy
         u6dDa/0hSliNC7avY//jsoEXkOWCdumQJ+FnZvA5SmQcnAbaoq1lRXXSPXiUgF12Oe5W
         aRPn5kl8kupjrSbH+Zwadp/PNMmsF8LMP62M9G9BnRMs7TXjF6JkJ2Nz9EXVXwnvORLT
         EsrjQBIi9vHytWU92SOvNTpmTOyL+nCLfNdMXlbh29Je1Yo64U1gC4hnjImN8AwkUy+g
         F4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768250514; x=1768855314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A0PErH3A+TCXfgL5PR8asxXBIGBytLNSMzZeGmnD/jY=;
        b=Aq9+fc654MZ4R9opbdowQnt8DJBNwv6jUIjz8AEnn6zwjVvT0LYU8Lu/I8nsFuvFu7
         KE8LpLPvacU+EP/fPzBumS0qqASAaeGgtJaqiXMqnBE24qQufwsCGGwxLULo/pMeyl8r
         QRd/UZJ6ZWcbwsNV1NYa4tpZwlO/ddXVnF7nxHgvUvVryPCQzSFO3ieXRlKhk80BezBr
         U3zWWpyDZBr9LW6zq9v6rdk3/ejK7n1dXogq2wCS39Dy6bNsccjolQ5Zm73CoePxX1ex
         BNht4GujIbmpxVI7aRwcMoKqvng9ORpF5sM4/NVxiQ4x6FjViWLoH0dr82g3RH4WKn58
         E5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWZVsRYdW/Mrpr9W+a7LwxwWz/CCjUVXqT34XYWJhZv4pRsOSTImM/cZYciif4pb92bgxbob0Xcz0EvHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO77Du2R/kV/fkRBa6gRuy2++BanCGAavEUlqBs6WzaWynO1oh
	tHYkfRAnUXdomjUCumFTeyVUT+jHH17WBPOm/wylRMRUe07kEBkP1KSso6cLWA==
X-Gm-Gg: AY/fxX5Q+Y/6riehqs5he/G/PcvmA92w1YWHHSxeO0+pOba4D4esG4c0ZNMf3ASG+T9
	jcH0flzap4rGmZFcC0AfiMVoHTYBOGLqCgNiRDLmJccf7hnfGDdzkhXDm1VQJcO/lbEjjufIaj3
	VYGFTBXm3X+AEWdyAmhOSPQhe3blKPrRQ8UQeS1eBYu420jmoePrNay1cmdOy0chufTb/ho4Kt5
	O6W9Fq6NONVpjkyl4D3W1BqPIFqHtZcCnpNVa/l+ydvPaN0jcXTQlD0SYTYPv2o9S7F2XSbM1hH
	AWNCJtt+0wIVPbxW3mSyfxiNDyD+VM8JJHgSALGjqvF7zn/AYF49LgaC/iWLeOE4nM0fqMJ0aYO
	nHeurUzX6fgaxg0Yg4eI47xnkbHCJKmeVSCZDep1AGmxOK2RR+PKSacTmehYMZOfHa3C2Z2J+aV
	lTflpZWfK0GycGGOYub5kCeCmjw4T5PCHX2yFQcTNzZ1XE/srHkXiqYrwfy1Pfx5ypAgpfSyDGP
	OxnomBMKzz8DHM+hU507g==
X-Google-Smtp-Source: AGHT+IGZVQoYbx2iilZrdLG2Ztf307Z50A6C9NTY1Qg4UTlyKWI05nICHsHwet4uo+a7zycAJ/JW+Q==
X-Received: by 2002:a05:6a21:3291:b0:35f:5fc4:d896 with SMTP id adf61e73a8af0-3898f906a35mr17214236637.20.1768243921460;
        Mon, 12 Jan 2026 10:52:01 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:52:01 -0800 (PST)
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
Subject: [PATCH v3 3/6] dt-bindings: input: google,goldfish-events-keypad: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:41 +0000
Message-ID: <20260112185044.1865605-4-visitorckw@gmail.com>
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

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Use decimal format for interrupts in the example.

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

