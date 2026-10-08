Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646984973BC
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456141; cv=none; b=FxWNVxcxgBYGBav2HTj2bVwPd5sQy4rIqeHfnaGKan3ha0aU4dT7crhWEj9YCMFM5ZDqGoLlWl+Of6zAy2ZT9oyl7oaA8aiQ4O/7vncvlC9Y4oWpvgDJM1BtEvR9laEgigSm+BrkaiyAhKCQ/rg03ZIzoCPIZ2vKHN2+q5DkMvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456141; c=relaxed/simple;
	bh=6dFh3KYbxtITJpRD4kNPYQg713kSVg+CYVFiW9/LyIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+tFHtOJ6jvagK09EPFYq6+n19yhmxw9CoElNPnZJkww0Qm/l89/l1iM+yEQYaG+FCPHyqjBD0o9XvkO+TqaHY7eiqdYVaeOi5MUzsOeMLXu20fYBJeu+AUkeRKXP5i/AWbeHMFrv+awyZbCfsQ05nIa9Pw0CnR3gLQKR65AztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlMjk0/t; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlMjk0/t"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-150f88d22aeso2387835c88.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456139; x=1792060939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0qhtd+efK/Hc1Em0lvih3vUFvGAfNajebBLWEpeLzs=;
        b=YlMjk0/tPe5syvZERUokFN4x0f9x1azhRPRznbhR4w+oVtneJuFsWlXKKnoAS5OQzS
         0cId1lznhca7JFP/FXdzJA5L+TW9sZpWSKzez9OMHDodODINcVOMGiL+7XTGAQMdVqhD
         ybD40uu8LN0VZfUCahLXx3rfPFFNfpJlmXUR4t+mI1+yYwtmrGHI02ZlGAoTN57ROlgH
         6PQ+XLiyQLrF1y6eB43smRyV2bzv3jiZF7PIqOi0nlSfd0RZ8C7xAA20VbxNq9tg6E0S
         +JyFyc2Gzw29tOwxrmqkMdihIL3PWWdAzEABJllMcRrJ8kHmIRqXBIqTJndOJbltM4t9
         EDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456139; x=1792060939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p0qhtd+efK/Hc1Em0lvih3vUFvGAfNajebBLWEpeLzs=;
        b=j7kk/MKR9grxq8zRai6OJvSVsuuw5tJR5hOAHvt1VcIc7EadWDUsUcRC8F/Kf7M+VH
         B6sMUAcg9x2RdCJB9azRfQSuuQiIlnvgjZ3C//Z2rcclzIShPL/5dc84yDmhsyDSEUdr
         VeZuGEdlmrTOYm+E4HKGTe186d4wgQHbSwuxD2qk17ZBHt6Uf8QXxEwzjUqKh78aHqBJ
         ahPjaZ8vdyVS62fIJP8xLO0FEgkTAE5DFjPVn1RaDLpm5G+Iiv4eO+eQLgQGpEpJLQoz
         Uk4MOv+33S4MoeSF99YUFVflspIK7coiJZXGN4JOP+pgbvNI3JXI+M6rix+7+NSYNRKQ
         Qhdw==
X-Forwarded-Encrypted: i=1; AKwUvBwutO/L5cRgw7gIt/SIqUCGwRC858J8C7dDJJkTTv5FpYnnCdnJKkLvS6kTxom6fxKWBbTtKz4S/qvoAQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lXRxu3O/4yCApZJj1O04u6KY5sLeKzpLo/n2alaA9tJPtUgHFB
	BYzrt1cMQWzA/4LZEF4x8PStAXzNEFtTUMA3Yo9JtJlUnAc+cJp/rR5J
X-Gm-Gg: AYBFou0EGg32gC2kggBmQrJLeXLsaqIy2KUk512EbFFQUAn/FwbzIHWxsjps8l87wdZ
	KfbyNt9L0GtGJC/JykQRIzOib3HKKoTyghb4vJmujRYsQGe6xHtE/zpJ4f5BnXhXaQOrZWPNvTL
	+BvUkmf9POluyjr6x0I8jY4smwDuo+WASUt0gDAsFKJEhpPBxD2zAl1wchszUJVm/SKVUP2EybV
	2+lLoGYuhjDISpkieWDDCMa4H9SzTUpV940K1maKSXVHCK3Q2pz3VU/jHf9vCwmOywaYZZghUw2
	fyjkc95N+bS74oEatWnsRy38t3rpQcvzhQzL7FKufB2pPVFe2rUAfSPfg5Whhabtv2RLoU9yZDX
	2Kk6jZ17hZ1inUHNWkGjIU4uOWGDqzsdQPKmFE5BFP6xoLh8el2axNNbc61ZmxQWVT61i7aRj8t
	6qdEaIZGUIEO5wziwNX3MEC9z2rBkNEVI3DZ1j+GB/EzBGu8PH0w7vGgTr2I12E15OxN1wp6/NX
	814AaWe649sVfH1EZpBq399zADZKnJrpDuuwOJDbU9xtvoqKODYSUbBnJzLCOmAxHGHkKtvRvCt
	sX19RMTn/tAMK3c=
X-Received: by 2002:a05:701b:4501:10b0:15f:6789:2c2a with SMTP id a92af1059eb24-16207d7c2a4mr5290246c88.36.1791456139402;
        Thu, 08 Oct 2026 03:42:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:42:18 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 13/24] ASoC: codecs: nau8821: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:20 +0700
Message-ID: <20261008103831.542533-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from nau8821_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8821_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8821.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index ecadbaee1037..935df063822c 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -829,14 +829,19 @@ static int nau8821_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
 	const struct nau8821_osr_attr *osr;
+	int ret;
 
 	osr = nau8821_get_osr(nau8821, substream->stream);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_DA_AD_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_DA_AD_MAX / osr->osr);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int nau8821_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

