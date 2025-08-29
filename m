Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283133218D0
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480063; cv=none; b=L9ydpnq84FQY0vAuEWGv4GaEsCPJGmwtQmOXvVIMZSKSYorCk+oKei983bAsW6WWqdKV9S/2+tzsiePzVRtwWvZGGJKdEsWE54YoknoxHtNtWZh2iQ6xHeFlhjXxri1OUtHGXmM/y0AbOt9233W/pQlaAIXvITnZHhyr3DDrB4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480063; c=relaxed/simple;
	bh=sKgQM01/JOEJDOcdEG3X+3wLHPNcBCILGSZkocqK+yc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWvfdsMPCcj4IMTESRWi9lN9rOtvJfU10B/yfF+HT7qAdjcW19BW/xD9kyFkBuseVs3hx0ktvyVpbkCwjYEBWXge/ChNwiZo2yCG0HyKQaTtsRQy+sYiCUEfACX+0Ddo66vTNIb3+udHq1kkgh1Za7t2NoFYy4LjV5phHnSg/SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PDL87aJu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nCUNb8bt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PDL87aJu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nCUNb8bt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PDL87aJu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nCUNb8bt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PDL87aJu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nCUNb8bt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6660633EF4;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJ9HfE5Khvlq4hEZPSagfEMRQF4EvmThXyP8pN4vzdA=;
	b=PDL87aJuhNS+uYvSnd/uch+XpMRUR+tq2d1zx7eSmlKo04RjEjB6xn9rkDrTnrOr0Usi6y
	G9il80Iz0pvqrTyIEI9ewPiO6oDZJNxN1Y+67FqVn0rmFUlnbsmSXkI796yW7sgyhETp50
	7EEj8mnVNqKcWSjhE53ZzE038xEOBj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJ9HfE5Khvlq4hEZPSagfEMRQF4EvmThXyP8pN4vzdA=;
	b=nCUNb8btgK9xOS+Q43w3DY2e188ucPV0VAnVJ7wMDOmz0WePcgPb7mKB2xA5R2zHgZXT+8
	HNHTE5+TwuMxdqBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PDL87aJu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nCUNb8bt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJ9HfE5Khvlq4hEZPSagfEMRQF4EvmThXyP8pN4vzdA=;
	b=PDL87aJuhNS+uYvSnd/uch+XpMRUR+tq2d1zx7eSmlKo04RjEjB6xn9rkDrTnrOr0Usi6y
	G9il80Iz0pvqrTyIEI9ewPiO6oDZJNxN1Y+67FqVn0rmFUlnbsmSXkI796yW7sgyhETp50
	7EEj8mnVNqKcWSjhE53ZzE038xEOBj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJ9HfE5Khvlq4hEZPSagfEMRQF4EvmThXyP8pN4vzdA=;
	b=nCUNb8btgK9xOS+Q43w3DY2e188ucPV0VAnVJ7wMDOmz0WePcgPb7mKB2xA5R2zHgZXT+8
	HNHTE5+TwuMxdqBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4AA7413A54;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kE4GETbCsWjMHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:07:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/9] ALSA: ua101: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:07:09 +0200
Message-ID: <20250829150724.6886-2-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150724.6886-1-tiwai@suse.de>
References: <20250829150724.6886-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 6660633EF4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/misc/ua101.c | 85 +++++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 51 deletions(-)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index e200e4af799c..1c4a266018bb 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -658,11 +658,10 @@ static int capture_pcm_open(struct snd_pcm_substream *substream)
 		DIV_ROUND_CLOSEST(ua->rate, ua->packets_per_second);
 	substream->runtime->delay = substream->runtime->hw.fifo_size;
 
-	mutex_lock(&ua->mutex);
+	guard(mutex)(&ua->mutex);
 	err = start_usb_capture(ua);
 	if (err >= 0)
 		set_bit(ALSA_CAPTURE_OPEN, &ua->states);
-	mutex_unlock(&ua->mutex);
 	return err;
 }
 
@@ -679,31 +678,28 @@ static int playback_pcm_open(struct snd_pcm_substream *substream)
 		DIV_ROUND_CLOSEST(ua->rate * ua->playback.queue_length,
 				  ua->packets_per_second);
 
-	mutex_lock(&ua->mutex);
+	guard(mutex)(&ua->mutex);
 	err = start_usb_capture(ua);
 	if (err < 0)
-		goto error;
+		return err;
 	err = start_usb_playback(ua);
 	if (err < 0) {
 		if (!test_bit(ALSA_CAPTURE_OPEN, &ua->states))
 			stop_usb_capture(ua);
-		goto error;
+		return err;
 	}
 	set_bit(ALSA_PLAYBACK_OPEN, &ua->states);
-error:
-	mutex_unlock(&ua->mutex);
-	return err;
+	return 0;
 }
 
 static int capture_pcm_close(struct snd_pcm_substream *substream)
 {
 	struct ua101 *ua = substream->private_data;
 
-	mutex_lock(&ua->mutex);
+	guard(mutex)(&ua->mutex);
 	clear_bit(ALSA_CAPTURE_OPEN, &ua->states);
 	if (!test_bit(ALSA_PLAYBACK_OPEN, &ua->states))
 		stop_usb_capture(ua);
-	mutex_unlock(&ua->mutex);
 	return 0;
 }
 
@@ -711,12 +707,11 @@ static int playback_pcm_close(struct snd_pcm_substream *substream)
 {
 	struct ua101 *ua = substream->private_data;
 
-	mutex_lock(&ua->mutex);
+	guard(mutex)(&ua->mutex);
 	stop_usb_playback(ua);
 	clear_bit(ALSA_PLAYBACK_OPEN, &ua->states);
 	if (!test_bit(ALSA_CAPTURE_OPEN, &ua->states))
 		stop_usb_capture(ua);
-	mutex_unlock(&ua->mutex);
 	return 0;
 }
 
@@ -724,12 +719,9 @@ static int capture_pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *hw_params)
 {
 	struct ua101 *ua = substream->private_data;
-	int err;
 
-	mutex_lock(&ua->mutex);
-	err = start_usb_capture(ua);
-	mutex_unlock(&ua->mutex);
-	return err;
+	guard(mutex)(&ua->mutex);
+	return start_usb_capture(ua);
 }
 
 static int playback_pcm_hw_params(struct snd_pcm_substream *substream,
@@ -738,11 +730,10 @@ static int playback_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct ua101 *ua = substream->private_data;
 	int err;
 
-	mutex_lock(&ua->mutex);
+	guard(mutex)(&ua->mutex);
 	err = start_usb_capture(ua);
 	if (err >= 0)
 		err = start_usb_playback(ua);
-	mutex_unlock(&ua->mutex);
 	return err;
 }
 
@@ -751,9 +742,9 @@ static int capture_pcm_prepare(struct snd_pcm_substream *substream)
 	struct ua101 *ua = substream->private_data;
 	int err;
 
-	mutex_lock(&ua->mutex);
-	err = start_usb_capture(ua);
-	mutex_unlock(&ua->mutex);
+	scoped_guard(mutex, &ua->mutex) {
+		err = start_usb_capture(ua);
+	}
 	if (err < 0)
 		return err;
 
@@ -781,11 +772,11 @@ static int playback_pcm_prepare(struct snd_pcm_substream *substream)
 	struct ua101 *ua = substream->private_data;
 	int err;
 
-	mutex_lock(&ua->mutex);
-	err = start_usb_capture(ua);
-	if (err >= 0)
-		err = start_usb_playback(ua);
-	mutex_unlock(&ua->mutex);
+	scoped_guard(mutex, &ua->mutex) {
+		err = start_usb_capture(ua);
+		if (err >= 0)
+			err = start_usb_playback(ua);
+	}
 	if (err < 0)
 		return err;
 
@@ -1127,18 +1118,18 @@ static void free_usb_related_resources(struct ua101 *ua,
 	unsigned int i;
 	struct usb_interface *intf;
 
-	mutex_lock(&ua->mutex);
-	free_stream_urbs(&ua->capture);
-	free_stream_urbs(&ua->playback);
-	mutex_unlock(&ua->mutex);
+	scoped_guard(mutex, &ua->mutex) {
+		free_stream_urbs(&ua->capture);
+		free_stream_urbs(&ua->playback);
+	}
 	free_stream_buffers(ua, &ua->capture);
 	free_stream_buffers(ua, &ua->playback);
 
 	for (i = 0; i < ARRAY_SIZE(ua->intf); ++i) {
-		mutex_lock(&ua->mutex);
-		intf = ua->intf[i];
-		ua->intf[i] = NULL;
-		mutex_unlock(&ua->mutex);
+		scoped_guard(mutex, &ua->mutex) {
+			intf = ua->intf[i];
+			ua->intf[i] = NULL;
+		}
 		if (intf) {
 			usb_set_intfdata(intf, NULL);
 			if (intf != interface)
@@ -1192,22 +1183,18 @@ static int ua101_probe(struct usb_interface *interface,
 	    intf_numbers[is_ua1000][0])
 		return -ENODEV;
 
-	mutex_lock(&devices_mutex);
+	guard(mutex)(&devices_mutex);
 
 	for (card_index = 0; card_index < SNDRV_CARDS; ++card_index)
 		if (enable[card_index] && !(devices_used & (1 << card_index)))
 			break;
-	if (card_index >= SNDRV_CARDS) {
-		mutex_unlock(&devices_mutex);
+	if (card_index >= SNDRV_CARDS)
 		return -ENOENT;
-	}
 	err = snd_card_new(&interface->dev,
 			   index[card_index], id[card_index], THIS_MODULE,
 			   sizeof(*ua), &card);
-	if (err < 0) {
-		mutex_unlock(&devices_mutex);
+	if (err < 0)
 		return err;
-	}
 	card->private_free = ua101_card_free;
 	ua = card->private_data;
 	ua->dev = interface_to_usbdev(interface);
@@ -1290,13 +1277,11 @@ static int ua101_probe(struct usb_interface *interface,
 	usb_set_intfdata(interface, ua);
 	devices_used |= 1 << card_index;
 
-	mutex_unlock(&devices_mutex);
 	return 0;
 
 probe_error:
 	free_usb_related_resources(ua, interface);
 	snd_card_free(card);
-	mutex_unlock(&devices_mutex);
 	return err;
 }
 
@@ -1308,7 +1293,7 @@ static void ua101_disconnect(struct usb_interface *interface)
 	if (!ua)
 		return;
 
-	mutex_lock(&devices_mutex);
+	guard(mutex)(&devices_mutex);
 
 	set_bit(DISCONNECTED, &ua->states);
 	wake_up(&ua->rate_feedback_wait);
@@ -1321,18 +1306,16 @@ static void ua101_disconnect(struct usb_interface *interface)
 		snd_usbmidi_disconnect(midi);
 	abort_alsa_playback(ua);
 	abort_alsa_capture(ua);
-	mutex_lock(&ua->mutex);
-	stop_usb_playback(ua);
-	stop_usb_capture(ua);
-	mutex_unlock(&ua->mutex);
+	scoped_guard(mutex, &ua->mutex) {
+		stop_usb_playback(ua);
+		stop_usb_capture(ua);
+	}
 
 	free_usb_related_resources(ua, interface);
 
 	devices_used &= ~(1 << ua->card_index);
 
 	snd_card_free_when_closed(ua->card);
-
-	mutex_unlock(&devices_mutex);
 }
 
 static const struct usb_device_id ua101_ids[] = {
-- 
2.50.1

