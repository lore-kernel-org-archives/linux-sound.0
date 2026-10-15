Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C6F307492
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028819; cv=none; b=c6KSMYiSHu/3DJPkD2OTsBxF66/iPF6Z/A+muqqXFVwati6c7XpMVCs2qBNQyTzQ/+DuA4WgKbB7h9iYC3uwaq5WOaXNgCaeqf/xapqr2e1WiHtp5kFhdcb8yaVhu8tTMflTz9AessD51l84TxErqSwn58gRuDvjruN7zJGVxEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028819; c=relaxed/simple;
	bh=b5pvZP3GD540pr000CqdgVuOT1MR9F2E/LPs2Mdzp0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJ93kmRj39O0JukT0OWGmwZrlEoOXfESbBYV8gZp+FQecv/qbcoi/HLBMcR4KLoQEBpqFXvivg651p9sOFfEoM7p0W87C2w4EtlzYLV1Yu//Zv4Jx+YnYNebihLVArwx31AmuyOxCi6seuhxM+zfrPYADLn4sAv2qD8TIaCnwkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9UYLwur; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9UYLwur"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db80fcdf8bso27566015ad.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028817; x=1792633617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkExA76YJWwf2po0CbLVw6mxayxnqBJKULe/shJjNF8=;
        b=f9UYLwurwy9pCtE9mdcJbFv7UlvMxhcFPqXBJvh4NqJ4NPGSRLS7XpBnYzfgA2qGc7
         idnk3fx+KleaHrRkNF1ZlUfIy2vFiJZHKtRs0woIlZkLy1eaow1f9tOkti5CGQegxucG
         GQRdla6ZLs1Gt/b6dF981/0HFvufufW7eJfRR/hyYgBhjCRy9S0HA6ypkmCxHy7ETZNP
         e8ZFV65L4usV0NM+aG2MlfP2UrtR7asAlczNHyLq33B1AicZz7kl6ecqmw9BLoqTdjI+
         pXAFuTUyiHAd1FG6Akg12MsCnXWPeWyY1X6XnACMGO0NGAQ7EPP16KWqxDsc7y3zYpeg
         ZnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028817; x=1792633617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkExA76YJWwf2po0CbLVw6mxayxnqBJKULe/shJjNF8=;
        b=vy/li/JXjpi1rqsHnLRJEyLhBDz8qxaY9mVd36nQwOYVCPRkmbDwekRgA7+wAJpEbz
         V6EEh+sqVrMkS7Plpv9sh9hnUVMWP65cmprL1GY8oigZXwPSl7FUAWhLY1tPl/q3pS/A
         kxDvIqgIGrn0H7KxfmMWMnymgxRpkq/56WVnhlu9H9XJsU7Lui3pLEQf28RFgoGJBqPJ
         PVDenVVMm2yOkWB/a3jUii0nlULEtBJL3zJwcBMlJnHP8KMKXKJ0ZddI0x83jEPnNa7d
         zMy2VNOCmqGn67syS75DoA0gVvFJzQXVrAFlgEVZ3R7Q715ScuqimrcYcrWCq+JzH7Av
         zpXA==
X-Forwarded-Encrypted: i=1; AKwUvBzEfadT3eV0NXBMNf9TdjgFv2cO185sUfbbR3UAda1NQdhIa3UIBTF2RuRbTPgN+Uw7wuCMLVxh0X3hPA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI7+f0fyVRc8cHYCRW/ZtsWI2S/jOfbcGYu0IG8QYTi9R94EWut
	GOlA6pASiMaayqMOwY6JfPgqEAh7PHrAQmjGG/YaaFw3wIkKfsI1Fb1j
X-Gm-Gg: AYBFou3HvgMsR5G3yukz7ILQpx+nKTbEz/8axQuunteoNqofI/w3yEw1THeZt2W1j8C
	UYBOy+OvIFW+8yf5e4zFCLmiBQhULqChOyc+Z++0ZwfeGI0oc8aBwy8bc4MNBoX78pwUAkgGVZ8
	vaxi58Z9cTlcyg6odSGYSiPiOI7Xar2rpEjsVKJZX7/BsRe5sP5lEPfhRSMWqdFFXdTD4bqQeLD
	IIH9fqwyQTezB2ZsRMDxeDp+qWzaJh8xpu7tdqaffmGG/M6vwD0FWGLeAzRVNaQQV5NOkYWnOBv
	F8oxQuMwF+TCaxwXqMBi7RxCLJGhpWvMZ8HXHNRL0lhW7MuGSHwaqo8JdxW+x8C8tmqQyWRuc4S
	Huv90hLRTfU3A7kIWOtllGmGXT3QJJ86rXy5iTV7hzcKpb1KRm515FNyV/Q3WvfVsiPWhssegrZ
	UOBngQRvoBCMaHOBq62KCVvxiCr1pE2S+7DThU8iBEi0lhcH0FWI2vWoUFFl8pKcPg9WjP+h010
	wt24L3IoRb19/Qv+db5UDXy/0Urw1rIPpaznk7IdvLLZt/SLfQMthHoQ0T5q+LvwP15CQTh/YjV
	lqpg5dKR8GujB+fH3oxMFDmI
X-Received: by 2002:a17:902:ebca:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9401ffb38mr25578395ad.16.1792028816992;
        Wed, 14 Oct 2026 18:46:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:55 -0700 (PDT)
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
Subject: [PATCH v2 11/25] ASoC: codecs: nau8325: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:10 +0700
Message-ID: <20261015014324.5569-12-phucduc.bui@gmail.com>
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
from nau8325_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8325_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8325.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 2c95ed00a681..5ccf4c110567 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -489,14 +489,24 @@ static int nau8325_dai_startup(struct snd_pcm_substream *substream,
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
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int nau8325_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

