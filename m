Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC944C10D1
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544436; cv=none; b=DuonoQkaNE7Q09b+OUnmAm4xPBmAHRt3D+P+G26iBPaWFDcWe2+0oVGZmK9GePYaV0o41gY/KzEGA//YC+MOa6Z+IPB/62Qyp6E76xA2hVjAL/L0GraXWgV9IrfLMej/JGSSTM3tzZ8BIfftse2LTTgOCFfRhWLpwsTeuwMtVkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544436; c=relaxed/simple;
	bh=3Z8R88v/tx5Du3rc1hWNnOKXjYU+6r1PY7B4+5MN3J8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aA8DA10QHzGBled4uj571rBlE8V18SdIH+ZIz8RH5Y6IN3abQuP1MXV+Eqmw616hV7obnPLCKKDcloV6p1G451K4GOU4d9Boiq0biYV4ApQ0GEavhTPljebfK+C8Vc/v2W3Dgnyqi3MXK8Hc+4Y0CkvfEED3JFc8xOjR8NQHnJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnTQWWWh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnTQWWWh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a061a13884so34487705e9.3
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 04:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544426; x=1792149226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3WuHrYY1WT9oFIK54Sq7W39RzHltv6fhaKlkGGpDGWk=;
        b=LnTQWWWhJlN0TmbnB1nwlKyVZBlAkg8yhsC/UqDzQh2iGHLwd2lUmz1cElRvGCtVJu
         xEDJX71/nBkoxS8DnwsT62+NeLRsgHOMui7++rjoG/ZbwKb/wMIETnbwmPuHAb2O2rTK
         1++Oj7Cta59d8l7nwpzRuS5KQ/rS+2DdC8O0WnzkfIqgz6PeqNE0BRh5JJ5NT+2SB9sG
         A6Th6vi9QeLf8iJggGzyHDYTdDtz7H821Rj0YJku0lTzUl5yiFOdD1zFc9Q7x7a6yaCl
         fcdTfm4sMpi8lOtGP50QXU94Q8LTQpGNudVXGyYBQLHd2YeCLKV23PRaZdR5ZuVLqjm8
         OcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544426; x=1792149226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3WuHrYY1WT9oFIK54Sq7W39RzHltv6fhaKlkGGpDGWk=;
        b=D9azu6fTmkY92osCsBUWyinmIAiFI1abDm6U+am5EpEaN4vX6o5ZEcxJBQlR8CB74j
         Hv5aBGdPiHRcwyMrTobMRmULr4dC2Gn9gYLLMW7d3qa+jaA5fTxgBxKwAOqr5iE810gb
         AsXDTRLQEtjHYdIso0OE7ppFHWmPpeF0CIhYiNgTn9ksiWnp7C4cLnZoV4EklAl62xxJ
         57y4oqqFfZ6waWheNvUs9yX8y2/Z+iq2OcHlNqgWRTV/+kTqj7kAF+rw7DEt6rRUGJnD
         doOlOnq7T/Ld/0V5LpwqYG3gUtTnEpGWGwa115/iVmbJmxAhSt+SeFy+DFfGBSLPTWUO
         3yXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYDz7Zv6F0iFx5zmZDL1HZBTZbFHZK9ZFOt23KAL+PQpAoo7YzMbjTls75ji3KYkWvw8VV43h4FZxVbA==@vger.kernel.org
X-Gm-Message-State: AFuF++m9uzfu03tJCUJTMHWtfzs3TiGsSBzTgxAL2brLKw28Tc8NpsJC
	F5JkD8VzYDafxAw/DUseW/SbMacflDCSs+PDUKDlq1RhFeNiERfYAjuK
X-Gm-Gg: AYBFou0Nz71EoQMcC1rHnbj9wtxihFLePk+tPE1bqKnZenYS7hJ9GBFUidu5kHqJFCI
	mferLbeRyWp3D4Ki7Zzz/O7IIIAlrI1+t14xya4ckvfHla1vDlhl6FRcEEfEkosupVb4ha9XpIO
	e3MBBF1N5chwZU2Fa+Y+FsCpovIgOoj5Cgx0AKkGpaowEQyD+gSXWq0H8r2um86vV44ccE6uVUJ
	tevVMDs/Vs36wXL81tbCBNfbrrJasleRlOdeEuXp0M/E/kNHSSWpwWb3QV+kv7UT7E/dez/FvGq
	9GI6gaNobQlhdJKzoKzWEBzrFwuDxCc7V/BMN7I7j4G/rRC9NeLPucB4SvT5fok+IIj820tVNcY
	9moprlBPhyBQKKfoy/BvISVaj7RA6JBGQmmnFfu+yMiS4/piz4KwI5DY6sFzim16YaAWpOGbcpr
	yDvK/Na5xVkw1w4etL3ab5PyUX6Gl4T4RLPv2aDF3MXx4RuggRxgTQ8KEcm4kseZ+PCuV98g6M/
	z0xyTZlSur1dc2pKnL+1Rc5TbbDPcYjhv+eln4Zgp0evRp2/W1A5oZF1vv62binxOaCImmkCHpM
	6qgDiAtrWMYh4J9j
X-Received: by 2002:a05:600c:3f06:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a18e4ca2acmr29756465e9.32.1791544426066;
        Fri, 09 Oct 2026 04:13:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm45503605e9.5.2026.10.09.04.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:13:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Fri,  9 Oct 2026 13:13:31 +0200
Message-ID: <20261009111334.23522-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009111334.23522-1-ansuelsmth@gmail.com>
References: <20261009111334.23522-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Document the related compatible and required interrupt/reset and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-pcm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
new file mode 100644
index 000000000000..e73236453b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha PCM controller for AN7581 SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcm1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcm@1fbd0000 {
+        compatible = "airoha,an7581-pcm";
+        reg = <0x1fbd0000 0x10000>;
+
+        interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_PCM1_RST>;
+        reset-names = "pcm1";
+    };
+
+...
-- 
2.55.0

