Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538761E25F9
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480445; cv=none; b=UuuKUp4eAU6pt+2VVuDAwmpnr6u/RoVWQCYP7yXd3NuwoVup1y9tIhAkQMvtuVvCWUJOXY1pD/cXzT06GrB7+MYF+jzlLRcY0mpWiO2k2mrrCDnJWuzAkwEmVup8comcj2AW7Hs7w7r9X9fMbbcXu5TkUhs4oa21zySMplFv2/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480445; c=relaxed/simple;
	bh=WXQo2D8/OyOH5BQwtNbsbOs9L4Z4FocY7cwdg2COsRA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urSmkn4tqyi11HtKGzEwFw1rDQq47OQtdRMkxwNoC4sCD6d7OidrSHxBZmkfiMGP2xQkouMGNtMghTYOgkPYIachPicahdxuWh2I5EJDBMEzX2hXGp1yRL+uWjadsRS/icyow8LIfBsD9Hl1Xkf+oeagxnETid0P93yDIm4RNg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j7vaf/27; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rK0dMAkS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j7vaf/27; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rK0dMAkS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j7vaf/27";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rK0dMAkS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j7vaf/27";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rK0dMAkS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1379C33F08;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WjV8YRro2Prw9JhqVocf3kJnA80yQKCGCuZbx9gYT8=;
	b=j7vaf/27JYau3r4qm35NBJqAH0LrLIydQKJMRAXCEx6l2ipd8oW/4WgvwACQCok23+YTRW
	AI57veWVgKLut9mi+E7S9KT0PlcnDnyMR+c2madLOnF9Ptayr2WGj2FhiTZzKd7KjGy6Op
	CT2LNCbFZh+nNgiVH3mPSv9vh1vpIlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WjV8YRro2Prw9JhqVocf3kJnA80yQKCGCuZbx9gYT8=;
	b=rK0dMAkSDGCX9o7jso/URRHR5HH1I47UkGutLQXsHQm5hGdx2AJs0AJmdB9Utv5R5WCbos
	yfUPhhJHoneLayAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="j7vaf/27";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rK0dMAkS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WjV8YRro2Prw9JhqVocf3kJnA80yQKCGCuZbx9gYT8=;
	b=j7vaf/27JYau3r4qm35NBJqAH0LrLIydQKJMRAXCEx6l2ipd8oW/4WgvwACQCok23+YTRW
	AI57veWVgKLut9mi+E7S9KT0PlcnDnyMR+c2madLOnF9Ptayr2WGj2FhiTZzKd7KjGy6Op
	CT2LNCbFZh+nNgiVH3mPSv9vh1vpIlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WjV8YRro2Prw9JhqVocf3kJnA80yQKCGCuZbx9gYT8=;
	b=rK0dMAkSDGCX9o7jso/URRHR5HH1I47UkGutLQXsHQm5hGdx2AJs0AJmdB9Utv5R5WCbos
	yfUPhhJHoneLayAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE5B913A54;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qC0YNaXDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 06/19] ALSA: x86: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:20 +0200
Message-ID: <20250829151335.7342-7-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1379C33F08
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/x86/intel_hdmi_audio.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 01f49555c5f6..c1506a9f7e15 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -554,16 +554,13 @@ static int had_chmap_ctl_get(struct snd_kcontrol *kcontrol,
 
 	memset(ucontrol->value.integer.value, 0,
 	       sizeof(long) * HAD_MAX_CHANNEL);
-	mutex_lock(&intelhaddata->mutex);
-	if (!intelhaddata->chmap->chmap) {
-		mutex_unlock(&intelhaddata->mutex);
+	guard(mutex)(&intelhaddata->mutex);
+	if (!intelhaddata->chmap->chmap)
 		return 0;
-	}
 
 	chmap = intelhaddata->chmap->chmap;
 	for (i = 0; i < chmap->channels; i++)
 		ucontrol->value.integer.value[i] = chmap->map[i];
-	mutex_unlock(&intelhaddata->mutex);
 
 	return 0;
 }
@@ -1394,14 +1391,13 @@ static int had_iec958_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_intelhad *intelhaddata = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&intelhaddata->mutex);
+	guard(mutex)(&intelhaddata->mutex);
 	ucontrol->value.iec958.status[0] = (intelhaddata->aes_bits >> 0) & 0xff;
 	ucontrol->value.iec958.status[1] = (intelhaddata->aes_bits >> 8) & 0xff;
 	ucontrol->value.iec958.status[2] =
 					(intelhaddata->aes_bits >> 16) & 0xff;
 	ucontrol->value.iec958.status[3] =
 					(intelhaddata->aes_bits >> 24) & 0xff;
-	mutex_unlock(&intelhaddata->mutex);
 	return 0;
 }
 
@@ -1426,12 +1422,11 @@ static int had_iec958_put(struct snd_kcontrol *kcontrol,
 		(ucontrol->value.iec958.status[1] << 8) |
 		(ucontrol->value.iec958.status[2] << 16) |
 		(ucontrol->value.iec958.status[3] << 24);
-	mutex_lock(&intelhaddata->mutex);
+	guard(mutex)(&intelhaddata->mutex);
 	if (intelhaddata->aes_bits != val) {
 		intelhaddata->aes_bits = val;
 		changed = 1;
 	}
-	mutex_unlock(&intelhaddata->mutex);
 	return changed;
 }
 
@@ -1448,10 +1443,9 @@ static int had_ctl_eld_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_intelhad *intelhaddata = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&intelhaddata->mutex);
+	guard(mutex)(&intelhaddata->mutex);
 	memcpy(ucontrol->value.bytes.data, intelhaddata->eld,
 	       HDMI_MAX_ELD_BYTES);
-	mutex_unlock(&intelhaddata->mutex);
 	return 0;
 }
 
-- 
2.50.1

