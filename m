Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E57327E045
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 06:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763705174; cv=none; b=ASRA63GRggp26sBHEp/SRlSnYQ/2f9qyM8cv1cKY3EBq/l73fB+4Vm2Fr0spCVDRLpzsStKMuOW0Vp1M2cLuLHu2jZ/Jca0bzEESZhLyuB/3EIdvD7zUTeu22fEPEVF9LXcEt0UtoXVPSllCivS6sgpibeB/GEYtpKBo4ZPHgWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763705174; c=relaxed/simple;
	bh=GcROR96JF5hCwBimwpg3lqL3nafgW194peOGSoR1pUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YCbftyxAbNFMKLYZ94/7UtiRVQ78KJU7fuMJPfZ8q6zqYiW3Wr2W8SzaJGpkQQXBO4tCgOxnXXZQHmKBk8GyDoZRvnNM+bJVDcJvlLF8C5SCkuX7iEUNJZrux4wQEU7x6qSLCMxJBwr7LG0FF28rnOWgIGCBgJNger46QzbxgHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=HASdJYUk; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="HASdJYUk"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ee2014c228so13327191cf.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 22:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763705170; x=1764309970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=La5vJNM1jWM5YiAHSf9v+V5WGA4ndFbbe8gW9RIdiFU=;
        b=HASdJYUkgCBJXUhfrnr5RVJ+DI+K7lQxO4c6FhtW0J+dJUD7pr4vvtslEvKOu8+VLU
         XHX9LLS7XAthXRnYTw+unVASUbHamogMwiQG5axrizfj+u/DOZBtSU+qloUCVzuXGtbD
         xOUcV2YEAls0Jh0GX+ArnUCUN0hf9/5xeip2s3J+YIDrdtt4eRPuKaD6O6IINLMFelEt
         Q43vQHMpbxeDnbcxvvVD/hO3nHFYC7NbmQpxnnaR5fBQcJTLnaiXGgC105dsiAhi+Lpv
         JUq/K4p5Yrz2XMQfQF12yXvinXM/Cc62xZICiQV0/BRdRTK82GikzZkbuQC6qejJ4UkF
         RspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763705170; x=1764309970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=La5vJNM1jWM5YiAHSf9v+V5WGA4ndFbbe8gW9RIdiFU=;
        b=jX03cu0oI0xl5wV37R88BJqIH8P9CjkmGpr03t4PoNIgOXfrs1VoWHwScHIkma01bO
         ZVNn4AY1JqW3g3u2SveNhYTQjUNRwaKABq6paPzvuJcFH5YKiol2nKlPAILllLjIjIra
         9SCx3Cz/1asWQa1Uf9d61mR1VwF7qWnd/KBisN8APMf7slLZQMu0GxNwRGLVsLlqlrWn
         60sOLsyI6SGFsjRWJPTFKc7VD/nPfy98Z8V65AuMnxXkNMyvLgOgmROiSeWE+iB9ZJSP
         u5mRzEqrgxkq2fAbvEYfYlrZuqQ9aLOnwRmorIBClSAGd0cyYYLDey9511+9k9ljV9um
         9yoA==
X-Forwarded-Encrypted: i=1; AJvYcCV+pUP2xqpKvBHRt3KMz3UJlACZ2+0ANooxnoqSpAVz21Cd7NFaH1xSYguXHEoi72ypl5IQdaFoPZbQtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpjqGavxQPcmRavAapVQ0rAPIEkpQll0G+H9GOoMqVQ+c/1dgq
	LBq7g5ncPbQ3XALi+kiv3ghcv1dnFGrFrrTlK2X75UmcPICRSJuecnXjZBpq+OblnfM=
X-Gm-Gg: ASbGnct6GRd3AbGL+lPiCLionm7/E7n6bPdCKLFnu1WekQ/DFhYtiOKnA3jZPynL8rc
	rY+d+B4p8EWf49iOcynPi4cDoXKMWV+/PoB1RnMvVrVuD+BuOrgHIJlVPqdPlgRLEUcdMQVywbc
	xuYjrJHhExFFcrk/jP7g2sujDHal91nDNyqYFkaG63QF/U6+gyiGX6WYUlqfXwpXje3ndvEdc9h
	KqzkySQr3E4vR7MLPkjOe4zOo9e51R9eYQIFsegrhmAk76mFXuSwv63BQ5cgb6UeY/2TB7Pbdcc
	oYWebCBCnYFsgWnTeKvs9yqOXTn9CYIgMpWwETwqgtNQ0JP9ZzimvykaJ3tIYIdl70C+PxjVf+3
	DfJCP3h59cVYL4ldVKTJId+luYvHz1HzvpPIGC5VMk/DJizzRInMdOkAIcUD5nNBHWRE8TyL2O4
	y88DNWpdJEwFZ5e9EtdASZHeSYbxQC55xUABQ37gMj6FJE7QKKcGH7QxKIterr/BEuRIu1AM6QI
	7LC
X-Google-Smtp-Source: AGHT+IFQdwMnwbIyaAZ09s2AcuDIc3ln2beikKLvPXoaLdoe4d+jYtLW2a8X7J1WM977sGr1YJ8SNA==
X-Received: by 2002:ac8:5846:0:b0:4ed:213c:1582 with SMTP id d75a77b69052e-4ee588194e0mr19087991cf.7.1763705169906;
        Thu, 20 Nov 2025 22:06:09 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48d6aab4sm30245831cf.15.2025.11.20.22.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 22:06:08 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] ASoC: codecs: lpass-wsa-macro: add RX4/RX5/RX6/RX7/RX8
Date: Fri, 21 Nov 2025 01:03:30 -0500
Message-ID: <20251121060437.26704-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows playback using the WSA_2CH AIF, which feeds RX4 and RX5 on both
WSA and WSA2.

RX6/RX7/RX8 can be tested with the regular WSA AIF (the 3rd intf is RX8,
the 5th intf is RX6/7).

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
v2: added RX6/RX7/RX8
this depends on the other patches from the original series

 sound/soc/codecs/lpass-wsa-macro.c | 96 +++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index e2e78ff6dd54e..5d440a839e733 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -300,6 +300,11 @@ enum {
 	WSA_MACRO_RX_MIX,
 	WSA_MACRO_RX_MIX0 = WSA_MACRO_RX_MIX,
 	WSA_MACRO_RX_MIX1,
+	WSA_MACRO_RX4,
+	WSA_MACRO_RX5,
+	WSA_MACRO_RX6,
+	WSA_MACRO_RX7,
+	WSA_MACRO_RX8,
 	WSA_MACRO_RX_MAX,
 };
 
@@ -2228,6 +2233,16 @@ static const struct snd_kcontrol_new rx_mux[WSA_MACRO_RX_MAX] = {
 			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
 	SOC_DAPM_ENUM_EXT("WSA RX_MIX1 Mux", rx_mux_enum,
 			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX4 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX5 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX6 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX7 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX8 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
 };
 
 static int wsa_macro_vi_feed_mixer_get(struct snd_kcontrol *kcontrol,
@@ -2410,6 +2425,16 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
 	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_5),
+	SND_SOC_DAPM_MIXER("WSA RX4", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX5", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX6", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX7", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX8", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MUX("WSA RX4 MUX", SND_SOC_NOPM, WSA_MACRO_RX4, 0, &rx_mux[WSA_MACRO_RX4]),
+	SND_SOC_DAPM_MUX("WSA RX5 MUX", SND_SOC_NOPM, WSA_MACRO_RX5, 0, &rx_mux[WSA_MACRO_RX5]),
+	SND_SOC_DAPM_MUX("WSA RX6 MUX", SND_SOC_NOPM, WSA_MACRO_RX6, 0, &rx_mux[WSA_MACRO_RX6]),
+	SND_SOC_DAPM_MUX("WSA RX7 MUX", SND_SOC_NOPM, WSA_MACRO_RX7, 0, &rx_mux[WSA_MACRO_RX7]),
+	SND_SOC_DAPM_MUX("WSA RX8 MUX", SND_SOC_NOPM, WSA_MACRO_RX8, 0, &rx_mux[WSA_MACRO_RX8]),
 };
 
 static const struct snd_soc_dapm_route wsa_audio_map[] = {
@@ -2529,6 +2554,64 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 	{"WSA_SPK2 OUT", NULL, "WSA_MCLK"},
 };
 
+static const struct snd_soc_dapm_route wsa_audio_map_v2_5[] = {
+	{"WSA RX4 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX5 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX6 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX7 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX8 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX4 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX5 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX6 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX7 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX8 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX4", NULL, "WSA RX4 MUX"},
+	{"WSA RX5", NULL, "WSA RX5 MUX"},
+	{"WSA RX6", NULL, "WSA RX6 MUX"},
+	{"WSA RX7", NULL, "WSA RX7 MUX"},
+	{"WSA RX8", NULL, "WSA RX8 MUX"},
+	{"WSA_RX0 INP0", "RX4", "WSA RX4"},
+	{"WSA_RX0 INP0", "RX5", "WSA RX5"},
+	{"WSA_RX0 INP0", "RX6", "WSA RX6"},
+	{"WSA_RX0 INP0", "RX7", "WSA RX7"},
+	{"WSA_RX0 INP0", "RX8", "WSA RX8"},
+	{"WSA_RX0 INP1", "RX4", "WSA RX4"},
+	{"WSA_RX0 INP1", "RX5", "WSA RX5"},
+	{"WSA_RX0 INP1", "RX6", "WSA RX6"},
+	{"WSA_RX0 INP1", "RX7", "WSA RX7"},
+	{"WSA_RX0 INP1", "RX8", "WSA RX8"},
+	{"WSA_RX0 INP2", "RX4", "WSA RX4"},
+	{"WSA_RX0 INP2", "RX5", "WSA RX5"},
+	{"WSA_RX0 INP2", "RX6", "WSA RX6"},
+	{"WSA_RX0 INP2", "RX7", "WSA RX7"},
+	{"WSA_RX0 INP2", "RX8", "WSA RX8"},
+	{"WSA_RX0 MIX INP", "RX4", "WSA RX4"},
+	{"WSA_RX0 MIX INP", "RX5", "WSA RX5"},
+	{"WSA_RX0 MIX INP", "RX6", "WSA RX6"},
+	{"WSA_RX0 MIX INP", "RX7", "WSA RX7"},
+	{"WSA_RX0 MIX INP", "RX8", "WSA RX8"},
+	{"WSA_RX1 INP0", "RX4", "WSA RX4"},
+	{"WSA_RX1 INP0", "RX5", "WSA RX5"},
+	{"WSA_RX1 INP0", "RX6", "WSA RX6"},
+	{"WSA_RX1 INP0", "RX7", "WSA RX7"},
+	{"WSA_RX1 INP0", "RX8", "WSA RX8"},
+	{"WSA_RX1 INP1", "RX4", "WSA RX4"},
+	{"WSA_RX1 INP1", "RX5", "WSA RX5"},
+	{"WSA_RX1 INP1", "RX6", "WSA RX6"},
+	{"WSA_RX1 INP1", "RX7", "WSA RX7"},
+	{"WSA_RX1 INP1", "RX8", "WSA RX8"},
+	{"WSA_RX1 INP2", "RX4", "WSA RX4"},
+	{"WSA_RX1 INP2", "RX5", "WSA RX5"},
+	{"WSA_RX1 INP2", "RX6", "WSA RX6"},
+	{"WSA_RX1 INP2", "RX7", "WSA RX7"},
+	{"WSA_RX1 INP2", "RX8", "WSA RX8"},
+	{"WSA_RX1 MIX INP", "RX4", "WSA RX4"},
+	{"WSA_RX1 MIX INP", "RX5", "WSA RX5"},
+	{"WSA_RX1 MIX INP", "RX6", "WSA RX6"},
+	{"WSA_RX1 MIX INP", "RX7", "WSA RX7"},
+	{"WSA_RX1 MIX INP", "RX8", "WSA RX8"},
+};
+
 static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 {
 	struct regmap *regmap = wsa->regmap;
@@ -2562,7 +2645,9 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(comp);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(comp);
 	const struct snd_soc_dapm_widget *widgets;
-	unsigned int num_widgets;
+	const struct snd_soc_dapm_route *routes;
+	unsigned int num_widgets, num_routes;
+	int ret;
 
 	snd_soc_component_init_regmap(comp, wsa->regmap);
 
@@ -2587,6 +2672,7 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	case LPASS_CODEC_VERSION_2_1:
 		widgets = wsa_macro_dapm_widgets_v2_1;
 		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_1);
+		num_routes = 0;
 		break;
 	case LPASS_CODEC_VERSION_2_5:
 	case LPASS_CODEC_VERSION_2_6:
@@ -2595,12 +2681,18 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	case LPASS_CODEC_VERSION_2_9:
 		widgets = wsa_macro_dapm_widgets_v2_5;
 		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_5);
+		routes = wsa_audio_map_v2_5;
+		num_routes = ARRAY_SIZE(wsa_audio_map_v2_5);
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	return snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
+	ret = snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
+	if (ret)
+		return ret;
+
+	return snd_soc_dapm_add_routes(dapm, routes, num_routes);
 }
 
 static int swclk_gate_enable(struct clk_hw *hw)
-- 
2.51.0

