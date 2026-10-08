Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2419496D41
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456111; cv=none; b=rFNoNjiTMUoU8nFQ9dtlhybcel8WoGTzV9EFxYm2ysJu4ky8vtX+87DKHWuujpS2bYBzPHDkFRJ16jLOwevST/umBoPqY3CvCa3Tnr4pYJ2GppKeW8WzTPVdH3Qn7iMid542+/xvt7EPXCFiJ32Y0UDnsLWep88cPaQj5nS4qWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456111; c=relaxed/simple;
	bh=71PUR7K91ZyD69iBNYAlBARrgyC4DA7DjLeiH7sGXns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FyqheP9wxG0ojbFEbXiN5FzuxdeeazaB0i+9SYpiyKaAsLu6l0ykbSJeD8Zmnzz9NNf/1gviJQrReWalNKN9/N+6P8Pmde1VmRpMxtHWgw9SBgBEPvg67AkeTe4U+DMSksyWAcpuDxFQE0riD7XttVlnLjPAn5IoXL4ia5xSVmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByvCiVox; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByvCiVox"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3518cbe59b0so250838eec.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456110; x=1792060910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dx+SAHqrRwjwnSaJfYRo4lbib/UhuPNUGHZg46FBeBY=;
        b=ByvCiVoxAn6fV/+LIDOi5N14qIArg/MZ8UI1RiN7PoMpReOOGHCmepzXoqabAoej5G
         aq00BuIzwPpJQ6ZNVUfqY422qcvSoYOCX93ft78oBfcPQxXeUv/OIBrsv2kfGzcFqrer
         ItszAiAudPqI8IFF0Zp6aUsemmMuVn635IyORZuUtFQFwwoNjXwvmR7tb09PlOWtx97t
         G12GpM4Wt6skr452N4zlu/uNym/YWeKpvzRoVUGJrKnRjFgGaFam0r6USZyNFyqdZdAc
         tm9S/jwU7NXjVYiaIrYqq3w0KylWHiZI/KlPpUSoJKztDQPr/rPBdDJsgUWCboTts/5r
         /pWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456110; x=1792060910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dx+SAHqrRwjwnSaJfYRo4lbib/UhuPNUGHZg46FBeBY=;
        b=cJyzeSYXqoDN0/rLDOeHmgaaa1LzxZJHGCvrVUntRYR4+WcqaPAFRoaxfvRi8gvvtM
         Ib08GWX+jfBonHqHorRtQW4lBdkYFBckIuwBPNaEaSSPXYHchOAI/RN1dKaGlYh1JCeZ
         uIap+5icKrqGwYqSr5WjiR1mUDJsHJpxD6P8T/QCrSHefWRgyx2p+9EILn/YNd8UXNFy
         yz0OED5SUYGe5qBb1nqcIUsuvBAohwsnBl1ZTM4bFXVoriQC4tAmZFWBMmSwkhksV31I
         Q7CmWRArIDp36hg2YMhabepO3Ib3PPZG1yJnBycFSkUEPVkdhbuopsTif6WlTqIhyf24
         1d6g==
X-Forwarded-Encrypted: i=1; AKwUvBz43MTlPhdYgHTbELbVDxHyDvZKlZ68kZTPvRw+3O6tYhum3sJq25ITT6N7izFKJaE+pyJ3MY/PFRamTA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3Zj+dC+WotBraauvSk3U81jLNVw1Py5byJaeZPXHSmF/zLsRF
	5AAaxvKowx6JA8clfbpEI7NZOgJPAi8VfWTKoBufwS/SomQ6hQsV4Gaw
X-Gm-Gg: AYBFou06QFpGTMXlNBJ6SwEZDXgGgsCbqNfY/zMJpbvgPF3otI0YP0DKx/XHxgeily0
	qIIUgez8WSDerXoS6r7ViAzlWxaXl9ku/vK+cq89ZgjZqVEErnqvbNiXdFEk4uHhFYYyzWUZph/
	5g6fC63tSssfM0OZhzrAsM/EQeZD3Tg4N/vuVLxEvaue0Co7jpPP7amSruRrezecKtV74xM4qY5
	D8nyfGexkCRjvXUTpkHTFZVkGQPdHh+pOQUxpmL/CeqT7idyiCO27lpGG+B9ONF42oK/06Q9jAJ
	9+qt0I2XqEDvugPy0Egq654POJcPsRBU81ySTqy549LU3gXCwXdMxgmWpweQ/yR+40trrzC358k
	/9e9i8spDKu4k6FaDqmkcVjWrcBS6awpvolESFtbXEZMHpawcl/yWuB+VqaMnUm0ic0CKi5Ndkx
	8d4KAeoqdqerkxppj99TOt4Ken2FXMiAwGO4BLD5auhefb+2KzMFiBjbD0r3t227PcqIj5cOmfm
	rugrXrY7ilAwlFzXZk8njWPCPu/1v+CHDrwWP5cEZKQYPsEbPIOwB/AW/N/bzitkMjGQNz+UlfX
	zkLxB4p9cO5Ogg==
X-Received: by 2002:a05:693c:87dc:10b0:353:58f7:9b41 with SMTP id 5a478bee46e88-35358f79b75mr44405eec.11.1791456109537;
        Thu, 08 Oct 2026 03:41:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:48 -0700 (PDT)
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
Subject: [PATCH 11/24] ASoC: codecs: nau8325: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:18 +0700
Message-ID: <20261008103831.542533-12-phucduc.bui@gmail.com>
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
from nau8325_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8325_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8325.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 2c95ed00a681..0902a7d7730d 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -489,14 +489,19 @@ static int nau8325_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
 	const struct nau8325_osr_attr *osr;
+	int ret;
 
 	osr = nau8325_get_osr(nau8325);
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
 
 static int nau8325_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

