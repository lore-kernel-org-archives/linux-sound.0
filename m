Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177D9495042
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456067; cv=none; b=mCbJjrfnCL+zz2cqHKniLNX6+oaiyAr6JtJFfHu92FNpwqePPx0Z256fMIulK+Vj64Wsb1Eab3TXYECPsI9W107yE3g3ob09o+d9E+vymrzdFIi2EuVrjC6taoSteElblyPpgP1jmEoBOR8JauBYRczoLtPAemgj18nTw74MVoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456067; c=relaxed/simple;
	bh=Z888BsRACHc4khVghw71yqQDS3j8iLQcHLU2iv4UfaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRwWO5yoD7NyoKaM4PL6txR+mXyTaTenmF54wEOOu+KQ0EkEO0apEy0s73wp2W9olCnRt/E57grmXglshb812iQ7wKermttfZzHb2SXyb6vTaWjJ4PeFZMdm67Rtok+vjWYM18N0+SkHJzJf/ubOD9rcW7KU+wppiQfkKw3+Cns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbNm8Vvh; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbNm8Vvh"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-34ceab2900eso4963753eec.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456065; x=1792060865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTcgEknypy3JpI9J/G9mPIrbfMp+7I5/710LUj+4UxE=;
        b=KbNm8VvhkpiCrKqc89Fq4x9OFB+UNKL+d34wYccd6XOILhvesojNO6ZGOWE3YlFruQ
         IQwVZtXJ7YIv1iDtJ3vSYtCiYoPp6Uk487ypZOJi68zwYu3XLls+Mt2b68GVnGT2LJGs
         dhgCVOGZjqTWEYGrfUgqGt1TCONEB/Zhy33T71LL79sUi+VBgwXyXMAmfQO1z33xvGvV
         H5UqAaZkFDn6UZ36FYSFGTmd1d5CaKrlEn2x6YmqDkstSiG/3epK2Unmgf5JwwGnbB+u
         Bozz0Sy9sjW5Z0ef6UIGnqIHrFg8PDJA6i26vuP5S6+EmXy9ZMyTR3PO2ZYHUfddxLPV
         Wptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456065; x=1792060865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTcgEknypy3JpI9J/G9mPIrbfMp+7I5/710LUj+4UxE=;
        b=l3PefrV+PzXoESvf6ub3Z5YB2j0tvj99l5hkgFnLpKuEMCXAgDX6QWNeaP3fKH+xDh
         YOYPBqNMaemRioNRYocYHEgiBbgbEjXjK3kkDvw6T7f908Sx6i9wyoMgf1HyzuDyLvqx
         WA+BdIU8r36XF0CABiCux4ovuLiZeYNGkWDaDlsPJm3uAXiQaoUs22ZYgsg4mb6kh2DK
         jQn7BEgAWRY5+OAab3eyklib/IcpSvVXGs0y2cddoalTN0CbmbLD6f7ESTPUqDztCAsc
         yqtgDn4NNTMl1LUgVLjMXCch1dKAT8uDNt+kyWS0s3oHBp4XDe3zk54xbAKlRmxIctLL
         UsNg==
X-Forwarded-Encrypted: i=1; AKwUvBwdKbi4O2bSh0JsgkcvAMSINBBvzv+qllen5UVI+gYbc15KzfkkAMU7UNrZJJjSRzAViIUP2xDqmp/KsQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kdHI5xs8uIGyL6/mW8prVzLYRQ/3ONnskmakoL6S9uZOSulcut
	g+lFYqpo92OLn0NKcJW5/v+lzX+cvrQ+TvPROAx2swa40RPBL92zIosN
X-Gm-Gg: AYBFou0KlGJmuMD3je3h1Vy05pdx1K9bqO/gzmpw6v3Xmpo6N5K2hLV+kga2GsCMdDL
	tf68S4eSZzV1GrmVd5Q0qR7KpQMENz1zxXE25dPHX1+iLrXCPtHZrrLiElT0JZllOleZoW2LZQB
	v3L8LGiGFoKh+DVl+fqr/9HadsE5ecn72DgxjqwU0iKnd4R4nVaDCGmW4OS728XLz6TO2rwb3sU
	J+E3ddf41o5adryWtXO9/S/1jza7JtTKD6r8JDLJkRW55jOnYvSGcU7EpAds937HP7dS6LW8T3M
	mAmtMf9erhAeIso8ceRT+QWImTlbg5pghz5IllT/4aL2/f/aDqrd69h2K/M9n3uyB/d23Azph9p
	IU4AB2yiXmrKYYye2lU1YDv21EOpO9Tcme5UBfhulr7Hm93wuLSg8Qj9WjVV+kiU4WXJLO7MKFy
	qoA3Xsn5RM8MnTsB1zPSQ+Ec6lGfZXevfHZYqu72SqTQwx4P9vAh22aE74JEF9zL+Apo5dedb9m
	lb6dBlHx3IwueZc+NfZ2AUZgk6c9QIrF1Kqweu5Y/27hGJBwX3IcdzQz2fHg52tMOJzelOnljTq
	AINR2y4uIxdsQA==
X-Received: by 2002:a05:693c:880d:20b0:34b:f279:2c16 with SMTP id 5a478bee46e88-3515db9190dmr5490986eec.5.1791456064946;
        Thu, 08 Oct 2026 03:41:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:04 -0700 (PDT)
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
Subject: [PATCH 08/24] ASoC: apple: mca: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:15 +0700
Message-ID: <20261008103831.542533-9-phucduc.bui@gmail.com>
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
from mca_fe_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as mca_fe_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..3585432ad49b 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -516,6 +516,7 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	unsigned int mask, nchannels;
+	int ret;
 
 	if (cl->tdm_slots) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -528,9 +529,13 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 		nchannels = 2;
 	}
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_CHANNELS,
-					    1, nchannels);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS,
+					   1, nchannels);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int mca_fe_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
-- 
2.43.0

