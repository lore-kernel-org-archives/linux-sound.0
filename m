Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E4532ED27
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352401; cv=none; b=HnwKLmJ3ibosAfruVnQBT8U+lA1DAEmGrgxhfBmg6oF4/DoemVSQIN06gnbVz6/PJST2gwV961tm4CLePVNmU6TCQISiknBIrVjJ5WNZYKk3jnn6WyoFna0w2f6y43NdCI4+txU0WLsjWEsehnXDN5ok7JlsNRzbqCXGJ/SZv1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352401; c=relaxed/simple;
	bh=VyTWRPS81+vOo86P7NyB7zBl67kC7Sarhern+hi6yV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5o3bMaGLpwAdd2+YAFmkQr/iNhtJMt4pumS7li/Tm8fptOvnG833vd2DUbxRnGgHQ1aZhDEtLKCDml6KjjNwBMx3JI83ZWNwML/GxrcvczeIIVcfOzg7bnwZYCUkUdwPsr5kI6aFMPpAVB0OhnKQz8g9oMuxGasqKPDciuf3hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9bwnysP; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9bwnysP"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3597df496f6so362378a91.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 00:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352400; x=1772957200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COktpS70G1jBT7Oq0awQeJHx1NZJeipbMMF36OzY5Z0=;
        b=U9bwnysPsazAHpbYU8klwctF30VxW0j2I3eRmugN45MVcbGBNG8WrxWxAsUAD2AZVz
         YYng8FmyQTqiQkLiwKXUgP63t2geqsGGR/aiZE0HLCCiI53SIw4NzP3mlFgIimuKaIEA
         qfPLt1Xky++OIMNBrnXJliqb69p96D1CjdBQlWZBde6xI7NqHxkneDQUErLiIxdHyQJ3
         dV1jlvJFY6UHzLkchbIkUL1u0X/FrY5Oj2Y7+6PvwgXVkANLP7KsXcgu0wAY04IZumwk
         PMlsihkZghn+EH7bomWaoVhjr7mM6OXHdvchV6u+iD5oSdEK8vMaxfHo5cQbQ7g0biQT
         kR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352400; x=1772957200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=COktpS70G1jBT7Oq0awQeJHx1NZJeipbMMF36OzY5Z0=;
        b=W/XEySys6Lfk3i/YCV9jNBsHsQziY3TCnlPevh5TNzV1e00QEdje8eZaiZGVpUVbZE
         7D6Id13G0bOIYFXRPciWf8FuFT8tk8vth6TUv1DvToQWnzEN4ucDyEtXwuscKcMbEReh
         bzywk09DGbz1OdSbsSisyejoso/PE/b7eyf5Ah2t0nLCKlX+f+tlFYOhxGsH6rqWmf4y
         hEAXBubVKp+/9br8pBfczLenBsu8EnOo/AOkIOLMFgHK2Z9Q3wRJcaprANxrnIwb8Bj1
         eX3p01LiKVLoHJ/Yz8X9Dr/g6eiZ3Lt3sqRDtKcx+j8OoNcBqahCNCpmfJt8bRheo/S7
         qbMQ==
X-Gm-Message-State: AOJu0Ywlw0ID+7KvVUDkWkE36rfE2AfGMQOtwaEfxGyzPujGEutzXK0B
	vvKfowHMijmfGQS7KqdcOUBTL3r0cKCiDsEMHFKBWyi5VQLdot0oYBN5
X-Gm-Gg: ATEYQzzctCGYNvgZPgMwma2i8Ie+O5C6+zcRFqLpPon6SNRLDRrZ7V/Ghe8UEdn17qA
	jjNna5nhs4PSXnpGqrYu8cR+/s8scxXzr22tRIlbntCqVOYGiYCJ00UHbHTYe4xGsgtNcyIzsk7
	Pq09aGWPze3JhWc+kfOYJVigBedlUwIvsMdajDvC4LtEMc26nG/0i/cL20GFp+itQlUNfZo7IWh
	MiDDJAFeMDCI0Hscy2zbfyu6mHaI2f2BC8w9lyubuI0dNdVyv6kvbnhqv5fJt3gem3WWiID0Cgr
	TNmEIJKlAuZTVyDaTDXFm1GDjuk3e5D8T/TC8im1JezwgKg4D9spU7jBOgtrXA6h6DzpPNKSTF8
	8Bo1J6/C/onD+cPJP1H0WR0+wTh+HqjfG6BgxgJfbhDa4ezJMEFocJByWGioTnJrZsFcatlpYhX
	b6CkMLCT7rhjP2D6b8FHtk50DI2zmTwDZQHaZHgwmjWij+mMSN0BvfXc9xGp9B9pLZ0a78F3xGs
	f3r59OgJai6dWxAyUYvkfRm9hI7bO35kj38p2qVriFhqKm7SAh979T5aNhCWncc+z0otsIpk5hk
X-Received: by 2002:a17:90a:fd97:b0:349:3fe8:e7de with SMTP id 98e67ed59e1d1-35965cd1066mr4480685a91.28.1772352399832;
        Sun, 01 Mar 2026 00:06:39 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:39 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:23 +1000
Subject: [PATCH v3 4/7] ASoC: soc-dai: define possible idle TDM slot modes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-4-c6ac5351489a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=VyTWRPS81+vOo86P7NyB7zBl67kC7Sarhern+hi6yV0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fXyj+ot16S9/zirdpppzcc2LDlnapn6bXO1G+Hz
 6y9z3LmXMdEFgYxLgZLMUWWDU1CHrON2G72i1TuhZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqJ+gx/GJO9N22/us5k96pFR4/V7C08c4w3xVVcFidZcP8zCcfjNIZGQ6lTXT
 u+PN3rYrwtOxN968V75nySMXRV/eSfPhus8QJ+iwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, such as certain Texas Instruments codecs,
include configurable bus keepers. We currently don't have
a standardised way to configure such hardware, and instead
rely on the hardware initialising setting itself up into a
sane state. There are situations where this is insufficient,
however, and some platforms require more concrete guarantees
as to the state of the bus, and being able to explicitly
configure bus keepers enables this.

For example, some Apple Silicon machines have an odd bus topology where
the SDOUT pins of all codecs are split across two data lines, which
are summed via an OR gate in front of the receiving port on the
SoC's I2S peripheral. Each line must transmit 0 while a codec
on the other line is actively transmitting data, or the SoC
will receive garbage data. To do this, one codec on each line
must be configured to transmit zeroes during the other line's
active TDM slots.

Thus, we define seven possible bus-keeping modes that a device can
be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
(actively transmit a 0), PULLDOWN, HIZ (floating), PULLUP, and
DRIVE_HIGH.

These will be consumed by CODEC/CPU drivers via a common DAI
op, enabling the explicit configuration of bus keepers where
required.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 224396927aef..44dd06add52e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -52,6 +52,21 @@ struct snd_compr_stream;
 #define SND_SOC_POSSIBLE_DAIFMT_AC97		(1 << SND_SOC_DAI_FORMAT_AC97)
 #define SND_SOC_POSSIBLE_DAIFMT_PDM		(1 << SND_SOC_DAI_FORMAT_PDM)
 
+/*
+ * DAI TDM slot idle modes
+ *
+ * Describes a CODEC/CPU's behaviour when not actively receiving or
+ * transmitting on a given TDM slot. NONE is undefined behaviour.
+ * Add new modes to the end.
+ */
+#define SND_SOC_DAI_TDM_IDLE_NONE	0
+#define SND_SOC_DAI_TDM_IDLE_OFF	1
+#define SND_SOC_DAI_TDM_IDLE_ZERO	2
+#define SND_SOC_DAI_TDM_IDLE_PULLDOWN	3
+#define SND_SOC_DAI_TDM_IDLE_HIZ	4
+#define SND_SOC_DAI_TDM_IDLE_PULLUP	5
+#define SND_SOC_DAI_TDM_IDLE_DRIVE_HIGH	6
+
 /*
  * DAI Clock gating.
  *

-- 
2.53.0

