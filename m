Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D07E2E54B6
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028930; cv=none; b=Vn9RDaJ0vdDf3K57A/S+d+uueal5v+BeFijJbsKRY+c2GOE/FF7+Oc2LtQh+YEd29HDUOeaY2EFGDbAfHdSVOQL0ihtGbL1mRlXFHrMRhyqikGhScZEOQzjinUUn91kB2CIKUNsM7QJRdhKdB/uQJdijiDAyMDS43S8kfbsAm1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028930; c=relaxed/simple;
	bh=6J9ua4kM2AQ1AbmDRprUIZcBpH1X+E/0V7ZxxtKcoOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYBuZT2IPwlE+XWuHgbNqr/ho6ZRhAXLJQlJx8jTL/Q2CVzHqwFD/rtnRH+8admZ4yQ/O0h6aG0P1DBEx5zawYXmLAHx2eZIjn2wafQ/OCCdDGkYFr4bBWmgpg1ZquRIGx3X2YuKUQjEQCvA4hLJy0o7hm5CyRSk4ca52i8Kayk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz/KO4az; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz/KO4az"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6d28aa26cso6631015ad.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028929; x=1792633729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yU/tI1b3Chy6tvjhfXj60ZgAk9bekyFoLKnVljFmz1M=;
        b=Oz/KO4azwkMDM2jNYGf/puHJRKNxYgmsxYxU1QO2pOpz9q0GLi2IcyOPnl3DJxp2Ri
         GIx4jHXhU/1Yw5DOZr79Uw23kttKizck9ak8zzsCDNMHHmXHiVqezgn/1dT33z3oSFL6
         kJxzBBYwkTfAerbHXqETA1+FU+nm3CV7IxJREqrtKUtp9IK01C7GYq+iYRDZ8t6INNEf
         eXnWjT3elmXZmgTU/bxfN3zsyMPppnAlKwYN6MHOi60/UI0565QEyLYCsNA7GcO+eWHT
         j2qsWWGXWqe3ILOcGhTzrtEe2Divq4LvyvKuUHkE6pJHs1iQGOOcgoKTg0KNsuuq/T/h
         aivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028929; x=1792633729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yU/tI1b3Chy6tvjhfXj60ZgAk9bekyFoLKnVljFmz1M=;
        b=MuvXcIVeDjIujkx+AzoHlmaYD6yp1JJdx/Zv26kGvwgv4LZ+ZRD/+VaRIC1Ik8pQJK
         Y2rc7VxKBwKd4sGx/PG7kRrG8sGCH6vFJS6/fkzZrl38eel/7srRXglCmA+esd4Vn7IF
         kc4CGTsocf36mG59rp/JVIx6vypGeUXqAckX4+O3+AN/GMgMOFZ5EBb4yHVGa7ZNDOVg
         UKCfOUJ3ly9T+zCvmU2rOZ1tmwggIpdx8T00zid8dxRoh8bnDOuWiMqWPee+vGNlZosD
         nFFJav49l6i+VcGLdhxlAThfRtAN+oWegWgtSKjRY0SZXpRt0W4e1HjRUaR5BL/IuPt5
         MEFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRxwgF86eNWyCeHJM3xccIKxRDp4R5RgMlMEhQtg5uEISwhO0BpK2HusrHk7cUUfOB4eJHJI6Sv+0dyg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4w3IgKUfFLn3/jkOETNlPd6rFIJrADo1AMsUYgo0bOckpXnXh
	zauwDpE1sztURSRSWkjSkdwdYwv6IEojgXZlyYk38p5xwK3bfWmauv+z
X-Gm-Gg: AYBFou3p61IzNRMi2uFv6XvTMJhlmQB+5JRk4UpuFpJk0RGO85Zm0zqTtnqNNPlcHNp
	L8Lszl13396VzZQg+RwYdf+8ZP+3gM+Oef9mna+7JRVcKHN9fYwCQFDFHvn0YXphvAsmMSPFbIb
	QGdpqnuuW22uHGBFwanx5cwdEQuQWKy7SY97P2AMCSUpH2gNTJfC96UwIYH6YZNffEgG8cA2d5e
	TljCOhxN8Y0XI6lr40g+ABHG0FxYpiM3BnDRdWDJtPZM4QfBpR46Wm8uxfbQAYAWpdVcCpxJtJO
	zMDhLWlHIfndBtFNlUbGzL7TR28Gsq0IXWFOgohvtyWFDlWwJNEFQLqannh5N1ow+KhoKbhBHXI
	hZX39bkrEUY7352rvNa/l4yG97gym69EKP1XT/xdfbwxwg1J34obM3GGf7dXuDunqHGb8mzw3bE
	Snj1uqFy+Xgj9tsCVqoSAB1zrzQb0DPA+lFyz676bXXXgbWMWFS+Uxnfv0BrOTj7NEAgGQheU5V
	6lFcJckXdxj0sDG3wpjCSHVaofW84nqZsRjsevqYyi27UI8jMy0YgmG/O9TCYhRQlJd+0nx7zYT
	NhbIYt6Wf22tqg==
X-Received: by 2002:a17:902:f786:b0:2e9:3215:c458 with SMTP id d9443c01a7336-2e93215c642mr37739115ad.25.1792028928882;
        Wed, 14 Oct 2026 18:48:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:48:47 -0700 (PDT)
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
Subject: [PATCH v2 17/25] ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:16 +0700
Message-ID: <20261015014324.5569-18-phucduc.bui@gmail.com>
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
from wm8782_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as wm8782_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8782.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index 3a2acdfa9b85..cbf0c823c022 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -39,9 +39,19 @@ static int wm8782_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai
 	struct snd_pcm_runtime *runtime = sub->runtime;
 	struct wm8782_priv *priv =
 		snd_soc_component_get_drvdata(dai->component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
 					   8000, priv->max_rate);
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
 
 static const struct snd_soc_dapm_widget wm8782_dapm_widgets[] = {
-- 
2.43.0

