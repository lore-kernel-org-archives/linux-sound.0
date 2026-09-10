Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F7D48D881
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045139; cv=none; b=tqijQzl8S42D3l0sFJnc7HptW0J678l+wB13jV7XKk5bvG/OEOe7X9X6aI3yj0J458rYnuh4S/EYWEbxZJ3pPX/FZbqQdHv6ggOaJtzApOkCMWVFrY4dZgcQ8SD3zmsvtKTAFLqHk5awdm3nBqVe7vi8sIN/9C6fJSo6OlNMmxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045139; c=relaxed/simple;
	bh=zVt/GLB/PctPHE9xjcaVCw+lY910OuGBOfYlSPretgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJIauy3Q4Q3aNCcVFvCks0h2nd8j+C+YGf3s2X+TJo2vCDjw88AXMoBMkVpd+koxYopx02FPap5wzMahtMM9Tb6N/Md7Rtv/GNI5tInGJw/qL20DUHxRWtEC6aCzr5jNHF0teg8/E/cXmmqUrT2l2bN7iAJwUikIyYcbwLktjuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GV+HiOYW; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GV+HiOYW"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso1868708a12.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045135; x=1789649935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=GV+HiOYW4ibcXRW0xjhbCO9YDZNtuLs+6jRlWYwSWfuWpU5e8wdNu8ARubW8ePu/dM
         Q4Q/EidX4rLFAhHy3L3QnQnnT9q8vnQkvN4ZqMn2PMVws9Om2dK1oKEZWc0hoSHePY7h
         A0zH0xrcw16Jc108Sc9CKoGW8IXoFwDiWC3qJjkyQJp8pkeiA4Ry3GXjsBkIfvIRBw1i
         Rl+RSJkacGn9ovAMDE3b21aLS//sNnDVF3j4AWkYyLaH4RNRBuXIA9lx/zqAGGQjjK3I
         1w2gSPq448J8SN91AmkMlQ087m7ZkH869WDUGugtRLz0emRb1UkOQGIhJeXLzahjvAAi
         0Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045135; x=1789649935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=EgaPNbo/oOvgTaW43whIQk5gYL17vc4vrn/LmxoxMffRXwt07ZDkgUWASDHINeUINV
         0/EylwxtO8AGR8CVlf4/qEE3wMuyLY9rqCyAeO8u5QOUSe81yckpJV4kru8Bac5v2C/P
         9GgN1Jy0lB/hJGue6sa8ndZKcDSDS/+Fk4cSdxm4O/QG/6PVMasMXDYbZVl2VOfDaQJR
         AwwduN84SJ6k7XN4DK1TT3XkXUjpH3CIMm5HgXm3GMDz9p6oca74ZBHU0v/F8Wcpcpwq
         BHEjyh9Ol7lqnHgWfOlX6e3o/t7xgZjQlLDvp0f+ekCf9KhJpgJC4QVPk4b4nb2ClOMk
         PPUg==
X-Forwarded-Encrypted: i=1; AKwUvBxfgswqFYfnoXmo4XDqOIKDlH+Qd7AgyjeocnTDaBTCc7QHrk7XDZ9X/CAmOFhd92hEhwrAtkpZeiSTxA==@vger.kernel.org
X-Gm-Message-State: AFuF++nWR31yJFZO1FopE6ZREQpA4ysvzaJfBXJEdsZi79+APtYKtOUW
	0HQuuxe4/i6LcNq7bOn5LVg7QQDu+j9vOGP88Ev7veJjm5Y5UR77KfCy
X-Gm-Gg: AYBFou32t89Tf/QCU1O0Nw5u2kY3yzf9uQRFd5/g+G3dtuzwjlcp5vQ1Qxc3LszoYoi
	HzFGFz70I4FhYwCmiNg+TyKTmVsRYpYcfd7dp/55sPQWsraBJBtwg2G6WEDwm0AmFBDzh9g+aoB
	VMxLo8iVYEbbglSUzIl7lDuj26h3V/pdtn9ABl1ch8HbRBdKzh1b2rByEBwMqORXgmG0hKULlvX
	Ir/M4Eh4gDJnncG9NKFBU6IdDMwo9reYIPiQBIUCZof5gnmi40fItUznfwDw7f856cRiJcNhF87
	z3LEYq0he/94iA1SfZmD6a0i4mykYjBReL44GacYfe5eDTDLsXE2rU98EsVuipubkqx7B4GBZ2d
	PBc17o8ywJbEPvp+HW8HL3krVnqFzfq08wkInNW7WCBjIuK9hiV8nGNX10QHIFinuuCPcSyP2jn
	Q12c1tVhTwmdZJUlFHf0Y0b4BcJGtJfBWdcDOmvJJnRcWB3ADZALHOEm5GwhOJeBclOHDphbo6h
	GuPCiii3gI0aHGbUjfjzKK1Ez90sNHhZK1osrUnChqiAkQL/CXuHGJ7LcSO2AdMzpJUINJ+H/v7
	2nRwopKWVCvje3U=
X-Received: by 2002:a17:90b:520e:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39bac3c452dmr19487586a91.18.1789045135450;
        Thu, 10 Sep 2026 05:58:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:55 -0700 (PDT)
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
Subject: [PATCH 12/13] ASoC: mediatek: mt8189: Propagate TDM clock errors
Date: Thu, 10 Sep 2026 19:57:41 +0700
Message-ID: <20260910125742.150902-13-phucduc.bui@gmail.com>
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

mtk_tdm_bck_en_event() and mtk_tdm_mck_en_event() currently ignore
errors returned by the MCK enable and disable functions.

Propagate these errors.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 5d68a55ccc45..1b51027c6cf4 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -261,22 +261,23 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, bck: %d\n",
 		w->name, event, dai_id, tdm_priv->bck_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8189_mck_disable(afe, tdm_priv->bck_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->bck_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
@@ -288,23 +289,24 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, mclk %d\n",
 		w->name, event, dai_id, tdm_priv->mclk_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, tdm_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->mclk_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] = {
-- 
2.43.0

