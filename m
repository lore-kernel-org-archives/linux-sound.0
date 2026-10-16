Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D3A4734C5
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146860; cv=none; b=mqRTBJLC4Yi7NTmxGhpgYptlB6eGGi61w183xUVn/idBpqo+5lq7vJiehR721vh8E1FkQeI91SD91jrE68w9ZvU+T/FBERL/SE7HIUQt3sQ43pkQHPaCeBpz/bf+YRIfLQ3f4a81BgRp+BtkN3V0B3ondbr1X2bJyji2jeHGMyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146860; c=relaxed/simple;
	bh=Nv8VQkbUiPG1aZzPVXB79Tte0iN24CS3tAzHXZLKcRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BjJjRkmCEFRpY30hHpllmE2Yf86nGdspMALGxPWjAsEKqmWEi8MwnmrTxnqvoS2STjbMMfO2Hh9O6ap4VlPKKbu2Xtv7/5xNxZerlI/b4/5APwneFkiVPRBclWuVRTPaRXb714lgopqMP1Dhd8Y6zFLu7sUcv62AuwNZpA486Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iSA9ftEE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iSA9ftEE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df54150dfso1029587f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 03:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146857; x=1792751657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+lEaq8UIfWxZ/tIjV0SG6p5OStGVbQ7BX4PDBI90Lg=;
        b=iSA9ftEEQ8FdEMAlr4xr2hn58OzlzVzrjXXbaI7l0sSL4u9yroyiz+BjsyFTlwOusB
         jqEmY4YD4HgpXZbmnglOYNYanlWmP3Ry2n6CTE8tvCAwFcRMsKr1tQv7fJF1LqPCp/NH
         /MA2StCJ3x0LqaGhmQz+889q492f10a52TW8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146857; x=1792751657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+lEaq8UIfWxZ/tIjV0SG6p5OStGVbQ7BX4PDBI90Lg=;
        b=gBdtGhmHJ5n8z9kdfpT9NwLddvT2dhlqVXoPmu3OaYhNchsdo3BZWUOyG5t36QzFoK
         7o9PLzLb7HLiPXSSdvmfJEXWejVEb0oESLZ1WKHfORpDp9tBQLbynVdGTNEuHmHEbxJx
         8bW96WjkgDNHyY+9C6pA/+kaYoxw66vy+ixlDZsdtpZigEIDma5RdsX/hFk+ufRIbuxe
         g/XSiun8Ku0s+HFyDrHNd6aavSp1b+7/hNlcPNu2EF0EN9pLARB19QUVbHZvnftHuKxv
         qfC6AUszSQrYTGiUTOn1FdWME03Eq4OEC7/4ICrw3mEcpYZ/lijm6tNoVxyXLZh9MfqE
         i27w==
X-Forwarded-Encrypted: i=1; AKwUvBxz1ClhXgKC6w+8IPVS3h/vY8n86OttePs1dsBWG0hm8R19TiKQk+aOEGMRBGB9nkxXG9VDZjTqR8G5rg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLBj4Yxni40iwPbAuXU5wGfzcQjAUnl0N49PU6kn9CJFk7ZioGi
	qsUs6nkLobEJHCd3pPeO7PHuu7BEibB1BlBq0MEPrL6QWwxS7RLADuvK4CM0sbNBUIs=
X-Gm-Gg: AYBFou3n+jxdA171kuKBrt24uWB850zxW9R52YjfRUzKH/2QuBNE0lYl+12576XcUGA
	sjpCAiixkujnWvYTIufJr8ODxPD+w3O2eTgKL4VF92Q/gz7/1zK9RhudhdjqnvmEetWqAWXsOm0
	4dwNPLqE9P7qXHx8oRNKTGI1/yKgAuKGIUfYmQT7o3tqOsUMk52Dm7/9ackqRhuIOlJqhKqIYXP
	pwbgO+bykvSy3ro6C34CCu7EWNYnytRqAQQShIIP+Yy/axkWjuRUGq7iFtmCcTwYt9faHSSRN7Z
	Ep3/APET5J8mm6NRBfuu0h/MifhmtnwYoLG0yMmtmDejsM6sScaUzHrZ3B3pNhMrR3HEu3Q23h4
	BcNg+80vZLnjFZLZqjjDhntvbg4vZe2rConc+QLpRRl/Yp/xGgwwhxUP2950JIai6yhXNm0uFC8
	7kOucWXTzeixvufr1uOHwoimvvBd/nRkaV/mmgw1aYRixDqGRvY1aVaM2d1e4KOhNXLVSYS07qH
	BZAFBH7F15aF8SdYqTRqVHZdedOlcCioq3Rv+HpfzK1L4y7x0PvI8o=
X-Received: by 2002:a05:6000:2905:b0:48c:6d9d:9f90 with SMTP id ffacd0b85a97d-48dba9d0b47mr43566956f8f.26.1792146856850;
        Fri, 16 Oct 2026 03:34:16 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm4154979f8f.46.2026.10.16.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:16 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 16 Oct 2026 12:33:55 +0200
Subject: [PATCH v2 2/5] ASoC: pcm179x: Refactor regmap value lookup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-work-v2-2-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
In-Reply-To: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

Use a table lookup to find values for fmt register instead of switch
statements to prepare for additional codec variants of the same family.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x.c | 60 +++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index cb70927872aa..61b87dab3266 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -65,6 +65,31 @@ struct pcm179x_private {
 	unsigned int rate;
 };
 
+struct pcm179x_fmt_table {
+	unsigned int fmt;	/* SND_SOC_DAIFMT_* */
+	unsigned int width;	/* sample width in bits */
+	unsigned int value;	/* FMT[2:0] */
+};
+
+static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
+	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
+	{ SND_SOC_DAIFMT_I2S,     16, 4 },
+	{ SND_SOC_DAIFMT_I2S,     24, 5 },
+	{ SND_SOC_DAIFMT_I2S,     32, 5 },
+};
+
+static int pcm179x_fmt_value(struct pcm179x_private *priv, unsigned int fmt,
+			     unsigned int width)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(pcm1792a_fmt); i++)
+		if (pcm1792a_fmt[i].fmt == fmt && pcm1792a_fmt[i].width == width)
+			return pcm1792a_fmt[i].value;
+
+	return -EINVAL;
+}
+
 static int pcm179x_set_dai_fmt(struct snd_soc_dai *codec_dai,
                              unsigned int format)
 {
@@ -96,40 +121,15 @@ static int pcm179x_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct pcm179x_private *priv = snd_soc_component_get_drvdata(component);
-	int val = 0, ret;
+	int val, ret;
 
 	priv->rate = params_rate(params);
 
-	switch (priv->format & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_RIGHT_J:
-		switch (params_width(params)) {
-		case 24:
-		case 32:
-			val = 2;
-			break;
-		case 16:
-			val = 0;
-			break;
-		default:
-			return -EINVAL;
-		}
-		break;
-	case SND_SOC_DAIFMT_I2S:
-		switch (params_width(params)) {
-		case 24:
-		case 32:
-			val = 5;
-			break;
-		case 16:
-			val = 4;
-			break;
-		default:
-			return -EINVAL;
-		}
-		break;
-	default:
+	val = pcm179x_fmt_value(priv, priv->format & SND_SOC_DAIFMT_FORMAT_MASK,
+				params_width(params));
+	if (val < 0) {
 		dev_err(component->dev, "Invalid DAI format\n");
-		return -EINVAL;
+		return val;
 	}
 
 	val = val << PCM179X_FMT_SHIFT | PCM179X_ATLD_ENABLE;

-- 
2.55.0

