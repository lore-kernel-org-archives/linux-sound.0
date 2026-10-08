Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1840497B87
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456268; cv=none; b=mHy5aIEDA7oYiHGS+80iJbUAPVqXVLpuaV+UxJg3D1SgXCAtHim+Kt+mzDH06TdQa+7Te6N6lunHs3PkdrSUiFyMlFmrWjwHfMowLBLIt7y30CyGp3FrCfV3caJvF1j4hnXaq0K3tv9Lm4QhUrXu7ELP+lOQGovYsZFmA/YHc3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456268; c=relaxed/simple;
	bh=IeY1UCp2zv3XkIJvaFQJCH/Jamzhz2wdmHX15Fsk8cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQFNN5KNWl+PIZ0Qor8P2UGn0UifvQp9XWXvHpSpoXxXlVVNT20hCtDKunKPrINqvbAFSWwiEwvaT/8ii8avmXbu4/T7gSd3tiXl6twzcSuvKkMecX+vEqO2L+QaHohwdnc7nNmVGijY9pSk4/wS1e2uuvzkV3WhgerYqBOvAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffn5R3Ob; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffn5R3Ob"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3515f9a5d25so4195037eec.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456266; x=1792061066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuLwPV5SkTfLeBmEQBHF5wyNVMglPos+3a2Ytz5Xtg0=;
        b=ffn5R3Ob5Qn6zW8sklPbadf5IoNbMq1dE1nGZz9O/S0iZ1b6n7PbU8fnuRPMZWbWAO
         KQ9z+dtGwThqsQPbQpEfyTIpakhvexBxu5isnhchFYKKs3fddJe9zBDalUMUMiYipNGS
         WfZRP9AlAGB50RZoYx10jDMc6t3f0arCa1M3P/qNhJWMiPuIebn38JA00PgAo0h2M0hu
         aLi89P2aL6uMBNDYFzHC2kCHLeuWzJTzFaBrRA6/z/5o/AMD3eZ3n+oCF4WIEOmFlseo
         HSwwnlkRA16UJkYxn+Nf8u9z4Dc/Dtq0qIoQmudtqgRoR8EoDaneg/3tvDj08tWUEURg
         LmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456266; x=1792061066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuLwPV5SkTfLeBmEQBHF5wyNVMglPos+3a2Ytz5Xtg0=;
        b=hOKF1Pd7Zxw4HaYextgSMbSkuUixtrUlG5ycaYEhO2M3GOETTNRzGDnJobOluNGVh+
         8QSZW4FK342/cG4fx0DwrwHu2H+ZCHLIxLfx/L8hoT3ToWD32NaZ+eHxG0bwPyLGWavZ
         y0xnKwlzRSw8HQSfzCSFr8Tbr9U9VyBWW1TlNPROOuLMZXHWj9RMDQlOpRyjpISzZpL/
         8rBo08x00A5rj6Yv7uCg6pbNG0EBQiAQWctjrvnteBD3xpyWmoGHN8T8M/T2NBSv46DU
         CGBGVNB+H9Vm/RcGi8Fejii89pBz8lbY5BxPMp90jlMDUrnZ0aVm+wCQmxkY1e9KoGb7
         1kZg==
X-Forwarded-Encrypted: i=1; AKwUvBzoVR09QBqZlj+ewpBkpmCUXblT0JgkFMvqH92tuyYUcm4nIXIknI2iEXSsa03/Oc50SgCbR6LMYZoZ1A==@vger.kernel.org
X-Gm-Message-State: AFuF++ncicieoPaZmM+RaqB73T+2jC6Inf3PCBa4PzXzgJkz/k0Xzvxi
	769ct19qhUQw73egUfL5rsgvF/ynsIjn7kJraQTAl47QMaBCsZh3R2q4
X-Gm-Gg: AYBFou0M7B8ZK7U5CwO/bJlO5ik+wCHya9bGD8tLjBFwQQZ3TvSsnmguYrIFonH43aY
	1OoslRWGpZv5KA+ZjrHUTA9b4xE3xYZtvEfCYvTgjaeNTKcEuQ9QLY7C/wM5hC1VJBcC20KrCzh
	dyeTnNwVRk1IcviIi9U5m8sIw/MUK2DSA6Bp0pfhxaKn4mZexneYqCBt5QaXi1gA7r6TjbY65Qo
	QC2v2xW52Fd5RSyCzW6xw0JibNa5xUv9iUYiRwd5H3Io69yzFwf0pX7HjoJKz38wfCljdxIPsQv
	ch87LgnBQsja33iLCHCt8API5S1yguq14dvdMAgJiIgCQaCQbKqkIeuD8/DFa+FZASaI4oXFoiZ
	MK19VwVeiYdCncJrK7WvQonweKzrcDZhGlr4mv034ggtbwZfYjHUVFKdT0Jy58uRPzb5k4HQb2I
	4T4xMGqv+rkGGvg+UxaR/5M9SCdg5giLpxbAqforbLXhgCCO7ELO/q4g6AMq8XbhvKamw0QmK3T
	HJLFS79aOn4sjKleYZttP9P15ZJpJUDougk7dPSO88gycdf0nS/UP1wGdX79g8saW5ZV0cVqKmN
	NqCoTVS/qp1GgQ==
X-Received: by 2002:a05:7300:d408:b0:34a:e7ba:863c with SMTP id 5a478bee46e88-3515dde5512mr6327305eec.18.1791456265752;
        Thu, 08 Oct 2026 03:44:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:24 -0700 (PDT)
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
Subject: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:28 +0700
Message-ID: <20261008103831.542533-22-phucduc.bui@gmail.com>
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
from msiof_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: c61caec22820 ("ASoC: renesas: add MSIOF sound support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rcar/msiof.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 128543fc4fc9..9fead9a22cdc 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -427,10 +427,12 @@ static int msiof_open(struct snd_soc_component *component,
 	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 
 open_err_dma:
-	if (ret < 0)
+	if (ret < 0) {
 		dma_release_channel(chan);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int msiof_close(struct snd_soc_component *component,
-- 
2.43.0

