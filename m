Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110BA33BBA0
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110423; cv=none; b=kAPs615ZBsUrwJFfiWs4Co+qCHUymXEeieyM1bgtasnBrs9Sc4IvZZGHo6pDRH5czxAUXALsZzXQr02k8pYpDaSptmuennaOhPaNdvpNdpYfswzl9j/RDvNX9e/r7vXiL1/jui7Zp/f2O2DMFFUw7B1bJ6YKa+Ff97u4xs8DG/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110423; c=relaxed/simple;
	bh=bEsaWlScrbBCQR2vyd03Rj2hwZQssUjgVIlz9cJj7hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNFQxFwNXbjSrm2bQjV5kM2tcuFCQdo0hwvsm1V5hRSVfd7LcfJ4clbIZAlvrsTmzertkcnegfC6Ykw30V0wk+pdYAGxrwO7bH75y9fjEd/IlqbCC4W/LsPvPXKIsTKmWyNV/91hhtsJaqeqsPI4UeK10Kays5/RCVuaZTapRF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=XjEQLIdx; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="XjEQLIdx"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ee0ce50b95so2851361cf.0
        for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 14:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1764110419; x=1764715219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPcgWe8TETAnwxrZdvwBOeumA+A97sZqGPVfpLETI1Q=;
        b=XjEQLIdxvATRgDqRdCzk2uq81Wsz6dm5r4679d4xEzgTgUunKrUv/NBT/dVohBk1LI
         n0E8Mray4MfdoG/7+pBTkP3eAEHncSDEiCmavRRaN1NOxGBDi74K4Ht8uTQCUQWKpAoV
         Hy/y++m/WhglgOTlA2LSZVf3SskxNMAo7lEsNo6K+xgsF+kpNYcI3I7WYRSNZ+gsdk01
         KHe6t8M/QVc5SrfMphn0YC8oVGttzjIsBI3TATd53wUGZLNmJQ8qhgGDTY3DZh2yBRc9
         HDlylu3gY/I9HS5gKHhaz1jCtnPuf9lCzD+4iWuN1mp33OWosFQCAERJJUhvtlwic/pW
         o7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110419; x=1764715219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nPcgWe8TETAnwxrZdvwBOeumA+A97sZqGPVfpLETI1Q=;
        b=hjKbrvindIiA6Tzv7gBGeudOVa0e4ZjXHbSdFxDXa95wWEAXefcXybY8tANKRjdKlr
         F9I8lwrFsLrB8YISbvVcESEQckk3dXF7/eXLMORNQ13LNp+TTeHXy+z4h35K7Z7achMA
         QdqydfKqV+Kfg+DIc4uShEnmQrRols0uG5+uv0lv9Oy9BYvyy2+AvrjeqgvUxUUbgWFw
         957P7FXWUngbB275Wk2m/XfHpIGtIE8ax54Zlko/qlTBFW1M0zw723/yHhNytoiP2C/i
         xhYxPndxd45y5II1w1Gu7Syumhdugxa/glaiipH01ETjV9H9L51ObvVvC8RFq070SK91
         WNwg==
X-Forwarded-Encrypted: i=1; AJvYcCW0uu5ZNZ23YbKQqFtV9MfrKV1Lgy0UnVbTKKUjG3P6ZrEZxH2+nXCKz/Oh7RF0q0QvOorQg4JN5jY4Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWHnD4L6k+XfkO8cs1z62fPu1G+zjaMBtQYMjAc2h9R545CWK0
	0W7MJHaTIrP01dRHSNuJdf6AVHe/6YvkpgjKc+57S3WAqLbFaGdQLgY/fzXQDfIEl9Q=
X-Gm-Gg: ASbGncsqP3mpM4CbYeHOZJqd8lJyms5zUAUsoimgXxUHLR/g9BS2ZylukmOD866hdhH
	RHfcBOlGhF2k2cpRh4axRMxwN7RytPFe2LLxdcyUrlBidnDSQm3hoGi+XWi8Y8YS9j6MsXT+c5L
	e0eGz7lHBzaElKEYFg0HQayFQ+i8S/Z6cKeDskcz0IJndyzKDFlDG0CPJ507jeWZqi4DOzU+Wp4
	9+n8H6tT49xEQCccLmw8ANI4el3+ym6fj5TrovZ7EAMxwOKcT5zw6oSqml6x3Yf05QyhfkV2fGC
	rcS6CsaFpJo2VUB3SRXlLxUAd4aMC02MwcvYddzv7pV9SV1QjepcUrKKTD8Gsd/bfmuM6RLKkfm
	fEPLomiG7H/m5aTBVKpG9/JvvLeqw1P3sT3rqyw2NPjx9OLQWoCY62tnhzQP+LChe2MbIXQtUaF
	OD/5JYtMhcm9W+jB7AaOMb4vRDAJYL0/iKOg7sz29lYbraZcbCJDLQVvhHqpfj7O/9sg==
X-Google-Smtp-Source: AGHT+IHC/Uz2/yBtgtB64dKBbpa47mfZMsLZuKdSSSFBVyZkdaLsIIx+227RaXs5AONN5noE3fnFqQ==
X-Received: by 2002:ac8:4a04:0:b0:4ef:bed6:5347 with SMTP id d75a77b69052e-4efbed65610mr44606051cf.30.1764110418700;
        Tue, 25 Nov 2025 14:40:18 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e54e9e2sm132836336d6.31.2025.11.25.14.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:40:18 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/2] ASoC: codecs: lpass-wsa-macro: use ports as the DAIs for playback
Date: Tue, 25 Nov 2025 17:35:33 -0500
Message-ID: <20251125223848.1798-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125223848.1798-1-jonathan@marek.ca>
References: <20251125223848.1798-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AIF1_PB and AIF_MIX1_PB don't correspond to any part of the HW, they are
"virtual" inputs that are configured with mixer settings. This
configuration shouldn't be part of this driver, and AFAIK its not used in
any useful way upstream so it can just be removed.

The inputs to the WSA codec are the ports (RX0 to RX8), so remove AIF1_PB
and AIF_MIX1_PB and expose the ports as the DAIs.

Note the DAIs correspond to an INTF of the DMA engine. For example, RX0/RX1
come from the same INTF so they are part of the same DAI. (they must have
the same rate).

The common use-case is to use AIF1_PB with RX0/RX1, and AIF_MIX1_PB with
RX_MIX0/RX_MIX1, so this change should not break things for current users
(except 'WSA RX0 MUX', etc. settings will longer exist).

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 521 +++++++++++------------------
 1 file changed, 198 insertions(+), 323 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index e00b901eb3a0c..a4f5215085d5e 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -331,53 +331,15 @@ enum {
 	WSA_MACRO_SOFTCLIP_MAX
 };
 
-enum {
-	INTn_1_INP_SEL_ZERO = 0,
-	INTn_1_INP_SEL_RX0,
-	INTn_1_INP_SEL_RX1,
-	INTn_1_INP_SEL_RX2,
-	INTn_1_INP_SEL_RX3,
-	INTn_1_INP_SEL_DEC0,
-	INTn_1_INP_SEL_DEC1,
-};
-
-enum {
-	INTn_2_INP_SEL_ZERO = 0,
-	INTn_2_INP_SEL_RX0,
-	INTn_2_INP_SEL_RX1,
-	INTn_2_INP_SEL_RX2,
-	INTn_2_INP_SEL_RX3,
-};
-
-struct interp_sample_rate {
-	int sample_rate;
-	int rate_val;
-};
-
-static struct interp_sample_rate int_prim_sample_rate_val[] = {
-	{8000, 0x0},	/* 8K */
-	{16000, 0x1},	/* 16K */
-	{24000, -EINVAL},/* 24K */
-	{32000, 0x3},	/* 32K */
-	{48000, 0x4},	/* 48K */
-	{96000, 0x5},	/* 96K */
-	{192000, 0x6},	/* 192K */
-	{384000, 0x7},	/* 384K */
-	{44100, 0x8}, /* 44.1K */
-};
-
-static struct interp_sample_rate int_mix_sample_rate_val[] = {
-	{48000, 0x4},	/* 48K */
-	{96000, 0x5},	/* 96K */
-	{192000, 0x6},	/* 192K */
-};
-
 /* Matches also rx_mux_text */
 enum {
-	WSA_MACRO_AIF1_PB,
-	WSA_MACRO_AIF_MIX1_PB,
+	WSA_MACRO_AIF_RX01,
+	WSA_MACRO_AIF_RX_MIX01,
 	WSA_MACRO_AIF_VI,
 	WSA_MACRO_AIF_ECHO,
+	WSA_MACRO_AIF_RX45,
+	WSA_MACRO_AIF_RX67,
+	WSA_MACRO_AIF_RX8,
 	WSA_MACRO_MAX_DAIS,
 };
 
@@ -411,7 +373,6 @@ struct wsa_macro {
 	const struct wsa_reg_layout *reg_layout;
 	unsigned long active_ch_mask[WSA_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[WSA_MACRO_MAX_DAIS];
-	int rx_port_value[WSA_MACRO_RX_MAX];
 	int ear_spkr_gain;
 	int spkr_gain_offset;
 	int spkr_mode;
@@ -470,11 +431,6 @@ static const char *const rx_mix_ec_text[] = {
 	"ZERO", "RX_MIX_TX0", "RX_MIX_TX1"
 };
 
-/* Order must match WSA_MACRO_MAX_DAIS enum (offset by 1) */
-static const char *const rx_mux_text[] = {
-	"ZERO", "AIF1_PB", "AIF_MIX1_PB"
-};
-
 static const char *const rx_sidetone_mix_text[] = {
 	"ZERO", "SRC0"
 };
@@ -1158,120 +1114,144 @@ int wsa_macro_set_spkr_mode(struct snd_soc_component *component, int mode)
 }
 EXPORT_SYMBOL(wsa_macro_set_spkr_mode);
 
-static int wsa_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
-						u8 int_prim_fs_rate_reg_val,
-						u32 sample_rate)
+/* indexed by 'WSA_RX0 INP0 Mux' (etc.) value */
+static const u8 inp_to_dai[] = {
+	0xff,
+	WSA_MACRO_AIF_RX01,
+	WSA_MACRO_AIF_RX01,
+	WSA_MACRO_AIF_RX_MIX01,
+	WSA_MACRO_AIF_RX_MIX01,
+	WSA_MACRO_AIF_RX45,
+	WSA_MACRO_AIF_RX45,
+	WSA_MACRO_AIF_RX67,
+	WSA_MACRO_AIF_RX67,
+	WSA_MACRO_AIF_RX8
+};
+
+static int wsa_macro_set_interpolator_rate(struct snd_soc_dai *dai, u32 sample_rate)
 {
-	u8 int_1_mix1_inp;
-	u32 j, port;
+	struct interp_sample_rate {
+		int sample_rate;
+		int rate_val;
+	};
+	static const struct interp_sample_rate int_prim_sample_rate_val[] = {
+		{8000, 0x0},
+		{16000, 0x1},
+		{32000, 0x3},
+		{48000, 0x4},
+		{96000, 0x5},
+		{192000, 0x6},
+		{384000, 0x7},
+	};
+	static const struct interp_sample_rate int_mix_sample_rate_val[] = {
+		{48000, 0x4},
+		{96000, 0x5},
+		{192000, 0x6},
+		{384000, 0x7},
+	};
+
+	u32 i, inp_max;
 	u16 int_mux_cfg0, int_mux_cfg1;
 	u16 int_fs_reg;
-	u8 inp0_sel, inp1_sel, inp2_sel;
+	u8 inp0_sel, inp1_sel, inp2_sel, mix_inp_sel;
+	int int_prim_fs_rate_reg_val = -1, int_mix_fs_rate_reg_val = -1;
 	struct snd_soc_component *component = dai->component;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
-	for_each_set_bit(port, &wsa->active_ch_mask[dai->id], WSA_MACRO_RX_MAX) {
-		int_1_mix1_inp = port;
-		int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0;
-
-		/*
-		 * Loop through all interpolator MUX inputs and find out
-		 * to which interpolator input, the cdc_dma rx port
-		 * is connected
-		 */
-		for (j = 0; j < NUM_INTERPOLATORS; j++) {
-			int_mux_cfg1 = int_mux_cfg0 + WSA_MACRO_MUX_CFG1_OFFSET;
-			inp0_sel = snd_soc_component_read_field(component, int_mux_cfg0, 
-								wsa->reg_layout->rx_intx_1_mix_inp0_sel_mask);
-			inp1_sel = snd_soc_component_read_field(component, int_mux_cfg0,
-								wsa->reg_layout->rx_intx_1_mix_inp1_sel_mask);
-			inp2_sel = snd_soc_component_read_field(component, int_mux_cfg1,
-								wsa->reg_layout->rx_intx_1_mix_inp2_sel_mask);
-
-			if ((inp0_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
-			    (inp1_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
-			    (inp2_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0)) {
-				int_fs_reg = CDC_WSA_RX0_RX_PATH_CTL +
-					     WSA_MACRO_RX_PATH_OFFSET * j;
-				/* sample_rate is in Hz */
-				snd_soc_component_update_bits(component, int_fs_reg,
-							      WSA_MACRO_FS_RATE_MASK,
-							      int_prim_fs_rate_reg_val);
-			}
-			int_mux_cfg0 += WSA_MACRO_MUX_CFG_OFFSET;
+	for (i = 0; i < ARRAY_SIZE(int_prim_sample_rate_val); i++) {
+		if (sample_rate == int_prim_sample_rate_val[i].sample_rate) {
+			int_prim_fs_rate_reg_val = int_prim_sample_rate_val[i].rate_val;
+			break;
+		}
+	}
+	for (i = 0; i < ARRAY_SIZE(int_mix_sample_rate_val); i++) {
+		if (sample_rate == int_mix_sample_rate_val[i].sample_rate) {
+			int_mix_fs_rate_reg_val = int_mix_sample_rate_val[i].rate_val;
+			break;
 		}
 	}
 
-	return 0;
-}
-
-static int wsa_macro_set_mix_interpolator_rate(struct snd_soc_dai *dai,
-					       u8 int_mix_fs_rate_reg_val,
-					       u32 sample_rate)
-{
-	u8 int_2_inp;
-	u32 j, port;
-	u16 int_mux_cfg1, int_fs_reg;
-	u8 int_mux_cfg1_val;
-	struct snd_soc_component *component = dai->component;
-	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
-
-	for_each_set_bit(port, &wsa->active_ch_mask[dai->id], WSA_MACRO_RX_MAX) {
-		int_2_inp = port;
-
-		int_mux_cfg1 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG1;
-		for (j = 0; j < NUM_INTERPOLATORS; j++) {
-			int_mux_cfg1_val = snd_soc_component_read_field(component, int_mux_cfg1,
-									wsa->reg_layout->rx_intx_2_sel_mask);
+	inp_max = ARRAY_SIZE(inp_to_dai);
+	if (wsa->codec_version < LPASS_CODEC_VERSION_2_5)
+		inp_max = 5; /* no RX4-RX8 */
+
+	for (i = 0; i < NUM_INTERPOLATORS; i++) {
+		int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0 + WSA_MACRO_MUX_CFG_OFFSET * i;
+		int_mux_cfg1 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG1 + WSA_MACRO_MUX_CFG_OFFSET * i;
+		inp0_sel = snd_soc_component_read_field(component, int_mux_cfg0,
+							wsa->reg_layout->rx_intx_1_mix_inp0_sel_mask);
+		inp1_sel = snd_soc_component_read_field(component, int_mux_cfg0,
+							wsa->reg_layout->rx_intx_1_mix_inp1_sel_mask);
+		inp2_sel = snd_soc_component_read_field(component, int_mux_cfg1,
+							wsa->reg_layout->rx_intx_1_mix_inp2_sel_mask);
+		mix_inp_sel = snd_soc_component_read_field(component, int_mux_cfg1,
+							   wsa->reg_layout->rx_intx_2_sel_mask);
+		/* map to corresponding dai->id */
+		inp0_sel = inp0_sel < inp_max ? inp_to_dai[inp0_sel] : 0xff;
+		inp1_sel = inp1_sel < inp_max ? inp_to_dai[inp1_sel] : 0xff;
+		inp2_sel = inp2_sel < inp_max ? inp_to_dai[inp2_sel] : 0xff;
+		mix_inp_sel = mix_inp_sel < inp_max ? inp_to_dai[mix_inp_sel] : 0xff;
+
+		int_fs_reg = CDC_WSA_RX0_RX_PATH_CTL + WSA_MACRO_RX_PATH_OFFSET * i;
+		/* FIXME: fail if another input is active at a different frequency
+		 * (main path has 3 inputs, sharing the same FS_RATE setting)
+		 */
+		if (inp0_sel == dai->id || inp1_sel == dai->id || inp2_sel == dai->id) {
 
-			if (int_mux_cfg1_val == int_2_inp + INTn_2_INP_SEL_RX0) {
-				int_fs_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL +
-					WSA_MACRO_RX_PATH_OFFSET * j;
+			if (int_prim_fs_rate_reg_val == -1)
+				return -EINVAL; /* note: not possible for this to happen */
+			snd_soc_component_update_bits(component, int_fs_reg,
+						      WSA_MACRO_FS_RATE_MASK,
+						      int_prim_fs_rate_reg_val);
+		}
 
-				snd_soc_component_update_bits(component,
-						      int_fs_reg,
+		int_fs_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL + WSA_MACRO_RX_PATH_OFFSET * i;
+		if (mix_inp_sel == dai->id) {
+			if (int_mix_fs_rate_reg_val == -1)
+				return -EINVAL;
+			snd_soc_component_update_bits(component, int_fs_reg,
 						      WSA_MACRO_FS_RATE_MASK,
 						      int_mix_fs_rate_reg_val);
-			}
-			int_mux_cfg1 += WSA_MACRO_MUX_CFG_OFFSET;
 		}
 	}
+
 	return 0;
 }
 
-static int wsa_macro_set_interpolator_rate(struct snd_soc_dai *dai,
-					   u32 sample_rate)
+static int wsa_macro_get_active_channels(const struct snd_soc_dai *dai)
 {
-	int rate_val = 0;
-	int i, ret;
-
-	/* set mixing path rate */
-	for (i = 0; i < ARRAY_SIZE(int_mix_sample_rate_val); i++) {
-		if (sample_rate == int_mix_sample_rate_val[i].sample_rate) {
-			rate_val = int_mix_sample_rate_val[i].rate_val;
-			break;
-		}
-	}
-	if ((i == ARRAY_SIZE(int_mix_sample_rate_val)) || (rate_val < 0))
-		goto prim_rate;
-
-	ret = wsa_macro_set_mix_interpolator_rate(dai, (u8) rate_val, sample_rate);
-	if (ret < 0)
-		return ret;
-prim_rate:
-	/* set primary path sample rate */
-	for (i = 0; i < ARRAY_SIZE(int_prim_sample_rate_val); i++) {
-		if (sample_rate == int_prim_sample_rate_val[i].sample_rate) {
-			rate_val = int_prim_sample_rate_val[i].rate_val;
-			break;
-		}
+	struct snd_soc_component *component = dai->component;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	u32 i, inp_max;
+	u16 int_mux_cfg0, int_mux_cfg1;
+	u8 inp0_sel, inp1_sel, inp2_sel, mix_inp_sel;
+	u8 inp0_dai, inp1_dai, inp2_dai, mix_inp_dai;
+	int active_ch_mask = 0;
+
+	for (i = 0; i < NUM_INTERPOLATORS; i++) {
+		int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0 + WSA_MACRO_MUX_CFG_OFFSET * i;
+		int_mux_cfg1 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG1 + WSA_MACRO_MUX_CFG_OFFSET * i;
+		inp0_sel = snd_soc_component_read_field(component, int_mux_cfg0,
+							wsa->reg_layout->rx_intx_1_mix_inp0_sel_mask);
+		inp1_sel = snd_soc_component_read_field(component, int_mux_cfg0,
+							wsa->reg_layout->rx_intx_1_mix_inp1_sel_mask);
+		inp2_sel = snd_soc_component_read_field(component, int_mux_cfg1,
+							wsa->reg_layout->rx_intx_1_mix_inp2_sel_mask);
+		mix_inp_sel = snd_soc_component_read_field(component, int_mux_cfg1,
+							   wsa->reg_layout->rx_intx_2_sel_mask);
+		/* map to corresponding dai->id */
+		inp0_dai = inp0_sel < inp_max ? inp_to_dai[inp0_sel] : 0xff;
+		inp1_dai = inp1_sel < inp_max ? inp_to_dai[inp1_sel] : 0xff;
+		inp2_dai = inp2_sel < inp_max ? inp_to_dai[inp2_sel] : 0xff;
+		mix_inp_dai = mix_inp_sel < inp_max ? inp_to_dai[mix_inp_sel] : 0xff;
+
+		/* note: odd values of inp0_sel,etc. are RX0,RX2,etc. (always first channel of the dai) */
+		if (inp0_dai == dai->id) active_ch_mask |= (inp0_sel & 1) ? BIT(0) : BIT(1);
+		if (inp1_dai == dai->id) active_ch_mask |= (inp1_sel & 1) ? BIT(0) : BIT(1);
+		if (inp2_dai == dai->id) active_ch_mask |= (inp2_sel & 1) ? BIT(0) : BIT(1);
+		if (mix_inp_dai == dai->id) active_ch_mask |= (mix_inp_sel & 1) ? BIT(0) : BIT(1);
 	}
-	if ((i == ARRAY_SIZE(int_prim_sample_rate_val)) || (rate_val < 0))
-		return -EINVAL;
-
-	ret = wsa_macro_set_prim_interpolator_rate(dai, (u8) rate_val, sample_rate);
-
-	return ret;
+	return active_ch_mask;
 }
 
 static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
@@ -1309,23 +1289,23 @@ static int wsa_macro_get_channel_map(const struct snd_soc_dai *dai,
 {
 	struct snd_soc_component *component = dai->component;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
-	u16 val, mask = 0, cnt = 0, temp;
+	u16 val, mask = 0, cnt = 0;
 
 	switch (dai->id) {
 	case WSA_MACRO_AIF_VI:
 		*tx_slot = wsa->active_ch_mask[dai->id];
 		*tx_num = wsa->active_ch_cnt[dai->id];
 		break;
-	case WSA_MACRO_AIF1_PB:
-	case WSA_MACRO_AIF_MIX1_PB:
-		for_each_set_bit(temp, &wsa->active_ch_mask[dai->id],
-					WSA_MACRO_RX_MAX) {
-			mask |= (1 << temp);
-			if (++cnt == WSA_MACRO_MAX_DMA_CH_PER_PORT)
-				break;
-		}
-		if (mask & 0x0C)
-			mask = mask >> 0x2;
+	case WSA_MACRO_AIF_RX01:
+	case WSA_MACRO_AIF_RX_MIX01:
+	case WSA_MACRO_AIF_RX45:
+	case WSA_MACRO_AIF_RX67:
+	case WSA_MACRO_AIF_RX8:
+		mask = wsa_macro_get_active_channels(dai);
+		if (mask & 1)
+			cnt++;
+		if (mask & 2)
+			cnt++;
 		*rx_slot = mask;
 		*rx_num = cnt;
 		break;
@@ -1356,10 +1336,10 @@ static const struct snd_soc_dai_ops wsa_macro_dai_ops = {
 
 static struct snd_soc_dai_driver wsa_macro_dai[] = {
 	{
-		.name = "wsa_macro_rx1",
-		.id = WSA_MACRO_AIF1_PB,
+		.name = "wsa_macro_rx01",
+		.id = WSA_MACRO_AIF_RX01,
 		.playback = {
-			.stream_name = "WSA_AIF1 Playback",
+			.stream_name = "WSA_AIF_RX01 Playback",
 			.rates = WSA_MACRO_RX_RATES,
 			.formats = WSA_MACRO_RX_FORMATS,
 			.rate_max = 384000,
@@ -1370,14 +1350,14 @@ static struct snd_soc_dai_driver wsa_macro_dai[] = {
 		.ops = &wsa_macro_dai_ops,
 	},
 	{
-		.name = "wsa_macro_rx_mix",
-		.id = WSA_MACRO_AIF_MIX1_PB,
+		.name = "wsa_macro_rx_mix01",
+		.id = WSA_MACRO_AIF_RX_MIX01,
 		.playback = {
-			.stream_name = "WSA_AIF_MIX1 Playback",
-			.rates = WSA_MACRO_RX_MIX_RATES,
+			.stream_name = "WSA_AIF_RX_MIX01 Playback",
+			.rates = WSA_MACRO_RX_RATES,
 			.formats = WSA_MACRO_RX_FORMATS,
-			.rate_max = 192000,
-			.rate_min = 48000,
+			.rate_max = 384000,
+			.rate_min = 8000,
 			.channels_min = 1,
 			.channels_max = 2,
 		},
@@ -1411,6 +1391,48 @@ static struct snd_soc_dai_driver wsa_macro_dai[] = {
 		},
 		.ops = &wsa_macro_dai_ops,
 	},
+	{
+		.name = "wsa_macro_rx45",
+		.id = WSA_MACRO_AIF_RX45,
+		.playback = {
+			.stream_name = "WSA_AIF_RX45 Playback",
+			.rates = WSA_MACRO_RX_RATES,
+			.formats = WSA_MACRO_RX_FORMATS,
+			.rate_max = 384000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &wsa_macro_dai_ops,
+	},
+	{
+		.name = "wsa_macro_rx67",
+		.id = WSA_MACRO_AIF_RX67,
+		.playback = {
+			.stream_name = "WSA_AIF_RX67 Playback",
+			.rates = WSA_MACRO_RX_RATES,
+			.formats = WSA_MACRO_RX_FORMATS,
+			.rate_max = 384000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &wsa_macro_dai_ops,
+	},
+	{
+		.name = "wsa_macro_rx8",
+		.id = WSA_MACRO_AIF_RX8,
+		.playback = {
+			.stream_name = "WSA_AIF_RX8 Playback",
+			.rates = WSA_MACRO_RX_RATES,
+			.formats = WSA_MACRO_RX_FORMATS,
+			.rate_max = 384000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 1,
+		},
+		.ops = &wsa_macro_dai_ops,
+	},
 };
 
 static void wsa_macro_mclk_enable(struct wsa_macro *wsa, bool mclk_enable)
@@ -2085,79 +2107,6 @@ static int wsa_macro_ear_spkr_pa_gain_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int wsa_macro_rx_mux_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_dapm_widget *widget =
-		snd_soc_dapm_kcontrol_widget(kcontrol);
-	struct snd_soc_component *component =
-				snd_soc_dapm_to_component(widget->dapm);
-	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
-
-	ucontrol->value.integer.value[0] =
-			wsa->rx_port_value[widget->shift];
-	return 0;
-}
-
-static int wsa_macro_rx_mux_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_dapm_widget *widget =
-		snd_soc_dapm_kcontrol_widget(kcontrol);
-	struct snd_soc_component *component =
-				snd_soc_dapm_to_component(widget->dapm);
-	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	struct snd_soc_dapm_update *update = NULL;
-	u32 rx_port_value = ucontrol->value.integer.value[0];
-	u32 bit_input;
-	u32 aif_rst;
-	unsigned int dai_id;
-	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
-
-	aif_rst = wsa->rx_port_value[widget->shift];
-	if (!rx_port_value) {
-		if (aif_rst == 0)
-			return 0;
-		if (aif_rst >= WSA_MACRO_RX_MAX) {
-			dev_err(component->dev, "%s: Invalid AIF reset\n", __func__);
-			return 0;
-		}
-	}
-	wsa->rx_port_value[widget->shift] = rx_port_value;
-
-	bit_input = widget->shift;
-
-	switch (rx_port_value) {
-	case 0:
-		/*
-		 * active_ch_cnt and active_ch_mask use DAI IDs (WSA_MACRO_MAX_DAIS).
-		 * active_ch_cnt == 0 was tested in if() above.
-		 */
-		dai_id = aif_rst - 1;
-		if (wsa->active_ch_cnt[dai_id]) {
-			clear_bit(bit_input, &wsa->active_ch_mask[dai_id]);
-			wsa->active_ch_cnt[dai_id]--;
-		}
-		break;
-	case 1:
-	case 2:
-		/* active_ch_cnt and active_ch_mask use DAI IDs (WSA_MACRO_MAX_DAIS). */
-		dai_id = rx_port_value - 1;
-		set_bit(bit_input, &wsa->active_ch_mask[dai_id]);
-		wsa->active_ch_cnt[dai_id]++;
-		break;
-	default:
-		dev_err(component->dev,
-			"%s: Invalid AIF_ID for WSA RX MUX %d\n",
-			__func__, rx_port_value);
-		return -EINVAL;
-	}
-
-	snd_soc_dapm_mux_update_power(widget->dapm, kcontrol,
-					rx_port_value, e, update);
-	return 0;
-}
-
 static int wsa_macro_soft_clip_enable_get(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
@@ -2220,30 +2169,6 @@ static const struct snd_kcontrol_new wsa_macro_snd_controls[] = {
 		       wsa_macro_get_ec_hq, wsa_macro_set_ec_hq),
 };
 
-static const struct soc_enum rx_mux_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_mux_text), rx_mux_text);
-
-static const struct snd_kcontrol_new rx_mux[WSA_MACRO_RX_MAX] = {
-	SOC_DAPM_ENUM_EXT("WSA RX0 Mux", rx_mux_enum,
-			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
-	SOC_DAPM_ENUM_EXT("WSA RX1 Mux", rx_mux_enum,
-			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
-	SOC_DAPM_ENUM_EXT("WSA RX_MIX0 Mux", rx_mux_enum,
-			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
-	SOC_DAPM_ENUM_EXT("WSA RX_MIX1 Mux", rx_mux_enum,
-			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
-	SOC_DAPM_ENUM_EXT("WSA RX4 Mux", rx_mux_enum,
-			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
-	SOC_DAPM_ENUM_EXT("WSA RX5 Mux", rx_mux_enum,
-			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
-	SOC_DAPM_ENUM_EXT("WSA RX6 Mux", rx_mux_enum,
-			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
-	SOC_DAPM_ENUM_EXT("WSA RX7 Mux", rx_mux_enum,
-			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
-	SOC_DAPM_ENUM_EXT("WSA RX8 Mux", rx_mux_enum,
-			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
-};
-
 static int wsa_macro_vi_feed_mixer_get(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
@@ -2319,11 +2244,6 @@ static const struct snd_kcontrol_new aif_vi_mixer[] = {
 };
 
 static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets[] = {
-	SND_SOC_DAPM_AIF_IN("WSA AIF1 PB", "WSA_AIF1 Playback", 0,
-			    SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("WSA AIF_MIX1 PB", "WSA_AIF_MIX1 Playback", 0,
-			    SND_SOC_NOPM, 0, 0),
-
 	SND_SOC_DAPM_AIF_OUT_E("WSA AIF_VI", "WSA_AIF_VI Capture", 0,
 			       SND_SOC_NOPM, WSA_MACRO_AIF_VI, 0,
 			       wsa_macro_enable_vi_feedback,
@@ -2342,19 +2262,10 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets[] = {
 			   &rx_mix_ec1_mux, wsa_macro_enable_echo,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
-	SND_SOC_DAPM_MUX("WSA RX0 MUX", SND_SOC_NOPM, WSA_MACRO_RX0, 0,
-			 &rx_mux[WSA_MACRO_RX0]),
-	SND_SOC_DAPM_MUX("WSA RX1 MUX", SND_SOC_NOPM, WSA_MACRO_RX1, 0,
-			 &rx_mux[WSA_MACRO_RX1]),
-	SND_SOC_DAPM_MUX("WSA RX_MIX0 MUX", SND_SOC_NOPM, WSA_MACRO_RX_MIX0, 0,
-			 &rx_mux[WSA_MACRO_RX_MIX0]),
-	SND_SOC_DAPM_MUX("WSA RX_MIX1 MUX", SND_SOC_NOPM, WSA_MACRO_RX_MIX1, 0,
-			 &rx_mux[WSA_MACRO_RX_MIX1]),
-
-	SND_SOC_DAPM_MIXER("WSA RX0", SND_SOC_NOPM, 0, 0, NULL, 0),
-	SND_SOC_DAPM_MIXER("WSA RX1", SND_SOC_NOPM, 0, 0, NULL, 0),
-	SND_SOC_DAPM_MIXER("WSA RX_MIX0", SND_SOC_NOPM, 0, 0, NULL, 0),
-	SND_SOC_DAPM_MIXER("WSA RX_MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_AIF_IN("WSA RX0", "WSA_AIF_RX01 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("WSA RX1", "WSA_AIF_RX01 Playback", 1, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("WSA RX_MIX0", "WSA_AIF_RX_MIX01 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("WSA RX_MIX1", "WSA_AIF_RX_MIX01 Playback", 1, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_MIXER("WSA_RX INT0 MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER("WSA_RX INT1 MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -2424,16 +2335,11 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
 	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_5),
-	SND_SOC_DAPM_MIXER("WSA RX4", SND_SOC_NOPM, 0, 0, NULL, 0),
-	SND_SOC_DAPM_MIXER("WSA RX5", SND_SOC_NOPM, 0, 0, NULL, 0),
-	SND_SOC_DAPM_MIXER("WSA RX6", SND_SOC_NOPM, 0, 0, NULL, 0),
-	SND_SOC_DAPM_MIXER("WSA RX7", SND_SOC_NOPM, 0, 0, NULL, 0),
-	SND_SOC_DAPM_MIXER("WSA RX8", SND_SOC_NOPM, 0, 0, NULL, 0),
-	SND_SOC_DAPM_MUX("WSA RX4 MUX", SND_SOC_NOPM, WSA_MACRO_RX4, 0, &rx_mux[WSA_MACRO_RX4]),
-	SND_SOC_DAPM_MUX("WSA RX5 MUX", SND_SOC_NOPM, WSA_MACRO_RX5, 0, &rx_mux[WSA_MACRO_RX5]),
-	SND_SOC_DAPM_MUX("WSA RX6 MUX", SND_SOC_NOPM, WSA_MACRO_RX6, 0, &rx_mux[WSA_MACRO_RX6]),
-	SND_SOC_DAPM_MUX("WSA RX7 MUX", SND_SOC_NOPM, WSA_MACRO_RX7, 0, &rx_mux[WSA_MACRO_RX7]),
-	SND_SOC_DAPM_MUX("WSA RX8 MUX", SND_SOC_NOPM, WSA_MACRO_RX8, 0, &rx_mux[WSA_MACRO_RX8]),
+	SND_SOC_DAPM_AIF_IN("WSA RX4", "WSA_AIF_RX45 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("WSA RX5", "WSA_AIF_RX45 Playback", 1, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("WSA RX6", "WSA_AIF_RX67 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("WSA RX7", "WSA_AIF_RX67 Playback", 1, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("WSA RX8", "WSA_AIF_RX8 Playback", 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route wsa_audio_map[] = {
@@ -2451,24 +2357,6 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 	{"WSA AIF_ECHO", NULL, "WSA RX_MIX EC1_MUX"},
 	{"WSA AIF_ECHO", NULL, "WSA_MCLK"},
 
-	{"WSA AIF1 PB", NULL, "WSA_MCLK"},
-	{"WSA AIF_MIX1 PB", NULL, "WSA_MCLK"},
-
-	{"WSA RX0 MUX", "AIF1_PB", "WSA AIF1 PB"},
-	{"WSA RX1 MUX", "AIF1_PB", "WSA AIF1 PB"},
-	{"WSA RX_MIX0 MUX", "AIF1_PB", "WSA AIF1 PB"},
-	{"WSA RX_MIX1 MUX", "AIF1_PB", "WSA AIF1 PB"},
-
-	{"WSA RX0 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
-	{"WSA RX1 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
-	{"WSA RX_MIX0 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
-	{"WSA RX_MIX1 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
-
-	{"WSA RX0", NULL, "WSA RX0 MUX"},
-	{"WSA RX1", NULL, "WSA RX1 MUX"},
-	{"WSA RX_MIX0", NULL, "WSA RX_MIX0 MUX"},
-	{"WSA RX_MIX1", NULL, "WSA RX_MIX1 MUX"},
-
 	{"WSA_RX INT0 MIX", NULL, "WSA_RX0_CLK"},
 	{"WSA_RX INT1 MIX", NULL, "WSA_RX1_CLK"},
 
@@ -2554,21 +2442,6 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 };
 
 static const struct snd_soc_dapm_route wsa_audio_map_v2_5[] = {
-	{"WSA RX4 MUX", "AIF1_PB", "WSA AIF1 PB"},
-	{"WSA RX5 MUX", "AIF1_PB", "WSA AIF1 PB"},
-	{"WSA RX6 MUX", "AIF1_PB", "WSA AIF1 PB"},
-	{"WSA RX7 MUX", "AIF1_PB", "WSA AIF1 PB"},
-	{"WSA RX8 MUX", "AIF1_PB", "WSA AIF1 PB"},
-	{"WSA RX4 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
-	{"WSA RX5 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
-	{"WSA RX6 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
-	{"WSA RX7 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
-	{"WSA RX8 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
-	{"WSA RX4", NULL, "WSA RX4 MUX"},
-	{"WSA RX5", NULL, "WSA RX5 MUX"},
-	{"WSA RX6", NULL, "WSA RX6 MUX"},
-	{"WSA RX7", NULL, "WSA RX7 MUX"},
-	{"WSA RX8", NULL, "WSA RX8 MUX"},
 	{"WSA_RX0 INP0", "RX4", "WSA RX4"},
 	{"WSA_RX0 INP0", "RX5", "WSA RX5"},
 	{"WSA_RX0 INP0", "RX6", "WSA RX6"},
@@ -2774,7 +2647,7 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	struct wsa_macro *wsa;
 	kernel_ulong_t flags;
 	void __iomem *base;
-	int ret, def_count;
+	int ret, def_count, num_dais;
 
 	flags = (kernel_ulong_t)device_get_match_data(dev);
 
@@ -2826,6 +2699,7 @@ static int wsa_macro_probe(struct platform_device *pdev)
 		memcpy(&reg_defaults[0], wsa_defaults, sizeof(wsa_defaults));
 		memcpy(&reg_defaults[ARRAY_SIZE(wsa_defaults)],
 		       wsa_defaults_v2_1, sizeof(wsa_defaults_v2_1));
+		num_dais = WSA_MACRO_AIF_ECHO + 1; /* no RX4-8 */
 		break;
 
 	case LPASS_CODEC_VERSION_2_5:
@@ -2842,6 +2716,7 @@ static int wsa_macro_probe(struct platform_device *pdev)
 		memcpy(&reg_defaults[0], wsa_defaults, sizeof(wsa_defaults));
 		memcpy(&reg_defaults[ARRAY_SIZE(wsa_defaults)],
 		       wsa_defaults_v2_5, sizeof(wsa_defaults_v2_5));
+		num_dais = ARRAY_SIZE(wsa_macro_dai); /* WSA_MACRO_MAX_DAIS */
 		break;
 
 	default:
@@ -2903,7 +2778,7 @@ static int wsa_macro_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(dev, &wsa_macro_component_drv,
 					      wsa_macro_dai,
-					      ARRAY_SIZE(wsa_macro_dai));
+					      num_dais);
 	if (ret)
 		goto err_clkout;
 
-- 
2.51.0

