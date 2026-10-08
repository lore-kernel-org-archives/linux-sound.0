Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331DF497B7C
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456218; cv=none; b=A2Ti6BrTKwLyhXSmZftdyPOHm3PouqGKAewI3LwSWKr7Czb+A5CpwV5l6TXi6fSwUPH+LnY3fl2Tw3lmECDnW07pj9Tr8++j9g1jSWUakAIhuspiMQIiInUFMv68ix2vgRHMob2X2hgjOoGhdyhXW5NaeznPd4Xi02ftELmmXWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456218; c=relaxed/simple;
	bh=M6D9aaF9YzenOEQjSguQl07lda02HnO0SBENTFTDcdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddYcJDSc8zkD3bL215zeW0rgiB8I3HFtEyuu5bdxEBK8o5KxatYRWmi1cmUhsTNimJGNYjWfT7eIz/oI+8Vor3sc63oBV+kfE5pq0+cM1W/4VPZciyJzULUTUGCmDG/yEe+zclQdpufKPFrP/vJLweaYCryuhigvjFnrv/TlDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ru8D1jET; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ru8D1jET"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so798672eec.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456216; x=1792061016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfWx2qRDgtNnVPrZV6mmc0DG+YGHGqR8DbBEhiLgtRc=;
        b=ru8D1jET2dSztv6RGwn5H5YEhLcmlHauVuoLQhYOaqDuIupEpJwnEb+ujOWmo+WP/o
         WO8sFtDl5Hydvw4nJuegrBcYZ2DM4KESF+x+TT93EWUNNtjNREJLgv1QX95wCxOcgi6Q
         2IHyTxuWsZ6LGWuFyf6l/vp6CNBKBqXGDwjrAN2LT4OqGNEl762N985QMyTN3h0KAA/w
         FNXo+s4HH+6zNHucyE69peI/2UC4+G0YCiLMFo6JDNFyP3AnDODDQMQkNSFXyUjMCVyk
         nX3+ux8YhV2AAEAm0+TpvSO7RCC9PdGgXYjRRdMjYuMzAy87q8iotbqkzPxxmcGVRESF
         apKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456216; x=1792061016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfWx2qRDgtNnVPrZV6mmc0DG+YGHGqR8DbBEhiLgtRc=;
        b=IKfxWoAwA8Vj3tXEL2jX5jsHaPDZ8xl1d7d7eZSAHZrB1j2nhBeBsMHgSoe4/rE6BX
         5zj9QgAmGxnlCqYzom0PnmdrNHe/jo40s6tbf6mAY+kTN2z1EYgYRe5zP4jJJGpmOGwU
         g4FwpGXC9D7u7JoYChAPyb9vvOt2chKmfDv37cMzQaZZraL8i2OyQXjLRXIb2Jxumc99
         eNnwQwUPi9ycImSwoaL3gXzB1ZUx4/eLmhBtmC4AGU6OurZmDae+qyQaobuDiCFNjR4L
         +68/TC9NRy8U53jiuSO2blRePs1UtlzrHlTS8BONyVSFI8E6XzvDghQZixC+456CQ4tC
         nwyA==
X-Forwarded-Encrypted: i=1; AKwUvBwCLDKOlHyr1uphjdDMaEDbg3IEbyHn9vXofBiM0qnyTZ/iq7i8BADHZUi8R74sE7zHDm357F7lNjwWUw==@vger.kernel.org
X-Gm-Message-State: AFuF++neWtIi/LQ+284jF7EXl8WNcGGOxhBO744HE5TY9yl1Zn3YlGtH
	GCb0l3u0m9zc5/yD/X9+931sbBSyShsAt6fORbmgWeJbFhU/Tl90L1E2
X-Gm-Gg: AYBFou2Y50S1FnKflO3lQ1EOhNPcSXwhUUh1Z0L/ZUevKsIsYt8lwPoQbIbDQe+6sHQ
	rTs6155Zx1jsDyZa6y5C4gtLw6FYLuO9PDRJP7WEX8TpAIwJH3SLxJrGlargu2YAmZ+pttwPAMM
	prl3tedaWeaWf8wf42nvF6nY9HFme/YoJ22fzKJC1NXZN0VMbERFK233myt8FVjj6THiKDzmbnn
	+UH6lN6wHQHrNneflia8gTiAJxfAhnQSQiWls5rn4660lN1r8fqsDtNMCdE4QqoSDe1OmhTPM0C
	sZrQq4HIX84lKznfO4QWzWMY2o5z2m0OwoeiiA/Jf8mhuIzWmWxILZG2wImzd4YXaHhCWQDe1Bx
	FR0Po0Svj4PpUOFM28g4LNm6SjSq1Ls9SqYtJalahDN0vSIbRsbZVhe9l9sVrUfKvkAIolTWZEW
	QDDGzWkL3slSUHBEtd4HmdrlkWFZCSPs4arKRvGGpKqe/8TBiTDLEJaet3Z73IW0H8HLq/5ukcN
	JAJ7m7LNFF66M+r3e0xct9asV+0vXiP9EOa6utFZpqrZwHcLfHM9Ojj4Dcp7fcM4p7ZjsBZJyXJ
	upjJrx2xjWcZu73w/qS7gEcH
X-Received: by 2002:a05:693c:2402:b0:34c:e77c:f92d with SMTP id 5a478bee46e88-3515de8cbfemr6349033eec.33.1791456216244;
        Thu, 08 Oct 2026 03:43:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:35 -0700 (PDT)
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
Subject: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:25 +0700
Message-ID: <20261008103831.542533-19-phucduc.bui@gmail.com>
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
from imx_rpmsg_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 3c00eceb2a53 ("ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 7086fb7fc1eb..30e75fee5175 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,7 +269,7 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
-	return ret;
+	return 0;
 }
 
 static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
-- 
2.43.0

