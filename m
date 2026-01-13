Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8DC38BF72
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302162; cv=none; b=aJpHph2FiG8ohYfeMlVaxF8ORg+MlNvu/UcE9QDQWeFxhlblt/fG8fKPrEaHW5SF1ITJLrTLFcKkGT78s4n6t4iTYytKrvEn0Fa3/+7/FgCQQU4iGCXQw+oiuJD3ob2g8h8pJ27G03tg6maTu4T0LSxMInvG4OSwUxHwEyOVChI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302162; c=relaxed/simple;
	bh=HDUKH+I7Fa+PmeSfYZXj+pEr7M14pExXySUjkX85juE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jr64rjWZ6rRh9eMTjA1d2zA/Nnoi5y2WANAp7p1Ej8VVyjHv/x1LECNCYl6PNklkhHusKz18CMOgIfAtdbriZD6eyItuX6CyyWnJ0nGqkYvoPLRnwhCyCe0k8CEJYMablskgpDFqp1l7gohHldGxaO0dSOKf5j5ZQMYibPCN8wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PA+lQVBE; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PA+lQVBE"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b2a4b6876fso1145724385a.3
        for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 03:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768302158; x=1768906958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DtPGFQHFju1IO/Degf1/ys2a0tv707U6qKEmBe4+A8=;
        b=PA+lQVBE36Uu/zVHpEQqAJpf8rToAh57G3CbR9wEp5RMOOTxBmsaSZd9CNsomynvVV
         tdnUgIwJjIPtTiCL3zuK4uFO5Ki/WkE7CHiA7VNaNPlwgyhsPSuO4kJAGcel65h838a/
         oC+KnCxXAjJWzdsePGkv8o/qavCx8thstoH2w2XA8lpwzKrYu5ZWOBRzgpSQRNi6b+c6
         2XExuNRPGtvrAzAQUFwZQTqn3OXCCvm6zFBG6dx4rmMs2n++dawvhXVJtKnx7kmsxd4e
         mrPOP1IIFrjP1PSSJDLY8+ZAXwTpDmlkbxeUwSgGr9zHsoKIRjBe5CVY6ppF8Lp6PHYp
         mXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302158; x=1768906958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/DtPGFQHFju1IO/Degf1/ys2a0tv707U6qKEmBe4+A8=;
        b=QutfZXnZb0WgaQmA6WoSyvLB9uZKZkAnRBtbcKgXFNovJIlCfX49YaGwlwblS10PbQ
         UaXET2thBxHZvynwpuAKntU5Wt2N6MJnzSMw4HMt/xKwwToCiKvDAgMSogCF2beeFTb9
         s7DWR/eVLw84hq8l81W9ps41sPcUUq4WqTSCKKoNVk9Ux3QcSPt+xO2ZhgRhgszZEJHq
         9G4P6pl8F4tPXYg1Y+FzRVKqtv1CqiMqb4F25GTqdpJ+DcTT5NPgGmd9Z2lfSzlQ7mTk
         lCXsJqLeT++s+tnU9KvFpS7LzIP5h9Sb0po6OMKZWz6LkX7hXRFW1iPZYbFogeude+r9
         vFTA==
X-Forwarded-Encrypted: i=1; AJvYcCWlmrjFe3Anv8jfVSk1d3HGiBjerMNNRcUmChhoKuCLnd+X1ty8IA94uKR0XQfecZ20aK3zQGfcEfxxjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLqmxAq+uzKSv3R7zFYQx9ecw9aJIQI7H3zwRmFOCCztsEcYZU
	MxLyuwIRiPiiPXDF5iyjZoe5UOPML5tMXmYaqBfcs+o9IIhe5NZDAm4dYOzw/w==
X-Gm-Gg: AY/fxX4snw8teaCz0oEcb/7xZDZukG/pH9GJOyYe8YUU25e/CaEmPXCzO3/u5o9ynk2
	nXW9e8OV6QUg2Qw6pLSZyN2MkWGl2ArZtLbUUuKS6HUyMBX+SUOzaGg/XyZa8x2atnJZWtzLW+8
	K3txsucIthwSqnfLpyd3EmlCG/uuzVY2gRGRHaM0kb004um7v0Y5SxIlwWxwe/oNEi9Cj5kqBi9
	wH99rzO8RGhq1MLC8AxVNyfpdqLoom7DafQHGMTc42JVl5WeOmiaGirtME8h7DSXxapMTeQGj+y
	bsQKkiOeR3xqQKGjo5qnwWkBdvSjA8asgtuNQCwnZRTEOFdpng2joJ5niaRQXoNonVL39Sh5qQS
	54/uyMyRRwnNb0MDj9GsB6lVlVfRWOVEevBas12ISolycLNZ0w9bCtRW/lPKj67nUNekpHvGw/r
	v2Fc18De3tNvYr1IqxL9XCbSjOrS58JBbYhMTrpoUbkEmrX7Ptg405g8avQ6ytYzB7BZSVurFoN
	RxPjG4c9AZZU4pvV1y6bQ==
X-Google-Smtp-Source: AGHT+IGN7YtptJAvyBxGsryFp/ZVQ3AtqkPm+d6Uo/gUGIm0zr03kGaJ57Syx71qzIqCdd6goycVuA==
X-Received: by 2002:a17:90b:4b0b:b0:330:6d5e:f174 with SMTP id 98e67ed59e1d1-34f68d0bc5fmr21176395a91.20.1768296400127;
        Tue, 13 Jan 2026 01:26:40 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:39 -0800 (PST)
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
Subject: [PATCH v4 4/6] dt-bindings: power: supply: google,goldfish-battery: Convert to DT schema
Date: Tue, 13 Jan 2026 09:26:00 +0000
Message-ID: <20260113092602.3197681-5-visitorckw@gmail.com>
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

Convert the Android Goldfish Battery binding to DT schema format.
Move the file to the power/supply directory to match the subsystem.
Update the example node name to 'battery' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
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

