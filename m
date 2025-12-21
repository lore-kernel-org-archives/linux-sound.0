Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C333D27FB2E
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309812; cv=none; b=QQlhDSg1RGOaLsKXgmTe6/P7f+XzxvhGuREZCpWXURPPMquAVkrefKmeoVd0PwJn0Isb8ty4Z3UvEQD10GoAL5wTCEVf6sSNobEvYhT5wnYeFz8pr9HccQZQ1R6ZRtepnbHKLmsY91UbbBZQKEYRlAJQRckahuq+u27LycFlHuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309812; c=relaxed/simple;
	bh=WG5E/HC2YxDy3oxNYC3bZbjudxqByJP3FjNkgk9QQKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uuIMFvfTPVI+37cx8eeFXBb8pXOLlBBEMyibDuL0r1bwBfycsL8zB/gJb5gggiBZEZdOVhbzzj/8xDvgCcVYeMCqKfaVklm++Beao0zhOCmJJs5IJA6S4WbBy3IejxYnMMhaC6/cxeOlAmJHvQDJ/JowoQrnPc+phFOnNpcgoCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Up9WZMzA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Up9WZMzA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a12ebe4b74so52726745ad.0
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 01:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309810; x=1766914610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8X+CGg6X2TQewpD16dhdCQA0CgAU6ZNu4lyH/rNjLw=;
        b=Up9WZMzAje2jZMDCPa6venfMhq/OwW97evTE2Eu2REtdcNBllov28nhhEaO/zXiioL
         dktnWWx5oqAa/ZNiRvxJua7AIz8+v0iPtxNOWr1rqMK+Oqq0dTmRbMyPuUqQJsg4FDFW
         WpmK4JUME/QDjh1r5bdWJw8Zz0LWTP7HrB4PcI/1wUK+pvbq9sbQzlj1yiO88/qiBDk3
         JL7zCy+bxvrNcyp78wGp+Gl9XldFflfSJevz1PHkhy8Z8AnA9Cv9tNlIxT0E+AW9rr0l
         dMz70CUOx6xS2LQVIOREZVciy1lye061ymgJMlnxO79rT5XwcnOWx0gpjbSiNytHBdrW
         jj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309810; x=1766914610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z8X+CGg6X2TQewpD16dhdCQA0CgAU6ZNu4lyH/rNjLw=;
        b=VBX86Gj46FTCO82unHRSeYw9TNuoSDHKzaJUgQCPcAu7EbRGhPmdv0hhfVs1TgWcgo
         Qn3kayJLnr63LSwOFSpPN21fzZr14/YiIEh9m6m4Xe4lSSf8KRMMuq8Iy6dJb8fZO+Vd
         2idF3yy6yoptVEDieSmCMRmSPhNC4JHfw73DF7i36oqWnXwTlocUlemE9ZHnSXvlNXl7
         +/cbxxr3Vbm7sQKcnkmcLSLuI9Zkgi8axGp8cshDgpzXXw4YBcq/talVGCSrRUoHY1K4
         98Juza88oe8Xy63S0E0Yiv1LCE7tsi7vYR/x1nj7pNE1L9oJB8MUvw/Mva9I2Uo01ZW9
         Repw==
X-Gm-Message-State: AOJu0YyMgGI0nZxNuJ8LnLAus2U0B+/S5qTtBpNG+A+5qXaZS8HvmzTe
	NchHnUPmHcRuY8XH/J6K2L3mPFDGbhWUSxfmBet/bVzNnaMk5Iu76Gdr
X-Gm-Gg: AY/fxX4MhDvkHMlpua8JUnfQ9xLePYPlZ+QEvAvGj5SxFF8+xdh0TTaRFdoTSBTetV1
	HzK8m/QjbtbodRmZyKcgHRI2JOcmb51DBz0C+q4lH0XQfiQwGtF27song6/UrsSd9wwrzUkF8TB
	mAQX1ZYOSBY8ZTHn9kxKLiD23Dpem7AmL1aKYa/pZi/U73QKWltoIGR+vbCab1qJOwNPb0Zic4B
	CSCyIIjF037SoYlxaLdRVldXuxU/Z20BYTirsafLH1RwHkoqEeyS8JK+MwjFluYuYVEm/OaaxnP
	Z+k3tvJ/QFksiK7vqDI3x3lTubXD8A0MC5cBR1rIuIrJStne1V6cJAC30m+QjU5Cz4LpzPUdYeP
	+WOP3fGWyhQxgVILHUYRww/S8MYU+9mMZHnO6IkfHO6+gaW4c/K9SE46JU5tjl0/84CSH7Q74mq
	w2siWz2SiFTKzqzFm+D9xHn4lWVdRaQ9eMMYx+HkEHOa5UAPUs6UlAg/2/BD17FmfWuOD59W2nY
	N0srls7K4Sn2eESo03LFI6/vEL3tNep+JUi04iFnl6yjTGqdkYQbHhqIGqLKSuFo76Uua/+gDI6
	+PtrVrUNK++96ROPzIdmDfmnUUyISfexT1q34iWeDtvyXi9jJGo=
X-Google-Smtp-Source: AGHT+IE8jH5CF7+AN79OkklOKmx/JMvaSoEQ+RMtmm98sJVMFFzecpBHy1QLye0QOgZLDfrXbuUvuA==
X-Received: by 2002:a17:903:ac4:b0:298:2afa:796d with SMTP id d9443c01a7336-2a2f2a56707mr72049865ad.61.1766309810032;
        Sun, 21 Dec 2025 01:36:50 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:49 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:35:59 +1000
Subject: [PATCH v2 3/7] ASoC: dt-bindings: add TDM slot idle mode
 properties
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-3-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=WG5E/HC2YxDy3oxNYC3bZbjudxqByJP3FjNkgk9QQKc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yfrGR48+UOQteLYKruZFvVKuT2pb3sY230nqCaUG
 UpI7DvQMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Qx1jHSMGLk4BmOqzCowMPecqt8ecjPT+cT8yyy9z9/n5x3WvxfH3eX5gLJd9p/PlIyNDu2reTcm
 pK7IkV3w9ln6vMD8xT/VD8t/FQl+vqLe6M5owAwA=
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
 .../bindings/sound/tdm-slot.yaml         | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
index 5bc46048d689..e8b2d35a7c37 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -33,6 +33,17 @@ $defs:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: Receive direction slot mask. Optional. Identical to TX mask.
 
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
+
 properties:
   dai-tdm-slot-num:
     $ref: "#/$defs/dai-tdm-slot-num"
@@ -46,4 +57,26 @@ properties:
   dai-tdm-slot-rx-mask:
     $ref: "#/$defs/dai-tdm-slot-rx-mask"
 
+  dai-tdm-slot-tx-idle-mode:
+    $ref: "#/$defs/dai-tdm-idle-mode"
+    description: Transmit direction idle slot mode. Optional. For hardware
+      that can configure its behaviour during idle TDM slots via
+      .set_tdm_idle(). "None" represents UB/unspecified behaviour and is the
+      same as not setting this property.
+
+  dai-tdm-slot-rx-idle-mode:
+    $ref: "#/$defs/dai-tdm-idle-mode"
+    description: Receive direction idle slot mode. Optional. Identical to TX
+      idle slot mode.
+
+  dai-tdm-slot-tx-idle-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Transmit direction idle slot mask. Optional. 1 represents
+      an idle slot.
+
+  dai-tdm-slot-rx-idle-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Receive direction idle slot mask. Optional. Identical to
+      TX mask.
+
 additionalProperties: true

-- 
2.52.0

