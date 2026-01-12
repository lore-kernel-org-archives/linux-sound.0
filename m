Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D57C33AD93
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250032; cv=none; b=L3gYOCvz4QGiAkusuw8f3giM9VrpR8HxbaEEZxy+RvSxZ59SpYu0Tdh+AZAd+0/EwB74JSjYrLFVAORqy4/bOdlNmc542p0xw2YvscVJHF8kHTPr6UrW0DrP/em+fkre32NZm95pDTeyL80S9km2zJ84d4l7uR/s7mywhqvduaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250032; c=relaxed/simple;
	bh=FJzcSHDXluO4dUb76g2nKqIIglQO2UJtt5G2NIwIGRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gK6yLzkjjZMUW8BrhJDIZfPZFSDfdho/Kv2PKZp9dDbmR3uIyxiRQrTowfCIA40WFxBUdrPMO+cwWFeGiwH9ysAeq2eGv4JAhYaGzApJqyB86qesItjFhOIu9iJb0ggnbJB09U92TEE2Q7CPwae7LwBtX5owiuRgU4igCMv5LcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwH3vRY/; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwH3vRY/"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3f0ec55ce57so4748370fac.2
        for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 12:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768250030; x=1768854830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcdvqbOz52LfBLxCMSffSYUjax3JQUZoLUuen8kKWUc=;
        b=HwH3vRY/2gEox7HoaCT1/3B4rkhSu0vZu5CRAhqUbPcfdTHCaoBet3+zA9N1ofMNfL
         nV93iOW3htxGxqd2BhGKGwXpaPT37878Iwz3ApnBca5UYH7D2/GfkGrguLrnchvGPObO
         wWRHhTIw174ho//PWay2sooE8QW8R1Abbr2G/rnGL7Lr+Bs95by4QKaSBy7FJXOD9NDy
         ecorWxf8iMGJO3cs/nA8Umd3SDHlsJrvAPhCJ2diG7Jk9bWZEa4EAeyH/KiKd4k7NGoj
         eik/IlVRB0JEr1zn87u1wkjEaMljmtyMh+mU/kST9bipRXkQLfHQmlfvTGlAZ+cW+Vn5
         5kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768250030; x=1768854830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HcdvqbOz52LfBLxCMSffSYUjax3JQUZoLUuen8kKWUc=;
        b=LZRkKTx14B5qTDeFk6IMH7O/mNDFl5reQut4VVOSekLeRoHdMBxS3zVX6tA9v3/gL1
         CqE1BaW8c5wk2HI2DXvy30oz6Ix91mlEt2eqJ2YTVH7YRPabxulenJdW6/WfZH34hD8v
         DRgRq8MtbicrfHxa79wl+0fb8ptQQUHNdPSNYoiiW0lblM0pErjjf8sySGi/VTBP8sug
         PnJaAt6qS/84E7LPb8Hgy27mTl4IKwypi/vub62mX6WNgY4D8jkxeYdcpQ81sgBzH7+c
         T53yLR/XL07ARHL9dcNTE4qHvKVxXPVoOFgRQ8kjGYfXdwaN9djWP3htzU8HHZUdmfOU
         K03w==
X-Forwarded-Encrypted: i=1; AJvYcCUOkucRbCUOTVYxTZHtWEHU9OKe4I4jhXB62hn7G8qMLR6Z7I5h1olnwAZ6o78C+6vYoFt0+xDwuaw1bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKBqPJbWDd+kDEDnVlsCFI/UzDxAgP9wNbrkh+n+qb07r23XJ8
	wxPrwDbU4Xa6v69yOPZAKjoFUfqKZq8rBn5qtnpFFl+4R5txBtNzkCVXy6w9Lg==
X-Gm-Gg: AY/fxX7qNMlFGbC+QPSuYPHuvvjaHaVsV5KqypQap0PTpFDw33GV1GXHNSu/F5j/0Zv
	MUqVDhfO+9ruJgthComf6IWWIxBocW4f8o+Xl4HTSllizPsww13Su0fwxoRvdZVw5sTOe2UQ102
	dXY8CZstdnSuf2y9u9WmG2dkiDSiT6IiyggRaGsydo3LuxoWuXoLKhU09WIP/dlRfeZzHR8m8Fi
	p3kSFCDcJ+3HffiDA/p3gcOukMZEr1IMer+4YNpVfu6uzbWZSRHHtKnnpGyGeZOs9/YfMYnZdKW
	6r3Yep34eELbxXZfVBXzD3SRYkvB35Yr3uTjBlJedXGK8lMis/poTfnMUuZmU3t486MkeJuqd7w
	ZJzjnKXJVRW2QSPmD2FcwxiyAmXKSn4UNTlCO/Ad+G0fvHP093Z4Yidz1sxkoitT7tUwp15AVT2
	hGukufNKDwzyi9SuYVBJLR/rXyBuRlLLq64ptgCCyyVEodGdicwmYQdnTbUYWfhSQ0ka4bY1hXf
	6IDOJAiuqvsz9oeEZQb8Q==
X-Google-Smtp-Source: AGHT+IFk1Dr6wslFyNgQa2xGPUDljm9kHZ7BOgUopSMDiNk3ke91/OiF9CCfER+TuAOFwDhwgffkQA==
X-Received: by 2002:a05:6a20:9389:b0:364:13ca:3702 with SMTP id adf61e73a8af0-3898f987e4dmr16296668637.42.1768243926226;
        Mon, 12 Jan 2026 10:52:06 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:52:05 -0800 (PST)
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
Subject: [PATCH v3 4/6] dt-bindings: power: supply: google,goldfish-battery: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:42 +0000
Message-ID: <20260112185044.1865605-5-visitorckw@gmail.com>
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

Convert the Android Goldfish Battery binding to DT schema format.
Move the file to the power/supply directory to match the subsystem.
Update the example node name to 'battery' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Use decimal format for interrupts in the example.

 .../devicetree/bindings/goldfish/battery.txt  | 17 --------
 .../power/supply/google,goldfish-battery.yaml | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/battery.txt
 create mode 100644 Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/battery.txt b/Documentation/devicetree/bindings/goldfish/battery.txt
deleted file mode 100644
index 4fb613933214..000000000000
--- a/Documentation/devicetree/bindings/goldfish/battery.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Battery
-
-Android goldfish battery device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-battery" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_battery@9020000 {
-		compatible = "google,goldfish-battery";
-		reg = <0x9020000 0x1000>;
-		interrupts = <0x3>;
-	};
diff --git a/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
new file mode 100644
index 000000000000..634327c89c88
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/google,goldfish-battery.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Battery
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: power-supply.yaml#
+
+description:
+  Android goldfish battery device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-battery
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
+    battery@9020000 {
+        compatible = "google,goldfish-battery";
+        reg = <0x9020000 0x1000>;
+        interrupts = <3>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

