Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D9F318BB8
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028842; cv=none; b=ZR5cItUmbvZcXzyX6U0a+fx3Y0vzT+vJC0SN74VkSqRRMUSgHso93BfMztcXZ7asVOCPide99j1uvCu8PE3EyL5rQuv1MdzoC5Oi6PiIZXuiTdJaQLQpkVcbMldNt36kOIEYEy/Fo0lo+T/TJ3XfnJ2bKjD5VrQMLE/GbWN1Ej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028842; c=relaxed/simple;
	bh=HfPat1LNwNEOWJNqkwPd57O97NdzuN6vi5OJFTBpI7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RleURfE5GfwaYq1uaHzcKfaNfwU/PM24UbdKddXQkDDoTpMplHjYsNSJXWN/V16Q5GbVZHMys9btpBwt1usbkDg3ATkq3UOR8WqW+aSL4mRHY2lyyT1HyP7XXYZBwqOfSxm3ZxIU4NPm0T8/0UIsajs3ceTgnAyX+T9NCS99wCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4stlHh7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4stlHh7"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so25403175ad.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028841; x=1792633641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sl+xZe1w/+ufceVKXDka/4tzEgH/pdjCTIAX9h5M0vo=;
        b=P4stlHh76iKlAkTlSTaEMwhMiKlxVlx4jugbh5SKDJG+/k0iytxzwTsiGk0nzeRhd7
         BxBSN+pWIn0shua4wjWu/KvzW0V5SpAEZBJ37KN7bhr/GGb2D6fNv1PIrptPLyQCXEr2
         eeZg90zIRfyOCXGc2CniY2nOl+bDwha7nGNj+jBMytciEyT//B5u88E0t1YoxfW9OFEG
         oVqzlbOuysSEouiW6ZHv0ptF8Hu5LRVwj4+Gx+Oc1bdG4LlUER9QLCfZkQHPk5sE4Jby
         1wlAyomaauidajsbnfaDhrjVQeDfjsxMQaECtfORGZMlJOKMLQBolerYWxMb2zyJQrsy
         VQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028841; x=1792633641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sl+xZe1w/+ufceVKXDka/4tzEgH/pdjCTIAX9h5M0vo=;
        b=GfaRf1FMoG9mz3HBClB5lFwMeqLYaoHwGkidt0kjU0cSUaeDgUEATyiD3hP4VsmVTR
         7LPd5/H7cPYubiySLENhU5pzTyMHMmPKpRxmkVMEjHDeQi84jvP6jJel7FR+BtiJjvv3
         avyNb2jyhrc3ZXdzq5Wzm0Mln5J5GuwPJquuzIW9dQwJB4pLQdAIlZO7kmJVOwzZEDc0
         y0JnyVVLCKXTmLZrf+dVzQ9esES4ggyyxDyjeVIZXW5K1M4IJiH0eHfTU1JIZwaReNT9
         GE/+fvwu9d/nXfO9iNMI+P0Z0Cy/S0nODDg2aCFnQP4/yMaNYnOEnx6Qr+M45QPRaXNJ
         86Dg==
X-Forwarded-Encrypted: i=1; AKwUvByrbnANkyPoj1zSVJUTAOrr5YF8FbQAKGWdoy94DYAsV41xL7oCRKqP0/G4mN/VBW7/TCryw8I3dDwI4g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjFxiDmUPhU7p+F1HDBXHaRZ+Sl7sroVSbuapKQ1FFuA2xRutF
	MlyUJ8pL4k6uKJKxYz0K+IZ3piXIUGoeZ9jNca0Ev/r5ul1pdxMO2DvG
X-Gm-Gg: AYBFou0pKrtWqNk7FSJVCL620DWblJAh1wZ/KppH/CNy8HBz7Xsvns5sYXqrTYB09nf
	NaXWwiXgIf8dGB4BqCMtsWj+TOUpEa0A//WUQbFYpHzA64qD7pmZ/D3PDWYlrbiO+hy2tldn3mH
	OLbM78EGrQNqQh7s5my93CBCgaSMqb3rsGhMkucchLgdVb9cs05Go4iqyxzVE1Sj2ubJLa3CLIn
	DX4BdToJcZGkay9e00cELemYmGi/60Zw4X9XYr6Yoy9plrflc3tdyZmcizns4Q29FbYdRDdLXIq
	y4U+QY3TZvQDFD9MTrw7XZsjHh6Hh6Fl2IjtMw4c7BheQRSgAaCK7NWJxj0Y/xNWxxZg3EtgEAM
	SmRozQ3Ucbar9mE9wYBAEfB+E5fKn/bt4SMXILEyAJvjjt5TFYh1O2DmB5Pew6CHAW09pVMV1a6
	lTCRmN5KCmew0yrqV0aAcBziD8gaXGr6SMAlf1OxESZ2dPFVEg9K/o+rDGopm8WtljoiTjgo5Hm
	7Zpx2IMe8S/ppUld2A7fxYm5b0KmLOPdK5YM9OCrKHph9Xyo9Rzd4HvwZZ5rBrHtDiI45omt+Zj
	0fVID/VE8GdPqg==
X-Received: by 2002:a17:902:f54a:b0:2e9:628d:e9c1 with SMTP id d9443c01a7336-2e9628df363mr1150385ad.26.1792028840848;
        Wed, 14 Oct 2026 18:47:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:47:19 -0700 (PDT)
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
Subject: [PATCH v2 12/25] ASoC: codecs: nau8540: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:11 +0700
Message-ID: <20261015014324.5569-13-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from nau8540_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8540_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8540.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index d4211a76b096..09e7f31a904d 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -419,14 +419,24 @@ static int nau8540_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8540 *nau8540 = snd_soc_component_get_drvdata(component);
 	const struct nau8540_osr_attr *osr;
+	int ret;
 
 	osr = nau8540_get_osr(nau8540);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_ADC_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_ADC_MAX / osr->osr);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int nau8540_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

