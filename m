Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F395D353A66
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028734; cv=none; b=EFeVLOtCTDaCvGCE76i6NlSN9wXTY8q9u8fF3aXopbRXirq09au5WE7e3lDTqym9TY8T7qfooi+JKfw1oBaeg2YMtv6xRn4xJYql0+7WGOcWShFDQmj2uW621l3KWUV/x8f0Plcef7xIRtWaCFDM2/O5lMRWyHAGto/mFemO2i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028734; c=relaxed/simple;
	bh=42Th3Qj56b43dUmPcGDSjuTLub8jxmLc2kGADA+KV8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKxfE3gdCjlTR1+VCs9SeaTdkyTucUsNRMgWcoZ/fvVD3WRdMvBcW5plbHh9BIE5boYCAtuSY6pg3yWJQH662WN/qNdVY4HzRRBLAhqvG38Y+mjDTZqZ5DReKIY+bQCDT+RgrqunMEHIKs5B0ZcGoTVts5gfcaNTTAD4yxlOXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfZT7RL3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfZT7RL3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e95b3b52f2so1419895ad.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028732; x=1792633532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eK8UF2f8kXq1TEqWl9Zyp8tJ5HPyvJ/UCpsqtpYFERs=;
        b=TfZT7RL34QVziHDLX+Fr2u82M+Y8QGdFLCaZPpC4hEoaNYzM6VlbCDl8784/HENI9C
         s6k4/dHainJ1Fv6YY046VkIcBQam6Y2C0MUJcjiGBPDrS8JuSOOg0Gr5hbDyQDjJ+Y9e
         BLXBmvTSV6OmMc3CtK+4iDeitNB9kbr5YAzxm9X5/0jRXqtNHjgn1MDzRMjbtI0fMAsD
         w8IgOx3EZ7Bycd301RWbTtD3NUQfglJ/24NFc0kstsf0jId9lxxfq4mEZh1QhjD6GmbZ
         gDd/oY/uQK576Ue8j8Rzo9Gs+ccpRTCQrja31R1bU03IvPJaqACttZ5/jtkzuAZthlu9
         PlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028732; x=1792633532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eK8UF2f8kXq1TEqWl9Zyp8tJ5HPyvJ/UCpsqtpYFERs=;
        b=AICJNKK6y6YMRxB0HnawlwdJ8uBKiFDv/8cXVBVrnYHbMMat66bX/TEhR/yuOb6/Ob
         1jP0SjikcKDyRgNjPdnv9tgs696h+sCGJ6IzOzAEvAuZknyIxjd6piacYe6l49d3E2HS
         mRfqaehNFG0CvTsNzBCQRztyVX30AIWbT/f6DNMKC/zfU7/esXyyEempP4ZC/ft5M4HW
         wQhi2nYOzjUzN06jVO7jNtkxX4lBrBP4yEDhDaDVpTaqRD3nPSyX/HIt3G775gn7ksmQ
         fAVHgFDw8sZDG84s+S6phNmf93G1ZO55K/PIb3+VmWSlBSZY1fxFTlRgkftCwNqBhWzg
         qeXw==
X-Forwarded-Encrypted: i=1; AKwUvBxzM1/yRdT5JBhE2l1y5HsYwR+prFm9xMFP04x2cy3vnJetbtKYW3iQE571K+vYDJ1VyBP9D3S0mqAhhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPHj/sgvXzTnft8U92qmIUbw+u5RO0E0/otwZcSvJ1gK3bG3MT
	ljf60zy9s0XXkvqxDuDldZhetifEYLq6j/kDHofn0cSRntDisYbYU8qT
X-Gm-Gg: AYBFou1JNesCJeXU1iFGlicwzzKTYk3gWHDpObDn7Ajh3xQ2/Lvun4dJeGekAkWRViM
	qgUJtg5VuzQpFtM1gC1mT2qhQAxDR5jTwNCdvLVJJ9672p5yq3Up1BsMeEJbyoK1RQ1Cly70u65
	Z4gApy+apx4Z797Ltj7XrYl9le7erREVTNROeuAa6Bv4hr3aZG71nIzHb9yEsWlI020ihZf/kGZ
	Y4yZJJdCDp4wgVDCZ4I7QQXdM6KfG51gL6vS2jNIjQ3z86uvh3L6qV4Hq2iujcBO3qzb/sdfIqY
	PMHgB67YSpENmIymexHcMscONhgy2o740zUWUL5hIjcHkNebnq6x6Gux68luQva/xSOKmeDlBhm
	IPsTUh/v/e+esL1iWPk3tsYwlfMi07aJJbmNGiDOtZAWcSd2YPA8gzPpJMttHYLEDoJaN/ZJM+S
	DuBr6U7k93Oz8+c2pVXyNXanuOjJymKYmOgJqi15dxykKENlXwDWacbN8J/IGJacMiTbPWmmRyP
	37j3JzEdVMieDUYBhE6ql9B8mD0UJ9FwjwbmTOVHiHP7TQnSEEK7iT9sOWhAw2nNhQejiO1I4yB
	AsyM1+yQxa+LpQ==
X-Received: by 2002:a17:903:19e8:b0:2e8:79d:15ec with SMTP id d9443c01a7336-2e84280afc4mr161680265ad.6.1792028732357;
        Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
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
Subject: [PATCH v2 05/25] ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:04 +0700
Message-ID: <20261015014324.5569-6-phucduc.bui@gmail.com>
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
from acp_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4a767b1d039a ("ASoC: amd: add acp3x pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 3f59b753243d..89dc60849c06 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -233,7 +233,13 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp_base = adata->acp_base;
 	runtime->private_data = pdm_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

