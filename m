Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59C72F1FEA
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 19:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504700; cv=none; b=OrEf7VdOXi4nU5NDblNKB0/dUPXOVcyV7q/V9GWXrUVLU08wAlkE90xD4g493hsANXYBiebAw44mUppWKdSikNOwqYevIV62inPw2KOUZWhSvoQu7Wb+cCc5zG1nZ5MrnT0x8PpRoXL8gda81MBKEJsL1DdXv1IK0C1Q/dl4+ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504700; c=relaxed/simple;
	bh=DQtXugkjv8oX6MRmxxnR9guqKGpU+4+ND0DSGzuSelE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f80btIS3WlG9ON8pBCCkFOgb6iWIQ3U9vFWHk06JqY891JWxbgLfQvBO8qctjmixxeduKH8kkedxXskCJLHjKQjJoDXO2CSGe6yIyyHmmmTmrCQao4/TTv6f4uzt5k9GEqJp65UQFSUFF4xshzXmHonNcNPzWynQkfZUR154iDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/T5db//; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/T5db//"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so1157967f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 11:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504697; x=1769109497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WczvYa8CE5EVgqZyNZGoJ41lrxkL4ZBfyJ2rH7pD8I=;
        b=k/T5db//fsRafVYrLw98LfeF1HYdOJrjfha0dXJ3gJKwT0RmfSYQ6PTjxfxcwwap8H
         sFBbXgHu0R/Fw2IW/A132XN+AZC7cgQmcRwkTErj+8ZWdhhPvGIUbnMkRI/aDAtlWgSy
         dFn83gVI+3Eeqr0QvwN8OmUgkDeukW0oMmkj848xUM45zd+VpT0C49ECIsri/DwPdX0n
         KCY+yJuI/DXKmeA/icHcyNyxCwOK5dt5PZThGGnDziRo9HBLvnjPjsghjL9lcSVJKpFj
         kM4FPJs4iG8sxpTF8hW+qLuicP9QTwHeVTAnQodIcTD8W4LVzkvBN1D7PZxf1U8YXAGI
         1y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504697; x=1769109497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WczvYa8CE5EVgqZyNZGoJ41lrxkL4ZBfyJ2rH7pD8I=;
        b=WyIyqqKabfC296SZml9Ka8sqVxKMUKSNHouNB/kPXVpsvAYa46CP6eCOLsAiOFTe5i
         qcpm63WfFPIGVjzjrMuHEn4OArvyL1CbAIOiQ2J6HOdiPbenp85SyTLHmZoYzXGgSjNR
         6AcoLwga4/WvZjvGiRH/6g54Yj0z3rdKBMzo7oBEGnD+Zd7VSiBXThJgBRWt8xLnMeUP
         9azDVHpDj3V66hCORg+xuP6pPVxosu73lpkFXMroucdAlDd3OAI3kRPa++oscL5jncOH
         dmIHEK/xr5OG7aN91qAG5vOLrQA1gX4vSveXnwiuQ9scNh5Sfbc8SqKrSVsVXUWxxQFD
         iGfg==
X-Gm-Message-State: AOJu0YzF7nT149ylY9jY7WOsXns894xlaYoL3LVcFoloECEDgv5+qwXq
	1pUcvV9vN4pbShZzugSl7W9DzuWiZjjh3qY5/TRbGmOkkGkvU+FikpVs
X-Gm-Gg: AY/fxX4gWxE9ir8WL7XydMn43DbUHfoQUZ7lsTFN1VecNUT0xJPEsfJ3GdoWrCdfrG+
	Mjtwpho5cz4CJJFC+Wy792vEEKlAjh2W4siWTSgJk1XsKKThh9gbtl9kSfxCKwWusiJQEAOPboV
	xLy1W/zL/ZRQ4AhqKzcScllQg41G+Y5e8jNiUSRh8jZGQvQ0HdxsNjOuMxgWys+Po7Go1Uja7D1
	gY9+levdtmdf88DGVokKxliEIhhw3DTTsYkpb/3qvEZRPQ98zKQypMN9l6trr2qJ1hD0xSDkkvB
	mvmwgcXq75o3AUYce5AWGfdRSs4BEENxCPc12WI2MNo1vS4D9DnPOZJnTChxezYwt8AGn9X7VkT
	EQYhYF//wXJCO9iRD081weiweUNzIcQB7QeRPzAsFk5PKNhx976smY3OOhBcMoZE0rR02SVCwFz
	+tAAepr/Ep7oNo6AgADYqZB/iqmiAO5ztX2s/NFeBlnnnP
X-Received: by 2002:a05:6000:310d:b0:430:ff0c:35f9 with SMTP id ffacd0b85a97d-4356a082e2dmr403974f8f.48.1768504696733;
        Thu, 15 Jan 2026 11:18:16 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:16 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:42 +0400
Subject: [PATCH 5/8] dt-bindings: sound: sophgo: add CV1800B internal DAC
 codec
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-cv1800b-i2s-driver-v1-5-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=1672;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=DQtXugkjv8oX6MRmxxnR9guqKGpU+4+ND0DSGzuSelE=;
 b=yM+zC4fx7IIosib9wWNkVnBDpFynlEiv6ynEXZvFjIYVeO78hrI1gJgz8ZSXSXR1lUTlJNP4a
 qleFH+mRy5KCKhR5BVRssDGDyFSa0R4d9EPyWyCc2OxMY1+wN1/pcIG
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Document the internal DAC audio codec integrated in the Sophgo
CV1800B SoC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
new file mode 100644
index 000000000000..2a35e38dc7f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-dac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B internal DAC audio codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: |
+  Internal DAC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single playback DAI and is intended to be connected to an
+  I2S/TDM controller via an ASoC machine driver.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-dac
+
+  reg:
+    maxItems: 1
+    description: |
+      Register base address and size of the internal DAC codec register block.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-codec@300A000  {
+      compatible = "sophgo,cv1800b-sound-dac";
+      #sound-dai-cells = <0>;
+      reg = <0x0300A000 0x100>;
+    };
+...

-- 
2.43.0

