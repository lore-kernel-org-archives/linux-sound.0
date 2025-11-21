Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07E52E7185;
	Fri, 21 Nov 2025 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738574; cv=pass; b=cEJ1FaldQ6d8ko00TrPnnpqpS3GnpP2U1nVobHNJ+H1M9zm1veABMoNWh7xXE4IZL3e+OdEPW4AUGm/9VIBC9MkE8TDUzy5V6IbOUJRZczqAyy8ld/EWFOjgf0PnxPECFWj6NWI+rfEFkXhDyu3iuzNkjkkJNYt+HOe4craQ0eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738574; c=relaxed/simple;
	bh=92z/KNlP1NEFCpm2Yser7QCAn0uhy1m8CuqWxt4iyqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMnelVwEdyHecpFBBow7SwDejHYS/POa8xrvD5blGw8eM99Se6YKq5M5WYzKNi2z2EBqeUAzolrOknn3CoZj4AhmIIA7wbp3Emg9tT1ZewIr9ucRp4DVXZ3ns+05S5C0SkOvyJXaCvQtuDAEeArSpLfVJST1hC699hMGeX3QblY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=aNAn/wpe; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="aNAn/wpe"
ARC-Seal: i=1; a=rsa-sha256; t=1763738563; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C7hmLbee6UpgdByCICpu3yYSXKt9rqQnCueMeHPVTIl6pD1NLJxhGKeZ/oTWpl3BqL7CbDrLuCpKa89ejbpKKUKowpOig3uiASjMczGmFkzySNa3EsfrO0vEY9L3WvH9njJq1GhNgBhelkx4ZVjhrf2tMmwp+JXiOv47XJMfII8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763738563; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xUCZJUR1KrfKjFjmOxBQPeEte4Hoy97k3kE5KkFfS+o=; 
	b=SIfMY3QwwrYVrPIloK3yGRfVuq9HTxhVMiMfnrUVX9VEZtKnSiE0A9YTG3nriC7PIlSvL5UM8vEgV4UujqD1zbhCEReoz5C/1ATHTruKjcYG7QAOrrd5A8pdUqk5flspHOa0+A1eHX8Sf6dA3uHq9rJZAh3Bp4J+Z0dHQ1x2E/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763738563;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xUCZJUR1KrfKjFjmOxBQPeEte4Hoy97k3kE5KkFfS+o=;
	b=aNAn/wpeBrNzrNEd+fcBYclCFle08Acs2MziWyXGQ4RS9GQ01WpgQOgsnFqwitvX
	4U8RkgS8yj3E6vtgEWRrP1BMauWy02pnclVmL+dKzJtd0pxLYKFxPZ8GDNC63bgPOMO
	s/+vLtmWUgE8l74ezjcwA/PknNvh/8iA+BW63Xi+lIPswpUF6r5aRdEDlAU0KkL3s5V
	S+vXaJ1lygM6zbxq5JW2LEf6vyhThF8Kz+jwuQaMOG/zM0ZWZe8dt1pwj2SSwuORwqA
	zuV4I69wTkRgZ5YRawy2Ufx1P0Vu2xex5MN4jgghyRV/BMJvGid8KOkioG2Aj8Jf+2G
	KWTSQ0icJQ==
Received: by mx.zohomail.com with SMTPS id 1763738560824638.7647366437496;
	Fri, 21 Nov 2025 07:22:40 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v2 6/6] ALSA: ctxfi: Add support for Onkyo SE-300PCIE (OK0010)
Date: Sat, 22 Nov 2025 00:22:20 +0900
Message-ID: <20251121152221.1152523-7-me@harin.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121152221.1152523-1-me@harin.net>
References: <20251121152221.1152523-1-me@harin.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add support for the Onkyo SE-300PCIE, a Creative X-Fi CA20K2-based
sound card with a custom hardware implementation that differs
significantly from other CA20K2-based variants.

Changes:
- PCI quirk entry for OK0010
- Port 0x3 is utilized for dedicated RCA output (configured as I2S)
- Modified GPIO pin mappings and states
- 4-channel simultaneous ADC input support for line and microphone
  capture without input switching (similar to SB1270)
- Simplified ADC initialization (no manual setup required)

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctatc.c      |  7 +++++-
 sound/pci/ctxfi/ctdaio.h     |  2 +-
 sound/pci/ctxfi/cthardware.h |  1 +
 sound/pci/ctxfi/cthw20k2.c   | 45 ++++++++++++++++++++++++++----------
 4 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 69dad9ebbd8f..62432510eb2f 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -63,6 +63,7 @@ static const struct snd_pci_quirk subsys_20k2_list[] = {
 	SND_PCI_QUIRK_MASK(PCI_VENDOR_ID_CREATIVE, 0xf000,
 			   PCI_SUBDEVICE_ID_CREATIVE_HENDRIX, "HENDRIX",
 			   CTHENDRIX),
+	SND_PCI_QUIRK(0x160b, 0x0101, "OK0010", CTOK0010),
 	{ } /* terminator */
 };
 
@@ -78,6 +79,7 @@ static const char *ct_subsys_name[NUM_CTCARDS] = {
 	[CTHENDRIX]	= "Hendrix",
 	[CTSB0880]	= "SB0880",
 	[CTSB1270]      = "SB1270",
+	[CTOK0010]    = "OK0010",
 	[CT20K2_UNKNOWN] = "Unknown",
 };
 
@@ -1535,8 +1537,10 @@ static void atc_connect_resources(struct ct_atc *atc)
 		dao->ops->set_right_input(dao, rscs[1]);
 	}
 
-	if (cap.dedicated_rca)
+	if (cap.dedicated_rca) {
+		/* SE-300PCIE has a dedicated DAC for the RCA. */
 		atc_dedicated_rca_select(atc);
+	}
 
 	dai = container_of(atc->daios[LINEIM], struct dai, daio);
 	atc_connect_dai(atc->rsc_mgrs[SRC], dai,
@@ -1549,6 +1553,7 @@ static void atc_connect_resources(struct ct_atc *atc)
 
 	if (cap.dedicated_mic) {
 		/* Titanium HD has a dedicated ADC for the Mic. */
+		/* SE-300PCIE has a 4-channel ADC. */
 		dai = container_of(atc->daios[MIC], struct dai, daio);
 		atc_connect_dai(atc->rsc_mgrs[SRC], dai,
 			(struct src **)&atc->srcs[4],
diff --git a/sound/pci/ctxfi/ctdaio.h b/sound/pci/ctxfi/ctdaio.h
index 99d55f19e3ca..ff77d55539a5 100644
--- a/sound/pci/ctxfi/ctdaio.h
+++ b/sound/pci/ctxfi/ctdaio.h
@@ -31,7 +31,7 @@ enum DAIOTYP {
 	LINEIM,
 	SPDIFIO,	/* S/PDIF In (Flexijack/Optical) on the card */
 	MIC,		/* Dedicated mic on Titanium HD */
-	RCA,
+	RCA,		/* Dedicated RCA on SE-300PCIE */
 	SPDIFI1,	/* S/PDIF In on internal Drive Bay */
 	NUM_DAIOTYP
 };
diff --git a/sound/pci/ctxfi/cthardware.h b/sound/pci/ctxfi/cthardware.h
index 84ea690763e7..a3051fdd31f6 100644
--- a/sound/pci/ctxfi/cthardware.h
+++ b/sound/pci/ctxfi/cthardware.h
@@ -38,6 +38,7 @@ enum CTCARDS {
 	CTHENDRIX,
 	CTSB0880,
 	CTSB1270,
+	CTOK0010,
 	CT20K2_UNKNOWN,
 	NUM_CTCARDS		/* This should always be the last */
 };
diff --git a/sound/pci/ctxfi/cthw20k2.c b/sound/pci/ctxfi/cthw20k2.c
index 214a83977a70..e007d1122441 100644
--- a/sound/pci/ctxfi/cthw20k2.c
+++ b/sound/pci/ctxfi/cthw20k2.c
@@ -910,7 +910,7 @@ static int dao_commit_write(struct hw *hw, unsigned int idx, void *blk)
 	struct dao_ctrl_blk *ctl = blk;
 
 	if (ctl->dirty.bf.atxcsl) {
-		if (idx < 4) {
+		if ((idx < 4) && ((hw->model != CTOK0010) || (idx < 3))) {
 			/* S/PDIF SPOSx */
 			hw_write_20kx(hw, AUDIO_IO_TX_CSTAT_L+0x40*idx,
 							ctl->atxcsl);
@@ -985,11 +985,11 @@ static int daio_mgr_dsb_dao(void *blk, unsigned int idx)
 	return 0;
 }
 
-static int daio_mgr_dao_init(struct hw *hw __maybe_unused, void *blk, unsigned int idx, unsigned int conf)
+static int daio_mgr_dao_init(struct hw *hw, void *blk, unsigned int idx, unsigned int conf)
 {
 	struct daio_mgr_ctrl_blk *ctl = blk;
 
-	if (idx < 4) {
+	if ((idx < 4) && ((hw->model != CTOK0010) || (idx < 3))) {
 		/* S/PDIF output */
 		switch ((conf & 0xf)) {
 		case 1:
@@ -1176,6 +1176,10 @@ static int hw_daio_init(struct hw *hw, const struct daio_conf *info)
 		hw_write_20kx(hw, AUDIO_IO_MCLK, 0x21011111);
 		hw_write_20kx(hw, AUDIO_IO_TX_BLRCLK, 0x21212121);
 		hw_write_20kx(hw, AUDIO_IO_RX_BLRCLK, 0);
+	} else if ((4 == info->msr) && (hw->model == CTOK0010)) {
+		hw_write_20kx(hw, AUDIO_IO_MCLK, 0x21212121);
+		hw_write_20kx(hw, AUDIO_IO_TX_BLRCLK, 0x21212121);
+		hw_write_20kx(hw, AUDIO_IO_RX_BLRCLK, 0);
 	} else {
 		dev_alert(hw->card->dev,
 			  "ERROR!!! Invalid sampling rate!!!\n");
@@ -1183,7 +1187,7 @@ static int hw_daio_init(struct hw *hw, const struct daio_conf *info)
 	}
 
 	for (i = 0; i < 8; i++) {
-		if (i <= 3) {
+		if ((i < 4) && ((hw->model != CTOK0010) || (i < 3))) {
 			/* This comment looks wrong since loop is over 4  */
 			/* channels and emu20k2 supports 4 spdif IOs.     */
 			/* 1st 3 channels are SPDIFs (SB0960) */
@@ -1637,6 +1641,13 @@ static int hw_dac_init(struct hw *hw, const struct dac_conf *info)
 		hw_write_20kx(hw, GPIO_DATA, data);
 		hw_dac_start(hw);
 		return 0;
+	} else if (hw->model == CTOK0010) {
+		hw_dac_stop(hw);
+		data = hw_read_20kx(hw, GPIO_DATA);
+		data |= 0x1000;
+		hw_write_20kx(hw, GPIO_DATA, data);
+		hw_dac_start(hw);
+		return 0;
 	}
 
 	/* Set DAC reset bit as output */
@@ -1756,9 +1767,11 @@ static int hw_dac_init(struct hw *hw, const struct dac_conf *info)
 static int hw_is_adc_input_selected(struct hw *hw, enum ADCSRC type)
 {
 	u32 data;
-	if (hw->model == CTSB1270) {
+	if ((hw->model == CTSB1270) || (hw->model == CTOK0010)) {
 		/* Titanium HD has two ADC chips, one for line in and one */
-		/* for MIC. We don't need to switch the ADC input. */
+		/* for MIC. Also, SE-300PCIE has a single ADC chip that */
+		/* simultaneously supports 4-channel input. We don't need */
+		/* to switch the ADC input. */
 		return 1;
 	}
 	data = hw_read_20kx(hw, GPIO_DATA);
@@ -1846,7 +1859,7 @@ static void hw_adc_start(struct hw *hw)
 	msleep(50);
 }
 
-static void __maybe_unused hw_adc_reset(struct hw *hw)
+static void hw_adc_reset(struct hw *hw)
 {
 	hw_adc_stop(hw);
 	hw_adc_start(hw);
@@ -1862,6 +1875,12 @@ static int hw_adc_init(struct hw *hw, const struct adc_conf *info)
 	data |= (0x1 << 15);
 	hw_write_20kx(hw, GPIO_CTRL, data);
 
+	if (hw->model == CTOK0010) {
+		/* Manual ADC setup for SE-300PCIE is not needed. */
+		hw_adc_reset(hw);
+		return 0;
+	}
+
 	/* Initialize I2C */
 	err = hw20k2_i2c_init(hw, 0x1A, 1, 1);
 	if (err < 0) {
@@ -1929,8 +1948,8 @@ static struct capabilities hw_capabilities(struct hw *hw)
 	struct capabilities cap;
 
 	cap.digit_io_switch = 0;
-	cap.dedicated_mic = hw->model == CTSB1270;
-	cap.dedicated_rca = 0;
+	cap.dedicated_mic = (hw->model == CTSB1270) || (hw->model == CTOK0010);
+	cap.dedicated_rca = hw->model == CTOK0010;
 	cap.output_switch = hw->model == CTSB1270;
 	cap.mic_source_switch = hw->model == CTSB1270;
 
@@ -2167,15 +2186,17 @@ static int hw_card_init(struct hw *hw, struct card_conf *info)
 	/* Reset all SRC pending interrupts */
 	hw_write_20kx(hw, SRC_IP, 0);
 
-	if (hw->model != CTSB1270) {
+	if (hw->model == CTSB1270) {
+		hw_write_20kx(hw, GPIO_CTRL, 0x9E5F);
+	} else if (hw->model == CTOK0010) {
+		hw_write_20kx(hw, GPIO_CTRL, 0x9902);
+	} else {
 		/* TODO: detect the card ID and configure GPIO accordingly. */
 		/* Configures GPIO (0xD802 0x98028) */
 		/*hw_write_20kx(hw, GPIO_CTRL, 0x7F07);*/
 		/* Configures GPIO (SB0880) */
 		/*hw_write_20kx(hw, GPIO_CTRL, 0xFF07);*/
 		hw_write_20kx(hw, GPIO_CTRL, 0xD802);
-	} else {
-		hw_write_20kx(hw, GPIO_CTRL, 0x9E5F);
 	}
 	/* Enable audio ring */
 	hw_write_20kx(hw, MIXER_AR_ENABLE, 0x01);
-- 
2.52.0

