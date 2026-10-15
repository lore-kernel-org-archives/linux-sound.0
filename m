Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A366353A6F
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028904; cv=none; b=VLwTFMVY0dEt/E9mMGuGpZwi2+wjCqRNO+32GHTRbmhs1yYLKJCW2aT6DiuIKIOJC1CY9X8zMbljcbKxKUD+DP7kLEscXcS6FLmXWe+mmH+8IR64t7Qa9gDhuMKpupeUEJTkzXp53ToDAnE5AbrMdShthBGrrJJgRs2ycSl+Fhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028904; c=relaxed/simple;
	bh=tEX34tHuv9Enx3BSXJsLezOkH8S4dBDt6DQw1nfmw4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5lXgVGUCeDbaN34OAtTEHyzKMPlI7YxOcYEq8TrJzcO45CxR3mN5w5qkv/oTPiDtfhf26Q9d5voo08NpottsRS00rZjZ0m4YcKfZPd5R660HThppnH4+rzlInD4cSqI4zZW36vpmFI9Q+6f++xJhsVuqwAygmYzdhtYei7y540=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioOYtQmQ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioOYtQmQ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e7e742a2c7so32173885ad.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028902; x=1792633702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6Pl3gMBQYmN9D7oerWQplIq1HLxsu+OxdUd7erjjPU=;
        b=ioOYtQmQeVzQ8zTl1npW9bDX8gNPRMsX2DMcGb0mpWmuDsAWVa5lbC6SbfirHg1Gai
         Ha7hRMRdXGFrt+my4sfzb/j/Tn5EOldlcPsVWo5f3c7jU0PvncIa5yu4jRsE4uYYPXsR
         tTAeRq4m5vvkwYXBsyPuB+TD7C607RRSjOdDgAIkw+8kJNViw7Iun4T5xgdnmJ6yDKbx
         7ypowfUSXWVfH7vY+ggivvTm7UMPuK8siMCfB74AkGcVz3mBd3l6gi+EqB6Dd/KvYoYT
         gwgQ8uOV08JmCTsULu4X8yhOwDXN3PQRSq+wKD4qjWDJ7FZi453PwGn8PqeLhdyYybXV
         qSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028902; x=1792633702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6Pl3gMBQYmN9D7oerWQplIq1HLxsu+OxdUd7erjjPU=;
        b=RNb1c2ZocQSHQrO0BRIu8LMu/MacMo+xsc843BsnzDWNTzI8RWFuCp3NAeasyR2HV0
         Eqabaz9mA3nHi/qNYFlr3IgDm1nXV/dbOgVRUj42dcov5NIqv3NW9RmJ45t1jkY8DsGK
         wi2thAjNknlJeWAeu2Fv6xev/EElu6osdM6dfhrXdbtDdkCZyzuCpzBCswZLOOLu3JaZ
         Tv/kmYRUQNPLNaGfpnRZZDF3sNtDGTc3Fd6wLmKZqw4uLHfx+OU3EeLPb3caLsdJzxcJ
         3k0AOju3TTTUVXz+7oCURSdUm/4X+NeGjdxwmpHOKRZZdFiPenqW/L78jd9G8yHqKyrE
         8UkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwofZ2gN7pj3EA+NBqrRpukIuHcXVYzctZLB2B4u3Hv+YHT1x1ne4bhyjXJ6uoMqpjS4UC4yDSXonWESQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI4+YSMWev93A42mwV1ebZ4WNgZZ13BxgWQMwG3A/TQ7RaZsO8M
	q/2DBYMAe5kFs9IsTrxh7whzzTGkjrK7O7al1P2SN6cJ7TebYH8Wsslo
X-Gm-Gg: AYBFou1K6LViJ10g727OdXPGiddmTbZI36zGz1rJvrgLqYPoPufgBPTfc3iItDopUUA
	obiHscl/cHJnCuFjseB9GESYgyaN+zL2WsafoMi4nuvOtIQgF8TKYqm+6MXLI5zJhHH2Wx9UrTJ
	aCOqLLChy+Zv7tBIJ9sDtmfgyP41JN4IHdUtKjn1Nm+8q6ah26YxG3aed+Nyfz7fxk7AkwcB4iu
	I15u+v8OMzm8IxAW1EDv9DsurNU/NmPdas7Ckg2I6gHm+cVsmbBXNNUa4P26I4XKsOZK5wUO5Le
	umbgOVoRte16ARwnOOEYYX/7ry9zfw0FqWNPQny5jlt8498pbnmCntzXXmN7meqbojxqRoauIOM
	ZjlP9YepkJ83QnOPtHKQonuQVLNNR6kiCJZDJv5b5j1RvoxgjmMGOomDOf+FGVbWEKRoo5dIUWH
	ed2s9yYiv/O2EHJw0Ub+uKJGgH8JrslXbfrIBC1mnGniUh7uXFtrAad06MkvaZg/YAwVkQi9IGs
	6DQxKD+m81tHU8N/5qJ3cn9U2bDoXhZyNV6gkqEMZO7CtEBJA7Xr29K0VVht2edLTwdtb+a7geh
	lri09iTx+iG8eJ4=
X-Received: by 2002:a17:903:1b06:b0:2e9:5d1f:dfee with SMTP id d9443c01a7336-2e95d201631mr3403435ad.25.1792028902474;
        Wed, 14 Oct 2026 18:48:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:48:20 -0700 (PDT)
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
Subject: [PATCH v2 16/25] ASoC: codecs: wm8580: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:15 +0700
Message-ID: <20261015014324.5569-17-phucduc.bui@gmail.com>
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
from wm8580_playback_startup(). ASoC only marks the DAI as started
when .startup() returns 0.

This currently has no functional impact, as wm8580_dai_ops_playback
has no .shutdown() callback. Still, return 0 explicitly on success
to match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8580.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 9bc5d1e795dc..cee80da8f753 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -852,9 +852,20 @@ static int wm8580_playback_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8580_priv *wm8580 = snd_soc_component_get_drvdata(component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-		SNDRV_PCM_HW_PARAM_CHANNELS, 1, wm8580->drvdata->num_dacs * 2);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS, 1,
+					   wm8580->drvdata->num_dacs * 2);
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
 
 #define WM8580_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
-- 
2.43.0

