Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA41331EB2
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514792; cv=none; b=np2wXIJszVUGnyxvdalkujCVb5vM6YGMo+nQGX5tdY9nxMhYAojhg0GzAhXAH6/s3QDIKeAPuWFa23ClwUtkdr80RNg3ht74T6F3C+CGrvuXzLr8AHtJqNPKQMQMkCkxbEGHT83lxo9UOtuzgZw+CBoDYItwFU8MOXKQyWWxe/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514792; c=relaxed/simple;
	bh=V8SjoGbNet5FKURMF81Ze9ZMCIDQMFPSA+1sJw57yh8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6LI4sVSi9Gq3m5H4nsNipNDWugDCSTpyuL8V14NQSLBZQLByx1TLZLZwISPDwevs5QTpsIewaRRE+qnmXXTQiyI4RikGJ0BusJ8n+TwsH3cWeQBPR8XVGgF3BJgpEn1/XRwV70hhaM3wRlMAIhYQoYnwTuMJe45Nwlq2LMEJZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OFV2rohU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y+C3PPwx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hI38jXex; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EQ+F318O; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OFV2rohU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y+C3PPwx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hI38jXex";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EQ+F318O"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 40B5F820E8;
	Wed, 12 Aug 2026 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apU3f9l36PYU210F/TBqRmglF0T0BRIgoNc0uB5G0CQ=;
	b=OFV2rohUx7VJnwfy5IE7CeNbyd32vvKzyKvdzpySpzbxxYeCybQOkniwyTHA1gy6MuTMAD
	Rx4TfovF9uC4mTDTBxUZPtHaCqCg288Jozb2tOGmYefpcm2gppT7ODodSNtUh/IbOXDetp
	1J9F4xZt0xHDD+hjY2l3byBFhY9Zp0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apU3f9l36PYU210F/TBqRmglF0T0BRIgoNc0uB5G0CQ=;
	b=y+C3PPwxeuS6r4KwjaerqeHijDWNRdkzj6Zy7OKwzSCjtx9IfVmZA60wCZH9NHrDeUH5E6
	79F/GOtBxhy/y9Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apU3f9l36PYU210F/TBqRmglF0T0BRIgoNc0uB5G0CQ=;
	b=hI38jXexo5Uvg/bHQWuvPc53HivcsmgYEeMMdld+wL9gONBwV4McrsSJqzWApZRAClpN/2
	wJId1a09xNKc+NZOgjFTTDPYf9t0JUqntBZOD09QNL69xeNXjZPjOgGK2hZUP8aIVQ3lWJ
	t5vvAQereMK3iowhs+I/k1qzx6hzbS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apU3f9l36PYU210F/TBqRmglF0T0BRIgoNc0uB5G0CQ=;
	b=EQ+F318OElbd4342OfbrMzdt78WuunvtiskGBDHiVDD4vdhd/WIUFQSiQUUSk3dgwFXtZH
	Oq7Ka+zjPpgPcEAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00EC5779CF;
	Wed, 12 Aug 2026 06:06:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CGWAOlQNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/14] ALSA: emu10k1: Drop __force casts
Date: Wed, 12 Aug 2026 08:04:42 +0200
Message-ID: <20260812060557.80445-11-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812060557.80445-1-tiwai@suse.de>
References: <20260812060557.80445-1-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Now that the bitwise parameter definitions are gone for control
parameters, we don't have to cast with ugly __force prefix.
Simply drop those superfluous casts.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emufx.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 08e0556bf161..49cabb2eb2b7 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -990,7 +990,7 @@ static int snd_emu10k1_list_controls(struct snd_emu10k1 *emu,
 		    i < icode->gpr_list_control_count) {
 			memset(gctl, 0, sizeof(*gctl));
 			id = &ctl->kcontrol->id;
-			gctl->id.iface = (__force int)id->iface;
+			gctl->id.iface = id->iface;
 			strscpy(gctl->id.name, id->name, sizeof(gctl->id.name));
 			gctl->id.index = id->index;
 			gctl->id.device = id->device;
@@ -1156,7 +1156,7 @@ static void
 snd_emu10k1_init_mono_control2(struct snd_emu10k1_fx8010_control_gpr *ctl,
 			       const char *name, int gpr, int defval, int defval_hr)
 {
-	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	strscpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 1;
 	if (high_res_gpr_volume) {
@@ -1180,7 +1180,7 @@ static void
 snd_emu10k1_init_stereo_control2(struct snd_emu10k1_fx8010_control_gpr *ctl,
 				 const char *name, int gpr, int defval, int defval_hr)
 {
-	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	strscpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 2;
 	if (high_res_gpr_volume) {
@@ -1205,7 +1205,7 @@ static void
 snd_emu10k1_init_mono_onoff_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
 				    const char *name, int gpr, int defval)
 {
-	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	strscpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 1;
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
@@ -1218,7 +1218,7 @@ static void
 snd_emu10k1_init_stereo_onoff_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
 				      const char *name, int gpr, int defval)
 {
-	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	strscpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 2;
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
@@ -1542,7 +1542,7 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	 *  Process tone control
 	 */
 	ctl = &controls[nctl + 0];
-	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	strscpy(ctl->id.name, "Tone Control - Bass");
 	ctl->vcount = 2;
 	ctl->count = 10;
@@ -1551,7 +1551,7 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	ctl->value[0] = ctl->value[1] = 20;
 	ctl->translation = EMU10K1_GPR_TRANSLATION_BASS;
 	ctl = &controls[nctl + 1];
-	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	strscpy(ctl->id.name, "Tone Control - Treble");
 	ctl->vcount = 2;
 	ctl->count = 10;
@@ -2137,7 +2137,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	 *  Process tone control
 	 */
 	ctl = &controls[i + 0];
-	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	strscpy(ctl->id.name, "Tone Control - Bass");
 	ctl->vcount = 2;
 	ctl->count = 10;
@@ -2147,7 +2147,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	ctl->tlv = snd_emu10k1_bass_treble_db_scale;
 	ctl->translation = EMU10K1_GPR_TRANSLATION_BASS;
 	ctl = &controls[i + 1];
-	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	strscpy(ctl->id.name, "Tone Control - Treble");
 	ctl->vcount = 2;
 	ctl->count = 10;
-- 
2.55.0

