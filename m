Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8505247CC7C
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692680; cv=none; b=WLu/WQsOD/celhSVueaQ1U6LAqDd7eVl6yAmFac40uNeb3vShM0+byV38gYv9RiXOa7gxq2aVOEJ7meMus+IZaPVVb4J9OnUFu1+NbWveQc8BfTXmGzNSSdKRLXP4EJ0Rm4LcHUQHou/r1X5QR6fS88Y3OV8SNpxd1lq+toqNvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692680; c=relaxed/simple;
	bh=PkNTUMrO9A90ORm5UpNrg9J+YT1OSjZKeeLipJ8J31Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBaM6+uFcT2zBq5jBGEFPRmj3CWxKK/MIluhVBeMkgV7OGMzjOgiz8cwD0HSabziO55oxgaFfCAjpkKomXPYcpOydyvvAdHwcdPkbKjjqhwQ8QqBwAjYSwLzMWFkTsrhRlR8rudPYUpaMknOquoKE0cmG/jGTGbUwyq/SDNsxJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/AN1+eQ; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/AN1+eQ"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1384eb94d20so733984c88.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692675; x=1782297475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=;
        b=e/AN1+eQjAmUhgaCOVXIVXBNE1Cgn1bBZ7xsPghEWabDbtD1P09z+ffY/9Ivb9s5+R
         VOx39WIclWZ1tOGcI1PGR+I3vG5bcbyFHoQx/XGksCedcKOHuiAm/1ItfqUlOVuHqzW9
         orHn1pGNwOjcl7EJq9XwOT5s00gTlAhMLIMvlwKON2ec3fNubNoTwQlWoywZVbA2nhIp
         cgPf1YFAiUZzaPcYqrq992hiJtQjSkymJ1vzfuLWtIlpoudknGJoULYn9L+amZsLqqcI
         nzrWPe3weGAuFU6cHPRfIkr/p0fyY89imitNMjhEa/NQ6zJ5W8tmHdM/L8kVngxOE53K
         dNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692675; x=1782297475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=;
        b=qU2yeOhAfb9iw+07Zz69BfmJoiZKOVsMsZ37LcBE3FunS9LAyn5GzvNDCDA0oZGPhp
         E1dyrNa2F6ZhTbPhWwxiJBnFDh/4SF91tAmWulKA2vwp5W0eFMpIiLWUcGhUu4YcBDQO
         IVJN0JgOD4RPrAEjvMcOgnyU6BdldWvsadsJLm5btvfu6UWAZtWMxVza3NzBFPxSyFOr
         +YOKXuR6//fv84Ki+EAytcQJW17+tT3FZXI0phTPpQ4GDPuK82ykH4xQybS/QbNFRbt8
         hehtA/B8erp63mWVcvVYTyFvuASt6EE+e7NqgVpA4Qevmvg6STY2+AD44BF2Jl726ENe
         R9Nw==
X-Forwarded-Encrypted: i=1; AFNElJ88Ri0N2KcbuTitO9UPG1G+0OGnHQ9w58SjDSj8NmtjINMUmcc0pmJU3Z7Npnh9OfRzLaxvgkbJslqZtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcE1FWViqPhRmNBjYplf25PxnOgu/zrGus4fOVpL1ald8zSb7D
	MyIP8do8Gqvs+pUAQc9tdTVCyGQ73aVyszrInUeqbBc+Pm+vLv4vjUIO
X-Gm-Gg: AfdE7cld4H4KhMQvDL1+LoGbWjsC9kCPK0/6cEAAk89qQVtD9YIGD+CQ77af6pd58PA
	VG3wq0AAbrTRF6irSyyLtLs3LWALhj1l+1Qp6MEk7Q9ellRBQdh47kz6PPK1rIR5rRJGCPHqABS
	P6COyq4nkhkagFD4HOU6EhN9UVO4t+Ccnx70fmFylx/k8MPb4KPIXZaME5Xw7F1xFDLVZm9iMWg
	rGiSnPEEKatf+/WIVorH7mvXeQrKi48BytGhqzKnvrZtGIaehrF+JtTuJ+SGfV9IFiyqyw33OXF
	aZHOWuRuELZuDiBQUAlNY2DOYig8qPlqFPtcpcieR2apCt3tDqIsGLMFf84tIAeUJAVKg62WY5r
	SM1WymVIH4WTocG8rFc7cKiF9hOk6QHPcz16Ew9dRzKVIg4DbKyYLssHFpX9p7lG8075TLPjXvX
	30ifJ6KzLdC/7r2dW2Bp8CE9eY+5ogKJl9X8nO7Zq8QqMoTb0=
X-Received: by 2002:a05:693c:2288:b0:304:de2b:446f with SMTP id 5a478bee46e88-30bca0aadf5mr1738283eec.28.1781692674617;
        Wed, 17 Jun 2026 03:37:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:54 -0700 (PDT)
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
Subject: [PATCH 32/78] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:49 +0700
Message-ID: <20260617103235.449609-33-phucduc.bui@gmail.com>
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
 sound/soc/codecs/hdmi-codec.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..608a0bf28887 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -452,31 +452,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (!((has_playback && tx) || (has_capture && !tx)))
 		return 0;
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
-		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	if (tx && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
-			goto err;
+			return ret;
 
 		snd_parse_eld(dai->dev, &hcp->eld_parsed,
 			      hcp->eld, sizeof(hcp->eld));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-			goto err;
+			return ret;
 
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
@@ -484,8 +483,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +500,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
-	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
+	scoped_guard(mutex, &hcp->lock)
+		hcp->busy = false;
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0

