Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75342327BF8
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028804; cv=none; b=YPCyFX8nvV5wLCCdMbsyqx2LlojpcNT7GGv0vHCFqVZ+HyMj1rE63Kwrcft7DXZczgrBDgQkrr+2/SNMr2y3LfIMn283Y/e4yymR8aK0kveXYFcydYUHmfCs//ls0ZdGuzNiIQd9v6q8Ezeli7etZygzvb72eGXlJRZVHqMfkYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028804; c=relaxed/simple;
	bh=HEnoir5YUU9pRtHiCZMnqTe7yfBh5BOFRRnUCPqrwfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYQ2VlmtggdS/PUQOpQ1FNuJpx8H5zdTt5StIuh77R5lyAo5x/rYpfbUUH1TdYsNLxZVl81c0lJ5xyDEx/t5zRyP8qZeNrh8K9rNrmh1Z+tfDvPiOMMRtD46D2BPax7+mYgEr8lUAtvzLhrPhO8OevkxPs9kqSBZeRdejpalB8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLOUHqYM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLOUHqYM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2db710396ffso36899925ad.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028803; x=1792633603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNKaoas0suhXoNZM631qYPKJn33cxyMQnmMBR8n2e68=;
        b=iLOUHqYMa76XKfsdwncdnvFA6++Fw7bgclRFGIIVUXcqtGOSB6JW7uRG0uy8mlqiTY
         Y75O0M9L0cpMOnN47n277djnZbVu13dWNF5ISb2jx3Roc6052ewiIXtDUrgDTKnrYOIQ
         NVtwWEB/scZ2WVDi9MgTqIVzgQJcciam2X4hXHWAvNOZe81XGcazO0ecenaH+nyR6S5a
         xUL76qqIXBr4xAWGH6rC7i5PUwjPLuuJdcTJaiz0iwgRG1NFb+22yjyziT+IMzyUFg5/
         ddmdJgpquBgdZ5KL0ZCxjj0djF3j4mo0kM9TDvP9Z8eOygE3YikA8pl7KEo4zo9CkQWt
         ue4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028803; x=1792633603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNKaoas0suhXoNZM631qYPKJn33cxyMQnmMBR8n2e68=;
        b=YJhQSP9ML+Gxv03EbSeOlZYB+wYZwWaT4zyH9CRzZ+4j8kBrEx3GbhXRmgfoytn0EA
         aN0Q+Tw3JLEThDRpmHgzuI+xaqzLmK2UsU7M2nsJzusqmmBao78j6NaFIRwvOOfzVTpD
         BkwjelNfjlpf6YVYTLktUyp2rDREqwb1+y87B1oZNLHjEAIvm4f9zwOVh96X54Betm1X
         ZVyRJgvKGvKySlVyEKkmD16Plkl9HeO437vtfMVvOc/+mos+YLeNughIS58BGzHjeCXR
         PpAsh+xJ0WOI6b0CDSO3IGZKVIQuXqeLv1sa/pngu4ucasY87LRqkDLna/3OMIv4xdpV
         qh6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7WI5JwymxJRrt0cMq7HH9gz7FWzfGjH/6xLTUdBbnZxoigDrbPF9tjGR33LvS546JRaiwN5Rds2lDXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJYdhfL5IAedSG+OZBTDtf04Xc/lhkFnsRnVqkg5KQ5/0It3oYP
	vK/rSpPd3SKGA56VYNwIkdgCixozlyDDhHnbUnn+qbS1R8u9UT5C4DbW
X-Gm-Gg: AYBFou32y8fO98dVM2Lyte4ncMAYDM51VG0ogvfo8IlrayXa7JM7yT1ypuOpEuAo16G
	S8lTxUXJChHlugh+11tMYqA+sL5N+ms2DzDDP7pyVHAvp/4YihvHqOoV5ErkqL1Sd01OtcsvA3o
	fbKecunW9fFUijkucMwYtXIVKHFgEq1FJues9hflEeYd9P7azJaNE0waZuCW7aKwfL1KqPClA4N
	Tt37yI7rSApViL3Pf6yZyeAcDcta3WKk3iBs24Ds82toKCS6AWr1x9zBrVc6P4hTHsOrbBTDo3K
	dZzWKHNASI14o/qGGXJORSoWCSy5/LMMzflPpPlUXwfi+4axSE9sfNmF/moy7QadxOX0jbxQExm
	ifdy37HbyIW3wy8wqIi9Rp8g5Ee22cB1Wacul+GIghvvl61q+nNIGSB9yd12LFaTPB9RLAmQ12X
	uXtyEyhEAB5VI4woRqXUHZo2Wt04emwjb9clk9ljfU9/58PM4q8kofDAIAJPd0f+NRAlHpNZfnN
	LRqQDqGWRWAhmhD9baiirk6vVLy9julALCfAsIvsH+QayvxVCqZ6MgDkzgiTvc6IdXwDrBNwO56
	3ej0xG/V0CMhDg==
X-Received: by 2002:a17:903:37cd:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2e85857ba34mr106063185ad.10.1792028802766;
        Wed, 14 Oct 2026 18:46:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:41 -0700 (PDT)
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
Subject: [PATCH v2 10/25] ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:09 +0700
Message-ID: <20261015014324.5569-11-phucduc.bui@gmail.com>
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
from cs42l42_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as cs42l42_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..18d6cb9bfa2c 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -890,6 +890,7 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/*
 	 * Sample rates < 44.1 kHz would produce an out-of-range SCLK with
@@ -900,9 +901,18 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 		return 0;
 
 	/* Machine driver has not set a SCLK, limit bottom end to 44.1 kHz */
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    44100, 96000);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   44100, 96000);
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
 
 static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

