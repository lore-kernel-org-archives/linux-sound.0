Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA5D547074
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029039; cv=none; b=R+D4IAg3QY5j5f4gBnftJbjCnr3jTziC8v58BuCf75xBN/MP3XNBVbEJgrGBaLWXVRYOKFU2lofiM1HPq2r+I8Z5GxgCwU3+7o9LAwMPFU5f4ZXR02PPCQ1aeT/xKQPQmGuL7Rs2YDQfNiBROMfVCj4V54Jekt8skgi2EPcbng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029039; c=relaxed/simple;
	bh=/x4wgoOpRrlKj8g7RinhirGMQW8lTujhGHYMYJBcDDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ar/0Hnuhl4eLl8yoUoJ2kIu1htjDGiE+AsTJt/yVUHa26lzs4Sq2J0xea7/8bjMtaM9UiVE0q8st9TF2z4Qn7GW5xhZhhCvMGwJ4JMy2hG5QQIJxY62eUIviG2mU5h2cMBltx7YKLKJQQu1H91ZZURVQHkSinagt3cSopuIbCBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avQ/nmnn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avQ/nmnn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e915887d9dso16494625ad.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029037; x=1792633837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lmt1bwfRxOTKjQOsp9tkvpG9ehM8yzZulL3eFnlXWR4=;
        b=avQ/nmnnmdQWGkkLl1ZaoXabR89CPuJuiq0KeDy93a2oC8+qq+nzkyIvCEUaSyaufN
         YYYoMjNrkKHMYh/VnXk/ntlBMqLx+TEMJGup+bNjjjiQj4NX6AnNQCDyodvF7qzvDMW1
         8bia2ROC+ByWbIRgDfiBILPqYEWKNUrybgBZA3kOpsCUE6j8cqtfo7tT3pYtnFyhXP2C
         675m437KTTJ7ASPNYoneWOMAd4703Xf70ZMNeFCQPhtzu+AGfjI0YCQfVmZpsL6BkSWC
         754/LLe9alP3u86Ggdq7eCop93CGbBN1OAYS7/WcQa/i791aSzDJnjwDlWwBAUbvbPoD
         oD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029037; x=1792633837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lmt1bwfRxOTKjQOsp9tkvpG9ehM8yzZulL3eFnlXWR4=;
        b=VWF3kHrNEX0YemnJDl9gsRTeLR4GkTz5YLH9mFLCpi07s185YNbzcPppnQyvF8vyfL
         LwKgRjnMktz9gmrhTy1Hc57XdI3fNW7EI1J7F4j15iLlEfdx8d4KB2ACFSVzpqqcPYTV
         0i1F516PH/2/FZLqqg9EI07fGSDH+gSqkHlv7laKwrl4PLTwavqHYuO645q8ke19XXh0
         DDSkxTIgnb3ZXDFMruZbCTC35G/QybTa05Lt4EzwbdyEMOt+oIMboWQ2rZHxscwiu7Ar
         amL3k5Ik9Pj4ntCSmYGOARdM4YKYJKbjyD5/nOLJyIjRUW1Gy6Jb1O1TU2tKNgNkZGl7
         EtbA==
X-Forwarded-Encrypted: i=1; AKwUvBwMnutBQB5jTbQKKv7qwgZ0o+assb4f66CLltOig3Sq1YMCm8PEutywyJjn4gGwgUAQmYm4HQcrOL/uOw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJt6beN5ryvH6s72HdHgnaqDMS9oNT1/+Lg6+SHHqmNndJG2vA/
	vb8rp5ZZlxScywZFU4DcRlnUwvWd+1+JY14S40OeElGZ3v1V3d9gFeXw
X-Gm-Gg: AYBFou1rJ3NyP/4aiA+k7m6+S5XC8Aj9plzdCVflqqJDGO0LAuU0k5xqmtBju5qJUi/
	vihJWKzgIU2X9SeiXfAb/OogAmmdb7jBirmoVZTyhCjxK6pLm5Wi1JTNq5c97QxllS43MMNF3j1
	eNKmoTa4KiISAgD9edmEgScCuXscgFk1j44zbBdYx2XZcBx3PUpeSVeuWUD5ALo9+vn7aMRhomB
	es5AsV8QRIKG/1hCxdCpz5CCvEJp5SK3UoV2dP/W0qWRr/Iq9ggXA+un4YFPVD4UZILM9vOivZb
	Du6vqnK6829voPCEDK25cB/IJEiE9DTpV6dya6IAzZkvh+Npyu3hYc3Pi7iJhwSQWr+5H7beWee
	QqcQryKRk1By470QEuWVlamUXn3OIdYs8E/BsZvsm8vlKL4IR7dnoWiQF+jM+DKHGNTNWGu2Z6Z
	E4P1TWz8d4r7wEaEkQOqu/voN0S5fWaUgScYM+7NvMrZziM7grtIbTXIxgZ639Rz/XyGngmMJV7
	zYmwJLpQVg6ilGU5pPsWqOiNxdzJR8J00jOU1jDwKuqKQtAVck3E1t221kOheAKz1uk+W7Fhh87
	65AqA2UsL+iP2Q==
X-Received: by 2002:a17:902:f706:b0:2dd:c053:82f1 with SMTP id d9443c01a7336-2e842cdb110mr149481055ad.40.1792029037428;
        Wed, 14 Oct 2026 18:50:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:50:35 -0700 (PDT)
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
Subject: [PATCH v2 24/25] ASoC: rockchip: rk3399_gru_sound: Mark the link as started on success
Date: Thu, 15 Oct 2026 08:43:23 +0700
Message-ID: <20261015014324.5569-25-phucduc.bui@gmail.com>
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
from rockchip_sound_startup(). ASoC only marks the DAI link as started
when .startup() returns 0.

This currently has no functional impact, as there is no .shutdown()
callback in the relevant snd_soc_ops. Still, return 0 explicitly on
success to match what ASoC expects and ensure the DAI link is correctly
marked as started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 04e7bed8275d..d4a0daabfb42 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -258,10 +258,20 @@ static int rockchip_sound_dmic_hw_params(struct snd_pcm_substream *substream,
 static int rockchip_sound_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	int ret;
 
 	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
-			8000, 96000);
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+					   8000, 96000);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI link as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI link is correctly marked as started.
+	 */
+	return 0;
 }
 
 static const struct snd_soc_ops rockchip_sound_max98357a_ops = {
-- 
2.43.0

