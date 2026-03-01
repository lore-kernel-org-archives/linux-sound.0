Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9FA2C2363
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352377; cv=none; b=ZlemGtKpxjegd8qGjlR7c6LXug5lPaxKY2c80IWKyjNgW0BmYXkMB7O5qKXNeEgcavEK6IKX0Ds0cVoLejIUfoH/u7+aoriKMbEvZnJfNIY7j8N7bOaAoQElNopvPeGh/Xl5YVOGqc3b1mV7v+4y41NIO5ySgvEPT9f9V+9GNb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352377; c=relaxed/simple;
	bh=HNjAg2xdRxewqWz3EXUwC/PrDpEvfT/uT/eZPObjn+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5RqjQwDh/g/3nUfUBdtX9lF3bBn5c2cPAw1h8syh2WRWY26KfC0pnLIe8D2ip3TqU5k5g6solh24/oxbMkbU0RmJ4Lkz2Zx8a2Fng1FUjMdvTw4L8759VHGSQra+OL4NRIyEY5ERCehBGn8E6shnOJMKLyzCT+ZpVY0LjcAip0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ee9nhMZN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ee9nhMZN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3598a09fcb3so53543a91.0
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 00:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352376; x=1772957176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKbztpHgM8PKD0CcFwHhxyWzraGVBnVo495326Vfa6Y=;
        b=Ee9nhMZNNt9f6rtp0dxzeXF5BSJx4DMEFgz38EJXcCHPAF3eQVEENH8Vd1bq+w6AEr
         YmUzCBUpR/ZiA4DvhdK8iGHLj3U7D5YAHJYU74vzrxootWoCVHE09QfNhEML188l/x3A
         5hVEAv5XjpbbhVF9gGugeevnrk2cFToI06foGzQdLKXYt0n/WxiC29bNkbE3hFyeJTtc
         HNR4yS7MuSlbLtaeBpZdQLOrlwZTCb/aGozpiQG1JxvObxtdyQmcsAn7IjovgFHAZEax
         bfYrO2SL7XBGqa31bj5022wXGJ/ys2K2CuA8iHG3nAI2HEkrkwnNq4uhExA+Qd5swmYa
         WMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352376; x=1772957176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HKbztpHgM8PKD0CcFwHhxyWzraGVBnVo495326Vfa6Y=;
        b=mSAZNY/dLUEJXuaw2ODSEpHfP1ByYWzvWnzg+hFMuIUz9St6kZuzT+AKzs1+m9GCyz
         ivTsx8Bu7lk7wxnpNWunK9vjAtLjTU2TpHBsmaMVQGT0d3NKYxGqWUbRCLkya1opb3AW
         sMDFCuVd19o6lenckoSTq8hWEuD0ZWThwuibLZKf7yBcyI3F3E4zOl4T+9Qb6iYr9Zcm
         cU5RMO8QQust0o8y2ZCM5RdhdPbDHqFMP5JnwF8ru/SvYI7U9o2VE0V7LbPWd3BsaRMh
         mr3fj0qgSk0+kxUCD6GgLq8uSqKK4qxQfYIFGUqh9duwPwTQUChaiXjiFjjVbmdsGHeR
         FyxA==
X-Gm-Message-State: AOJu0YzK2GpZFSTEZS8aF8isIfnaLC/fNkNr74kxxWGKjj4z4JwIXHa7
	ftS3h58YbiUmuiptoJwYrGoHkQ5Zosf6BCrUpKZusjk25xLB+poTDkKrDlL4me3D
X-Gm-Gg: ATEYQzwMy56YxFcGQ96GiTgF4TDEMTst2Htr0YdP6jqSJ9RKWF5fNZpL5s8wPHn6T5h
	iPUNuNs+4VSAmpyfnOSqV8yvHpXba/UwoyZqpqFPL3R4pQ4E1qnBXEtRw/6k6ILzCFURY/orAsl
	dITKJJLDfnwRpZx/8qQJhhMJy+uUhoGBpPHUH5s6G6Lb+0aBtBEQnHZP41tB61Cv38cCFBLHvxH
	dL/cndE91Vv0iEfJgIa62Dv71TjaXc7qPy5UcSH37ToUtoY8TAA0RcoGUEWHLPwqrGUGXXVJPFJ
	kOZVq3zOsBlQ+XO/Y6z7he3QPuEVAIHflKRUZpACc4KTEufvrHN6kJ69iC8BX3Pzx8BRQ6mpOqU
	+3wykL5s0WLCVH1VTmx7czv7JlyO7L6pq3z5OPxoHxwZ5vnLFw4+gdWVZliDWzzV7PKv2OHZdsp
	bZZeT7rNlHg9tXr3k1e9WzCJK7FnMYzcDqDT0qb6WZzs+GwrRKb8dExFyGPS5NPPZB8sok1TJ2c
	S2k+99xWTKcRiR9/BWdAFzET+uKlxNxa5cYtHFjiV6ZYydn6nHJDGQvfj3H1C7lGxXc7pmu7tat
X-Received: by 2002:a17:90b:3f87:b0:359:8014:d5fb with SMTP id 98e67ed59e1d1-3598014d645mr3245982a91.0.1772352375853;
        Sun, 01 Mar 2026 00:06:15 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:15 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:20 +1000
Subject: [PATCH v3 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-1-c6ac5351489a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3210;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HNjAg2xdRxewqWz3EXUwC/PrDpEvfT/uT/eZPObjn+w=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6dvf2pd1qHRvMz1xi4v/i9vSkzeL088WKxRn2z4p
 TMz/bl2x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKpP6jD8FdFdfO5hUsaOKw+lrt6UzfgXfjtO7nf3noRZrzrm8ISFFzAy3LpZs+4
 O53ye+6smZzlZH57lNf3Lovuq18IcX523mefVyQgA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

This schema was still in plaintext form. Convert to YAML format.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.txt          | 29 ----------------------
 .../bindings/sound/tdm-slot.yaml         | 33 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.txt b/Documentation/devicetree/bindings/sound/tdm-slot.txt
deleted file mode 100644
index 4bb513ae62fc..000000000000
--- a/Documentation/devicetree/bindings/sound/tdm-slot.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-TDM slot:
-
-This specifies audio DAI's TDM slot.
-
-TDM slot properties:
-dai-tdm-slot-num : Number of slots in use.
-dai-tdm-slot-width : Width in bits for each slot.
-dai-tdm-slot-tx-mask : Transmit direction slot mask, optional
-dai-tdm-slot-rx-mask : Receive direction slot mask, optional
-
-For instance:
-	dai-tdm-slot-num = <2>;
-	dai-tdm-slot-width = <8>;
-	dai-tdm-slot-tx-mask = <0 1>;
-	dai-tdm-slot-rx-mask = <1 0>;
-
-And for each specified driver, there could be one .of_xlate_tdm_slot_mask()
-to specify an explicit mapping of the channels and the slots. If it's absent
-the default snd_soc_of_xlate_tdm_slot_mask() will be used to generating the
-tx and rx masks.
-
-For snd_soc_of_xlate_tdm_slot_mask(), the tx and rx masks will use a 1 bit
-for an active slot as default, and the default active bits are at the LSB of
-the masks.
-
-The explicit masks are given as array of integers, where the first
-number presents bit-0 (LSB), second presents bit-1, etc. Any non zero
-number is considered 1 and 0 is 0. snd_soc_of_xlate_tdm_slot_mask()
-does not do anything, if either mask is set non zero value.
diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
new file mode 100644
index 000000000000..ca71e3660f62
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tdm-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Time Division Multiplexing (TDM) Slot Parameters
+
+maintainers:
+  - Liam Girdwood <lgirdwood@gmail.com>
+
+select: false
+
+properties:
+  dai-tdm-slot-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of slots in use
+
+  dai-tdm-slot-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Width, in bits, of each slot
+
+patternProperties:
+  '^dai-tdm-slot-[rt]x-mask$':
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Slot mask for active TDM slots. Optional. Drivers may
+      specify .xlate_tdm_slot_mask() to generate a slot mask dynamically. If
+      neither this property nor a driver-specific function are specified, the
+      default snd_soc_xlate_tdm_slot_mask() function will be used to generate
+      a mask. The first element of the array is slot 0 (LSB). Any nonzero
+      value will be treated as 1.
+
+additionalProperties: true

-- 
2.53.0

