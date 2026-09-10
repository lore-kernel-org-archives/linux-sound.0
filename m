Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A712489FD7
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045143; cv=none; b=DPk5fhxmw987xhC/ZkUNqv+mHa0u/auG4Sm9yYx1ox1FP9gGgLbfC8J8yD6rJsKS3kt4rEKpI0Zm/7eVAoLKRGNTPSf9ybuGx/6deY6m4JA/B8KFxJnRZQP1gR6e83CKspQKA+0xcOS9v3EY1CLU08kSYunOPD7zt9vQ6pgNQmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045143; c=relaxed/simple;
	bh=HNQ3yAaTj8Lox9L4v2OsrFX6RIoSfJ6hArRWObXN3VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuGOc+4bEXF/B8eLuSqm77n8DznidhMh4jh717iPcXVCq/C9y6KiOA1+l/cOUyUtBzKisMLFB3kCtYvT3exz/IZvDOLVhnouXtyiRiBMkya/hxzD/dCfNf4OdSZsBiTZem/xmQyNSth4HmaOr5J8sbRlU/ivvXbI2tBY+xuHccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXmG+AmY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXmG+AmY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso6197382a91.3
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045141; x=1789649941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=XXmG+AmYeQA5wFVZe4dPHhJnRvIQuS2SddhNcQiHH8MWPBka942XMgjYgqNim3IeLx
         d5kwADZa1r2xjLVXZS/IRgIuIXmk1EBm+iq4gz1jq2nxgAcm9FcUFxqT3Y+N+k5LRbW5
         NyWO2uFYIZyvnY6xpaqDDykqGA9ItPmv7/iPBTORP3fZYi9Ce44x3j2otet0gOwLw7U9
         Ui4lgmQtiJ2tVBiB76vksrXK+3oLxxHYq9frS98i8BA4tfS17PvA99vzc+rp75NK3WMs
         /Q7Wp6vskMvUGcw4zyXMe7Cn1bPbiv/O3sYTBj4y7bFF3vBznrtc455dH/wuAz2euoRe
         DKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045141; x=1789649941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=D/V4iOJnIKcVgftrSt/Ihkz3W76QGrl0HiXfFzF0e6hdGcjii3ZSzPTGo9Zf3AS5NX
         c0WoSgar9mBP9jr9UQIe4vqrMYR2/BG8glEo+00eydU7KT5aDVpUfBl7K4tpOKhUI6Kf
         PSO283cPsj7mwB85N+BYZTMQhkoybEVqkZhXCqFmQhpORz8dYEM69Z3wOn+/Jc149N8W
         qTZp/yifvIey9hbbGgQ0ibCKjLwhVgj2MnQY6Rge716HivczrzvyXLxo301TfZxgZyDK
         p8oqzaRtq+KUr79KxCX/cNiU4PYGQ8wyd5yps8SKMYlWy3I0uGLcgb1CLU5Q21bNH7cB
         r0jg==
X-Forwarded-Encrypted: i=1; AKwUvBxHea2U4WuOnhB6Co51f0HqI3TRhUhye3w+2MyNEfRWXWOSpfLRbvfRGZaTeUjPU17Xvg6NaA8d+FpA7g==@vger.kernel.org
X-Gm-Message-State: AFuF++ltn248olR21QRV+J7VOGsDYAyEBGO/pRsFXhD2bt/GMggjq/O2
	VxC42Ohzf099fAD3mmPnzHa/5UiBYZyVIYi0yj8EiYxXM2e/hrVQhnYT
X-Gm-Gg: AYBFou2TEm5AACY95epwt3I+BhXFIeihBA2Yk4uh96w/wQ74+h3m6jPEkTCODDFIBPf
	Lq4V/i7yHScqkq+0BODDIY6RneTc7+7fzC6jmwq0sCz5fwrzLC1EwBIrVI7LIPVZPf6lpM3Rwwt
	gBKGi6VeUBUPkXhcTG+k7VABVBinTtiTdynK/OpWhhpeEC7a/rfCp1M6Ybl0mrl5ksAO6gXaFOf
	FPGuA7fM43FFR1GvAgObPbJy4omWozYgv2nW4BeII/RKmS3aT/N7RVcMz2jxvFr0zYrxzCSb9uJ
	XlikPR9qus9fiPmOZ+PyEMlUUvriH2vFACwerPQmvZiOat1Trh5RmJM0bned/mR3D8D4ToiugqT
	M8UEIyb8lk9j/2nBgIRD1HVEMlqOySpvAuMLErDPJQ8PUemoL+7ZAayWQBntKlbNAiwAs13n/n4
	dLIZ0QnxeARvlNDJwPLFl2yE+MAuKOFpVljmPCuu5xlO5gsIZoCh8k1B8NenwZtdFIxScCOaAnX
	PkAEgaxStr4A/OoO5vvIzkKvgNAEqbNxizpolTKHZ61/K4Fk1z+2xhlr1BncBMZ6uJLD2pejUk/
	JuNqRVEQI+wQG/0=
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr58543997a91.10.1789045140953;
        Thu, 10 Sep 2026 05:59:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:59:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 13/13] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
Date: Thu, 10 Sep 2026 19:57:42 +0700
Message-ID: <20260910125742.150902-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_dai_tdm_cal_mclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the TDM clock.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 1b51027c6cf4..7748b4ff2c72 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -381,6 +381,9 @@ static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
 	int apll;
 	int apll_rate;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	apll = mt8189_get_apll_by_rate(afe, freq);
 	apll_rate = mt8189_get_apll_rate(afe, apll);
 
-- 
2.43.0

