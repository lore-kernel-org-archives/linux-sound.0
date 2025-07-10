Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3AF2D6628
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142328; cv=none; b=B4K1ZCR5uLyyi45HOSRF9f85Ruph+j9qVfzYjLIzaa85NPVmGsmYoROpWX99on2AeDMmSjy+cO3kpoB+pLVTlZdGDKQ60TSvrf9t7J/L9na48TrJD88sUKVyPVlrckdY1pHdCQJJTKRkcVWTVbYH8mmXMhAiegePWmTZNc7mfcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142328; c=relaxed/simple;
	bh=Phv5G1KG+qtvw1Zv1aOJ4cHIOQg3r+uLIvi4is4m2OM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/crruwbmK6ZMxT6PkKWuR2NITE4AtwjiaTCBmqJg9PjiQbTyb2WKOIbfGxOeK86m85Db2DrzkPu6rkPMK8sJBRBDLy1l5DsJ1y3dTQ3E62BdkFurCuXxG6VzGKh9QT2RQkjD4p3acsjL27c6qCtVINNg+CuZ9sAQ2lyIZ+rxeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CHvRiK0O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vpI51VkJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CHvRiK0O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vpI51VkJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CHvRiK0O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vpI51VkJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CHvRiK0O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vpI51VkJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9A5421F78E;
	Thu, 10 Jul 2025 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AE1q2Kom2g/LGj/gmvZg6a+Vw2NU+X+GGUmxl5KPDec=;
	b=CHvRiK0O1fBktWMZgd1Co5TeNzojt0IGTs1KtU7+1N2MeH2I0qkXxD5hHd4SqsDOkTmzSr
	ttZg8ICrtrDhsPBgEmSbKsG/RAKsXjNNnVi7fil5lM3kBgFembLMgMAEStrCZ7g4NK3Wtd
	nNXzbW+GAxOlPyLuCdhY1RWZ02nNcks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AE1q2Kom2g/LGj/gmvZg6a+Vw2NU+X+GGUmxl5KPDec=;
	b=vpI51VkJiGWpbVhMT6Q+q26fa8tyJUb5v5Kg4kd34yNYlWPpvXLOTue6/Rer1Cg5Dsiewh
	JGzh900UVBlvhDAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AE1q2Kom2g/LGj/gmvZg6a+Vw2NU+X+GGUmxl5KPDec=;
	b=CHvRiK0O1fBktWMZgd1Co5TeNzojt0IGTs1KtU7+1N2MeH2I0qkXxD5hHd4SqsDOkTmzSr
	ttZg8ICrtrDhsPBgEmSbKsG/RAKsXjNNnVi7fil5lM3kBgFembLMgMAEStrCZ7g4NK3Wtd
	nNXzbW+GAxOlPyLuCdhY1RWZ02nNcks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AE1q2Kom2g/LGj/gmvZg6a+Vw2NU+X+GGUmxl5KPDec=;
	b=vpI51VkJiGWpbVhMT6Q+q26fa8tyJUb5v5Kg4kd34yNYlWPpvXLOTue6/Rer1Cg5Dsiewh
	JGzh900UVBlvhDAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D899136DC;
	Thu, 10 Jul 2025 10:07:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oDdvHfaQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 102/103] ALSA: usb-audio: Copy string more safely
Date: Thu, 10 Jul 2025 12:07:24 +0200
Message-ID: <20250710100727.22653-103-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace strcpy() and sprintf() usages in the USB audio drivers with
the safer versions (strscpy() and scnprintf()) with the proper max
size evaluation.  Only for safety, no actual behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c            | 11 ++++++-----
 sound/usb/midi2.c           |  3 ++-
 sound/usb/mixer.c           | 22 +++++++++++-----------
 sound/usb/mixer_scarlett.c  | 31 ++++++++++++++++++-------------
 sound/usb/mixer_scarlett2.c | 14 ++++++++------
 sound/usb/proc.c            |  2 +-
 sound/usb/stream.c          |  3 ++-
 7 files changed, 48 insertions(+), 38 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 630ce40ed2c9..10d9b7285597 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -616,9 +616,10 @@ static void usb_audio_make_shortname(struct usb_device *dev,
 	    usb_string(dev, dev->descriptor.iProduct,
 		       card->shortname, sizeof(card->shortname)) <= 0) {
 		/* no name available from anywhere, so use ID */
-		sprintf(card->shortname, "USB Device %#04x:%#04x",
-			USB_ID_VENDOR(chip->usb_id),
-			USB_ID_PRODUCT(chip->usb_id));
+		scnprintf(card->shortname, sizeof(card->shortname),
+			  "USB Device %#04x:%#04x",
+			  USB_ID_VENDOR(chip->usb_id),
+			  USB_ID_PRODUCT(chip->usb_id));
 	}
 
 	strim(card->shortname);
@@ -757,8 +758,8 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	card->private_free = snd_usb_audio_free;
 
 	strscpy(card->driver, "USB-Audio");
-	sprintf(component, "USB%04x:%04x",
-		USB_ID_VENDOR(chip->usb_id), USB_ID_PRODUCT(chip->usb_id));
+	scnprintf(component, sizeof(component), "USB%04x:%04x",
+		  USB_ID_VENDOR(chip->usb_id), USB_ID_PRODUCT(chip->usb_id));
 	snd_component_add(card, component);
 
 	usb_audio_make_shortname(dev, chip, quirk);
diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 692dfc3c182f..030569fda416 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -1058,7 +1058,8 @@ static void set_fallback_rawmidi_names(struct snd_usb_midi2_interface *umidi)
 			fill_ump_ep_name(ump, dev, dev->descriptor.iProduct);
 		/* fill fallback name */
 		if (!*ump->info.name)
-			sprintf(ump->info.name, "USB MIDI %d", rmidi->index);
+			scnprintf(ump->info.name, sizeof(ump->info.name),
+				  "USB MIDI %d", rmidi->index);
 		/* copy as rawmidi name if not set */
 		if (!*ump->core.name)
 			strscpy(ump->core.name, ump->info.name,
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index a7cd7d51e66b..63b300bc67ba 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -674,40 +674,40 @@ static int get_term_name(struct snd_usb_audio *chip, struct usb_audio_term *iter
 			return 0;
 		switch (iterm->type >> 16) {
 		case UAC3_SELECTOR_UNIT:
-			strcpy(name, "Selector");
+			strscpy(name, "Selector", maxlen);
 			return 8;
 		case UAC3_PROCESSING_UNIT:
-			strcpy(name, "Process Unit");
+			strscpy(name, "Process Unit", maxlen);
 			return 12;
 		case UAC3_EXTENSION_UNIT:
-			strcpy(name, "Ext Unit");
+			strscpy(name, "Ext Unit", maxlen);
 			return 8;
 		case UAC3_MIXER_UNIT:
-			strcpy(name, "Mixer");
+			strscpy(name, "Mixer", maxlen);
 			return 5;
 		default:
-			return sprintf(name, "Unit %d", iterm->id);
+			return scnprintf(name, maxlen, "Unit %d", iterm->id);
 		}
 	}
 
 	switch (iterm->type & 0xff00) {
 	case 0x0100:
-		strcpy(name, "PCM");
+		strscpy(name, "PCM", maxlen);
 		return 3;
 	case 0x0200:
-		strcpy(name, "Mic");
+		strscpy(name, "Mic", maxlen);
 		return 3;
 	case 0x0400:
-		strcpy(name, "Headset");
+		strscpy(name, "Headset", maxlen);
 		return 7;
 	case 0x0500:
-		strcpy(name, "Phone");
+		strscpy(name, "Phone", maxlen);
 		return 5;
 	}
 
 	for (names = iterm_names; names->type; names++) {
 		if (names->type == iterm->type) {
-			strcpy(name, names->name);
+			strscpy(name, names->name, maxlen);
 			return strlen(names->name);
 		}
 	}
@@ -2804,7 +2804,7 @@ static int parse_audio_selector_unit(struct mixer_build *state, int unitid,
 			len = get_term_name(state->chip, &iterm, namelist[i],
 					    MAX_ITEM_NAME_LEN, 0);
 		if (! len)
-			sprintf(namelist[i], "Input %u", i);
+			scnprintf(namelist[i], MAX_ITEM_NAME_LEN, "Input %u", i);
 	}
 
 	kctl = snd_ctl_new1(&mixer_selectunit_ctl, cval);
diff --git a/sound/usb/mixer_scarlett.c b/sound/usb/mixer_scarlett.c
index ff548041679b..8babfa3f7c45 100644
--- a/sound/usb/mixer_scarlett.c
+++ b/sound/usb/mixer_scarlett.c
@@ -357,21 +357,21 @@ static int scarlett_ctl_put(struct snd_kcontrol *kctl,
 	return changed;
 }
 
-static void scarlett_generate_name(int i, char *dst, int offsets[])
+static void scarlett_generate_name(int i, char *dst, size_t size, int offsets[])
 {
 	if (i > offsets[SCARLETT_OFFSET_MIX])
-		sprintf(dst, "Mix %c",
-			'A'+(i - offsets[SCARLETT_OFFSET_MIX] - 1));
+		scnprintf(dst, size, "Mix %c",
+			  'A'+(i - offsets[SCARLETT_OFFSET_MIX] - 1));
 	else if (i > offsets[SCARLETT_OFFSET_ADAT])
-		sprintf(dst, "ADAT %d", i - offsets[SCARLETT_OFFSET_ADAT]);
+		scnprintf(dst, size, "ADAT %d", i - offsets[SCARLETT_OFFSET_ADAT]);
 	else if (i > offsets[SCARLETT_OFFSET_SPDIF])
-		sprintf(dst, "SPDIF %d", i - offsets[SCARLETT_OFFSET_SPDIF]);
+		scnprintf(dst, size, "SPDIF %d", i - offsets[SCARLETT_OFFSET_SPDIF]);
 	else if (i > offsets[SCARLETT_OFFSET_ANALOG])
-		sprintf(dst, "Analog %d", i - offsets[SCARLETT_OFFSET_ANALOG]);
+		scnprintf(dst, size, "Analog %d", i - offsets[SCARLETT_OFFSET_ANALOG]);
 	else if (i > offsets[SCARLETT_OFFSET_PCM])
-		sprintf(dst, "PCM %d", i - offsets[SCARLETT_OFFSET_PCM]);
+		scnprintf(dst, size, "PCM %d", i - offsets[SCARLETT_OFFSET_PCM]);
 	else
-		sprintf(dst, "Off");
+		scnprintf(dst, size, "Off");
 }
 
 static int scarlett_ctl_enum_dynamic_info(struct snd_kcontrol *kctl,
@@ -391,6 +391,7 @@ static int scarlett_ctl_enum_dynamic_info(struct snd_kcontrol *kctl,
 	/* generate name dynamically based on item number and offset info */
 	scarlett_generate_name(uinfo->value.enumerated.item,
 			       uinfo->value.enumerated.name,
+			       sizeof(uinfo->value.enumerated.name),
 			       opt->offsets);
 
 	return 0;
@@ -876,7 +877,8 @@ static int scarlett_controls_create_generic(struct usb_mixer_interface *mixer,
 				return err;
 			break;
 		case SCARLETT_SWITCH_IMPEDANCE:
-			sprintf(mx, "Input %d Impedance Switch", ctl->num);
+			scnprintf(mx, sizeof(mx),
+				  "Input %d Impedance Switch", ctl->num);
 			err = add_new_ctl(mixer, &usb_scarlett_ctl_enum,
 					  scarlett_ctl_enum_resume, 0x01,
 					  0x09, ctl->num, USB_MIXER_S16, 1, mx,
@@ -885,7 +887,8 @@ static int scarlett_controls_create_generic(struct usb_mixer_interface *mixer,
 				return err;
 			break;
 		case SCARLETT_SWITCH_PAD:
-			sprintf(mx, "Input %d Pad Switch", ctl->num);
+			scnprintf(mx, sizeof(mx),
+				  "Input %d Pad Switch", ctl->num);
 			err = add_new_ctl(mixer, &usb_scarlett_ctl_enum,
 					  scarlett_ctl_enum_resume, 0x01,
 					  0x0b, ctl->num, USB_MIXER_S16, 1, mx,
@@ -894,7 +897,8 @@ static int scarlett_controls_create_generic(struct usb_mixer_interface *mixer,
 				return err;
 			break;
 		case SCARLETT_SWITCH_GAIN:
-			sprintf(mx, "Input %d Gain Switch", ctl->num);
+			scnprintf(mx, sizeof(mx),
+				  "Input %d Gain Switch", ctl->num);
 			err = add_new_ctl(mixer, &usb_scarlett_ctl_enum,
 					  scarlett_ctl_enum_resume, 0x01,
 					  0x08, ctl->num, USB_MIXER_S16, 1, mx,
@@ -960,8 +964,9 @@ int snd_scarlett_controls_create(struct usb_mixer_interface *mixer)
 			return err;
 
 		for (o = 0; o < info->matrix_out; o++) {
-			sprintf(mx, "Matrix %02d Mix %c Playback Volume", i+1,
-				o+'A');
+			scnprintf(mx, sizeof(mx),
+				  "Matrix %02d Mix %c Playback Volume", i+1,
+				  o+'A');
 			err = add_new_ctl(mixer, &usb_scarlett_ctl,
 					  scarlett_ctl_resume, 0x3c, 0x00,
 					  (i << 3) + (o & 0x07), USB_MIXER_S16,
diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 93589e86828a..49eeb1444dce 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -7396,13 +7396,15 @@ static int scarlett2_mux_src_enum_ctl_info(struct snd_kcontrol *kctl,
 
 			if (port_type == SCARLETT2_PORT_TYPE_MIX &&
 			    item >= private->num_mix_out)
-				sprintf(uinfo->value.enumerated.name,
-					port->dsp_src_descr,
-					item - private->num_mix_out + 1);
+				scnprintf(uinfo->value.enumerated.name,
+					  sizeof(uinfo->value.enumerated.name),
+					  port->dsp_src_descr,
+					  item - private->num_mix_out + 1);
 			else
-				sprintf(uinfo->value.enumerated.name,
-					port->src_descr,
-					item + port->src_num_offset);
+				scnprintf(uinfo->value.enumerated.name,
+					  sizeof(uinfo->value.enumerated.name),
+					  port->src_descr,
+					  item + port->src_num_offset);
 
 			return 0;
 		}
diff --git a/sound/usb/proc.c b/sound/usb/proc.c
index e9bbaea7b2fa..c8b967bd7065 100644
--- a/sound/usb/proc.c
+++ b/sound/usb/proc.c
@@ -231,7 +231,7 @@ void snd_usb_proc_pcm_format_add(struct snd_usb_stream *stream)
 	char name[32];
 	struct snd_card *card = stream->chip->card;
 
-	sprintf(name, "stream%d", stream->pcm_index);
+	scnprintf(name, sizeof(name), "stream%d", stream->pcm_index);
 	snd_card_ro_proc_new(card, name, stream, proc_pcm_format_read);
 }
 
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 749498fbf9cb..ad6ced780634 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -536,7 +536,8 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 	pcm->private_free = snd_usb_audio_pcm_free;
 	pcm->info_flags = 0;
 	if (chip->pcm_devs > 0)
-		sprintf(pcm->name, "USB Audio #%d", chip->pcm_devs);
+		scnprintf(pcm->name, sizeof(pcm->name), "USB Audio #%d",
+			  chip->pcm_devs);
 	else
 		strscpy(pcm->name, "USB Audio");
 
-- 
2.50.0

