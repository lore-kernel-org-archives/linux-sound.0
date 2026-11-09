Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246393;
	b=JBBP1gKmnL89K94LQh6m52qzRCItFNMwzX0eojjGnwfCczHiUonWhXqofVSsSQ3JO3G/
	 0YZg18ttIB40WJOEfVhNHP3qa37AUviYV7tcvL47NloErbLzw3IPFpkOkp+QUEz+euVZn
	 r+u+BwvExbduRZJCS0BoLhdTIAb/ZJ64XE8F2JqFABCRnyK3yfjq+0If0b8psBaxwY7hf
	 RJYl6ow4Mv/IxCOapPy8aO5nkyot8HY4vHxLxxDsdgQp8BktdwT54HgAtomCguy2pZ2cm
	 u+AfCSHHgIQEmfaDAcEptOgtrC+GV1sCm7AN0J1XeN501rcyIC5s9ugtc6T3AqmIrUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H7/+0Eyjtekyr3Gppy7YFu3zccgKMINlxS+1BwNJUyY=;
	b=twWX9NflWAoI7svjyXarS/2uSf9SHK0kJihU9P3vcd0eWNkKLMGruMaj7zlLBVRzUGPy
	 53UdhZyH3hUrGGZPBYoGv+QK/3DkVmpP/hR8JGwjsjb0GiMmflh0DsM/i4q1jxw1awQh/
	 dZFHs6EyPJhK6xWeJrZONtd5bccllpngaSJdw6ytQqpREsSlDJNthm7p29g11IeYT21hr
	 1opGo2qqqTm4M+YI2kWG1+bVQ92Dr3eoIHmM+dGJmC74B/8lTNE1pD3m0buRHcyXrOhzO
	 banHco34hiK5XdVLokP/8dj002JhSKcCKy0c9x8qPoWkjuIDzhkj9uVGVbeunCrVKDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=kCpjojT+;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05A606A321
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D05A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=kCpjojT+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so12005565e9.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 09:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794246391; x=1794851191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H7/+0Eyjtekyr3Gppy7YFu3zccgKMINlxS+1BwNJUyY=;
        b=kCpjojT+1fmfLRDW+iJcpTr+D05/56CFbNz33tzXtaSt2R1lhEgLfyfG35UWnL1EEJ
         QdtNtr2SoYG2hA/uTY+ItuzlY/cPSdfB2+lMYYGDUovA4DzdOF1tmkB1WrL2MHgCyrA0
         QBGitlBuRt193paiEJAVc8q92Lr7u7gDYyQ87dNpKtwaXcOW4/p3dH6H21ig/pibIzSf
         LFfN/i2xtOi1t12T8w0LNBw29sTaAlpyBjU4xjUXPek7bBuL14S4phMWMg/PoWdPq2oH
         R1hN9nRY2Kcky2tysRJqimHV3K8qyM0eHWN2tpTv584EUmo572/vw6Mc2GSznGVek0Yf
         C/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246391; x=1794851191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7/+0Eyjtekyr3Gppy7YFu3zccgKMINlxS+1BwNJUyY=;
        b=wDiKWn3yEX/fdVAqXRpGuQHfxhz19Fi20ec1ghISN+xAK9SLZ7LGfrVY0GiZdcKa0d
         30LzAtxKoXiIS/f0CuwU7mJjfH2v2ZzWmm7HNYd/H4wGvnxxz+BxiJgMkCvytFPFGtK9
         TVuDjvTpg/gQ0gChhKsOgkqBWr+ehCLTCWOY9YERne0UyLaIMM2jStU4Iy5vLSkilo3u
         y+l0ZoZPCyShszF4pXUE2E3HJOL7GazRHr0rUqiexsqtanADvDNy8GTY+e7m4tSrDmMx
         BI16EqGfVX/ty25j57JBuSNZCz4zgX+1fMayK4w9+oF4Pns3oQ/ZW6zYkMe8sVUxxG5Q
         oeDQ==
X-Forwarded-Encrypted: i=1; AL+hErHnRo32y4cwv6wx5XPQU9sEGpzuO1GHdX7NzXdFb3uVDQoJ5cPtzjv7bpamVqSPgcKCVJbJLZBP6pN7jQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ihTYyrjDcv4pRD6N0M3nsOXnF3N77HsqmDBRp/aYWG0PB9fpB
	lO6po1QDQ68kz9w/RJctPUpm+hpLn17paoZziLa/r09Sxz7q2qPLQf9JiHEH4w0TpO8=
X-Gm-Gg: AYBFou1ao0eoUA3AZDhzK2iNqODdWDKKTOgmDi1q1Jj9fSp2eRlx0ILOfGlced6kgrE
	B0+xDGn8MY7/mWzwqk+rybhH5XnDiXqroHAK0ouxDU91s3hhcs1E4KTh7mVLZEIt8+nbNlke/Jj
	FEQuKLcDNVMZEp8KT2EhUzuJrmSoxR6syKskYyBKMzMsPwuCARWFNgNlrz49a1ONlZQpwWCPyob
	AIVJERWYy2J4XSsc98VyZQ3d8q37OjQ/YwPNj4vC0kO8qvWrnnCye1qOuYYZ3OVzsGAJYC3al+P
	K5T8ijIj+9huHq2YB6LPruRslsAtp4wnvg09W7HEW/G8jUwspMZ9KQMyN1n+sbDOGmoz6A/Sa+1
	e6L01stf4wbNZyw21uddLIoCdGU1zur6DM4Bj5zdZidArzSubk30Buv1LTNMI/uXjsqn2IfiThl
	hs8OtjmTPsuo9VDusQvgs9hHl2KlJYgjCvMAVOPHiZ4Sv99KImClJXKBTvnKdXaAY+iWb0I1uso
	FCyYZG7UDbkHP0DyGXQBvnAQTswfDrdGDOh348AiYNoYG4IhIgBXlsbirUFT+2JVtyM0vUlJ1+/
	aiAYT01KIOVHuvkDKcOd0Ib/UVN3xftUrwPwZ9bnW/CypIimlvIXcwOeFaYVyWM=
X-Received: by 2002:a05:600c:8712:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4b963c85e03mr83173505e9.16.1794246390594;
        Mon, 09 Nov 2026 09:46:30 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020433casm2313365e9.7.2026.11.09.09.46.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:46:30 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3] ASoC: cs43130: Take the frame layout from set_tdm_slot()
Date: Mon,  9 Nov 2026 18:45:14 +0100
Message-ID: <20261109174514.84903-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hw_params() derives the slot width from the frequency given to the DAI's
set_sysclk(), which it takes for SCLK. Generic cards pass MCLK there: the
simple-audio-card of a HiBy R1 (Ingenic X1600 as I2S master, 64 bit
clocks per frame, mclk-fs = 512) hands over 22.5792 MHz, so the driver
sets up 256-bit slots for a 44.1 kHz stream and the CS43131 plays white
noise. The card cannot simply leave mclk-fs out: simple-audio-card then
sets no clock on the I2S controller either, and the codec, as clock
slave, fails hw_params() with "SCLK freq is not set".

Add a set_tdm_slot() callback so the card can give the layout instead.
The PCM DAI receives what it plays, so the two channels go to the first
and second slots set in rx_mask, within frames of 16 to 64 bits, the
sizes the serial port clock tables cover. When set, the layout takes
precedence over the one derived from set_sysclk(); zero slots go back to
deriving it.

Tested on a HiBy R1, on v7.3, with dai-tdm-slot-num = <2> and
dai-tdm-slot-width = <32> on the codec node.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v3:
 - The slots come from rx_mask instead of tx_mask (Charles Keepax):
   set_tdm_slot() is device-centric, and the codec receives what it
   plays. A card that gives no masks, like the R1's, gets both filled
   with the slot count's mask by the core, so its layout is unchanged.
 - Rebased on broonie/sound for-7.5; no longer an RFC, since the
   approach is the one Charles found fine.

Changes in v2, after Charles Keepax and the review bot:
 - Full TDM: the two channels go to the first and second slots set in
   tx_mask, with the frame length from the slot count, instead of only
   accepting two slots with mask 0x3. Limited to frames of 16 to 64 bits,
   the sizes cs43130_set_sp_fmt() has clock tables for.
 - The callback stays: on the R1, without mclk-fs simple-audio-card sets
   no clock on the I2S controller, and the codec as clock slave fails with
   "SCLK freq is not set".

Tested on v7.3 on a HiBy R1 with two 32-bit slots and no masks in the
device tree, the only layout this board can run: the DAC gets a 64-bit
frame with channel 2 at bit 32, in stereo at 44.1 kHz and mono at 48 kHz
(with v2). v3 was run on the same board (v7.3, and the device tree
unchanged): the core passes 0x3 for both masks, and ASP_CH_1_LOC and
ASP_CH_2_LOC read 0x00 and 0x20 in stereo at 44.1 and 48 kHz, as with
v2. Other layouts are build-tested only, with W=1.

v2: https://lore.kernel.org/all/20261023163206.81891-1-olivier@mgcrea.io/
v1: https://lore.kernel.org/all/20261023081457.44579-1-olivier@mgcrea.io/

 sound/soc/codecs/cs43130.c | 76 +++++++++++++++++++++++++++++++-------
 sound/soc/codecs/cs43130.h |  3 ++
 2 files changed, 66 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 7fb23522f081..3a1588645b40 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -651,9 +651,16 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
 		return -EINVAL;
 	}
 
-	frm_size = bitwidth_sclk * params_channels(params);
-	loc_ch1 = 0;
-	loc_ch2 = bitwidth_sclk * (params_channels(params) - 1);
+	if (cs43130->dais[dai_id].slots) {
+		/* The layout set with set_tdm_slot() */
+		frm_size = bitwidth_sclk * cs43130->dais[dai_id].slots;
+		loc_ch1 = cs43130->dais[dai_id].slot_loc[0];
+		loc_ch2 = cs43130->dais[dai_id].slot_loc[1];
+	} else {
+		frm_size = bitwidth_sclk * params_channels(params);
+		loc_ch1 = 0;
+		loc_ch2 = bitwidth_sclk * (params_channels(params) - 1);
+	}
 
 	frm_data = frm_delay & CS43130_SP_FSD_MASK;
 	frm_data |= (frm_phase << CS43130_SP_STP_SHIFT) & CS43130_SP_STP_MASK;
@@ -960,18 +967,24 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	if (!sclk && cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBP_CFP)
-		/* Calculate SCLK in master mode if unassigned */
-		sclk = params_rate(params) * bitwidth_dai *
-		       params_channels(params);
+	if (cs43130->dais[dai->id].slot_width) {
+		/* The slot width set with set_tdm_slot() */
+		bitwidth_sclk = cs43130->dais[dai->id].slot_width;
+	} else {
+		if (!sclk && cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBP_CFP)
+			/* Calculate SCLK in master mode if unassigned */
+			sclk = params_rate(params) * bitwidth_dai *
+			       params_channels(params);
+
+		if (!sclk) {
+			/* at this point, SCLK must be set */
+			dev_err(cs43130->dev, "SCLK freq is not set\n");
+			return -EINVAL;
+		}
 
-	if (!sclk) {
-		/* at this point, SCLK must be set */
-		dev_err(cs43130->dev, "SCLK freq is not set\n");
-		return -EINVAL;
+		bitwidth_sclk = (sclk / params_rate(params)) /
+				params_channels(params);
 	}
-
-	bitwidth_sclk = (sclk / params_rate(params)) / params_channels(params);
 	if (bitwidth_sclk < bitwidth_dai) {
 		dev_err(cs43130->dev, "Format not supported: SCLK freq is too low\n");
 		return -EINVAL;
@@ -1624,6 +1637,42 @@ static int cs43130_set_sysclk(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+/*
+ * Sets the frame layout directly, which then takes precedence over the one
+ * derived from the set_sysclk() frequency: generic sound cards pass MCLK to
+ * set_sysclk(), not SCLK. The PCM DAI only plays, so it receives: the two
+ * channels go to the first and second slots set in rx_mask (both to the same
+ * slot for one), and tx_mask is not used. Frames are 16 to 64 bits, the sizes
+ * the serial port clock tables cover. Zero slots go back to the derived layout.
+ */
+static int cs43130_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+				unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
+	struct cs43130_dai *cs_dai = &cs43130->dais[dai->id];
+	unsigned int frm_size = slots * slot_width;
+
+	if (!slots) {
+		cs_dai->slots = 0;
+		cs_dai->slot_width = 0;
+		return 0;
+	}
+	if (slots < 0 || slot_width < 16 || slot_width > 32 ||
+	    frm_size > 64 || frm_size % 16)
+		return -EINVAL;
+	if (!rx_mask || hweight32(rx_mask) > 2 || rx_mask >= BIT(slots))
+		return -EINVAL;
+
+	cs_dai->slot_loc[0] = __ffs(rx_mask) * slot_width;
+	rx_mask &= rx_mask - 1;
+	cs_dai->slot_loc[1] = rx_mask ? __ffs(rx_mask) * slot_width :
+					cs_dai->slot_loc[0];
+	cs_dai->slots = slots;
+	cs_dai->slot_width = slot_width;
+	return 0;
+}
+
 static const u64 cs43130_selectable_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
@@ -1640,6 +1689,7 @@ static const struct snd_soc_dai_ops cs43130_pcm_ops = {
 	.hw_free	= cs43130_hw_free,
 	.set_sysclk	= cs43130_set_sysclk,
 	.set_fmt	= cs43130_pcm_set_fmt,
+	.set_tdm_slot	= cs43130_set_tdm_slot,
 	.auto_selectable_formats	= &cs43130_selectable_formats,
 	.num_auto_selectable_formats	= 1,
 };
diff --git a/sound/soc/codecs/cs43130.h b/sound/soc/codecs/cs43130.h
index b0dba903403f..d94ce32e9571 100644
--- a/sound/soc/codecs/cs43130.h
+++ b/sound/soc/codecs/cs43130.h
@@ -495,6 +495,9 @@ static const char *const cs43130_supply_names[CS43130_NUM_SUPPLIES] = {
 
 struct cs43130_dai {
 	unsigned int			sclk;
+	unsigned int			slots;
+	unsigned int			slot_width;
+	u8				slot_loc[2];
 	unsigned int			dai_format;
 	unsigned int			dai_mode;
 	unsigned int			dai_invert;

base-commit: edd3a027969c7609a8738230f07e607852377bef
-- 
2.39.5

