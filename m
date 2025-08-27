Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19052340DA4
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286466; cv=none; b=nysd4bQeZ+chn01kvRRqy7D3056iix+dzBdhvY1lQN4wUYYrKqBMwPwrAIDzBdIncImcXr+XSgaQDqz1W0Mzv09CYpJ4m8hyJ2Jk1TvhfCVG7A0C5Fg0TXa0HEPnfoWzWxkbsbQNyeXUS49cuSPcB7C3h4oWCCg4Z50TxraD0jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286466; c=relaxed/simple;
	bh=PKyPXxUTx7BYCPVc+XrH8B2SFcbi78oGZvLUEOLzCOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=No1DgGyE3q0vTKge+JdAYt4amfMRRee0UhZjnPAeCPnrsJGsikItOZxHQ377pyIDLzX/J35+lgZVekZYwj6dJ2AzqBVC3AJX5T4v/RLEFBG7Aqv2TZLmKMBx/rjCIveRuH9PWq0slBnPEscaIsRu0UhVI3Ukh3qG7gg/kl4/DyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U66i7Ya9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3M7Iq483; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U66i7Ya9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3M7Iq483; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U66i7Ya9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3M7Iq483";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U66i7Ya9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3M7Iq483"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D2DDE1FFC6;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsE2jkOzpn9k0lwga3q+t86VS3GDphu7jF6tc41MSrI=;
	b=U66i7Ya9r413Ggzn+ISX9yC8z247YrzQ1pFiW33FMA2lHLh6FS+0d3QKkAlfbeCOqoOpJk
	YR3d1pCaO4Xw26R4j6l5e3E+Qt/P7dZgTc98IJKiUgpszNr6R65gYTLk4s4V0e+YyKwzrq
	u8fbukLcIynrW1r75AzapZJceFHi8l0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsE2jkOzpn9k0lwga3q+t86VS3GDphu7jF6tc41MSrI=;
	b=3M7Iq483SReCwLoNg8pNxqMAMtALWM1iQla8pzFDMBK6hB7pq2lSxMePIKTD+FgWIVj/XS
	6Prl3YVB8G+/3ZAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsE2jkOzpn9k0lwga3q+t86VS3GDphu7jF6tc41MSrI=;
	b=U66i7Ya9r413Ggzn+ISX9yC8z247YrzQ1pFiW33FMA2lHLh6FS+0d3QKkAlfbeCOqoOpJk
	YR3d1pCaO4Xw26R4j6l5e3E+Qt/P7dZgTc98IJKiUgpszNr6R65gYTLk4s4V0e+YyKwzrq
	u8fbukLcIynrW1r75AzapZJceFHi8l0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsE2jkOzpn9k0lwga3q+t86VS3GDphu7jF6tc41MSrI=;
	b=3M7Iq483SReCwLoNg8pNxqMAMtALWM1iQla8pzFDMBK6hB7pq2lSxMePIKTD+FgWIVj/XS
	6Prl3YVB8G+/3ZAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C180B13867;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eNC6LtjNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 09/19] ALSA: firewire: isight: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 11:20:03 +0200
Message-ID: <20250827092017.29014-10-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827092017.29014-1-tiwai@suse.de>
References: <20250827092017.29014-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/isight.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index ee574b5d7406..2b7f071d593b 100644
--- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -327,9 +327,8 @@ static int isight_hw_free(struct snd_pcm_substream *substream)
 
 	WRITE_ONCE(isight->pcm_active, false);
 
-	mutex_lock(&isight->mutex);
+	guard(mutex)(&isight->mutex);
 	isight_stop_streaming(isight);
-	mutex_unlock(&isight->mutex);
 
 	return 0;
 }
@@ -400,16 +399,12 @@ static int isight_start_streaming(struct isight *isight)
 static int isight_prepare(struct snd_pcm_substream *substream)
 {
 	struct isight *isight = substream->private_data;
-	int err;
 
 	isight->buffer_pointer = 0;
 	isight->period_counter = 0;
 
-	mutex_lock(&isight->mutex);
-	err = isight_start_streaming(isight);
-	mutex_unlock(&isight->mutex);
-
-	return err;
+	guard(mutex)(&isight->mutex);
+	return isight_start_streaming(isight);
 }
 
 static int isight_trigger(struct snd_pcm_substream *substream, int cmd)
@@ -677,9 +672,8 @@ static void isight_bus_reset(struct fw_unit *unit)
 	if (fw_iso_resources_update(&isight->resources) < 0) {
 		isight_pcm_abort(isight);
 
-		mutex_lock(&isight->mutex);
+		guard(mutex)(&isight->mutex);
 		isight_stop_streaming(isight);
-		mutex_unlock(&isight->mutex);
 	}
 }
 
@@ -691,9 +685,9 @@ static void isight_remove(struct fw_unit *unit)
 
 	snd_card_disconnect(isight->card);
 
-	mutex_lock(&isight->mutex);
-	isight_stop_streaming(isight);
-	mutex_unlock(&isight->mutex);
+	scoped_guard(mutex, &isight->mutex) {
+		isight_stop_streaming(isight);
+	}
 
 	// Block till all of ALSA character devices are released.
 	snd_card_free(isight->card);
-- 
2.50.1

