Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F952C15A0
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 20:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681185; cv=none; b=kEYaJNvcgsTJGMMtwdpzfG9Ny+hgid7F0JjIvQLb53pkRyiLxDsBrsL+F+oKDf6XdOVJ6pnuF6V1GSQu8bgyFfZqI/7dURytr85/pXj5Vuz3yijjmwLd44dmi3c68UmUrB4phf0T3YEMHTRzmf3PttP3fOMIq1KXKgwgBaQ+JAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681185; c=relaxed/simple;
	bh=GwTIVlGCDzAackWj5fM/XVH5Lb9iGR97dcSVgftL+2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bd0BJ7l0SnXOfRu9h9RRrJDnFs8OxcZMlR7BFZjm7ePGN9B2k/Zj//PWkxL9KFD6a8Ak8nSUIE+ujZCONQCGoKYv0y4DXvUxKSL0YmyTLKY87y2yReyF2QZ/tTSYFOCOJOI5r+DZR2tBQSx1BbAHn65SleadAObVgyx9nDWq+Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WggWR+t8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WggWR+t8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so35724265e9.0
        for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 12:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681180; x=1769285980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UxSpNiV5VGrUBMb7ER2DKSz/PAOIwyqbaRxTfzD0/M=;
        b=WggWR+t8hzgaL0pEmO2Cdi73qt1ZyMULn7PAkQ8iCdMUKHCiOnK/WaBeNUOcAUWt/F
         r9d7hSgG9YmVfrkhGH4eIm3n8srkgPkp1lqMCtmjHAs4zy5J5gZOYnbIVFEFgiEpSOOi
         vJ4setaV9wBYYVEvn7S9waTL0030Z4HRSrxSOZpdC03yncyXSsKPvtA192JtXMaRY+fv
         f25+ndPdhuRX0vMQ6mK1HecnjP1q2+5qkKHn4VuiMiyJ7CT9Hr8kyrflLYZM9rVaO1i6
         +5hTV+TXBBzHBmUD/mj4VT5a7eXfElnPVwsn/yUdzX2uRblkt20P2SJaYBCarvAeiPQF
         5iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681180; x=1769285980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UxSpNiV5VGrUBMb7ER2DKSz/PAOIwyqbaRxTfzD0/M=;
        b=CIeYWf0tSOlSRYfCFSqGF5PE73qVit4mJRH1Nde1xYvGh7kW+y03x/gwwTdKt0vxfy
         A79HB7Lut6btbxZxazsDVJqPnCKJ5/jPkaUarkQThvVN/zacFoYGLVRWemfgPWHlmVNP
         MkV1XyP36ZoCqkjpQtE3C2vU49antJ+mmWDdLgYFiDa8CJDW+lNKly6zQ9HJn4fyb1DO
         +YMfiWSKfKW7P28veqhFOq3KpjcNPX5mZAILyESu/800/YlMktUCFRC+k1t9TbMlPlGA
         xEmWejT4kjbQy89NGUuEFNK8E0j/nHpQjnVAeww77BeLpC/cmDx0KqgcTgvVKR+D7X7r
         rjeA==
X-Gm-Message-State: AOJu0YycadFgMUNmS3UEP1LzE/kdhD2BhIhPqgY4qdqWYaHNSMqzvF/j
	PBS4+hZQL5aJHvOuUM2uXcSAZMQdGZVF/0qy9f5Dwsgd7wKPvbQFjKOO
X-Gm-Gg: AY/fxX6LNl6H8rN9siduwNdRiHj+UxhAVY0OLybjemT9bZlW2BhGCkEBbPxrqi3yC1C
	Ta9IOLyOVwQsCwBOgQA/oAkJNZREnF9RBCQfuX7YfeNBm1a7yuJnzQC6+79fjyKDnwDqNZd7Jy8
	i7g4EqcHlU+nQ1kQC8eBkgoAH/AzmB6Lo1koirh9WmERT3AlfmuaHIRWUygGdN94W6UNEsYI3PC
	iMHhLQenadkXvOqGir6K7TTv1GIEly+ewA2mPLSlxMmS5vPjyFSgCbzn/YUNxxZcRGxyxP8e4A+
	8VW0HgDHutHEp463HjaJUdm0TCt0QxxjLiRljkfvE5w/00vg2fgSn8/woV3XNRf7Hdqxk/0Fnyl
	mD34x4oHd0+hGd2xERh4fUsLeoYHbMkKZD6OZkWJ51YTPWY9oYZgXOAEBIS+Lqdv0Djq5FKTRIF
	eLuqOOlGukyP1AKVPV6Ly74My8hRWI6jNQZJLcVMtwzX2D
X-Received: by 2002:a05:600c:548d:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-4801e2a4c3bmr88691655e9.0.1768681179596;
        Sat, 17 Jan 2026 12:19:39 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:39 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:57 +0400
Subject: [PATCH v2 5/7] dt-bindings: sound: sophgo: add CV1800B internal
 DAC codec
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-cv1800b-i2s-driver-v2-5-d10055f68368@gmail.com>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=1737;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=GwTIVlGCDzAackWj5fM/XVH5Lb9iGR97dcSVgftL+2Q=;
 b=gWseGCnVm2/lclbG2rn3qTW1KAMRYhjwJ6KXzgLpr24RyIRTPhxiEifZ6rXedoHGg4b2rRBJg
 0zD6SVMzvkUDOAMuPw4nvoWJS0mMvRtfBHAbR4UhgEvE/VkxZzHvzq7
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Document the internal DAC audio codec integrated in the Sophgo
CV1800B SoC.
The codec doesn't have any special configuration at the moment.

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

