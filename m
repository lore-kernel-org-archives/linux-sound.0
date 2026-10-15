Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A675A362130
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028722; cv=none; b=PNf5pwkbm2r6sapTwKZP8PdPHkUIdZMhoQwFoIWM1Zk3hdAyfRWYkaxkaq1INEKR5lSC0DRU1DHH0TRjcuj29n3sCbfscETHFbXDpEsYMZ/jk/Ki/NG3M8jyvnmi/cJ3zWrDlZMTA0/lDNrmz/QCZLqXaCEXcVsJX65WicvpvZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028722; c=relaxed/simple;
	bh=jqJ5MSiUT4wmuGEu7gmmhxIxMq4n2gfyS3RH/x7Sng8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZDPRzFXxrSL7NhiBGanWfmiMptN9qRVFeWKvTjf2gRDFf+vSK1vwoUsSEpKxinGha4fvd2Znr66apILoCz6lxHoqgjKXnz5Iw2kQvWeVU4QYAqfZtj/Pvfj32e56V+jxHhh4voRnnXddGOfR5beKWSQM7KhIkcCMx4fQZr6dF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRLedoTy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRLedoTy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db80fcdf8bso27561155ad.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028719; x=1792633519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LV2XZk4JI85UeqWxHMk6K3Umo8587cjHfY2RFPxWAV0=;
        b=lRLedoTyMV31PW6xlzkmSc+Jl3ZYaIvC6Zk9aAVnG+NTWxr8tzEUraMx+Uqnw/+C/B
         sUS8FtoGd3kXhuflLy95LPgx7vmNcB3kXY8fH0T9ipwu/iW3rNfNCWy4BWQ/V329+A7h
         LMZDE1qEgzURTQyjmuyU8TvoG3vYx9AQp6qeQfeV4y++h5hSIttgrl1DkromJ7WDQrth
         QbXLrvx2RBIlcKxL1FVL/u7yohPhCmwpF4VkTpJexVRi8CGQPLjDoJNn0QCmqeVR85Dq
         DgfRjx0sGceIxMSJdxVa7ntLefdsXlcUSRG67qTXPl6Vm/l0VHbL59+jucbS4HwQmQT/
         XuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028719; x=1792633519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LV2XZk4JI85UeqWxHMk6K3Umo8587cjHfY2RFPxWAV0=;
        b=pDf4KvAW6KCeiaMUizUgNCpfldN4xLELrbFU6JtGeGGT2ZWGJgE2Anezp5S8+uP9Yf
         DbuGv22AYt2EfADxwpkcY0zdmfaNCPcowoSrTdHWpjapH5/znO/Z4F6W+yygEYOkJkeB
         CJM8k/qwuyp55ssQOdraj4VngiJArZytgKQ0kvHepJSQqHhV2gpBkQC+2SYnAMFGmnMZ
         y4LwZ4CXBLVATJgVDzpxwB/KakDkYYrsfnMrPkLm6hHLhT/Aufr9NdFW063/v1TeoE9N
         gCaDZ7zVAfnBArhBcX/BNA6WH0NkDq6nsDz8tCHC87TZg89WV9l+CDuByasbuaCzZTqy
         XHtA==
X-Forwarded-Encrypted: i=1; AKwUvBwiqxLuqNgZ/aSlkZkHqrLF28C8LnrE2XOz4aTpJXf/vs0C9dhUrxIpcuI0+h5TqCDRK+9BBWLOgxOa+w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKWe+5ebWVUaU9RB2FggTvpa5LfeTaL1rSXpY0t7zIR4REmixA4
	2OnZ7ejM9Nci3Y1HJHdyAiQi8pwTrmA17y22/RGsEyr30itGVP6aotUa
X-Gm-Gg: AYBFou0qbUI3ss9l8ergEMS9sOLJUKRCU4QTnCUunAGzw3UvMhEXU5oaqZVTyUv26Aa
	+fPpW9WjeparhbbYGrG5ZMXeoB6h5IHNIVFz86FB/mnBfGUxnCCMR+cz9EH4QVXJ3w24Z+xjcwR
	Kapk9jWVdpuDSA/CUKwkuhxknC7AOXguJpDwB7maNvIO9Me7RwiwV0Vj5EFR5bdVXnghZp/4NNy
	bZe24mmEIEZo9r3wTn2SniKQRBDTQKTZuCy1s+LEqAoFVEpwGuXW+7ZrYsIE5BOdHgkJfefh/uA
	8Cl+B2TFp0w/maFTXTHjTyo/lJGDA0i7LglZw84XDZPKFWAMfsK1kYxVK2kt7dhu+ElapdwdFqb
	10CIg5lKD9Yba9g4WgO+ubeCbdy3D5RZ5cYu5khfV4ZitvH0qIE6nNl02TD9w2WZq4j9H0+kbw/
	o3vsP8fRCi0tk9Nrn6KFQgcEQZkje4iSZCUbuRgybFoDHtNazaAZeKi4KzyGpDR0lisXsibv1Yt
	ReFc45ikqM0bSdquUDkacqh1jG1wZ2tAkA2KwoiSdhCTyfVXHsGbTwYSv31KWSh24z4yY5NXDf5
	BXY5N5v3dB7tJw==
X-Received: by 2002:a17:902:ecc3:b0:2dd:ad73:5b6b with SMTP id d9443c01a7336-2e8429ab7acmr151706215ad.27.1792028718870;
        Wed, 14 Oct 2026 18:45:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:18 -0700 (PDT)
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
Subject: [PATCH v2 04/25] ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:03 +0700
Message-ID: <20261015014324.5569-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp3x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 703a6e22888b ("ASoC: amd: Enabling I2S instance in DMA and DAI")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 37ea5c572eb9..765057499021 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -237,7 +237,13 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 
-- 
2.43.0

