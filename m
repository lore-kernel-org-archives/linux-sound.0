Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7112215F5C
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625468; cv=none; b=BIaHif+37mL8gfNvJn40WDWyErGZNVh+jZhNmmyJi8U2sVVHQK052UhcRmUkfE2NKlwcsituzNeKOM2HlhtIvu/FTRNdLO2xIMwVqHAhQ7x89Q92OkSyQ4VgroxHce5njIy7BIWpHvLW2eUZWIXd+hpsdvFnutSPaQrBBHJcd5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625468; c=relaxed/simple;
	bh=/xTALGAKnx5eHLVwUE+EG7CR+fbehwHd44GcaL+mShw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAZBAUObItTY6+TxlHc52eMOH5pdA/ZHYBHN16nfvz60bR9V99orqpPOpZceONO7Gu4drDfCHEm8fRJC9C8vm7So6zV5bzMcXbhV9QWqC9y3SjA7IskvfoWXvz3mXqHRwXr5SF6XNsXzzIo1MqSPZX6KRsKiqREKe1j8EXsXEcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fL6v+Dmr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5/Q4c+Vf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fL6v+Dmr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5/Q4c+Vf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fL6v+Dmr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5/Q4c+Vf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fL6v+Dmr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5/Q4c+Vf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9E6D64D395;
	Fri, 27 Mar 2026 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774625459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0J6RpN89aFAtvLNnXAE6BgbZtuhkGlnGwqo2TYbboVs=;
	b=fL6v+DmrCZ+9Ky85P3R4qy1ePuaLku6Q/d1fkhRvU/oP2TTjdG7+yAY5as529AiXmmyO3I
	QsAGOBiHpq+DPb/Xfl6jzXjUlwWbbS2eenA3orxHIKto9YEiG5QvMg2020B+gwASgdFbDz
	d/yBE3/Xs4pSN1i+V3mdQV3FguXt6oU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774625459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0J6RpN89aFAtvLNnXAE6BgbZtuhkGlnGwqo2TYbboVs=;
	b=5/Q4c+Vfgv9sqmWxgFYDB5fvoxzj84M8YF6TrrZZxpMZb1IzKokLpEpG8vznljY5jQ0WMh
	pvLDKWiLazu1ZUDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774625459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0J6RpN89aFAtvLNnXAE6BgbZtuhkGlnGwqo2TYbboVs=;
	b=fL6v+DmrCZ+9Ky85P3R4qy1ePuaLku6Q/d1fkhRvU/oP2TTjdG7+yAY5as529AiXmmyO3I
	QsAGOBiHpq+DPb/Xfl6jzXjUlwWbbS2eenA3orxHIKto9YEiG5QvMg2020B+gwASgdFbDz
	d/yBE3/Xs4pSN1i+V3mdQV3FguXt6oU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774625459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0J6RpN89aFAtvLNnXAE6BgbZtuhkGlnGwqo2TYbboVs=;
	b=5/Q4c+Vfgv9sqmWxgFYDB5fvoxzj84M8YF6TrrZZxpMZb1IzKokLpEpG8vznljY5jQ0WMh
	pvLDKWiLazu1ZUDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78B774A0B1;
	Fri, 27 Mar 2026 15:30:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gA5aHLOixmmNEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 15:30:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>
Subject: [PATCH 2/2] ALSA: usb-audio: Extend max number of channels to 64
Date: Fri, 27 Mar 2026 16:30:54 +0100
Message-ID: <20260327153056.691575-2-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327153056.691575-1-tiwai@suse.de>
References: <20260327153056.691575-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

The current limitation of 16 as MAX_CHANNELS is rather historical at
the time of UAC1 definition.  As there seem already devices with a
higher number of mixer channels, we should extend it too.  As an ad
hoc update, let's raise it to 64 so that it can still fit in a single
long-long integer.

Link: https://lore.kernel.org/F1B104A5-CD6A-4A26-AB46-14BF233C0579@getmailspring.com
Tested-by: Phil Willoughby <willerz@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 14 +++++++-------
 sound/usb/mixer.h |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index e764757979e0..69026cf54979 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1725,7 +1725,7 @@ static bool check_insane_volume_range(struct usb_mixer_interface *mixer,
 
 static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 				const struct usbmix_name_map *imap,
-				unsigned int ctl_mask, int control,
+				u64 ctl_mask, int control,
 				struct usb_audio_term *iterm,
 				struct usb_audio_term *oterm,
 				int unitid, int nameid, int readonly_mask)
@@ -1887,7 +1887,7 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 }
 
 static void build_feature_ctl(struct mixer_build *state, void *raw_desc,
-			      unsigned int ctl_mask, int control,
+			      u64 ctl_mask, int control,
 			      struct usb_audio_term *iterm, int unitid,
 			      int readonly_mask)
 {
@@ -1899,7 +1899,7 @@ static void build_feature_ctl(struct mixer_build *state, void *raw_desc,
 }
 
 static void build_feature_ctl_badd(struct usb_mixer_interface *mixer,
-			      unsigned int ctl_mask, int control, int unitid,
+			      u64 ctl_mask, int control, int unitid,
 			      const struct usbmix_name_map *badd_map)
 {
 	__build_feature_ctl(mixer, badd_map, ctl_mask, control,
@@ -2075,7 +2075,7 @@ static int parse_audio_feature_unit(struct mixer_build *state, int unitid,
 		bmaControls = ftr->bmaControls;
 	}
 
-	if (channels > 32) {
+	if (channels > MAX_CHANNELS) {
 		usb_audio_info(state->chip,
 			       "usbmixer: too many channels (%d) in unit %d\n",
 			       channels, unitid);
@@ -2113,7 +2113,7 @@ static int parse_audio_feature_unit(struct mixer_build *state, int unitid,
 	if (state->mixer->protocol == UAC_VERSION_1) {
 		/* check all control types */
 		for (i = 0; i < 10; i++) {
-			unsigned int ch_bits = 0;
+			u64 ch_bits = 0;
 			int control = audio_feature_info[i].control;
 
 			for (j = 0; j < channels; j++) {
@@ -2139,7 +2139,7 @@ static int parse_audio_feature_unit(struct mixer_build *state, int unitid,
 		}
 	} else { /* UAC_VERSION_2/3 */
 		for (i = 0; i < ARRAY_SIZE(audio_feature_info); i++) {
-			unsigned int ch_bits = 0;
+			u64 ch_bits = 0;
 			unsigned int ch_read_only = 0;
 			int control = audio_feature_info[i].control;
 
@@ -3452,7 +3452,7 @@ static void snd_usb_mixer_dump_cval(struct snd_info_buffer *buffer,
 		[USB_MIXER_U32] = "U32",
 		[USB_MIXER_BESPOKEN] = "BESPOKEN",
 	};
-	snd_iprintf(buffer, "    Info: id=%i, control=%i, cmask=0x%x, "
+	snd_iprintf(buffer, "    Info: id=%i, control=%i, cmask=0x%llx, "
 			    "channels=%i, type=\"%s\"\n", cval->head.id,
 			    cval->control, cval->cmask, cval->channels,
 			    val_types[cval->val_type]);
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 167fbfcf01ac..afbb3dd9f177 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -44,7 +44,7 @@ struct usb_mixer_interface {
 	void (*private_suspend)(struct usb_mixer_interface *mixer);
 };
 
-#define MAX_CHANNELS	16	/* max logical channels */
+#define MAX_CHANNELS	64	/* max logical channels */
 
 enum {
 	USB_MIXER_BOOLEAN,
@@ -81,7 +81,7 @@ struct usb_mixer_elem_list {
 struct usb_mixer_elem_info {
 	struct usb_mixer_elem_list head;
 	unsigned int control;	/* CS or ICN (high byte) */
-	unsigned int cmask; /* channel mask bitmap: 0 = master */
+	u64 cmask; /* channel mask bitmap: 0 = master */
 	unsigned int idx_off; /* Control index offset */
 	unsigned int ch_readonly;
 	unsigned int master_readonly;
-- 
2.53.0

