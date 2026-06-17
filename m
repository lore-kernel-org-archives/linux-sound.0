Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4D73F58FB
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692401; cv=none; b=NVZinM8sG0lZT7BBPpZ7b+TzXwrBP5vcmi+bmQtNIFk8cZszGjSeDouMSDt713yMTAzdBwl2ui9zlBRDsF4oJ0u6gQyROGsj4YpN7KAJi1AlIzCJyIrJsHya1N4GJEt1OrlIdBkKGPvWW4IRLAjg+cKtXs56I+QmUplkokv0h74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692401; c=relaxed/simple;
	bh=fUlQ+FnQe8ks2Bsyu9vc+jCVXkfhxC4s7oFtyOeVt8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOdTg3gj1k/N8aqFPEZ5WH877/vIZ2VVX/dRM90Z8/S4ojQRyGyV4mYFFSHU8xc+lo6VGklMNLU2pHBgBaFWVwOqMrwsfUZdP6fCqTkDm6JNTekTfXT7UtKIiXdGH+ZymudPZSsFvDhFX+YaGtZz18F+MoLbx8zNWZGFVDm9UJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyK9wgm2; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyK9wgm2"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30b9e755555so4890152eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692399; x=1782297199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRug9eLPJsGmAP+VJnwvB7OkJ9sFAbmMJ4eYi6JABvc=;
        b=iyK9wgm2j4YfkQDlDKlY0SDsvJC8I2+AC1Gwq5fmoJw5END9BRNEaXYZjTYsD5mepf
         LAdF1RGnn0EKCiAH1OUxn2YcrRA/rwkvFEgm/TCbHqZPw2aitmKkj3Hc5shsGOkpss7H
         vUEDarHIGymGJC8paOvhS/RNn8D9dAwWh32pEK94pjC5E3HdgNxZ73Kk6CMve4YvsL46
         /MIjmy5VWT/5aaB7zzjhSCIEoCNUpmpYpoLhlY4PfRG5yiEuVM/ND5u0dcunn+ZojVKr
         9d/zhqTh4hGKT5QGKjyZ40sTzT9BdjkhbVURpDc7aVTE3pkWxBVVsd8nNUhu3ww9LCBp
         eWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692399; x=1782297199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRug9eLPJsGmAP+VJnwvB7OkJ9sFAbmMJ4eYi6JABvc=;
        b=Kt4Wexv1H6vZZly7VoFdwxSzVYKRmefkIWvPGJfhmHdlvrNIChrw7+AweVKmNt4ffq
         NmtoFA0HGqsqBsQCBLB3BUOEH6CRxTslaBfK8W9njeUnkrIErITloD2DW9EsJNTSrN1W
         hCahuHx+RDjzxGzPJ/RxSTBwIbngXFaj9fMA+uhDivTuDECnCHBarQU46IGLW68Ligd3
         TGhCsDeBcAwZYXMHc1hjK/5DvAa9Fpssx1H+Q4sjvBBBLZDQQ5Jbcuc4kSfvn8+Wu0Rf
         gQq5cQC9IXpNBQXmPjmk+3zHU/0HlNqZhlg+Muqsygar+4Cf5KXiPU22WP/RdJPoKT8C
         Zh0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Z5+sCk7ActQ7wnGMWlVSu++lPVKxR3RazCP/hvkBTonryuQpOzsBODWfX2eLnEEzJNQPTepwat0iXsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYwm66U1oH17oEWJSgqOlv5CPHhGjQG0KbOBlNK4XtmI8f8X4g
	TvIu7rCGP1K+FPnQo3NTu8EDrgAJo4ecF398Ko+Y8B5eHBM+0ffndvwW
X-Gm-Gg: AfdE7cmkxvnkCvBAj6KS3p43Se/O4WeUgb914/WmG/jZAfIfsDDsf4a4vXdHZ/5mboz
	lJ5Gl9mdy3MoQTJCsGkz9PHiTDfHaxAl2a/QKVu5J1r9PmGZuFDOdkXdwQ7TKEiz93L83V9OAtX
	cD8gJhvlD5Hp8s9cBGTXP62jNnCq9dmdbIR66QQNOyP+vfugR2JJVhDobfB8tNyBlAWd+cZTdnF
	t/moSqUFeURjU8JC/0oh8qlNQLz9vXMkaUGRVA63FDQkjuyO4oL5Rki6BeRR2LEEgxbiJlbW5OD
	RUXOj0VaCGltLjZUdB5Q4jfBYfQd3Mh5irPWJHNwSsa5Jxf7SbIuW/r0aqF/s/jAytQEB0jIbGP
	0mgstdeuK5zPHGOYusGzVq724IEKKO38l/DynFBrGMqjI+lLQYnhKwrlM8zBBxcCw3xiIvCKNID
	NjX0i9DMkUuYeUsIilndPKhK5/MEfQvu+tW955tOke46IpK6E=
X-Received: by 2002:a05:7300:30d2:b0:304:5bee:f59d with SMTP id 5a478bee46e88-30bca0ab339mr1950409eec.29.1781692399061;
        Wed, 17 Jun 2026 03:33:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/78] ASoC: codecs: ak4613: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:19 +0700
Message-ID: <20260617103235.449609-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/ak4613.c | 72 +++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 3e0696b5abf5..413ef55b918a 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -384,7 +384,7 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 	struct device *dev = component->dev;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	priv->cnt--;
 	if (priv->cnt < 0) {
 		dev_err(dev, "unexpected counter error\n");
@@ -392,7 +392,6 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	}
 	if (!priv->cnt)
 		priv->ctrl1 = 0;
-	mutex_unlock(&priv->lock);
 }
 
 static void ak4613_hw_constraints(struct ak4613_priv *priv,
@@ -507,10 +506,9 @@ static int ak4613_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	ak4613_hw_constraints(priv, substream);
 	priv->cnt++;
-	mutex_unlock(&priv->lock);
 
 	return 0;
 }
@@ -599,42 +597,42 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
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
+				if ((iface->fmt == fmt) && (iface->width == width)) {
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
 
 	if (ret < 0)
 		goto hw_params_end;
-- 
2.43.0

