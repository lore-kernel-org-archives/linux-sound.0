Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850333803D1
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 04:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123936; cv=none; b=Buh/JwEmD8LabQnqkze67Zcs2r+Wx4zOpMU9pdP3gH6s8qVNt9eCzAEitXz9PrdpiYdxLNSFOgJVwvWwwbTFJgY0fihac+zbV/ocOGESr9kkdl9uKc12okKfuJnSM9tsq6CySP725UtfVUDQhAc5K8xnzjm43ulQG7k/w6noh7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123936; c=relaxed/simple;
	bh=Gs9t3eNuKnVFUO3uoF5nDdlII68A+pSb8mn+aZ2CHts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iM13heZDKIomB3nZPhDrQpHsqNebOWyo78Vyty8ErlRYvtAo9uXp28F2Rhnk/27/XKBAXLHMO1nAnmC8xWcdfpMd/lnHaR3ZJB5HJK/InBPSdECTtpk0pyEVZmMqjp96SYP6pf+sbtyTK42fXKi5dhA7YCKV/YPwjyCWEwkPZUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pX0/aTtn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pX0/aTtn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e942864693so10793625ad.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 21:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123935; x=1792728735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AZDJdjhNuFXFYn0yeoBtoVorlOWOlf41UfMI392qg0=;
        b=pX0/aTtn4DBDrFRjDEA3UjCh9eXQFQWKhkYhW/duwBQTPqyBMzhmj73YRS84pZVl1I
         SjvhsyaOkjxLQeIChVBCXaLKBZTqjPaDIBR5eDHfNkGQZNYZnu6/2cOsZ4hxN9Ho7jrm
         WQzdode+MnjXzlbX+ORBx+NQPSB1fdXVNNI8n/kwXDom6FE7Jb1yCzDDJJx0U4wMPm+X
         MBTChollxR8rGj/99ucZfQgmMiQalK9yemx7ipLafkjd1mJoORpdrKQ+9UTD01xTZPa1
         e4nm4Uua2+DpTYliLLG2WzhiqmwJ/rJgubtFsSAivQ5f4x6tL6IAUEzdYQpxNdULwpWi
         QdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123935; x=1792728735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AZDJdjhNuFXFYn0yeoBtoVorlOWOlf41UfMI392qg0=;
        b=Eb5bofPqPZmLTiYo4AqI/CYs4L0+QD0hXa93GXDmhGJiWwkHMExIgSJEX2TmVaPBhY
         gJtg8b2T+yZGerre4UUXIkfn6gX9QtJisrLsYtU5jbecegUTIU62Rsu9FsKSPD6R98C/
         /WQP1Ns8nfVuL9wgNaS4jrKJXnI1uCNN1nuu7u5fxDRwsuqYRtcCf/y11as3dfzRFp+U
         Y1A1Fa1WWR79Z+DfRVoFtbJ0XL/zpPlkpXlF2mT7WT1MqoUZvoz1qZlsJbFkx0uSf2Cl
         XwTmpOUpj0VP5qKu/K1UgR2TP/MwQmgGymDiyu54zpx+EoqCjoHkxwvv60nXjGORDXGB
         cy0w==
X-Forwarded-Encrypted: i=1; AKwUvBzU0OpF2a7ReFA2YvZWTVjMlPxo88CfWPJpUahIbdiRKQOdoN3kD1xBYGfhGC+6pRSFyFaYsBc/kZvVdQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKPaSuyJF/imHvSGyazFxq4mt5c7RkX/K/5DiBJTTuQzoOW/w5B
	OTyotcnp5IrdA4GwZFVI6FREycnw6aSx/BC7UqZR0UjLD5BC7PoW7O0B
X-Gm-Gg: AYBFou2KHzyoOtAFzCmG2OK1l1lxbW8IprOwC1FZwQ2MWkj3EyTQdq6PKA7ct6g9uVy
	5N8Ogk7y3N6IdbGH+vB8InfPR+jZJWTO5W5xBbw7fedrhzftVhDRu0F2RxS1UI34XTebl2d+cPi
	a5kl61WyZ6x6VdRg+ebqmBjvx5+cPfJ/q32JhrbzFdOg9TM2w+1bGvvhSvkwq7ZW2mAXErP2Gc0
	B2PYNbrGEHx4lQgwf6u1QMXPTh4NZLXE2/VuIqdiMPoaC41zqF1ZkCGxXOVQdtTLfPPx885uUDr
	Pd+owmqYiEBuoGIDS+e9akMDfVAn9A80kZNo4XePmfMTS+zBVqDWZ20/odMr+a3Dzx9gYu2rtsb
	kEedsKsJ4fRXWu3KmD4f/loSVo+HGXVfpmijnbhcZZFq1PeNMWuSJFNgCBuu86y2Y4CaBCnz3bs
	OPfymfLB9vRHcH5qUin4vS7yeXCxpZtCT1t05+mawxPfNP+yvvuQ8su++H/hXxItNsyvHLFlVNP
	lPY8H7+ADiI+vYe5r276tAFWirhjBgxqAQx7RkU4Mh3+f5Rm9GerNSDGcSjYu1EwQQeRIRCO0Oe
	9OcuIRZMwomXdg==
X-Received: by 2002:a17:902:f70f:b0:2e9:660a:7944 with SMTP id d9443c01a7336-2e9660a7bc6mr31481475ad.58.1792123934758;
        Thu, 15 Oct 2026 21:12:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:12:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component open callback
Date: Fri, 16 Oct 2026 11:09:45 +0700
Message-ID: <20261016040946.521195-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In DMA mode, the generic dmaengine PCM component already applies
the integer PERIODS constraint in snd_dmaengine_pcm_open().

Since rz_ssi_pcm_open_dma() only applies this constraint, remove
the redundant component .open callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 9f36fe2c16d2..9a0781bb072d 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -954,19 +954,6 @@ static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 	return 0;
 }
 
-static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream)
-{
-	int ret;
-
-	ret = snd_pcm_hw_constraint_integer(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
@@ -1017,7 +1004,6 @@ static const struct snd_soc_component_driver rz_ssi_soc_component_pio = {
 
 static const struct snd_soc_component_driver rz_ssi_soc_component_dma = {
 	.name			= "rz-ssi",
-	.open			= rz_ssi_pcm_open_dma,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0

