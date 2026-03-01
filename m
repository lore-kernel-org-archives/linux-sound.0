Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD382224AF2
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352393; cv=none; b=UDFUy91ym3t4QUURdaCCi2IKP2SSIAOyO+RDLd3q4VLDC8UwHWd5yfoCXNJagQ8sIZdzuFX00QwZTpZ6n7ZYMcZdPZgIT5bUvATu+0XdGVqmH62gxuNhkcV/kZKPBUECfH8BNPyY9i/J4WLCBZcHboEI5cO+HjhJxQfDzOCsQ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352393; c=relaxed/simple;
	bh=115g/WH2mtui7fHuZcwchXsAefVgpriJAftdKhU/VY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pnM3vzrjWKv+Cc6YPzSb68ljOelRo0Zym6KxT+S6MAlMo7PHtBlHDxDxrrmi2geuy6vShUaWMv5ls+4GRFPJXE6key7rkK94m1h554jvp40sAo0ZfRVvYKSaXN7xaCdwrRVhg8ED4y46mmrHQN5lBpdKgDbilOAx939JpXPV1NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7pITuBX; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7pITuBX"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so2137226a12.2
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 00:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352392; x=1772957192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGlR6YzXE5keZeD5R4R4wdzj80ZRJofyKqhSLLbK2aA=;
        b=d7pITuBXKb+ttwvFoN/kH/q1zeDoKEb0U2dhezOjnn+nO4deEhnECCj8d/o+jCtTxn
         nNpLau8ubEpcpA4s80a3qq2cKmtXBA3V6CIuQCkHgZ1CJG5U/Ar4ijK+eBWCOhGLcs51
         WGeJ36o/35rxxsi354zuLla6pyPZ4gzb6D9+he5t/3UQ8SBAJ2QzkumnmY7KmALva+0D
         LmXnHeV4tyV8hLCkqwld0CfGDxAVA7ujJoUj8pFFSDTl83g7H6a+FEwsbb02GlkKfQXb
         nNzqg0GVgoRa17KlI+2RRtsaec08fJV2TJAEv6inDsIodYy40miW4G4Okwb1bnyLSweK
         3B9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352392; x=1772957192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fGlR6YzXE5keZeD5R4R4wdzj80ZRJofyKqhSLLbK2aA=;
        b=d9uWFzkDpP9S7Cu/yE1PyeitZlwoIb/JBbIPPHWJoauiF1B0gGqLod3nV2BfO8kSA8
         dxfR+vjSbNTRvx70dTdPwhg+egfKJM5K0zJbYKW8Ea1xoJDtSjhHIAagFuKzmU5LcbtM
         E/0XNawhqej1VTGkSnhHhgUyYDHcNcV4ehf5ims4+SlAwdHCEfhuGx1VbLZpBCGwkNqn
         Me6Y80o6W8g459yVvgEndf1L7XwnkQouLnEqC++pseU5Q6ZjG//MCQIVC9DjcRZPimgt
         R+YKELUSrJZcvq1wYyjp5+hqzmjYkVXspEkCtVdkWt/mRSo6WUItsCq/9af8sWcVkqXb
         xqDA==
X-Gm-Message-State: AOJu0YxOFSS0KgAQupXCLGLHUR+TP9X+7qfXjGLCWoo7iX/nVJeI5MNN
	SypoeNWlVnceZRx+vohJf3V1ibJ1+vz1+B0uR6NSm0KbX7Iujp6ynaYM
X-Gm-Gg: ATEYQzx8rJG3RvBuUg8tSybs3mvbuvj0nI7cY1+IDD6jJ73RjGTEle3R8HzYEAxSCaY
	XFep9s1rfLFk8md2SqeHB0ShCjVKVJQgH+/SvEChB5KGK1vdy+Q9SD7lLe9jUjQqIfRcN+XD8U1
	c+wPPibSrXP3sBHZgNnXvthFc7UumeCmGU9sDdmJihN89pS9/fpHKLGFveeTzoQjHLuXhjSiidE
	6IZqq/yuFsSrPqlmAo1Uc0/Latazp4yemmkzGzayP8btjg0fjRyPEl838C4CYBq8kodtM6+3Qii
	AF+FhFJo+6w5/N3P3tlqahkU2kB3xL12dFJmwfqp6K9pas+4tf6UAWSCEo6FudsX5Mn5lR/PQwc
	rjh+xrfJ5H6WZpuKNFmeSKD/Gg07IUPXPU3uKcZEcpdVIarwicPnPScnm/df8KLReVd1P5Qogz0
	D+LfGntGs/MAjO3JBXucqqeAu1enkm1mYnga1JZ06lyxhYsl3ONVoxPd3nqfjsOtd3v2vt4SRp1
	dp1EQhD4Z+QVV7sOeFCgzONo+RmNwYPgdLA2vUcjRgtP5YRzbBpp1VCnsPY5f5I0KTXxIhzR4YZ
X-Received: by 2002:a17:90b:578e:b0:34c:2db6:578f with SMTP id 98e67ed59e1d1-35965cccb83mr6714723a91.19.1772352392000;
        Sun, 01 Mar 2026 00:06:32 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:31 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:22 +1000
Subject: [PATCH v3 3/7] ASoC: dt-bindings: add TDM slot idle mode
 properties
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-3-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=115g/WH2mtui7fHuZcwchXsAefVgpriJAftdKhU/VY4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fH1CYvWfDi6+VdS/ptHsxy/zZ9/q/rWu7bdB9du
 c1wrz6BrWMiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV96cxMvRPZA5hNnB6kNker/euf6nWnZJG5XMz9l95IXBFaqHH4QUM/13ivlz
 XP+vO+XRlp0D1vO8fDn37U1wXWD5Z6kr+pOTQSCYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add properties to describe TDM slot idle behaviour. These properties can
be used to describe how a DAI is supposed to behave when not active.

For example, Apple Silicon laptops split a single I2S bus between two
physical lines which are combined at an OR gate in front of the
receiving port. One codec on each line is expected to transmit zeroes
during the active TDM slots of the opposite line, or we will have corrupted
data at the receiver.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.yaml         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
index ca71e3660f62..457a899e8872 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -20,6 +20,20 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Width, in bits, of each slot
 
+  dai-tdm-idle-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - none
+      - off
+      - zero
+      - pulldown
+      - hiz
+      - pullup
+      - drivehigh
+    description: Drive mode for inactive/idle TDM slots. For hardware that
+      implements .set_tdm_idle(). Optional. "None" represents undefined
+      behaviour and is the same as not setting this property.
+
 patternProperties:
   '^dai-tdm-slot-[rt]x-mask$':
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -30,4 +44,9 @@ patternProperties:
       a mask. The first element of the array is slot 0 (LSB). Any nonzero
       value will be treated as 1.
 
+  '^dai-tdm-slot-[rt]x-idle-mask$':
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Idle slot mask. Optional. A bit being set to 1 indicates
+      that the corresponding TDM slot is inactive/idle.
+
 additionalProperties: true

-- 
2.53.0

