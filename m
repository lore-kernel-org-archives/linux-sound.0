Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9142D1F3B98
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906921; cv=none; b=aWNnTqMrEN0ZKQTncYDG7RtI/cCHep+V45R3thzKXq5I3xx+M34+1jDgogLeEEJ9HY/xAc2iCJplqz+OV5A9Lq16/DEqbHGGHqMy4GncIZF2zlDPoir5RrNDEKXqdDa8roOurfw/adQOMOVQWUNwEGSAPMrOIxwL/uWnEF9Tr5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906921; c=relaxed/simple;
	bh=YS9MgRrRZSpc785KyfV/mBP5nkNwEb0+MbSgwv3NHYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfdU4J2I52x/55GJfvdYVfjaVhn59T/dW9cgeCsaRJb78NIVSWjuGbdxPjsijlvceRGcImw2bCk4YK3mvJ4a65jjuxWvVjqXx6ShvtyAe11MXFonY6r8Kj0ac60E95779GWdphoPZxFGWZ5aOdtm2yMx3U54bl3HGq3ARAX7fr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zt5asu7x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KeHfk2QJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zt5asu7x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KeHfk2QJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zt5asu7x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KeHfk2QJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zt5asu7x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KeHfk2QJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A1F633E39;
	Mon, 11 Aug 2025 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hT27mOuPfoKdGY0u6FcqYcrNF/VD0kf3y92LgGXszlU=;
	b=Zt5asu7xzkQ0e/58xyUlvw5k969EyxXbsfTHo9HCiL1G6mzDQsQ/N0A5eOUpQxGd2rOrns
	fcDg9hUtkjyvT1fflQggyHwIBKrwFnziiWq3hKo6Lt1T1ye8zDSx71cuI4bkQduvf2oThy
	D3fWBFd+Rc2jAAHjEjNmwabULiQXhr4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hT27mOuPfoKdGY0u6FcqYcrNF/VD0kf3y92LgGXszlU=;
	b=KeHfk2QJ2wCTDdet02fQ0ORBf1TJAw2nvTgopxyDSa4yxQDTQgunSfzohI39toUOdkIV/W
	IqELtF9sbQa3xrBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hT27mOuPfoKdGY0u6FcqYcrNF/VD0kf3y92LgGXszlU=;
	b=Zt5asu7xzkQ0e/58xyUlvw5k969EyxXbsfTHo9HCiL1G6mzDQsQ/N0A5eOUpQxGd2rOrns
	fcDg9hUtkjyvT1fflQggyHwIBKrwFnziiWq3hKo6Lt1T1ye8zDSx71cuI4bkQduvf2oThy
	D3fWBFd+Rc2jAAHjEjNmwabULiQXhr4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hT27mOuPfoKdGY0u6FcqYcrNF/VD0kf3y92LgGXszlU=;
	b=KeHfk2QJ2wCTDdet02fQ0ORBf1TJAw2nvTgopxyDSa4yxQDTQgunSfzohI39toUOdkIV/W
	IqELtF9sbQa3xrBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3335213479;
	Mon, 11 Aug 2025 10:08:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mM5MCw/BmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 10/25] ALSA: hda/hdmi: Use guard() for mutex locks
Date: Mon, 11 Aug 2025 12:07:44 +0200
Message-ID: <20250811100807.7962-11-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/hdmi/hdmi.c       | 170 +++++++++++------------------
 sound/hda/codecs/hdmi/nvhdmi-mcp.c |   3 +-
 2 files changed, 63 insertions(+), 110 deletions(-)

diff --git a/sound/hda/codecs/hdmi/hdmi.c b/sound/hda/codecs/hdmi/hdmi.c
index 4b5d20f0fbe4..d02a47562208 100644
--- a/sound/hda/codecs/hdmi/hdmi.c
+++ b/sound/hda/codecs/hdmi/hdmi.c
@@ -145,18 +145,15 @@ static int hdmi_eld_ctl_info(struct snd_kcontrol *kcontrol,
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
 
 	pcm_idx = kcontrol->private_value;
-	mutex_lock(&spec->pcm_lock);
+	guard(mutex)(&spec->pcm_lock);
 	per_pin = pcm_idx_to_pin(spec, pcm_idx);
 	if (!per_pin) {
 		/* no pin is bound to the pcm */
 		uinfo->count = 0;
-		goto unlock;
+		return 0;
 	}
 	eld = &per_pin->sink_eld;
 	uinfo->count = eld->eld_valid ? eld->eld_size : 0;
-
- unlock:
-	mutex_unlock(&spec->pcm_lock);
 	return 0;
 }
 
@@ -168,24 +165,22 @@ static int hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
 	struct hdmi_spec_per_pin *per_pin;
 	struct hdmi_eld *eld;
 	int pcm_idx;
-	int err = 0;
 
 	pcm_idx = kcontrol->private_value;
-	mutex_lock(&spec->pcm_lock);
+	guard(mutex)(&spec->pcm_lock);
 	per_pin = pcm_idx_to_pin(spec, pcm_idx);
 	if (!per_pin) {
 		/* no pin is bound to the pcm */
 		memset(ucontrol->value.bytes.data, 0,
 		       ARRAY_SIZE(ucontrol->value.bytes.data));
-		goto unlock;
+		return 0;
 	}
 
 	eld = &per_pin->sink_eld;
 	if (eld->eld_size > ARRAY_SIZE(ucontrol->value.bytes.data) ||
 	    eld->eld_size > ELD_MAX_SIZE) {
 		snd_BUG();
-		err = -EINVAL;
-		goto unlock;
+		return -EINVAL;
 	}
 
 	memset(ucontrol->value.bytes.data, 0,
@@ -193,10 +188,7 @@ static int hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
 	if (eld->eld_valid)
 		memcpy(ucontrol->value.bytes.data, eld->eld_buffer,
 		       eld->eld_size);
-
- unlock:
-	mutex_unlock(&spec->pcm_lock);
-	return err;
+	return 0;
 }
 
 static const struct snd_kcontrol_new eld_bytes_ctl = {
@@ -295,10 +287,9 @@ static void print_eld_info(struct snd_info_entry *entry,
 {
 	struct hdmi_spec_per_pin *per_pin = entry->private_data;
 
-	mutex_lock(&per_pin->lock);
+	guard(mutex)(&per_pin->lock);
 	snd_hdmi_print_eld_info(&per_pin->sink_eld, buffer, per_pin->pin_nid,
 				per_pin->dev_id, per_pin->cvt_nid);
-	mutex_unlock(&per_pin->lock);
 }
 
 static void write_eld_info(struct snd_info_entry *entry,
@@ -306,9 +297,8 @@ static void write_eld_info(struct snd_info_entry *entry,
 {
 	struct hdmi_spec_per_pin *per_pin = entry->private_data;
 
-	mutex_lock(&per_pin->lock);
+	guard(mutex)(&per_pin->lock);
 	snd_hdmi_write_eld_info(&per_pin->sink_eld, buffer);
-	mutex_unlock(&per_pin->lock);
 }
 
 static int eld_proc_new(struct hdmi_spec_per_pin *per_pin, int index)
@@ -599,9 +589,8 @@ void snd_hda_hdmi_check_presence_and_report(struct hda_codec *codec,
 
 	if (pin_idx < 0)
 		return;
-	mutex_lock(&spec->pcm_lock);
+	guard(mutex)(&spec->pcm_lock);
 	hdmi_present_sense(get_pin(spec, pin_idx), 1);
-	mutex_unlock(&spec->pcm_lock);
 }
 EXPORT_SYMBOL_NS_GPL(snd_hda_hdmi_check_presence_and_report,
 		     "SND_HDA_CODEC_HDMI");
@@ -907,19 +896,17 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
 	if (pcm_idx < 0)
 		return -EINVAL;
 
-	mutex_lock(&spec->pcm_lock);
+	guard(mutex)(&spec->pcm_lock);
 	pin_idx = hinfo_to_pin_index(codec, hinfo);
 	/* no pin is assigned to the PCM
 	 * PA need pcm open successfully when probe
 	 */
-	if (pin_idx < 0) {
-		err = hdmi_pcm_open_no_pin(hinfo, codec, substream);
-		goto unlock;
-	}
+	if (pin_idx < 0)
+		return hdmi_pcm_open_no_pin(hinfo, codec, substream);
 
 	err = hdmi_choose_cvt(codec, pin_idx, &cvt_idx, false);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	per_cvt = get_cvt(spec, cvt_idx);
 	/* Claim converter */
@@ -960,8 +947,7 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
 			per_cvt->assigned = false;
 			hinfo->nid = 0;
 			snd_hda_spdif_ctls_unassign(codec, pcm_idx);
-			err = -ENODEV;
-			goto unlock;
+			return -ENODEV;
 		}
 	}
 
@@ -973,9 +959,7 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
 
 	snd_pcm_hw_constraint_step(substream->runtime, 0,
 				   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
- unlock:
-	mutex_unlock(&spec->pcm_lock);
-	return err;
+	return 0;
 }
 
 /*
@@ -1282,7 +1266,7 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 
 	present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
 
-	mutex_lock(&per_pin->lock);
+	guard(mutex)(&per_pin->lock);
 	eld->monitor_present = !!(present & AC_PINSENSE_PRESENCE);
 	if (eld->monitor_present)
 		eld->eld_valid  = !!(present & AC_PINSENSE_ELDV);
@@ -1300,7 +1284,6 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	}
 
 	update_eld(codec, per_pin, eld, repoll);
-	mutex_unlock(&per_pin->lock);
 }
 
 static void silent_stream_enable(struct hda_codec *codec,
@@ -1322,19 +1305,18 @@ static void silent_stream_enable(struct hda_codec *codec,
 		return;
 	}
 
-	mutex_lock(&per_pin->lock);
+	guard(mutex)(&per_pin->lock);
 
 	if (per_pin->setup) {
 		codec_dbg(codec, "hdmi: PCM already open, no silent stream\n");
-		err = -EBUSY;
-		goto unlock_out;
+		return;
 	}
 
 	pin_idx = pin_id_to_pin_index(codec, per_pin->pin_nid, per_pin->dev_id);
 	err = hdmi_choose_cvt(codec, pin_idx, &cvt_idx, true);
 	if (err) {
 		codec_err(codec, "hdmi: no free converter to enable silent mode\n");
-		goto unlock_out;
+		return;
 	}
 
 	per_cvt = get_cvt(spec, cvt_idx);
@@ -1354,9 +1336,6 @@ static void silent_stream_enable(struct hda_codec *codec,
 	pin_cvt_fixup(codec, per_pin, 0);
 
 	spec->ops.silent_stream(codec, per_pin, true);
-
- unlock_out:
-	mutex_unlock(&per_pin->lock);
 }
 
 static void silent_stream_disable(struct hda_codec *codec,
@@ -1374,9 +1353,9 @@ static void silent_stream_disable(struct hda_codec *codec,
 		return;
 	}
 
-	mutex_lock(&per_pin->lock);
+	guard(mutex)(&per_pin->lock);
 	if (!per_pin->silent_stream)
-		goto unlock_out;
+		return;
 
 	codec_dbg(codec, "HDMI: disable silent stream on pin-NID=0x%x cvt-NID=0x%x\n",
 		  per_pin->pin_nid, per_pin->cvt_nid);
@@ -1391,9 +1370,6 @@ static void silent_stream_disable(struct hda_codec *codec,
 
 	per_pin->cvt_nid = 0;
 	per_pin->silent_stream = false;
-
- unlock_out:
-	mutex_unlock(&per_pin->lock);
 }
 
 /* update ELD and jack state via audio component */
@@ -1404,16 +1380,16 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
 	struct hdmi_eld *eld = &spec->temp_eld;
 	bool monitor_prev, monitor_next;
 
-	mutex_lock(&per_pin->lock);
-	eld->monitor_present = false;
-	monitor_prev = per_pin->sink_eld.monitor_present;
-	eld->eld_size = snd_hdac_acomp_get_eld(&codec->core, per_pin->pin_nid,
-				      per_pin->dev_id, &eld->monitor_present,
-				      eld->eld_buffer, ELD_MAX_SIZE);
-	eld->eld_valid = (eld->eld_size > 0);
-	update_eld(codec, per_pin, eld, 0);
-	monitor_next = per_pin->sink_eld.monitor_present;
-	mutex_unlock(&per_pin->lock);
+	scoped_guard(mutex, &per_pin->lock) {
+		eld->monitor_present = false;
+		monitor_prev = per_pin->sink_eld.monitor_present;
+		eld->eld_size = snd_hdac_acomp_get_eld(&codec->core, per_pin->pin_nid,
+						       per_pin->dev_id, &eld->monitor_present,
+						       eld->eld_buffer, ELD_MAX_SIZE);
+		eld->eld_valid = (eld->eld_size > 0);
+		update_eld(codec, per_pin, eld, 0);
+		monitor_next = per_pin->sink_eld.monitor_present;
+	}
 
 	if (spec->silent_stream_type) {
 		if (!monitor_prev && monitor_next)
@@ -1449,9 +1425,8 @@ static void hdmi_repoll_eld(struct work_struct *work)
 	if (per_pin->repoll_count++ > 6)
 		per_pin->repoll_count = 0;
 
-	mutex_lock(&spec->pcm_lock);
+	guard(mutex)(&spec->pcm_lock);
 	hdmi_present_sense(per_pin, per_pin->repoll_count);
-	mutex_unlock(&spec->pcm_lock);
 }
 
 static int hdmi_add_pin(struct hda_codec *codec, hda_nid_t pin_nid)
@@ -1645,20 +1620,15 @@ EXPORT_SYMBOL_NS_GPL(snd_hda_hdmi_parse_codec, "SND_HDA_CODEC_HDMI");
 static bool check_non_pcm_per_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 {
 	struct hda_spdif_out *spdif;
-	bool non_pcm;
 
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	spdif = snd_hda_spdif_out_of_nid(codec, cvt_nid);
 	/* Add sanity check to pass klockwork check.
 	 * This should never happen.
 	 */
-	if (WARN_ON(spdif == NULL)) {
-		mutex_unlock(&codec->spdif_mutex);
+	if (WARN_ON(spdif == NULL))
 		return true;
-	}
-	non_pcm = !!(spdif->status & IEC958_AES0_NONAUDIO);
-	mutex_unlock(&codec->spdif_mutex);
-	return non_pcm;
+	return !!(spdif->status & IEC958_AES0_NONAUDIO);
 }
 
 /*
@@ -1678,9 +1648,8 @@ int snd_hda_hdmi_generic_pcm_prepare(struct hda_pcm_stream *hinfo,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	bool non_pcm;
 	int pinctl, stripe;
-	int err = 0;
 
-	mutex_lock(&spec->pcm_lock);
+	guard(mutex)(&spec->pcm_lock);
 	pin_idx = hinfo_to_pin_index(codec, hinfo);
 	if (pin_idx < 0) {
 		/* when pcm is not bound to a pin skip pin setup and return 0
@@ -1689,7 +1658,7 @@ int snd_hda_hdmi_generic_pcm_prepare(struct hda_pcm_stream *hinfo,
 		pin_cvt_fixup(codec, NULL, cvt_nid);
 		snd_hda_codec_setup_stream(codec, cvt_nid,
 					stream_tag, 0, format);
-		goto unlock;
+		return 0;
 	}
 
 	per_pin = get_pin(spec, pin_idx);
@@ -1711,20 +1680,20 @@ int snd_hda_hdmi_generic_pcm_prepare(struct hda_pcm_stream *hinfo,
 					 per_pin->dev_id, runtime->rate);
 
 	non_pcm = check_non_pcm_per_cvt(codec, cvt_nid);
-	mutex_lock(&per_pin->lock);
-	per_pin->channels = substream->runtime->channels;
-	per_pin->setup = true;
+	scoped_guard(mutex, &per_pin->lock) {
+		per_pin->channels = substream->runtime->channels;
+		per_pin->setup = true;
 
-	if (get_wcaps(codec, cvt_nid) & AC_WCAP_STRIPE) {
-		stripe = snd_hdac_get_stream_stripe_ctl(&codec->bus->core,
-							substream);
-		snd_hda_codec_write(codec, cvt_nid, 0,
-				    AC_VERB_SET_STRIPE_CONTROL,
-				    stripe);
+		if (get_wcaps(codec, cvt_nid) & AC_WCAP_STRIPE) {
+			stripe = snd_hdac_get_stream_stripe_ctl(&codec->bus->core,
+								substream);
+			snd_hda_codec_write(codec, cvt_nid, 0,
+					    AC_VERB_SET_STRIPE_CONTROL,
+					    stripe);
+		}
+
+		snd_hda_hdmi_setup_audio_infoframe(codec, per_pin, non_pcm);
 	}
-
-	snd_hda_hdmi_setup_audio_infoframe(codec, per_pin, non_pcm);
-	mutex_unlock(&per_pin->lock);
 	if (spec->dyn_pin_out) {
 		snd_hda_set_dev_select(codec, per_pin->pin_nid,
 				       per_pin->dev_id);
@@ -1736,11 +1705,8 @@ int snd_hda_hdmi_generic_pcm_prepare(struct hda_pcm_stream *hinfo,
 	}
 
 	/* snd_hda_set_dev_select() has been called before */
-	err = spec->ops.setup_stream(codec, cvt_nid, per_pin->pin_nid,
-				     per_pin->dev_id, stream_tag, format);
- unlock:
-	mutex_unlock(&spec->pcm_lock);
-	return err;
+	return spec->ops.setup_stream(codec, cvt_nid, per_pin->pin_nid,
+				      per_pin->dev_id, stream_tag, format);
 }
 EXPORT_SYMBOL_NS_GPL(snd_hda_hdmi_generic_pcm_prepare, "SND_HDA_CODEC_HDMI");
 
@@ -1762,20 +1728,15 @@ static int hdmi_pcm_close(struct hda_pcm_stream *hinfo,
 	struct hdmi_spec_per_cvt *per_cvt;
 	struct hdmi_spec_per_pin *per_pin;
 	int pinctl;
-	int err = 0;
 
-	mutex_lock(&spec->pcm_lock);
+	guard(mutex)(&spec->pcm_lock);
 	if (hinfo->nid) {
 		pcm_idx = hinfo_to_pcm_index(codec, hinfo);
-		if (snd_BUG_ON(pcm_idx < 0)) {
-			err = -EINVAL;
-			goto unlock;
-		}
+		if (snd_BUG_ON(pcm_idx < 0))
+			return -EINVAL;
 		cvt_idx = cvt_nid_to_cvt_index(codec, hinfo->nid);
-		if (snd_BUG_ON(cvt_idx < 0)) {
-			err = -EINVAL;
-			goto unlock;
-		}
+		if (snd_BUG_ON(cvt_idx < 0))
+			return -EINVAL;
 		per_cvt = get_cvt(spec, cvt_idx);
 		per_cvt->assigned = false;
 		hinfo->nid = 0;
@@ -1790,7 +1751,7 @@ static int hdmi_pcm_close(struct hda_pcm_stream *hinfo,
 		 * hdmi_pcm_open()
 		 */
 		if (pin_idx < 0)
-			goto unlock;
+			return 0;
 
 		per_pin = get_pin(spec, pin_idx);
 
@@ -1804,19 +1765,15 @@ static int hdmi_pcm_close(struct hda_pcm_stream *hinfo,
 					    pinctl & ~PIN_OUT);
 		}
 
-		mutex_lock(&per_pin->lock);
+		guard(mutex)(&per_pin->lock);
 		per_pin->chmap_set = false;
 		memset(per_pin->chmap, 0, sizeof(per_pin->chmap));
 
 		per_pin->setup = false;
 		per_pin->channels = 0;
-		mutex_unlock(&per_pin->lock);
 	}
 
-unlock:
-	mutex_unlock(&spec->pcm_lock);
-
-	return err;
+	return 0;
 }
 
 static const struct hda_pcm_ops generic_ops = {
@@ -1861,12 +1818,11 @@ static void hdmi_set_chmap(struct hdac_device *hdac, int pcm_idx,
 
 	if (!per_pin)
 		return;
-	mutex_lock(&per_pin->lock);
+	guard(mutex)(&per_pin->lock);
 	per_pin->chmap_set = true;
 	memcpy(per_pin->chmap, chmap, ARRAY_SIZE(per_pin->chmap));
 	if (prepared)
 		snd_hda_hdmi_setup_audio_infoframe(codec, per_pin, per_pin->non_pcm);
-	mutex_unlock(&per_pin->lock);
 }
 
 static bool is_hdmi_pcm_attached(struct hdac_device *hdac, int pcm_idx)
@@ -2035,7 +1991,7 @@ int snd_hda_hdmi_generic_init(struct hda_codec *codec)
 	struct hdmi_spec *spec = codec->spec;
 	int pin_idx;
 
-	mutex_lock(&spec->bind_lock);
+	guard(mutex)(&spec->bind_lock);
 	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
 		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
 		hda_nid_t pin_nid = per_pin->pin_nid;
@@ -2048,7 +2004,6 @@ int snd_hda_hdmi_generic_init(struct hda_codec *codec)
 		snd_hda_jack_detect_enable_callback_mst(codec, pin_nid, dev_id,
 							jack_callback);
 	}
-	mutex_unlock(&spec->bind_lock);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(snd_hda_hdmi_generic_init, "SND_HDA_CODEC_HDMI");
@@ -2219,7 +2174,7 @@ static void generic_acomp_notifier_set(struct drm_audio_component *acomp,
 	int i;
 
 	spec = container_of(acomp->audio_ops, struct hdmi_spec, drm_audio_ops);
-	mutex_lock(&spec->bind_lock);
+	guard(mutex)(&spec->bind_lock);
 	spec->use_acomp_notifier = use_acomp;
 	spec->codec->relaxed_resume = use_acomp;
 	spec->codec->bus->keep_power = 0;
@@ -2229,7 +2184,6 @@ static void generic_acomp_notifier_set(struct drm_audio_component *acomp,
 				      get_pin(spec, i)->pin_nid,
 				      get_pin(spec, i)->dev_id,
 				      use_acomp);
-	mutex_unlock(&spec->bind_lock);
 }
 
 /* enable / disable the notifier via master bind / unbind */
diff --git a/sound/hda/codecs/hdmi/nvhdmi-mcp.c b/sound/hda/codecs/hdmi/nvhdmi-mcp.c
index fbcea6d1850e..8fd8d76fa72f 100644
--- a/sound/hda/codecs/hdmi/nvhdmi-mcp.c
+++ b/sound/hda/codecs/hdmi/nvhdmi-mcp.c
@@ -131,7 +131,7 @@ static int nvhdmi_8ch_7x_pcm_prepare(struct hda_pcm_stream *hinfo,
 	struct hda_spdif_out *spdif;
 	struct hdmi_spec_per_cvt *per_cvt;
 
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	per_cvt = get_cvt(spec, 0);
 	spdif = snd_hda_spdif_out_of_nid(codec, per_cvt->cvt_nid);
 
@@ -215,7 +215,6 @@ static int nvhdmi_8ch_7x_pcm_prepare(struct hda_pcm_stream *hinfo,
 
 	nvhdmi_8ch_7x_set_info_frame_parameters(codec, chs);
 
-	mutex_unlock(&codec->spdif_mutex);
 	return 0;
 }
 
-- 
2.50.1

