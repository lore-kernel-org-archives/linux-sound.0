Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F15D371D07
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773695641; cv=none; b=TSBH8dbR1BEDw6AoOvtLvG7aibTlGv3yE61L6u/5rqz/9b2A8CbQyu5R/VpbHLu9B8AB6DHZl5rtm1eKGCa21MXz18IMrX7NjzRdQcgBsOrRkHo6SjwOTVX1k6x4uFZj3jdAmbPZkl7N2UZlI7E6xDO9JnCAqcrkbiiJcvPmCF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773695641; c=relaxed/simple;
	bh=XfTiVWBGSK18qTIcb1YyI0kDcpzqXok3T8TKqXUhaF4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=rmoQI3Rn++HA5E2dXO9GohLDI3O3IqCBbTT9UJrrbnPlB3VbyaZ6QiX/ZJCyxWwLkPhF54hK+t9R7wQXTtCAsecwyARNuoOzQ+ghkrm7SDDSqNThi+GP6Re/st5sGvfpRjAt5W6pNq/QzHmIPkxPLsLrWr4PDUdf2kMYSYN18TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMx0RpFN; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMx0RpFN"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c6e2355739dso1872411a12.2
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773695639; x=1774300439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rF4t7hmWxUp9tFqC+NU8ZguLNueXfL7Mf7zA4/7gZzw=;
        b=ZMx0RpFNHrrYei6yhQ+Dr4bJIyDSmLZ1o/yyraKlm7jO56w+8JHuPjU7WkhIE//ICL
         MkxmjcxPdTPtlfwJySf8jHxeUb75pue7ZobxV0O22fhkmrxEPyJt58yC0HtHbc+sgElt
         0dKXuoc2wd2sAvLrvm+e2KR5JGE46hI7eTYfvvf74z9GxaCAsH4JxSidRkjPhoRjuuvO
         MaExLSctnhYQHm0KrkY8iLvZK6Jz+VumkVZYeKK39rzMNaQ8b6GN+wJA3BnD2i7q8k2x
         pz4EMrX1hTa9zoLre3wgD/4+SESkvUhvMbwjSycNMjOx89GHZ00hTesQho4/unZgbkyL
         /XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773695639; x=1774300439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rF4t7hmWxUp9tFqC+NU8ZguLNueXfL7Mf7zA4/7gZzw=;
        b=ZjeFBj21URZw2IOosbfTu/edvo1qyvmPcTWFIEE9V4q8cq3LKSm89Szb6UNDEH0vDU
         on0uv1YQcI/GsDkZpO42Aeh6qaONbDAz6scJXMTeU4ufibXmOofMGI38NK3rB2Iic5EI
         TOzw8eUGh4BOBaHEvdAdaf4qn/IvCYYj3HEqBRY/77uYUfXKAYdcGfgjvBuCc+gL9NXf
         8bTg9Zi3ny25OTwlR+btKnzRWtmX2ZSz/ZKHC9ilzN/1BQnXuUQfzOctzsGBe6JC0We4
         Hdn2wEjerCdZqN5hgkvO0dq4HEk/SvFWbXDLU2zG0tUKbS/V6m7DT2ZCCTHnbW05b4dW
         Y/2w==
X-Forwarded-Encrypted: i=1; AJvYcCW9GL3xH8C4zqzlMOZ7Gg40YNrtAjwdWZm2Y5tks1aI23xfOB4gB7auYdJ+EexHgzHERORc0gTGESiiQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8lQXn+QAdOlwTbtDzz8O7DySVKAiT50xQE+xv52DsrUQ5Xuyz
	1oCqpr87z1J7Ouh1b8/t1dCDZuiwo5FFTob1bNugoi0lE7EDlHg1mhNv
X-Gm-Gg: ATEYQzwkP7mRljLds2aU7eW/lVGjMniuRckDvTlQN/CFhjgIIazne/am+hcPTl6OKo+
	GvwKs9QscYy8azxZG+O+8+F+8fk2i3gtaSe+MTbOy8AfgilSN+6JxBf8ueI774Gg1eFNP3VspaR
	oketWLW45lho2k2F8m7cXDNjl4w1iFm9SFiByEh/8protvqpgYOT+jtfuA10v7ZnoJJxzBK+t2w
	46f2eNwbekmzmBmSyEMWCW09vlScWSXNUDiZLIIiOAZ9vyZ+fnbe+AgnHL/pX3WbwDg14dZcvRe
	+mLf4YPyIhMnt1yBTt4eVIDd+bF2eFJr35hB7jKofA3ZndrnOOhHHT+yJtEH47Fh1jd5ZnpFW+I
	3GD7qPiOpLs3kB3CNuvVZgc1im2Ju9zaUGmB81SwtLIdTN110N0GLxj5T0ITv1rSnokvP/LMTAw
	aIXSojj3gUcERkTCnn3DoO3iKORevNIiUXWXPvunarh5yclur40VsbHYulUjtIZXdwko1HM0f1e
	DgRRIhu3bd2onUfZs/4eB6HStXw8uQwxGNeWk+3H9Uxg5YaOXfV+Q==
X-Received: by 2002:a05:6a20:12d1:b0:398:a027:4707 with SMTP id adf61e73a8af0-398ecd4e0demr13898288637.50.1773695638557;
        Mon, 16 Mar 2026 14:13:58 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.domain.name ([2401:4900:889e:d501:6872:1e15:77cf:339b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7401588ecesm5948475a12.32.2026.03.16.14.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 14:13:58 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: lars@metafoo.de,
	nuno.sa@analog.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: adi,ssm2305: Convert to DT schema
Date: Tue, 17 Mar 2026 02:43:48 +0530
Message-Id: <20260316211348.230923-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the SSM2305 speaker amplifier binding from text format to
YAML schema to enable dtbs_check validation.

---

Changes in v2:
- Fix subject prefix to ASoC: dt-bindings:

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 .../devicetree/bindings/sound/adi,ssm2305.txt | 14 ------
 .../bindings/sound/adi,ssm2305.yaml           | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/adi,ssm2305.txt
 create mode 100644 Documentation/devicetree/bindings/sound/adi,ssm2305.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,ssm2305.txt b/Documentation/devicetree/bindings/sound/adi,ssm2305.txt
deleted file mode 100644
index a9c9d83c8a30..000000000000
--- a/Documentation/devicetree/bindings/sound/adi,ssm2305.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Analog Devices SSM2305 Speaker Amplifier
-========================================
-
-Required properties:
-  - compatible : "adi,ssm2305"
-  - shutdown-gpios : The gpio connected to the shutdown pin.
-                     The gpio signal is ACTIVE_LOW.
-
-Example:
-
-ssm2305: analog-amplifier {
-	compatible = "adi,ssm2305";
-	shutdown-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
-};
diff --git a/Documentation/devicetree/bindings/sound/adi,ssm2305.yaml b/Documentation/devicetree/bindings/sound/adi,ssm2305.yaml
new file mode 100644
index 000000000000..b841da2dc284
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,ssm2305.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,ssm2305.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices SSM2305 Class-D Speaker Amplifier
+
+maintainers:
+  - Lars-Peter Clausen <lars@metafoo.de>
+
+description:
+  The SSM2305 is a filterless, high efficiency, mono 2.8 W Class-D
+  audio amplifier with a micropower shutdown mode controlled via a
+  dedicated active-low GPIO pin.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: adi,ssm2305
+
+  shutdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the shutdown pin (SD) of the SSM2305.
+      The pin is active-low; asserting it puts the device into
+      micropower shutdown mode.
+
+required:
+  - compatible
+  - shutdown-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    analog-amplifier {
+        compatible = "adi,ssm2305";
+        shutdown-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
+    };
+
+...
-- 
2.34.1

