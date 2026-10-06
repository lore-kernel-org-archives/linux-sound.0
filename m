Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36827288C2D
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281793; cv=none; b=PoLgigYQDuEd/Fbsffd9JTY8uTyJajJXOA+0dG+NTuceXO0vkyFPaxeo24QW2T6HKce8szheLDaBJ/EYa9lySArNIeLMTNhc9ntttWLAp3l5DJ1IIA8JT3uDGg/QNuJDZZbFe/wB0E6LWHsFg9aIWgL8N1yP4c7NUmibZRinS+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281793; c=relaxed/simple;
	bh=IPGYtaOQglwuqgGFcejyGd0b+qOVVjwrtRjhs5z1A04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udBOJIkGm8lEFglNpLkjTO40R2Q4AMDibMnucETFvAdqAwrVLm0IYTtcruJUl6hd69rP2RpHEPLenyc4VdnRH7dm/hFobspHsMs0kRwA0GcIFW1Vatalywr1liS3TZsUA0iMW59KSeBjkArCtFGL2BzAQxkKczuaf9WcwwIKyfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uzy7gP7f; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uzy7gP7f"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1812224b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281791; x=1791886591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=Uzy7gP7fq2HfIXZAg8nnFJdXOO2uh5tl5MhO7qczvUk27zFMUmPO1UkAn6PnF/wm5Q
         UL7NBb47kJjo94l2hfRxKxYTBbgCvvJthLytoktAb6jVaOsX+CclwoinkQiyj9OQS0YZ
         YKNzzAVA2iQXoj6P2/XJvU84gd073ZElG4yzmeSh4OK9+K93rQW/E1eTBetE1AVOcfEi
         4hkr27yWs366cnBhbWRh887XTfvEYsq6tN/MERTXWGGnTSPz6nDd2iOpLz/Z7aiQcc0C
         zr9QonaAD50zf/K6Fu5z9E1BoBbYVEuYnMOAdtHiKGHTMB/BupnouIrTbBotZ/OO8bW8
         O3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281791; x=1791886591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=xdgWzLyzm3lcv3QkwLxto/vtlOPtkQTUQ9b/edcwhHrE7k7wFjIxptnpByW7X1yp6+
         ukcCxciTaFKGBMwne+94oZjJp17/gTIbC0iSR7b0pBgaCrYtXbqYNbF/SqehTf+/sE27
         tCj2CxCkAznKUh/8870cBjMgRs+WLzHjkUC3evCXozLm557Pc5YEhZdNIQT6en0RuJrX
         FvgKM8lOpJPWMM0ezloa0ehFc5vqOOBe2AxjWuYj6NdYlEE9WRNhtHlDMcsfTGkxZGkZ
         mqubtObC/LmvUOKn28adMpqCgv5FAp2wa2WFaWlufc6VCy6h191vtULjF8RPLx0bjpdJ
         wojA==
X-Forwarded-Encrypted: i=1; AKwUvBy9cR3jBVvLEhdLzvMgTg72Q0Pj0eze/OMcT32ohBoSZR45/CQulizEgXaBn6Aw2x89dlUAAh8gEoTbkQ==@vger.kernel.org
X-Gm-Message-State: AFuF++menMJiPT6YCZwkWDxDK5WKSEZXma0Thh/sUqmbP02T93bACJxN
	u7EN/QSxaQ60PDMK9XVwGjDJ34VkcX+4E4pSZX3SbNiUKF4TR8B3rQhT
X-Gm-Gg: AYBFou0AzaHadO/51tT9QKOxpiRFScLc8CyIKvCD+fnD/i7D/68YFxgmPmfeDRHpz9d
	XrNX7BG9+gkft3y832Gpc8J2ZQhKMHQ3Jqy6I45B5itMCobONztdbHJHZGGwKqnG2HMvu/Rl8bZ
	hJNfQ3iGJTsOYtMMKh/bFJqthwPkH1BlhqxyZME7H0DB9Ey4+dHtDXf+5CkMg5p7HJOWs+g8PYU
	nvQkeXB0yLsxWnkJwySgfOJByPMD+1BKISimlIZoxTNgzPzPz3Y73S8vELJ81vE2kPdCoUnvsrI
	5AlvD14aMvUYRHLxHjtsb2isX12ohMNg/5nvdPFZvkaSg4yz8dWahe3ali2tNfuk0din52J5dLS
	9oCvK6TkadZvxeS3I8E46rTatArtSZNwVFZvrp/YyzlypOKrlb6EtDnC6P0QTzfVZaSTg/XA2pI
	xOOXWwZg241jhG3lCutslaR8HdtFtOKc/AWR2ed3HdkZ/53vkSLiZpf5EF/rd3c1W3rFwTwNu3L
	DXvWWx/zmmCrrwsMq6Rfd8S6MMVuaVePqJPawf2uGHqk7LVBtfqXNY/xWLq15B+dLx0WjzSjfh1
	BKwJUQp9gaNnzw==
X-Received: by 2002:a05:6a00:14c2:b0:885:e24e:16c5 with SMTP id d2e1a72fcca58-88c64d112b6mr9929947b3a.50.1791281791595;
        Tue, 06 Oct 2026 03:16:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:03 +0700
Message-ID: <20261006101606.54079-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mtk_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 283b612429a2 ("ASoC: mediatek: implement mediatek common structure")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 948f606cbaf2..ec99bc4a5d5e 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -75,8 +75,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -88,10 +90,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 		} else {
 			dev_err(afe->dev, "%s() error: no more asys irq\n",
 				__func__);
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_fe_startup);
 
-- 
2.43.0

