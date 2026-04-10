Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A37312814
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 05:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800545; cv=none; b=nUqWnYomxhusbtQQHVQvCMHWub50CBrulxZ2amUS86IcDgW7SNn8f8n4Nb6eDNfMQjHoG9/9mz1MShAHjsEOerYv6gixGMEEmQuaT5bjYD5+RrZ9tdT8ZQMemc9z7WMms00fqdSXA4MBU+ooP5Y1AKD5RFapLb/cTGmaSWxxg1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800545; c=relaxed/simple;
	bh=hWWgAhJK3jluW4debCIMFcuJaz0aQyv9VgWUStBlYcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQ988P8Dha9FB8p/CtIbPljUnwEKWKdntTrHra4hgF4h0+XnbvKo/A/psRk/VEl8jRiTK9pA9ZZFM6rv+D+V83VfaQCJKOfEpSxDZw+f8CGh2o01xvXkNuVR5O2pBQR0QNTek6SYt6yrP0wNQyrzWa8K+GEkmH969KQxO+2Kjng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgUPUsc7; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgUPUsc7"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so689141a91.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Apr 2026 22:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775800542; x=1776405342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZONTy3jkQF6vvheJ4A4geJ0E0xBe92xQL8/wb4o+I4=;
        b=fgUPUsc7J4Ag+P+fztHajhjMIM2MdY8fOcJNiaRDy9w9d/RZu8EGIM+IGaHClYgYWK
         UCtfdl/2zApBy5L67zo5Ax8eS2Timk32yiT3HsrdLiQa99Sy6f5a6v4wlwfuOB+XDeYj
         fTAGKLvTB6IUCLPBJNLFrENYHlvb8Nit30SRTsXyM7sfvgndoxB3SnPnYAXkQwiCquxl
         uY8PKrXFHp3+vSTrCBq6ja+4jFoK/BIUlWNaimxVZT+kbW67g/nsbQXQV0nqQPzNIs5U
         asWXRjCSwdCidPgXNnY3pmKmLvpWkOsIggKAOusJwBuUWgST0w+430ZSQn86vgsQXLKw
         f2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800542; x=1776405342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZONTy3jkQF6vvheJ4A4geJ0E0xBe92xQL8/wb4o+I4=;
        b=NUIF9Oi2K0EdgLCw/sKxWdtSo1tiCYuLhBQ7FV1U5sntsLB8dtWbD3AlU8+TQzygr1
         3vT3U6XeS8mVv2WsBFv27NMkokNzR1hQ8XWKkdUt1+3y4sPceiiVC6g4pR3vyXaJLGVp
         vPtCc8sNqky+HImL5Ettwz8Fk13mK+6xM3iRpCjuOM1VVr6enn+ucTLFPrP8WfhigRWx
         cTv5nYdcHtWL7KnHLZApH6UyXiCrF2ZWABTYqYVsokcR0yjbIbmtg0pz7xRN7l+JtxyJ
         EujMtF14YLCmDZxmqnPbg/fRjgwE4SyPDBU/a2/uhoCtHajfbISAqRIeIdL6N5Bn+5CP
         l3NA==
X-Gm-Message-State: AOJu0YxYsBuSkPAh1I7td8m06Mckv04d0Gp3D8SSbROeABOz7TzEkmrj
	IGfEHjZ7hIKj3v9Pq2kPNzzEyIa5trVchRjWyHeXyahy94ZLYrIxTrqQ
X-Gm-Gg: AeBDievgSSK+IDrt6Evuvi1ySb/oW4wi3Zk6PUXknxSdTV2G2MTt7iXds2xhFQid/6Q
	iwBE8fzNUWUDxAFD6RBAkiHnf2oV3ti+fuZf+YrfA1H6CYiUvft073jvXB8iTByqpcUUUxYuJhJ
	zliu+2P3BE14+DuIx1D+21TRaioB30O9BIRvMlobVCoqtaqF9Db7QwK7OUx2j7gYbICZmlKb4UC
	eYXbW6wmDHD9LEUHC29AqT9PUQhKjqZ87fHSfFbOmQPntYcIkqctgDxUikO2FwamZgTF74P7dpB
	CpaqJZN90x1JLgNLYPg48ElX3SAHikt3OYdsapC/FH0NeLunEyTZ9KZtCebhv1cA9ALd0om9FwD
	Fc48zUOMhzYkCFU0MoiuO+5/Mq6YXbzs1HVYIjUpyvKSfg1XNfatwZH1VQS+QcvoD3QzNFv8iSD
	MHW5p8zpwfkPjdtHNY0J37v3P8
X-Received: by 2002:a17:90b:52c8:b0:35b:a44f:b80 with SMTP id 98e67ed59e1d1-35e42fe6580mr1407691a91.1.1775800541645;
        Thu, 09 Apr 2026 22:55:41 -0700 (PDT)
Received: from localhost ([223.233.84.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e4131cfacsm1777318a91.10.2026.04.09.22.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 22:55:41 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anushka Badhe <anushkabadhe@gmail.com>
Subject: [PATCH v2] ASoC: dt-bindings: rockchip: convert rk3399-gru-sound to DT Schema
Date: Fri, 10 Apr 2026 11:25:32 +0530
Message-ID: <20260410055532.60868-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the rockchip,rk3399-gru-sound.txt DT binding to DT Schema
format.

Update rockchip,cpu from a single I2S controller phandle to a
phandle-array. Add an optional second entry for the SPDIF controller,
as seen in rk3399-gru.dtsi, required by boards with DisplayPort audio.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Changes in v2:
- Fix subject and body: "YAML Schema" -> "DT Schema"
- Fix title: "ROCKCHIP" -> "Rockchip"
- List items for rockchip,cpu with I2S and SPDIF descriptions
- List items for rockchip,codec
- Update descriptions for rockchip,cpu, rockchip,codec and
  dmic-wakeup-delay-ms

 .../sound/rockchip,rk3399-gru-sound.txt       | 22 -------
 .../sound/rockchip,rk3399-gru-sound.yaml      | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
deleted file mode 100644
index 72d3cf4c2606..000000000000
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-ROCKCHIP with MAX98357A/RT5514/DA7219 codecs on GRU boards
-
-Required properties:
-- compatible: "rockchip,rk3399-gru-sound"
-- rockchip,cpu: The phandle of the Rockchip I2S controller that's
-  connected to the codecs
-- rockchip,codec: The phandle of the audio codecs
-
-Optional properties:
-- dmic-wakeup-delay-ms : specify delay time (ms) for DMIC ready.
-  If this option is specified, which means it's required dmic need
-  delay for DMIC to ready so that rt5514 can avoid recording before
-  DMIC send valid data
-
-Example:
-
-sound {
-	compatible = "rockchip,rk3399-gru-sound";
-	rockchip,cpu = <&i2s0>;
-	rockchip,codec = <&max98357a &rt5514 &da7219>;
-	dmic-wakeup-delay-ms = <20>;
-};
diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml
new file mode 100644
index 000000000000..e9d13695cc77
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rk3399-gru-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip with MAX98357A/RT5514/DA7219 codecs on GRU boards
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3399-gru-sound
+
+  rockchip,cpu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandles to the Rockchip CPU DAI controllers connected to codecs
+    minItems: 1
+    items:
+      - items:
+          - description: Phandle to the Rockchip I2S controllers
+      - items:
+          - description: |
+              Phandle to the Rockchip SPDIF controller. Required when a
+              DisplayPort audio codec is referenced in rockchip,codec
+
+  rockchip,codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The phandles of the audio codecs connected to the Rockchip CPU DAI
+      controllers
+    minItems: 1
+    maxItems: 6
+    items:
+      maxItems: 1
+
+  dmic-wakeup-delay-ms:
+    description: |
+      specify delay time (ms) for DMIC ready.
+      If this option is specified, a delay is required for DMIC to get ready
+      so that rt5514 can avoid recording before DMIC sends valid data
+
+required:
+  - compatible
+  - rockchip,cpu
+  - rockchip,codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "rockchip,rk3399-gru-sound";
+      rockchip,cpu = <&i2s0 &spdif>;
+      rockchip,codec = <&max98357a &rt5514 &da7219 &cdn_dp>;
+      dmic-wakeup-delay-ms = <20>;
+    };
+
-- 
2.43.0

