Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9DD34F492;
	Fri, 21 Nov 2025 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734362; cv=pass; b=Wog3tZHL6JmINQJxoGHML/HyX9YQacN6zPvR/tXLyEYtGAlk6zHj9FaUwDSVxMTcjfiD3/wiWmnKQqnealxgelDriScGStBPY79kkr3KUFglUzlsAe5tUcq/rJqqlKU8lvVmCQ7G3SL5tfuXX6cWn4e/clFBS8vMwELtObhuKEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734362; c=relaxed/simple;
	bh=Oj4r/FH0vcaod/qS86InE7O6q3Sf6IuRp6qNMF46CA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbUUcqcuwG1enJL3X+nw1Pps6zAw40f4il52LP7Uz8lSMe9eH+aTy4vrZ8gEsWpW/aDo3PiaMro0AKR049RW5SaGhWUTHIqOidoMbPayHA/s73FcILRH/X0nJWMLkIiwym+3k44vxWPuFKnkR8GXYoYHgEXqS+AJnr+q7sJneIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=TWi+2URm; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="TWi+2URm"
ARC-Seal: i=1; a=rsa-sha256; t=1763734351; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ery5d1RaFsaOZxh7kEfYoxRGtMoRmsATtOjacojulw7CzGIMnMcLfJkB78krFiRAfkyQtEH3LiZNzx500XAwIXshx44iuGSXln5NO+2wTn8OpB8nQohN/PgJnDuBz2fxBUFJeiEca4wlg3WJUb+ltFLv1L5t1ON5D4fXI0TgO+U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763734351; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pf4rexWOXsUJK2HlPEmBw2lYKWhZHWVTKzPfXm3no9U=; 
	b=Pl/zzJAiOX30WlsUpG6dKuJNKl3aCyQLXDvEu0s3uHqbrrnRg/syDT6ZY0fbTfXLP6Dk7Kd4VgoaZSWDyXLuysuufpgiCDYpzx8yne3sKNeqQQ3zybtgrnAhbl1XC7D2M8Sh8dGy0qsuBVdchA8mLjOZXrr8uQMuryXPG5+Qm4Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763734351;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pf4rexWOXsUJK2HlPEmBw2lYKWhZHWVTKzPfXm3no9U=;
	b=TWi+2URm8Fk4YBa7EYNCl/VlUP+qsuTcPExAcbwSIC1I+KU/rdMsCpJWbx0CleTW
	9shmTIxo8/fRJCTHMQTUfCq/TAi2ZmsBMAlidbK5t5cBlmxA1wL/u1ALLQ4NsU3ANxV
	IDQ8CgGKCoaGSvb1njKf4J32cBrr5fEXeZ2C76vPWD1u0uDV3hdkyPhBlUfE48ZRFqd
	2GaVHs8N9rL6k4u0pGwBGtFIh3c7qP0RhVYz0jAr7y3cQ4IptPAnB+q4zdIFj7pd/Mu
	qhvsW2swbhAhTH6gFr4+3cGyJkEZThj74qJl/NNa01zxQx2X8RPVvaeDUn9CLRytPhk
	wOpV48ihUA==
Received: by mx.zohomail.com with SMTPS id 1763734349482844.0942822116127;
	Fri, 21 Nov 2025 06:12:29 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH 5/6] ALSA: ctxfi: Add support for dedicated RCA switching
Date: Fri, 21 Nov 2025 23:12:00 +0900
Message-ID: <20251121141201.850931-6-me@harin.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121141201.850931-1-me@harin.net>
References: <20251121141201.850931-1-me@harin.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add feature to support switching between the dedicated RCA output and
the 7.1ch Front output. This is required for hardware that utilizes
separate DAC circuits for RCA and 7.1ch channels.

Changes:
- Add dedicated_rca capability flag
- Add 'Dedicated Selection Playback Enum' mixer control
- Implement logic to swap DAO inputs between RCA and Front ports

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctatc.c      | 33 +++++++++++++++-
 sound/pci/ctxfi/ctatc.h      |  4 ++
 sound/pci/ctxfi/ctdaio.c     |  2 +
 sound/pci/ctxfi/ctdaio.h     |  1 +
 sound/pci/ctxfi/cthardware.h |  1 +
 sound/pci/ctxfi/cthw20k1.c   |  1 +
 sound/pci/ctxfi/cthw20k2.c   |  1 +
 sound/pci/ctxfi/ctmixer.c    | 74 ++++++++++++++++++++++++++++++++++--
 8 files changed, 112 insertions(+), 5 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 80888fffebd1..69dad9ebbd8f 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -987,6 +987,24 @@ static struct capabilities atc_capabilities(struct ct_atc *atc)
 	return hw->capabilities(hw);
 }
 
+static void atc_dedicated_rca_select(struct ct_atc *atc)
+{
+	struct dao *dao;
+	struct ct_mixer *mixer = atc->mixer;
+	struct rsc *rscs[2] = {NULL};
+
+	dao = container_of(atc->daios[atc->rca_state ? RCA : LINEO1],
+		struct dao, daio);
+	dao->ops->clear_left_input(dao);
+	dao->ops->clear_right_input(dao);
+
+	mixer->get_output_ports(mixer, MIX_WAVE_FRONT, &rscs[0], &rscs[1]);
+	dao = container_of(atc->daios[atc->rca_state ? LINEO1 : RCA],
+		struct dao, daio);
+	dao->ops->set_left_input(dao, rscs[0]);
+	dao->ops->set_right_input(dao, rscs[1]);
+}
+
 static int atc_output_switch_get(struct ct_atc *atc)
 {
 	struct hw *hw = atc->hw;
@@ -1088,6 +1106,11 @@ static int atc_mic_unmute(struct ct_atc *atc, unsigned char state)
 	return atc_daio_unmute(atc, state, MIC);
 }
 
+static int atc_rca_unmute(struct ct_atc *atc, unsigned char state)
+{
+	return atc_daio_unmute(atc, state, RCA);
+}
+
 static int atc_spdif_out_unmute(struct ct_atc *atc, unsigned char state)
 {
 	return atc_daio_unmute(atc, state, SPDIFOO);
@@ -1303,6 +1326,7 @@ static int atc_identify_card(struct ct_atc *atc, unsigned int ssid)
 	dev_info(atc->card->dev, "chip %s model %s (%04x:%04x) is found\n",
 		   atc->chip_name, atc->model_name,
 		   vendor_id, device_id);
+	atc->rca_state = 0;
 	return 0;
 }
 
@@ -1400,11 +1424,11 @@ static int atc_get_resources(struct ct_atc *atc)
 	daio_mgr = (struct daio_mgr *)atc->rsc_mgrs[DAIO];
 	da_desc.msr = atc->msr;
 	for (i = 0; i < NUM_DAIOTYP; i++) {
-		if ((i == MIC) && !cap.dedicated_mic)
+		if (((i == MIC) && !cap.dedicated_mic) || ((i == RCA) && !cap.dedicated_rca))
 			continue;
 		da_desc.type = (atc->model != CTSB073X) ? i :
 			     ((i == SPDIFIO) ? SPDIFI1 : i);
-		da_desc.output = (i < LINEIM);
+		da_desc.output = ((i < LINEIM) || (i == RCA));
 		err = daio_mgr->get_daio(daio_mgr, &da_desc,
 					(struct daio **)&atc->daios[i]);
 		if (err) {
@@ -1511,6 +1535,9 @@ static void atc_connect_resources(struct ct_atc *atc)
 		dao->ops->set_right_input(dao, rscs[1]);
 	}
 
+	if (cap.dedicated_rca)
+		atc_dedicated_rca_select(atc);
+
 	dai = container_of(atc->daios[LINEIM], struct dai, daio);
 	atc_connect_dai(atc->rsc_mgrs[SRC], dai,
 			(struct src **)&atc->srcs[2],
@@ -1643,12 +1670,14 @@ static const struct ct_atc atc_preset = {
 	.line_rear_unmute = atc_line_rear_unmute,
 	.line_in_unmute = atc_line_in_unmute,
 	.mic_unmute = atc_mic_unmute,
+	.rca_unmute = atc_rca_unmute,
 	.spdif_out_unmute = atc_spdif_out_unmute,
 	.spdif_in_unmute = atc_spdif_in_unmute,
 	.spdif_out_get_status = atc_spdif_out_get_status,
 	.spdif_out_set_status = atc_spdif_out_set_status,
 	.spdif_out_passthru = atc_spdif_out_passthru,
 	.capabilities = atc_capabilities,
+	.dedicated_rca_select = atc_dedicated_rca_select,
 	.output_switch_get = atc_output_switch_get,
 	.output_switch_put = atc_output_switch_put,
 	.mic_source_switch_get = atc_mic_source_switch_get,
diff --git a/sound/pci/ctxfi/ctatc.h b/sound/pci/ctxfi/ctatc.h
index 671edc46bd50..ca0a9d5b86d8 100644
--- a/sound/pci/ctxfi/ctatc.h
+++ b/sound/pci/ctxfi/ctatc.h
@@ -82,6 +82,8 @@ struct ct_atc {
 	const char *chip_name;
 	const char *model_name;
 
+	unsigned char rca_state; /* 0 = dedicated RCA, 1 = 7.1ch Front */
+
 	struct ct_vm *vm; /* device virtual memory manager for this card */
 	int (*map_audio_buffer)(struct ct_atc *atc, struct ct_atc_pcm *apcm);
 	void (*unmap_audio_buffer)(struct ct_atc *atc, struct ct_atc_pcm *apcm);
@@ -113,12 +115,14 @@ struct ct_atc {
 	int (*line_rear_unmute)(struct ct_atc *atc, unsigned char state);
 	int (*line_in_unmute)(struct ct_atc *atc, unsigned char state);
 	int (*mic_unmute)(struct ct_atc *atc, unsigned char state);
+	int (*rca_unmute)(struct ct_atc *atc, unsigned char state);
 	int (*spdif_out_unmute)(struct ct_atc *atc, unsigned char state);
 	int (*spdif_in_unmute)(struct ct_atc *atc, unsigned char state);
 	int (*spdif_out_get_status)(struct ct_atc *atc, unsigned int *status);
 	int (*spdif_out_set_status)(struct ct_atc *atc, unsigned int status);
 	int (*spdif_out_passthru)(struct ct_atc *atc, unsigned char state);
 	struct capabilities (*capabilities)(struct ct_atc *atc);
+	void (*dedicated_rca_select)(struct ct_atc *atc);
 	int (*output_switch_get)(struct ct_atc *atc);
 	int (*output_switch_put)(struct ct_atc *atc, int position);
 	int (*mic_source_switch_get)(struct ct_atc *atc);
diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index f012d47689d1..1c8f8efd836c 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -45,6 +45,7 @@ static const struct daio_rsc_idx idx_20k2[NUM_DAIOTYP] = {
 	[LINEO4] = {.left = 0x70, .right = 0x71},
 	[LINEIM] = {.left = 0x45, .right = 0xc5},
 	[MIC]	 = {.left = 0x55, .right = 0xd5},
+	[RCA]	 = {.left = 0x30, .right = 0x31},
 	[SPDIFOO] = {.left = 0x00, .right = 0x01},
 	[SPDIFIO] = {.left = 0x05, .right = 0x85},
 };
@@ -123,6 +124,7 @@ static unsigned int daio_device_index(enum DAIOTYP type, struct hw *hw)
 		case LINEO4:	return 6;
 		case LINEIM:	return 4;
 		case MIC:	return 5;
+		case RCA:	return 3;
 		default:	return -EINVAL;
 		}
 	default:
diff --git a/sound/pci/ctxfi/ctdaio.h b/sound/pci/ctxfi/ctdaio.h
index b337da2de8b5..99d55f19e3ca 100644
--- a/sound/pci/ctxfi/ctdaio.h
+++ b/sound/pci/ctxfi/ctdaio.h
@@ -31,6 +31,7 @@ enum DAIOTYP {
 	LINEIM,
 	SPDIFIO,	/* S/PDIF In (Flexijack/Optical) on the card */
 	MIC,		/* Dedicated mic on Titanium HD */
+	RCA,
 	SPDIFI1,	/* S/PDIF In on internal Drive Bay */
 	NUM_DAIOTYP
 };
diff --git a/sound/pci/ctxfi/cthardware.h b/sound/pci/ctxfi/cthardware.h
index d29b4e5b3fcc..84ea690763e7 100644
--- a/sound/pci/ctxfi/cthardware.h
+++ b/sound/pci/ctxfi/cthardware.h
@@ -62,6 +62,7 @@ struct card_conf {
 struct capabilities {
 	unsigned int digit_io_switch:1;
 	unsigned int dedicated_mic:1;
+	unsigned int dedicated_rca:1;
 	unsigned int output_switch:1;
 	unsigned int mic_source_switch:1;
 };
diff --git a/sound/pci/ctxfi/cthw20k1.c b/sound/pci/ctxfi/cthw20k1.c
index 60cc1d14453a..ea0a928937b6 100644
--- a/sound/pci/ctxfi/cthw20k1.c
+++ b/sound/pci/ctxfi/cthw20k1.c
@@ -1775,6 +1775,7 @@ static struct capabilities hw_capabilities(struct hw *hw)
 	/* SB073x and Vista compatible cards have no digit IO switch */
 	cap.digit_io_switch = !(hw->model == CTSB073X || hw->model == CTUAA);
 	cap.dedicated_mic = 0;
+	cap.dedicated_rca = 0;
 	cap.output_switch = 0;
 	cap.mic_source_switch = 0;
 
diff --git a/sound/pci/ctxfi/cthw20k2.c b/sound/pci/ctxfi/cthw20k2.c
index 5d39bc943648..214a83977a70 100644
--- a/sound/pci/ctxfi/cthw20k2.c
+++ b/sound/pci/ctxfi/cthw20k2.c
@@ -1930,6 +1930,7 @@ static struct capabilities hw_capabilities(struct hw *hw)
 
 	cap.digit_io_switch = 0;
 	cap.dedicated_mic = hw->model == CTSB1270;
+	cap.dedicated_rca = 0;
 	cap.output_switch = hw->model == CTSB1270;
 	cap.mic_source_switch = hw->model == CTSB1270;
 
diff --git a/sound/pci/ctxfi/ctmixer.c b/sound/pci/ctxfi/ctmixer.c
index 496682613db5..b2b6e7feed48 100644
--- a/sound/pci/ctxfi/ctmixer.c
+++ b/sound/pci/ctxfi/ctmixer.c
@@ -547,8 +547,14 @@ static void do_switch(struct ct_atc *atc, enum CTALSA_MIXER_CTL type, int state)
 		atc->mic_unmute(atc, state);
 	else if (MIXER_SPDIFI_C_S == type)
 		atc->spdif_in_unmute(atc, state);
-	else if (MIXER_WAVEF_P_S == type)
-		atc->line_front_unmute(atc, state);
+	else if (MIXER_WAVEF_P_S == type) {
+		if (cap.dedicated_rca) {
+			atc->rca_unmute(atc, atc->rca_state ? 0 : state);
+			atc->line_front_unmute(atc, atc->rca_state ? state : 0);
+		} else {
+			atc->line_front_unmute(atc, state);
+		}
+	}
 	else if (MIXER_WAVES_P_S == type)
 		atc->line_surround_unmute(atc, state);
 	else if (MIXER_WAVEC_P_S == type)
@@ -612,6 +618,58 @@ static struct snd_kcontrol_new swh_ctl = {
 	.put		= ct_alsa_mix_switch_put
 };
 
+static int dedicated_rca_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *info)
+{
+	static const char *const names[2] = {
+	  "RCA", "Front"
+	};
+
+	return snd_ctl_enum_info(info, 1, 2, names);
+}
+
+static int dedicated_rca_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct ct_atc *atc = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.enumerated.item[0] = atc->rca_state;
+	return 0;
+}
+
+static int dedicated_rca_put(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct ct_atc *atc = snd_kcontrol_chip(kcontrol);
+
+	if (ucontrol->value.enumerated.item[0] > 1)
+		return -EINVAL;
+
+	unsigned char rca_state = ucontrol->value.enumerated.item[0];
+
+	if (rca_state == atc->rca_state)
+		return 0;
+
+	unsigned char state = get_switch_state(atc->mixer,
+		MIXER_WAVEF_P_S);
+	do_switch(atc, MIXER_WAVEF_P_S, 0);
+
+	atc->rca_state = rca_state;
+	atc->dedicated_rca_select(atc);
+
+	do_switch(atc, MIXER_WAVEF_P_S, state);
+
+	return 1;
+}
+
+static struct snd_kcontrol_new rca_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Dedicated Output Playback Enum",
+	.info = dedicated_rca_info,
+	.get = dedicated_rca_get,
+	.put = dedicated_rca_put,
+};
+
 static int ct_spdif_info(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_info *uinfo)
 {
@@ -784,7 +842,17 @@ static int ct_mixer_kcontrols_create(struct ct_mixer *mixer)
 		if (err)
 			return err;
 	}
-	atc->line_front_unmute(atc, 1);
+
+	if (cap.dedicated_rca) {
+		err = ct_mixer_kcontrol_new(mixer, &rca_ctl);
+		if (err)
+			return err;
+
+		atc->line_front_unmute(atc, 0);
+		atc->rca_unmute(atc, 1);
+	} else {
+		atc->line_front_unmute(atc, 1);
+	}
 	set_switch_state(mixer, MIXER_WAVEF_P_S, 1);
 	atc->line_surround_unmute(atc, 0);
 	set_switch_state(mixer, MIXER_WAVES_P_S, 0);
-- 
2.52.0

