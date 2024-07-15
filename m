Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44561891A4
	for <linux-sound@vger.kernel.org>; Mon, 15 Jul 2024 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046980; cv=none; b=R7gwwXNcVbWcgixknqNw/umy6JxFfNbefwLjCt1Zf3jZ54/oMueZb2tzyYxngNY4chsmqttUTbyiWJTa9En+HaWNB+Qm70u/yDWRPEQ1c/yfsaLRtTar4L8W6LvUlqGR0y++jTgtHh9vHZTj68VaV4BNhu5fhMWepy0N3fKSHEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046980; c=relaxed/simple;
	bh=HiHU+Ap+AwZ92Jntt372IfkaoYWhZGwDWkoUCjtOlNo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qtZLY+S4v5pzkRaBuDVOqHHTlPU73nCEBaXv2rahmsKKNFxySoSanBN+PTxBI1Wd+oU57d1dQU42HVd8UODBNPwmG69Rxg2o+IxFmVJI1iKx8M6dYcE8niCOY9mlTAJS3Mcgf5SBtY5vlWdLiZfR1qcytoaoEilPRVsqi3bISNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t/E5SANN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6V/cwVF3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QC8U9Uds; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L/Inusqs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t/E5SANN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6V/cwVF3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QC8U9Uds";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L/Inusqs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0D8821BB8;
	Mon, 15 Jul 2024 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721046976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ByJcO28p9Zg9vtAvtDfX9W1ErU4Ux4/0QlzNM/qAG60=;
	b=t/E5SANNTstJuLJl05fMX2pfIv+V8hJ1t7U5nXhMyLazxwGkt4T2ipKHsU7FrWLrgaCpWO
	nGLZtrsRIT3S4z1I6kdlVh62W/vlhbMBrrJ2FD+ZNl7/ow25EA1ec4IuXxq4dkKOFrrSW/
	bwCJ/u2tikJ8QSAyMvcqpD0ajcKzasM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721046976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ByJcO28p9Zg9vtAvtDfX9W1ErU4Ux4/0QlzNM/qAG60=;
	b=6V/cwVF3yGW0ysSSYBUkxZM2WYiPioUAE6Awej/shzX7WJkdnAYp8xACQzajYDH6cJFFkL
	p84H9wa+D9fsOwAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QC8U9Uds;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="L/Inusqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721046974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ByJcO28p9Zg9vtAvtDfX9W1ErU4Ux4/0QlzNM/qAG60=;
	b=QC8U9Uds/Qjqn6tMczraUFiOlfXG9HwWkMFUAsSuvtjTZBz1pFKdIXEOes/e7JPjYIpFg3
	VN2KfsDtcC2CP7ngWr5E90XXSLET/nrTdKjVJP6SP9WRZbnjnEO51Lue8SVrphzOkr2bN7
	F1d0cJvibEj3oU38ZlTXQ1/FYSsKUJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721046974;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ByJcO28p9Zg9vtAvtDfX9W1ErU4Ux4/0QlzNM/qAG60=;
	b=L/Inusqsse+0PUUpimxukNL2ILG0F+yfGbNLNx3TGPpMT8aNIpuIbxBPPVvficLmbqclha
	oWOuMzvMKN0WPIDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2D3A137EB;
	Mon, 15 Jul 2024 12:36:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G+MPK74XlWb4RQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Jul 2024 12:36:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb: Use BIT() for bit values
Date: Mon, 15 Jul 2024 14:36:45 +0200
Message-ID: <20240715123646.26679-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Queue-Id: C0D8821BB8

Instead of the explicit "1 << x", use BIT() macro for one bit values.
This will improve the readability and also avoids the possible bad
value for 31bit shift.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/format.c       | 17 +++++++----------
 sound/usb/mixer.c        | 38 +++++++++++++++++++-------------------
 sound/usb/mixer_quirks.c | 20 ++++++++++----------
 3 files changed, 36 insertions(+), 39 deletions(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 3b45d0ee7693..1bb6a455a1b4 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -82,13 +82,13 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 	fp->fmt_bits = sample_width;
 
 	if ((pcm_formats == 0) &&
-	    (format == 0 || format == (1 << UAC_FORMAT_TYPE_I_UNDEFINED))) {
+	    (format == 0 || format == BIT(UAC_FORMAT_TYPE_I_UNDEFINED))) {
 		/* some devices don't define this correctly... */
 		usb_audio_info(chip, "%u:%d : format type 0 is detected, processed as PCM\n",
 			fp->iface, fp->altsetting);
-		format = 1 << UAC_FORMAT_TYPE_I_PCM;
+		format = BIT(UAC_FORMAT_TYPE_I_PCM);
 	}
-	if (format & (1 << UAC_FORMAT_TYPE_I_PCM)) {
+	if (format & BIT(UAC_FORMAT_TYPE_I_PCM)) {
 		if (((chip->usb_id == USB_ID(0x0582, 0x0016)) ||
 		     /* Edirol SD-90 */
 		     (chip->usb_id == USB_ID(0x0582, 0x000c))) &&
@@ -128,7 +128,7 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 			break;
 		}
 	}
-	if (format & (1 << UAC_FORMAT_TYPE_I_PCM8)) {
+	if (format & BIT(UAC_FORMAT_TYPE_I_PCM8)) {
 		/* Dallas DS4201 workaround: it advertises U8 format, but really
 		   supports S8. */
 		if (chip->usb_id == USB_ID(0x04fa, 0x4201))
@@ -136,15 +136,12 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 		else
 			pcm_formats |= SNDRV_PCM_FMTBIT_U8;
 	}
-	if (format & (1 << UAC_FORMAT_TYPE_I_IEEE_FLOAT)) {
+	if (format & BIT(UAC_FORMAT_TYPE_I_IEEE_FLOAT))
 		pcm_formats |= SNDRV_PCM_FMTBIT_FLOAT_LE;
-	}
-	if (format & (1 << UAC_FORMAT_TYPE_I_ALAW)) {
+	if (format & BIT(UAC_FORMAT_TYPE_I_ALAW))
 		pcm_formats |= SNDRV_PCM_FMTBIT_A_LAW;
-	}
-	if (format & (1 << UAC_FORMAT_TYPE_I_MULAW)) {
+	if (format & BIT(UAC_FORMAT_TYPE_I_MULAW))
 		pcm_formats |= SNDRV_PCM_FMTBIT_MU_LAW;
-	}
 	if (format & ~0x3f) {
 		usb_audio_info(chip,
 			 "%u:%d : unsupported format bits %#llx\n",
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index fd6b94b3b638..c00009b545c0 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -433,7 +433,7 @@ int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
 {
 	int err;
 
-	if (cval->cached & (1 << channel)) {
+	if (cval->cached & BIT(channel)) {
 		*value = cval->cache_val[index];
 		return 0;
 	}
@@ -445,7 +445,7 @@ int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
 				      cval->control, channel, err);
 		return err;
 	}
-	cval->cached |= 1 << channel;
+	cval->cached |= BIT(channel);
 	cval->cache_val[index] = *value;
 	return 0;
 }
@@ -522,7 +522,7 @@ int snd_usb_set_cur_mix_value(struct usb_mixer_elem_info *cval, int channel,
 	int err;
 	unsigned int read_only = (channel == 0) ?
 		cval->master_readonly :
-		cval->ch_readonly & (1 << (channel - 1));
+		cval->ch_readonly & BIT(channel - 1);
 
 	if (read_only) {
 		usb_audio_dbg(cval->head.mixer->chip,
@@ -536,7 +536,7 @@ int snd_usb_set_cur_mix_value(struct usb_mixer_elem_info *cval, int channel,
 					  value);
 	if (err < 0)
 		return err;
-	cval->cached |= 1 << channel;
+	cval->cached |= BIT(channel);
 	cval->cache_val[index] = value;
 	return 0;
 }
@@ -1253,7 +1253,7 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 		int minchn = 0;
 		if (cval->cmask) {
 			for (i = 0; i < MAX_CHANNELS; i++)
-				if (cval->cmask & (1 << i)) {
+				if (cval->cmask & BIT(i)) {
 					minchn = i + 1;
 					break;
 				}
@@ -1358,7 +1358,7 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 	} else {
 		idx = 0;
 		for (i = 0; i < MAX_CHANNELS; i++) {
-			if (cval->cmask & (1 << i)) {
+			if (cval->cmask & BIT(i)) {
 				init_cur_mix_raw(cval, i + 1, idx);
 				idx++;
 			}
@@ -1416,7 +1416,7 @@ static int mixer_ctl_feature_get(struct snd_kcontrol *kcontrol,
 	if (cval->cmask) {
 		cnt = 0;
 		for (c = 0; c < MAX_CHANNELS; c++) {
-			if (!(cval->cmask & (1 << c)))
+			if (!(cval->cmask & BIT(c)))
 				continue;
 			err = snd_usb_get_cur_mix_value(cval, c + 1, cnt, &val);
 			if (err < 0)
@@ -1448,7 +1448,7 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 	if (cval->cmask) {
 		cnt = 0;
 		for (c = 0; c < MAX_CHANNELS; c++) {
-			if (!(cval->cmask & (1 << c)))
+			if (!(cval->cmask & BIT(c)))
 				continue;
 			err = snd_usb_get_cur_mix_value(cval, c + 1, cnt, &oval);
 			if (err < 0)
@@ -1700,7 +1700,7 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 	} else {
 		int i, c = 0;
 		for (i = 0; i < 16; i++)
-			if (ctl_mask & (1 << i))
+			if (ctl_mask & BIT(i))
 				c++;
 		cval->channels = c;
 		cval->ch_readonly = readonly_mask;
@@ -2060,8 +2060,8 @@ static int parse_audio_feature_unit(struct mixer_build *state, int unitid,
 
 				mask = snd_usb_combine_bytes(bmaControls +
 							     csize * (j+1), csize);
-				if (mask & (1 << i))
-					ch_bits |= (1 << j);
+				if (mask & BIT(i))
+					ch_bits |= BIT(j);
 			}
 			/* audio class v1 controls are never read-only */
 
@@ -2072,7 +2072,7 @@ static int parse_audio_feature_unit(struct mixer_build *state, int unitid,
 			if (ch_bits & 1)
 				build_feature_ctl(state, _ftr, ch_bits, control,
 						  &iterm, unitid, 0);
-			if (master_bits & (1 << i))
+			if (master_bits & BIT(i))
 				build_feature_ctl(state, _ftr, 0, control,
 						  &iterm, unitid, 0);
 		}
@@ -2088,9 +2088,9 @@ static int parse_audio_feature_unit(struct mixer_build *state, int unitid,
 				mask = snd_usb_combine_bytes(bmaControls +
 							     csize * (j+1), csize);
 				if (uac_v2v3_control_is_readable(mask, control)) {
-					ch_bits |= (1 << j);
+					ch_bits |= BIT(j);
 					if (!uac_v2v3_control_is_writeable(mask, control))
-						ch_read_only |= (1 << j);
+						ch_read_only |= BIT(j);
 				}
 			}
 
@@ -2181,7 +2181,7 @@ static void build_mixer_unit_ctl(struct mixer_build *state,
 		__u8 *c = uac_mixer_unit_bmControls(desc, state->mixer->protocol);
 
 		if (check_matrix_bitmap(c, in_ch, i, num_outs)) {
-			cval->cmask |= (1 << i);
+			cval->cmask |= BIT(i);
 			cval->channels++;
 		}
 	}
@@ -2504,7 +2504,7 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 
 		if (state->mixer->protocol == UAC_VERSION_1) {
 			if (!(controls[valinfo->control / 8] &
-					(1 << ((valinfo->control % 8) - 1))))
+			      BIT((valinfo->control % 8) - 1)))
 				continue;
 		} else { /* UAC_VERSION_2/3 */
 			if (!uac_v2v3_control_is_readable(controls[valinfo->control / 8],
@@ -3448,7 +3448,7 @@ static void snd_usb_mixer_interrupt_v2(struct usb_mixer_interface *mixer,
 		case UAC2_CS_CUR:
 			/* invalidate cache, so the value is read from the device */
 			if (channel)
-				info->cached &= ~(1 << channel);
+				info->cached &= ~BIT(channel);
 			else /* master channel */
 				info->cached = 0;
 
@@ -3684,9 +3684,9 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
 	if (cval->cmask) {
 		idx = 0;
 		for (c = 0; c < MAX_CHANNELS; c++) {
-			if (!(cval->cmask & (1 << c)))
+			if (!(cval->cmask & BIT(c)))
 				continue;
-			if (cval->cached & (1 << (c + 1))) {
+			if (cval->cached & BIT(c + 1)) {
 				err = snd_usb_set_cur_mix_value(cval, c + 1, idx,
 							cval->cache_val[idx]);
 				if (err < 0)
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 212b5e6443d8..2bc344cf54a8 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -1139,7 +1139,7 @@ static int snd_ftu_create_volume_ctls(struct usb_mixer_interface *mixer)
 	for (out = 0; out < 8; out++) {
 		control = out + 1;
 		for (in = 0; in < 8; in++) {
-			cmask = 1 << in;
+			cmask = BIT(in);
 			snprintf(name, sizeof(name),
 				"AIn%d - Out%d Capture Volume",
 				in  + 1, out + 1);
@@ -1150,7 +1150,7 @@ static int snd_ftu_create_volume_ctls(struct usb_mixer_interface *mixer)
 				return err;
 		}
 		for (in = 8; in < 16; in++) {
-			cmask = 1 << in;
+			cmask = BIT(in);
 			snprintf(name, sizeof(name),
 				"DIn%d - Out%d Playback Volume",
 				in - 7, out + 1);
@@ -1215,7 +1215,7 @@ static int snd_ftu_create_effect_return_ctls(struct usb_mixer_interface *mixer)
 	const unsigned int control = 7;
 
 	for (ch = 0; ch < 4; ++ch) {
-		cmask = 1 << ch;
+		cmask = BIT(ch);
 		snprintf(name, sizeof(name),
 			"Effect Return %d Volume", ch + 1);
 		err = snd_create_std_mono_ctl(mixer, id, control,
@@ -1239,7 +1239,7 @@ static int snd_ftu_create_effect_send_ctls(struct usb_mixer_interface *mixer)
 	const unsigned int control = 9;
 
 	for (ch = 0; ch < 8; ++ch) {
-		cmask = 1 << ch;
+		cmask = BIT(ch);
 		snprintf(name, sizeof(name),
 			"Effect Send AIn%d Volume", ch + 1);
 		err = snd_create_std_mono_ctl(mixer, id, control, cmask,
@@ -1249,7 +1249,7 @@ static int snd_ftu_create_effect_send_ctls(struct usb_mixer_interface *mixer)
 			return err;
 	}
 	for (ch = 8; ch < 16; ++ch) {
-		cmask = 1 << ch;
+		cmask = BIT(ch);
 		snprintf(name, sizeof(name),
 			"Effect Send DIn%d Volume", ch - 7);
 		err = snd_create_std_mono_ctl(mixer, id, control, cmask,
@@ -1352,7 +1352,7 @@ static int snd_c400_create_vol_ctls(struct usb_mixer_interface *mixer)
 					chan - num_outs + 1, out + 1);
 			}
 
-			cmask = (out == 0) ? 0 : 1 << (out - 1);
+			cmask = (out == 0) ? 0 : BIT(out - 1);
 			offset = chan * num_outs;
 			err = snd_create_std_mono_ctl_offset(mixer, id, control,
 						cmask, val_type, offset, name,
@@ -1438,7 +1438,7 @@ static int snd_c400_create_effect_vol_ctls(struct usb_mixer_interface *mixer)
 				chan - num_outs + 1);
 		}
 
-		cmask = (chan == 0) ? 0 : 1 << (chan - 1);
+		cmask = (chan == 0) ? 0 : BIT(chan - 1);
 		err = snd_create_std_mono_ctl(mixer, id, control,
 						cmask, val_type, name,
 						&snd_usb_mixer_vol_tlv);
@@ -1480,7 +1480,7 @@ static int snd_c400_create_effect_ret_vol_ctls(struct usb_mixer_interface *mixer
 			chan + 1);
 
 		cmask = (chan == 0) ? 0 :
-			1 << (chan + (chan % 2) * num_outs - 1);
+			BIT(chan + (chan % 2) * num_outs - 1);
 		err = snd_create_std_mono_ctl_offset(mixer, id, control,
 						cmask, val_type, offset, name,
 						&snd_usb_mixer_vol_tlv);
@@ -2568,12 +2568,12 @@ static int snd_bbfpro_ctl_update(struct usb_mixer_interface *mixer, u8 reg,
 			usb_idx = 3;
 			usb_val = value ? 3 : 0;
 		} else {
-			usb_idx = 1 << index;
+			usb_idx = BIT(index);
 			usb_val = value ? usb_idx : 0;
 		}
 	} else {
 		usb_req = SND_BBFPRO_USBREQ_CTL_REG2;
-		usb_idx = 1 << index;
+		usb_idx = BIT(index);
 		usb_val = value ? usb_idx : 0;
 	}
 
-- 
2.43.0

