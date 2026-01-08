Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465F343839B
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866151; cv=none; b=aLF0kXF1X7hIPacR47dNxZRpJS5CVVpYtirQx1qxE7MNxUn1pHFe6XccLDc6SGUK6Me5J1effwPpJUqOOAAqNcitAxjlMhi5Vaw6p3jZiK5fOJjB/1D7rVVu267tqseNFwgbib1ZDolJHVLelxl5QCb0GMsLYbD10VwwMuUeY38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866151; c=relaxed/simple;
	bh=3n90BbXpZmo7/97SyvwdOM2dgbMwLekUvvzKLPzma1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZ2TuYVplmWv0m51LykV7xIXsHic6vH+To/h5th2B4jNKYDkGq2k0+5Qe129td/WKtnr4bVGeDDYJnaUWieJoB35ve+1+ReySf6DW+tHzwpIq2nw5W4hKCrD8k++QeTnhhuNZuX1ljGB7FbsGi0W9DxK9elBi7bsw3BM0DX1Q3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8r59M/x; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8r59M/x"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b220ddc189so393583285a.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Jan 2026 01:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767866136; x=1768470936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jVrer7foxeDXiFbFRi4WTYBqb7mxG96n3TZ489PhHs=;
        b=W8r59M/x5233SLH1np/nqaj04lXxmx0mLRj6Xoe2T8SFpzLE1xly5wvabQuw8wrAVR
         ZRRuKtuNcb1IEEIM1WtCHPxrIqTaosmlD8ChFIOfqzJ5sXeA94oCHFwRLcX4Ac91UZpW
         j98hTZYVloRap2Rl3HU+0GfJkThva03w04YMXd28T07qUTcl13nNyEcmvU4lGP8wZgJ4
         q3ZsEpoJUtCXB8BXZ68Qns3ZowmKb1AiOEajm/dP0nKS5PHaVbcnnJPCw6JcMYPO7P5w
         r7z/3Pty2ayaIYC9XC69n0lTs3rY91VQ8ZQEKbymxwAXWXfwUWZl/TT3mgRkLRRDIfMS
         ejpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866136; x=1768470936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3jVrer7foxeDXiFbFRi4WTYBqb7mxG96n3TZ489PhHs=;
        b=Lot/eHEto7Ne2zNr5zt5HKMkAebJ5v3LVGQ7H8wvt4qJoZEP60U+UD4IXMB7j14KC2
         GMUVe7//wvgpLrVdCNZxxwxS/B/bo+2Hi7AvhDAQQkdULvtYwnVZ4sN1n3Djxud0Ceqj
         Cw9w4bjgvw3vic4wTLhF33PLQsWlveQjtZoH/bxwojga3c1IfWPrXYVISxGBrCr3G7fD
         rX0yGwFI75ULFexUYtg6JnAw80ZBZQjFOvkpoRXFftRbPYrCPrj6/nBnANQJ4c5Cg4d5
         QlG7qrhg+/75nF//PfPDnVe3jvBjHkeO2W6S9lsicMmo55afpiJw7hJO0HxQwCTs0JEL
         vHYw==
X-Forwarded-Encrypted: i=1; AJvYcCW33umL7icdU/AxdMKjqwl2KTaHofLtSO8mR07+vD2VcSuJX7ROdG3otAYyP+VQm0QHUdFFyfc7qalHhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzs8YAksoCp5M0PaJlW9S5Ctr22Jn0Q/HBxiXiY6UtyF03wHS3
	jNbZ5JPPvBqKfNRn2UkObkJqV2Frgqo1pazgjVpQCHeAdV+h4M/1Pv9b79xJcg==
X-Gm-Gg: AY/fxX7/OxsXB3qmgEisADWFnHf4anS496TJHVtUP6hWycznelaLbbWwqB1Nb2pll6c
	4GXHitV6QchihBpQzv11DbUdfy7rbhY1FEU1Egj4RfsUSI4EKHIQ/j8B8gG8HnimR7CijcgzTSb
	Kdwe35dMohOquRXeBdzSOxuB8EDNtUnUIUGDr1Nb1JgpkW0LNCrgiW0xVrwx4EcG3zMv+o8HPNR
	uyn/kQ1973TwVxkrGZHc48aF15JZjk3Y17CDBtNTVvMUED3NzNUMzuflSCDMx5ZnZsWet8mRBjg
	orHQE4cgoiSGlZ4hR8Tb5hrMTl1Gt+6MHjHedErRRHVH0vdcn/gztIYev5hbaPYiQjpxX5bpYki
	jGTAtUR2QYraM018n2gSn1ayig9hDu41dthoQUSqcy10RWFWrZmv/3VF9qg7uH+qZ/D6YWiTKD6
	mnT9p8DqBmN7ZHd3mEZALXg9xg75NhOtBI7i4ABRpW1gW6lT0o7jSRjnV9CZek6CB83Sty2YQTd
	Qrc9gC6qV4ut86q0ZKiRg==
X-Google-Smtp-Source: AGHT+IHrWmrWZovQhYEcCj3OW2qe/OMr35yE9xC18wSEU8hxPlfPFqonbAeAYlH/zyT0y2ccrqO9lw==
X-Received: by 2002:a05:6a00:9085:b0:7e8:4471:8de with SMTP id d2e1a72fcca58-81b7fbc91b7mr5136728b3a.63.1767859762235;
        Thu, 08 Jan 2026 00:09:22 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:21 -0800 (PST)
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
Subject: [PATCH v2 3/6] dt-bindings: input: google,goldfish-events-keypad: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:33 +0000
Message-ID: <20260108080836.3777829-4-visitorckw@gmail.com>
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

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Add reference to input.yaml schema.
- Change additionalProperties to unevaluatedProperties: false.

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
index 000000000000..4d359c9be600
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
+        interrupts = <0x5>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

