Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3DA3B8128
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 10:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281807; cv=none; b=Ec8kk/qCf3vb2or2C9+e6XMfEPYEda06wrHpEv0YqqzpttMKvF01zNKi9DyDnfk46IzJvUAqISuza02Ws439ua840xbm7RXwzihZHIfSOnLvbpx2Ea6YUrJmdP36ZSYrqwLynKG9Cx5gHL8PHlBiyGE6grQ1jF2Q+0itRCUI6go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281807; c=relaxed/simple;
	bh=IPLilhdcPz0Rw1KffNK3T7TwDRffmKz0tzBAuXq8ebA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJy5azylwprXJHwP81cSst3vUz26bGI7bj8J4qILZi4FdusPPYY2uCTpfFnkqXsD5YfYm3n87fwNKMO15v26pgRu8nf2qI1bLjG7WKmxdnrCCHVM2eeZfEKPBvgvJxTlVrGL0Pm+eoQyJVh28FuVd+h+2uzLKhL7fXc4Im5pZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bM8GAPd5; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bM8GAPd5"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so236613a12.3
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281805; x=1791886605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=bM8GAPd5ZcB556LPUmPLp6SW4GJGVo6Jdfi6cot1mmlcBIFwjsTd2+IcerwuHqzAaz
         kAP6C7AO0+AihlYhjozIChpVIXz2oAertNx9Aa+CAoy8XLDajq7bef1M7Id2+D/az7Fx
         3NebrrTu0Jhe1kO3lNwPI7KyNloeqoZ3TOyrvsTHOYXULzS8/LHJVnPRJFhsIQ8eUjeV
         UgGsQIcGmjLuuueSSy7KiJ+F1oxNTmvkXbeKvc6efRztg1q6NMiRzys+EgfxThxoyIBf
         yf6043rsOjELr44MDqsMeW9Wvh6o377qDmiMlh3jHC2KJER27i2Hhi15WHv81EqtZJmN
         g3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281805; x=1791886605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=Lhovh6cdf+BPwhLhEHuTI29dMoRsBw3nrHpkmsJa9uEN30GVE/uDvElOIHJ1tH2nAM
         Qdrf3QOK4osyjLnwEjoUjOP0har05jLVlprUn0953xvhoV4NgMd1UiTh7CwuEkKl3gP7
         onJW/g1yQZe03UERoqetv6iRu5RXc49mIdhllWp2Qnl2jELp4M33GEu32xJnbGF/UwAV
         qvE8XlJtN87d8tP4UoFka1veUdazJqlwibGem7ZERstkjqmN19b33P0RoBcyEZashSKN
         khHJ9P/qoGrePrSxrcGhrfZRXCdd2C3QDE2t1W0ypQzb4VDi2KPqFmiE33c3nMEcs/jr
         8xgw==
X-Forwarded-Encrypted: i=1; AKwUvBzheIpJkHN7XFXNYbgtnDOO7SdbMXJbqIZfCEzhOWqs/z1ciNpNylCFGuBH8ei/TE/6S8CeSOSTt60hqw==@vger.kernel.org
X-Gm-Message-State: AFuF++mFYP0Q2nVmWSqcg1icXjBl4heTZb5h5tRV4qyzDUobkcfvQKC0
	We91bp5+0w0QSPutbQaIEto5Hp93VY2eN3+tOENqx13YqV66RaUa2oOJ
X-Gm-Gg: AYBFou2eWBLD/Kc0LZKAcR9Rk/umXZXzoGU473lusmZwR2nsIfTw5AYi519So/J4Z9s
	7TkOJwvVCM5V7KrENQq0tYvblOV1OxzeA9zJ1sX5wA/pNnuBLpp+Y4sbCThpzmo6hMT3Kcfbi7J
	gXhgw8zDTjCBR1fF8ZL5sErtiAKhyHny7YtoSVl+KfLU8CijZhJ53/qmNEDa7wu02UYhQiNuSB/
	JOQq0NA9zDwFt1a4CE80nzzBWKEkFLkLDRQmJSOfZtxnVAublJ5nyGici40qAo2YVbncVhQ4sPM
	q3+BaXEc3hz5ZHN0HUzz08a8Ca3WLN0KwJcg30SK0JdKJ+cAWgR8xdchYTmNbKYaZmfTGDPfacC
	j8Sk+8MZqkzrUKqIFTFuCYNGrn7EW01q0iUmmgH8E5+IY92AdElQ+XpHcU4cDqiZ4XTYLB5DaeR
	XAum/vqPleQ+/XmcWE6Q0z+jCc5jrzSkkLdcxRYw6qr8OvSxwkg+Rn0i3z3fVwve85bMXOXmyHx
	ctOk8CibKxrBwwedtsOrCUxjQ/Jn06xIizzvrMIYkAyTimXO5i37I5AQjoZTxvBz0nuQr2V8UYl
	/0KFO9AYsf6TRQ==
X-Received: by 2002:a05:6a20:c70b:b0:3dd:a196:69ec with SMTP id adf61e73a8af0-3e12492c658mr784333637.71.1791281805254;
        Tue, 06 Oct 2026 03:16:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:44 -0700 (PDT)
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
Subject: [PATCH 3/4] ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:05 +0700
Message-ID: <20261006101606.54079-4-phucduc.bui@gmail.com>
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
from mt8189_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index c0f340a6cc09..eefa96b701a5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -155,8 +155,10 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_warn(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -168,11 +170,11 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
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
 
 static void mt8189_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

