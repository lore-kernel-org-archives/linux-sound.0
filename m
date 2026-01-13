Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E905D2C026A
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303253; cv=none; b=GclRUpc1vWx24re8xf+o0fe8Ur4ON2YC+nQgX116ySTitafoPvRvSqGSnEQVyPU0B/782xD9uR/yUQDBwzwnLw6jLTurGBZxuOzOCCY82Jv1wpL34uF37/o1r+sIOkw0NLlcFh8npeWLVOshYTHvSIPNteqtWi1K8K3X43Vcjyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303253; c=relaxed/simple;
	bh=zdNFAH0iTWr7CYfBHRXif+JE5op8kPFWmv5y6FI3muw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oP7HwJ3CB+sCwS0APAsIOp5DinFB5svy7rGuPflf5BhLuHzi5COspbUwh45EqvWdavE1jTjo5qkbO92sHWiSRc6+k/FFjk5W7NnoSlfcUNZAiyI4H+nPM9t8LRYGPTCTPdDO2K6jWdmGsODM/WDx858W96hAfx/g7zaaMkNY3q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSYcy+66; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSYcy+66"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f102b013fso68958925ad.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 03:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768303251; x=1768908051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4hgjP3w88kDagdzWx8wSWq+XQR1e0+zfKSduukvDaU=;
        b=LSYcy+66XsHh6INx+Q/Xk5x09ClOCUbSDyOHcfkYtM43CiRzoHzjuFLGNaIwDr5R0f
         iGqvtuNyDpccOOzKuBVteqWNRuUEYb3pdXjLGisNFL7bDAxww2ZmD+I8gpaQVyr7mFv4
         d3FrPUc0CxYyKegDGeanjObNKDNmXMA48kQqFjuTjGHZDkKWCdmEK0eeByj/v5DWTudx
         ZdCh2NfKruQQP69XTXFIQRqIKyAEcRjjzng9VzK3Lvszf6DtRiuMFWzzj3nBteB47miD
         HvIVXBhs+7baYyrxUf64hFbS3EEfFwRv/8Rbz6+RfAXWKKa2yR4NK7wq5lfu+jiFboHx
         P3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303251; x=1768908051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d4hgjP3w88kDagdzWx8wSWq+XQR1e0+zfKSduukvDaU=;
        b=tsehsCrYEdZVtgVXA7v10w0YrbpQpSHUUYCvXAJ254cyEq0LXF9PF71MpSo9ewqa2l
         P0sgutfK4EwKTMru096/3TXKyTI1B3L5gV1n498gP/d6HshYeyhige40qFFvSUArr+/J
         P55mP+DHQJfA68jPRUfWxE0JThH1dYwd7RwaqutnaGwKt4Y3/g5Tsfh7k5X7K2nFh3dt
         4iQhNKoP+zq6BWkqZEhqx8drQiEEdMwPLXu17gVJc6n7HgypdxbVB2KMzPze2mHJCyYH
         wGbXPBwLLmcRbDaDAN/RtuDCREE+1uITKL8SEPMUXJAyn0Qej3uIM482xStWQ7a2s1yG
         NZBg==
X-Forwarded-Encrypted: i=1; AJvYcCV1vhLoFRbS3VApzy5KLx0ne77D5dQihAuysty+0p8+Bf1vBwwly1gR1mwtBT4iwGTW5NqMIaacLGrM6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO9YsK85r4wcjqzilKKERtgu9Gh0KuGzcOZ25gETYYkeD4HrI1
	Y2rsaLjvF2VisEzqNgvjLDQL8WxKeZD/rmEK0Aou4JKNj5QPA1iIIED/ZNpoIw==
X-Gm-Gg: AY/fxX6SZs1PjnBrDAIDP/NMLEB1EFaJgmyxSmxjNvqmYXsP5vuKzQkHoJ0ka1Lq8fz
	hVOSmrHoUcvP7MG/Itx0DiQEfI35goluSQDRupYwqRs27uqAj7/cVoMjIKl1jz1sBpis3FcXnLH
	q5buJpNsqVSXhT8sBMjHUeWaNkdpMo6HFIY3bbHMCRa9UjxwsgdSobYYoYNigDLTriE56Zh6uG4
	7xVyRorYe8w9N5u9/Cz0bmJEmyDr0nM9pkiRetKpXDhJi2Q7qx1t2edgB6hbQ2veZ0XoPze4Tj9
	lJu7tm3iiBPnIjIv4QzBrvmIU4N7kqzUIzW4CHkWI7BEqOYODoMsTW5p8LudIvSJvKMA4AAzH5b
	qwdf7hBeEuh3BK7lo/ZvbFAmFWlOHJDHQLF5sDfx9OXPbt5D6MmByn4cPOgFAWKR6x1X1RVygo+
	B4IG4/LpBJADS+OdFG80Hcw0WnJ0cvnxE+YPbRc2zDM19bHL6JR5IYJlGIF7svixyPr1RsQ1Szl
	bAm8SPB0yRFBqpAQhLxINAyncEuBHzD
X-Google-Smtp-Source: AGHT+IERyXXRObriIfp3G5vGgqAQ938C3mDCOXYLyt4LrW1z/WW3eq0L+wGB0uC11elqp7ivzib0lQ==
X-Received: by 2002:a17:90b:38c4:b0:340:fb6a:cb4c with SMTP id 98e67ed59e1d1-34f68d231bamr19378825a91.30.1768296384398;
        Tue, 13 Jan 2026 01:26:24 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:24 -0800 (PST)
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
Subject: [PATCH v4 1/6] dt-bindings: serial: google,goldfish-tty: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:57 +0000
Message-ID: <20260113092602.3197681-2-visitorckw@gmail.com>
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

Convert the Google Goldfish TTY binding to DT schema format.
Move the file to the serial directory to match the subsystem.
Update the example node name to 'serial' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v4:
- Use decimal format for interrupts in the example.

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
index 000000000000..0626ce58740c
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
+        interrupts = <12>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

