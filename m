Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212153D25A2
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454441; cv=none; b=i3UUVzMiaNjyaBMraLhxUVgQTNHhAQCn9hYN6Xk0aw7joo1ySb6GLoDikycIMZ8L3JEvnrslG3mN1J9r2626XwvQ4kWNnzLXBqg8nDxThejGU+XhHBxTHXE8zPUBn9RWGw+qAR48vkU4hZOR0vY3id7RJoK6aegSRvLRo4pqSiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454441; c=relaxed/simple;
	bh=VBywIEI+mrkeBMiuQwNmf5i2jTPdGPDjHD+MzsDCtuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wwn8TM1R8itKXgl+TBrP2U9mFhmtgIhwudCypILtC8BNGnWOal0WgaPsDp+7o6VReTnrroWx/JmyTYQMao5eewNL8JA2XqjMGq7kc0ej3gGjOmAVd26PwkFu3+n5aQaIegFvN7ELGER4OH+XKkAQZYEjYZ2WSGw6a7cuPpFk5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAwCY2HI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAwCY2HI"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37df0b86a82so991824a91.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454439; x=1783059239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4Mllffw4khwUVvJSV3KZtob20XT8yXXusLnJJ8LlWE=;
        b=IAwCY2HIr3P1bXO1efDjz0YduAmaNNTnJEtp5OvLGi1XKsOELiVKzRoQoQ3IVDqa18
         9elJ/XihiFKkVadpB9gyGjA2J4LVpDFozOOREK6al9BzNo4h3K80J8mybJrrev8+rwGp
         QtBE9+FSKu8nfZrFQ//XUiyW1yrtKFijPtE4qLXvsGMV/OBbMHbaseGGvASPaEmGuGuq
         iPtTWsIk23q2AFjdBc8HqI0t4DQ6Auc5jdaVCRb7oueD+CBwiVV+c2mwfooj2h8QDY16
         rvIGrhqdvxv3EMfXJetv8JZqEEu/BTwng1Ub2BdyJLRU352ZAqbax+qk9DqTXTMyfYz+
         LL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454439; x=1783059239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r4Mllffw4khwUVvJSV3KZtob20XT8yXXusLnJJ8LlWE=;
        b=B5LCwbMfTGlWJHC8LGeGTR4VWTOv2rCujiMdvFomAa05oLg9BvyIBnYCTLTeuTeMSE
         d6ZEWg0jxsjBW5dQBE3/BfzfHHSP5qtOIlTDhFv8guu90N6oxMqNUlPwpzsO9aqXLRda
         p5qHqk+iFWaHfGmDXhmNpsCF5layBtkCKzf82zkf/bt/B0cM/eiqn+oZPxv5txkqrkcV
         4Eg2dWI9uAk5eHEq9k4aJP3jwKiic0sKP6zr/h17vi9fCPNyiEHb7AzYrmo1bpsPc5PI
         ic7EZYkplK1Q+Y86SC1H5Q7KNAKE251qSjMID0N4OQp/P2YkIdM3Bd3xWRMX5C9Sz5c1
         mkhg==
X-Forwarded-Encrypted: i=1; AHgh+RqchmQw1/SRmRwU3XrylInY3gbhW/OdvJuNArBd0DkzerMc0J6xf5LrOfCyyUTSOBJm7U+ltu/zrKioMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfpcLoN2riPaeh6ZLQZFFQzQQbSqPBvOCuu0OQnKC7Is9+hw12
	KeY/Y3aSj51yKKHX/j/ADr+ZPCW+gWl7AnzMU48VoVCPRKuaSanBzefS
X-Gm-Gg: AfdE7cnB3ok/5Zjdf4Acxvv2epm1RhF8XlcU+YFs/LNiZIz8lJZN03cRLrBxerXTzuv
	tY4c/J0xf0xY9QoiBVrTW4a5OgJ05ZX1F+5szt99Syfp57GQ4p0g4xWq/L3r1Du6YsukNHYN981
	LZDCMUsmte9HQaxZAA98Hr9OZYkHitbqgH54fawDz1Wp3AzpqNjUl8d1w7Bh9D7j99HGOWMA+p1
	ncMU1M2wUktFll9s9sTEpupElLRntQcsJZEawMnxqoJAff3gYQmwK7BQ69Qli8ZWaD/Z7Y9mafy
	1r8J5OwrTY5mPoUXIobHuvpEsBYXBydJREg6T1O2ZEyS4MvmGquDB5WrB685feh9GckBYZp2Ku+
	6zrKKGYYvRavOtmd766YfGxiNiZUk3OBDJmZHmyNVHc6lHjXei5tSZLjmuo+oJdvmdjzaHMxEzM
	dy0A55vjP8EGomo3WEVuLPxtzg62r8TtIhTtMLyJWhkoRir+s=
X-Received: by 2002:a17:90b:4fc6:b0:35f:c493:cac5 with SMTP id 98e67ed59e1d1-37dcd7553a0mr12778202a91.16.1782454439458;
        Thu, 25 Jun 2026 23:13:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:13:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/24] ASoC: codecs: ak4613: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:07 +0700
Message-ID: <20260626061329.23264-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ak4613.c | 83 +++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 3e0696b5abf5..be5306d07d40 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -95,6 +95,7 @@
  * see
  *	AK4613_ENABLE_TDM_TEST
  */
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -384,7 +385,7 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 	struct device *dev = component->dev;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	priv->cnt--;
 	if (priv->cnt < 0) {
 		dev_err(dev, "unexpected counter error\n");
@@ -392,7 +393,6 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	}
 	if (!priv->cnt)
 		priv->ctrl1 = 0;
-	mutex_unlock(&priv->lock);
 }
 
 static void ak4613_hw_constraints(struct ak4613_priv *priv,
@@ -507,10 +507,9 @@ static int ak4613_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	ak4613_hw_constraints(priv, substream);
 	priv->cnt++;
-	mutex_unlock(&priv->lock);
 
 	return 0;
 }
@@ -599,45 +598,47 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	 */
 	ret = -EINVAL;
 
-	mutex_lock(&priv->lock);
-	if (priv->cnt > 1) {
-		/*
-		 * If it was already working, use current priv->ctrl1
-		 */
-		ret = 0;
-	} else {
-		/*
-		 * It is not yet working,
-		 */
-		unsigned int channel = params_channels(params);
-		u8 tdm;
-
-		/* STEREO or TDM */
-		if (channel == 2)
-			tdm = AK4613_CONFIG_MODE_STEREO;
-		else
-			tdm = AK4613_CONFIG_GET(priv, MODE);
-
-		for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
-			const struct ak4613_interface *iface = ak4613_iface + i;
-
-			if ((iface->fmt == fmt) && (iface->width == width)) {
-				/*
-				 * Ctrl1
-				 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
-				 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
-				 *  <  tdm  > < iface->dif >
-				 */
-				priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
-				ret = 0;
-				break;
+	scoped_guard(mutex, &priv->lock) {
+		if (priv->cnt > 1) {
+			/*
+			 * If it was already working, use current priv->ctrl1
+			 */
+			ret = 0;
+		} else {
+			/*
+			 * It is not yet working,
+			 */
+			unsigned int channel = params_channels(params);
+			u8 tdm;
+
+			/* STEREO or TDM */
+			if (channel == 2)
+				tdm = AK4613_CONFIG_MODE_STEREO;
+			else
+				tdm = AK4613_CONFIG_GET(priv, MODE);
+
+			for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
+				const struct ak4613_interface *iface = ak4613_iface + i;
+
+				if (iface->fmt == fmt && iface->width == width) {
+					/*
+					 * Ctrl1
+					 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
+					 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
+					 *  <  tdm  > < iface->dif >
+					 */
+					priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
+					ret = 0;
+					break;
+				}
 			}
 		}
 	}
-	mutex_unlock(&priv->lock);
 
-	if (ret < 0)
-		goto hw_params_end;
+	if (ret < 0) {
+		dev_warn(dev, "unsupported data width/format combination\n");
+		return ret;
+	}
 
 	snd_soc_component_update_bits(component, CTRL1, FMT_MASK, priv->ctrl1);
 	snd_soc_component_update_bits(component, CTRL2, DFS_MASK, ctrl2);
@@ -645,10 +646,6 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, ICTRL, ICTRL_MASK, priv->ic);
 	snd_soc_component_update_bits(component, OCTRL, OCTRL_MASK, priv->oc);
 
-hw_params_end:
-	if (ret < 0)
-		dev_warn(dev, "unsupported data width/format combination\n");
-
 	return ret;
 }
 
-- 
2.43.0

