Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68B489FA2
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456009; cv=none; b=m8XZf17dBS6dSd9z8M7nZPUUV4QuV4UGJvjTDx4Obrshp/RNa/9TGxorXLW6375UljnWM2hPQyfdg1HTjjjvHofVCui9QG3NQOaw1+JZO1zwLtzNxoC58dTMXlTtSZAsd680cy4wDrB5yPDrc4Jg1v1tdHeKulW2ejOEW40GGaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456009; c=relaxed/simple;
	bh=DQpdidc1ReLLfSxwfYnPC+Bi6IVnbVwubPbLgmRRb1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPMExwuR0DqmFouHvEdIlebPulu6pjgY1rDtKV3S1TD4oAbpmVLjEzNwoBviEFv/W5ZtjoC5KofKJIF4twXlNoUBReluFB/XfV9U98LRR9zqPQ9SbMVT0PRDjKqlwVr0Ay9vSxrNYZR+fpgL0W9YXGGx/qgkIHH75NF1u4vraFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PN7g5SAE; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PN7g5SAE"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35154cb9de2so4039641eec.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456008; x=1792060808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9nxhJUopT9Lxb0IcO/P1HkSQbbENhmHQ1cr6x4IK+g=;
        b=PN7g5SAE7stKq/t29EwylNCpnZeYW5k1Q4K8axf+cM57iDKwOOJ9uBnTE1Az3OZ9PS
         XrpQ8QPqPRzLrvvsLEQ1aO4KUXhtLc93qe5qUYqKipTTl2lGWwTDvXEQJ/9Gb5NpQ44I
         ZVQWgQBgNIvRFKgWjZ/x49V5Tp9nBLJ105aCc3ID5+ukS4Zsuk0QFkYRApWG5w14CtXj
         GkZToIZsjVWvbGPtOIXQJTMbw0aloUi2cZKDZYKx2hKAvuUswEV7EPty4aUnLy1D11uZ
         hdKa3bdNfNMW0uOed/Bsh9BnbMHo5x70pmiGxv0G+HnN7tX9tFIn4FSvt47JmnKbYsY2
         2vPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456008; x=1792060808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l9nxhJUopT9Lxb0IcO/P1HkSQbbENhmHQ1cr6x4IK+g=;
        b=cMIXUSmDOKnYwTqsNwvLvKivz2KEUcf2xq/Zhup3v0ClGwWW7o5zDhnASu6cRHaDh7
         Wztq3bUzu8wOB+p4yqljUNTkMlJk6cCntmpwwXntXIARkgUkPOuRP2hnDlhK/WrEfTru
         KP6oxuDibssDGvV2xe4tqonyyBcC/7LdxaZIYHc1iWYCnifzy+qal8eSrhmKiCb1er9P
         VW+gxQVTss5HyC8zXyNYMShJ3U8zj074Vcw6gEefQYsPcndyk1vQKrBPn+Zsc1juLtqa
         mJSmWQlM+ehWBT3Y0NGBvhrTaGVUvP5n4iyF550DDcsdMhlMvh2ZtKG+gA18uqI6ks/c
         /04w==
X-Forwarded-Encrypted: i=1; AKwUvBx1ysUis+DqLsGTLPn1qtF3zreM2wAY1Y8/5ESGf63Uyy3LhIEuq1whxaYGBrPspSa+LkkP2wrE63F96g==@vger.kernel.org
X-Gm-Message-State: AFq9FYK3MrMkZq2QQS115tomKrsr6em02ZPhMK5WoVyEEPBedSFhXz3X
	/rEbWg/kX1mVAhui8sKnf8yQdrSzAabsq4RwvBpF+ItTeCnvXD8xVlWw
X-Gm-Gg: AYBFou0c/f8JOQLkw48NNAduuZR6sc4uj65AsIKlFhASgm+YaX8WUFhcPt2wT1mFdvi
	1VHjSBuXKi0Xi05M46/QbKnF2SoDw+UnRPmA0tw5iR8LOumds/Qa2OuTREZuW/hP/D1Jq9aP1fx
	OJX6Yj3l7weUdKgfvdXj9hf0+nkR0JEBs2T9EhAw5ayGR///e6LqTqLOjtPWxmTQqysVqxJKiFw
	TNbvY0Yfoqdn8VXiPbC6K7yqcTiq6f3OxzY5iKR0GKTM+Z49Vv22H+S93GZHMfu8eMPI43NEkCH
	b6RSUeUBZ7ZWplV0Iicx60k1PEfF38BgKaa703izEmvov2xWzURKqvEw9HePvwm+fpVrHlQj+Dn
	o05xgyQObdHK5moYe6M3auQRupx5U/60ctVPpTPw4ofBS8eN60vm0p2UGNP3UshjQb+vIbDjMVn
	KJmUQ7GZlTVrJ2xWsYhpZWkS1ET9aqqNgkT9QtyeMw/uhlzM61BKPKCvMJW0cs5n9XkABMazTLw
	3IWZC1kyL5gR8P3zpFc1JbXDcrIVbppVXSa0X9hnZSOIt8oX9rWzRebWKFS72PayUaY4XDxcjN+
	cB7x1fn8f7ZrKA==
X-Received: by 2002:a05:7301:1e84:b0:350:89a8:5598 with SMTP id 5a478bee46e88-3515ddb2b12mr7233126eec.9.1791456007627;
        Thu, 08 Oct 2026 03:40:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:05 -0700 (PDT)
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
Subject: [PATCH 04/24] ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:11 +0700
Message-ID: <20261008103831.542533-5-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp3x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 703a6e22888b ("ASoC: amd: Enabling I2S instance in DMA and DAI")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 37ea5c572eb9..072f3dc35d40 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -237,7 +237,7 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+	return 0;
 }
 
 
-- 
2.43.0

