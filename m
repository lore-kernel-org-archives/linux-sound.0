Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF23049738C
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456174; cv=none; b=BR7bPpRnN/4OwPUsv4CHJKXwmclobPDa37Em3aE14i1LYZmVbxsDWv9rUtXCEUHIVM5m7ZMTMsROjy5bMIRKaH5pfI61Sbo5GS2aFvYySjeRa/UJk4kJlRzQ77Bc+jjYRzT/mD1KURqUErNOX0JD4PfUUMTkC6wlQyySeb/wKgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456174; c=relaxed/simple;
	bh=5gdHEOl1guP3lKSItABKnxUiFa7+ruLS9jKThkThl7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1Jd7KQIcHf0hHeWe1vO9kOM6ho2NhmbzmKplVmov4baSOle/VwkNaZpT2Xjd+ICIu2YtfAdEkDuDqaXMnUO5q4gdgZS9Oi+4/I/4vX/6WVmtLKXNpkiVZ/sT4Muyzi3TXTwypUBEP1Yg5CRrQtoO0Ri9ofYvAFGf+l1ZlCv4kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fionkPFW; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fionkPFW"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-351767ef18cso1962515eec.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456171; x=1792060971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzYVoHEdz3P+bsZXHKAJVN1yBKjLyzB0nPd+jwADmvw=;
        b=fionkPFWrDrAstDn+o1Q7dWab4riLi1f6A/rIsQHGHYjcP0wbkd1BL1MNHmumFFrti
         KwXHsEjTMAGTMupIw+5jEHNOXqiQY6bBBWvQpE9xOM0lha98fe2BWdqQ1TyqnnYkvuPm
         uQ9G8lNrAWrkvO3OblQzaUPoHk7hdYxpcbAJsR249PnoNsNtLQkyDrwx+I5oaiaUwidC
         bdNNnlpmWA8hkINoJ0bbwIlAWfdRpICIyMyH4mn90x9C26kKZ1HAblYzjH9YR8vz9082
         C0gLcQuT4oOuG78hC7KHLGeVDAyaLqGBwlpToY52Gm4J+zujNv8EiozF+HyWwPS0cgs7
         caog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456171; x=1792060971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xzYVoHEdz3P+bsZXHKAJVN1yBKjLyzB0nPd+jwADmvw=;
        b=z6E9KeSh1W6IozXIB519OxiPqz+jd2YTBrJ3wJFLmqSlGNEI/uPjC+qXvcKfrxGUlt
         +nWga3ExnFTqZ2PFZb6/cxeigr8tLSD96QEcAWhB4VJLqkYYggHXgZKzIn5QuIMSr5Wr
         E7Jy8EmMgVtCNe3OhsvrwNApYD7M2YB0qihiK0p84SZcv0LvOozU8RkLHoe62KBn+0h5
         4QZt0cUIJJLvpdGm4tgAcK53pFyv26SkOON28H6IJieRR3fqCDochIT3wvemiyaQlBET
         z6OdczGsb5Ry7ES1kMhBgC5c/YQ0VF3TDQN3D7G7lBk4NpitVkJ3KuF4vL8Hjg02oIJd
         982A==
X-Forwarded-Encrypted: i=1; AKwUvByHZrOLISqLDy4djmSI688FTSK59hQGEDn2WUywyedAt/cvuHkombrBbAIdDoqd4iCWqlnn7gyDpBJwAQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ljE4tzjMvJVsL2puDl0LWgWF7327AFLU9f/TOu3nBIgupakUnX
	2ymaANqJW8oPi0SabpzP98VR3vTZsQvOLVzWz+GCoh6qmHBSixWCstdj
X-Gm-Gg: AYBFou03S+ShOOLBXd617kXFidsTCQZ5CQy/2CpOzd+vbQi008QCf0B1uTo9Riw1zXC
	yTyGTJUzxES58XxTz7QdNzf25I/29nBNr6y1zlnGP5AGPjN67zR8f4qs/fAZWup6Ps9H2kLsIx6
	V1AcwW4FsEMuNNqy0SvX2Kr6f/B7PnaIAqARcU3s92RlPwt4K4hnn5gMOUoRK+rDKsUdUB2r4z0
	u4IEmmPWbxzwWiMTWxMHPAkbY2SWwrr2JBRNBDWaAGELWw9qFmshpt3CpyPrpkMSUesG97nx8RL
	lT9UKkAp3xPeeE7GlzGTrZhS16MV7HrJ1Wa+oRoJRpKK+HKOAFfpFfJ11RinpQVxBSIZRv56Cy8
	o44iDRinhpR1CCCD7s5RrVvaW0oAwXuMGwiEvlRd5YHCHV6eywIxPT9H9+5CK9UOUfL5W717I/Q
	lSOQfQCEI4w0L68nkEK3qYxgMF5mfkrK7MQzMxvENw9nQXroihumtz3cHJot0tPbk+m+ewyRTuZ
	7oHxigYqOgRi50d6qPB4mcWIU3YmWLuBQgE8scH1SiU+9nFI/TS7dzJpdr889tsIJPS2/y6+tJl
	T3apD0cin1Z4nQ==
X-Received: by 2002:a05:7301:8617:b0:351:11aa:5d5b with SMTP id 5a478bee46e88-3515dde8bbbmr5895512eec.19.1791456170565;
        Thu, 08 Oct 2026 03:42:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:42:50 -0700 (PDT)
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
Subject: [PATCH 15/24] ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:22 +0700
Message-ID: <20261008103831.542533-16-phucduc.bui@gmail.com>
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
from nau8825_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8825_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8825.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 63d927f31409..10bbfbb460b1 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1261,14 +1261,19 @@ static int nau8825_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
 	const struct nau8825_osr_attr *osr;
+	int ret;
 
 	osr = nau8825_get_osr(nau8825, substream->stream);
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
 
 static int nau8825_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

