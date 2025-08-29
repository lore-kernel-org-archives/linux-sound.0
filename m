Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8720027A454
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480473; cv=none; b=aLYAYHx9TgP2fMr0pXRoJVM1GENFpYiPgHe/HuvDac7kIa4j3ISZadUISUmE2qYeTE0d2Imej8NFWNe7lHXkbDG5jwgaVGJiGRhU8Iv+DY3ClwnFWF619jYV8ExDplFN/sUbRn8opjUGOp2FLL3PUlrI8Y4s/Hno5GQSQwd/w1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480473; c=relaxed/simple;
	bh=5530MpRKRIXBt+VZ7HAAo7HJDWPx3B2nF8osqunPqnk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSNvjylUS1SSmu+Bh8yVcEjt61bCsaJKSM1IvOvY80ft68GmEN9C0vcZhmS0mCZDyveZQSa2nJ9t/9N81B4ESPdupQmFAd8EpresOhfEcA5LuJh5sDrtOPn4FyieG9IE6k4zj97fXU0peUAzCpLrYv1KSGe9+6ihSi8mQoVW5KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hZK/6QoL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Es5EaXHZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hZK/6QoL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Es5EaXHZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hZK/6QoL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Es5EaXHZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hZK/6QoL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Es5EaXHZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7237433F0C;
	Fri, 29 Aug 2025 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gk5hST4aOhfFcNSeOulY2MTi+usT/tEvMAL77r3OLgk=;
	b=hZK/6QoLAaVYjEE09pFS5/Vg0Zh7XvXIk8hG4uyGxpNiML/oYWNJ3tjto/NPilPaLq7fYH
	K0GFZeklZe9693oiWigfIY4mUixDKIfXJ24JtUCJx9Uo6lI5TM1lnwiicn7SLZRKVTBeap
	xTdqFVUZEPLWu5P16R/szxF4kSXs4ZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gk5hST4aOhfFcNSeOulY2MTi+usT/tEvMAL77r3OLgk=;
	b=Es5EaXHZMMTA9PcGyI5xo80zHAghlRyIJHhGw64r9HR61CLWsSSKSyWwJreEnp/WICQ/nh
	XcZ+bNjFi5Wa50DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="hZK/6QoL";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Es5EaXHZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gk5hST4aOhfFcNSeOulY2MTi+usT/tEvMAL77r3OLgk=;
	b=hZK/6QoLAaVYjEE09pFS5/Vg0Zh7XvXIk8hG4uyGxpNiML/oYWNJ3tjto/NPilPaLq7fYH
	K0GFZeklZe9693oiWigfIY4mUixDKIfXJ24JtUCJx9Uo6lI5TM1lnwiicn7SLZRKVTBeap
	xTdqFVUZEPLWu5P16R/szxF4kSXs4ZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gk5hST4aOhfFcNSeOulY2MTi+usT/tEvMAL77r3OLgk=;
	b=Es5EaXHZMMTA9PcGyI5xo80zHAghlRyIJHhGw64r9HR61CLWsSSKSyWwJreEnp/WICQ/nh
	XcZ+bNjFi5Wa50DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5805413326;
	Fri, 29 Aug 2025 15:13:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sNo9FKfDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 16/19] ALSA: atmel: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:30 +0200
Message-ID: <20250829151335.7342-17-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 7237433F0C
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/atmel/ac97c.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 693d48f08b88..df0a049192de 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -88,7 +88,7 @@ static int atmel_ac97c_playback_open(struct snd_pcm_substream *substream)
 	struct atmel_ac97c *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	mutex_lock(&opened_mutex);
+	guard(mutex)(&opened_mutex);
 	chip->opened++;
 	runtime->hw = atmel_ac97c_hw;
 	if (chip->cur_rate) {
@@ -97,7 +97,6 @@ static int atmel_ac97c_playback_open(struct snd_pcm_substream *substream)
 	}
 	if (chip->cur_format)
 		runtime->hw.formats = pcm_format_to_bits(chip->cur_format);
-	mutex_unlock(&opened_mutex);
 	chip->playback_substream = substream;
 	return 0;
 }
@@ -107,7 +106,7 @@ static int atmel_ac97c_capture_open(struct snd_pcm_substream *substream)
 	struct atmel_ac97c *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	mutex_lock(&opened_mutex);
+	guard(mutex)(&opened_mutex);
 	chip->opened++;
 	runtime->hw = atmel_ac97c_hw;
 	if (chip->cur_rate) {
@@ -116,7 +115,6 @@ static int atmel_ac97c_capture_open(struct snd_pcm_substream *substream)
 	}
 	if (chip->cur_format)
 		runtime->hw.formats = pcm_format_to_bits(chip->cur_format);
-	mutex_unlock(&opened_mutex);
 	chip->capture_substream = substream;
 	return 0;
 }
@@ -125,13 +123,12 @@ static int atmel_ac97c_playback_close(struct snd_pcm_substream *substream)
 {
 	struct atmel_ac97c *chip = snd_pcm_substream_chip(substream);
 
-	mutex_lock(&opened_mutex);
+	guard(mutex)(&opened_mutex);
 	chip->opened--;
 	if (!chip->opened) {
 		chip->cur_rate = 0;
 		chip->cur_format = 0;
 	}
-	mutex_unlock(&opened_mutex);
 
 	chip->playback_substream = NULL;
 
@@ -142,13 +139,12 @@ static int atmel_ac97c_capture_close(struct snd_pcm_substream *substream)
 {
 	struct atmel_ac97c *chip = snd_pcm_substream_chip(substream);
 
-	mutex_lock(&opened_mutex);
+	guard(mutex)(&opened_mutex);
 	chip->opened--;
 	if (!chip->opened) {
 		chip->cur_rate = 0;
 		chip->cur_format = 0;
 	}
-	mutex_unlock(&opened_mutex);
 
 	chip->capture_substream = NULL;
 
@@ -161,10 +157,9 @@ static int atmel_ac97c_playback_hw_params(struct snd_pcm_substream *substream,
 	struct atmel_ac97c *chip = snd_pcm_substream_chip(substream);
 
 	/* Set restrictions to params. */
-	mutex_lock(&opened_mutex);
+	guard(mutex)(&opened_mutex);
 	chip->cur_rate = params_rate(hw_params);
 	chip->cur_format = params_format(hw_params);
-	mutex_unlock(&opened_mutex);
 
 	return 0;
 }
@@ -175,10 +170,9 @@ static int atmel_ac97c_capture_hw_params(struct snd_pcm_substream *substream,
 	struct atmel_ac97c *chip = snd_pcm_substream_chip(substream);
 
 	/* Set restrictions to params. */
-	mutex_lock(&opened_mutex);
+	guard(mutex)(&opened_mutex);
 	chip->cur_rate = params_rate(hw_params);
 	chip->cur_format = params_format(hw_params);
-	mutex_unlock(&opened_mutex);
 
 	return 0;
 }
-- 
2.50.1

