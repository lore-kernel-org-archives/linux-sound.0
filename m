Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CD7322DB2
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478676; cv=none; b=hrb+xCBfrGq5lm2gAglPrQDjZEiDzWLrmqc6XQBvlQy1ddYxkdwCIXdEJQ/KsRZJ1xQwQoPqbpIDjbnXkbfvnBTgRg23zAZiCP4XVxZ0ZC13H2qU0hsljQmH74isr+rbe0L0BhA7gvBAf8u5hc4/cA/axaRcEu/V+F+/QyY9Wv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478676; c=relaxed/simple;
	bh=S9yNmL6xCH8EErXK0vTIyIKss6uVZV7jTm20N0H/EWs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQlgRtiUyAj03SlQpGDfe6YqSG2GWp/4e+aQ3c2v6RlM/uKV1+uNIGG6eRq6+Pj7D+TL2cQj4TdFLM49VsxtnDCVFGqi6MqZs06xYsmL3o1+We1GszQRVrQekPnzYJ4SSrxUdoghCzKCrhiiAOaMhVFBrSDV//qC+2Gp+lZIRLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wj30k6Qe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nban7P44; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wj30k6Qe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nban7P44; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wj30k6Qe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nban7P44";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wj30k6Qe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nban7P44"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9C85D5C22B;
	Fri, 29 Aug 2025 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qq3mmOY6gJEswSy9R12Vzf45x2MaQS6GPoYPpNmAhUg=;
	b=Wj30k6QeNnEuRdGMfWL3HJvDjtKDlhVeoX7WPMosj8zVD3V/7LkKj7jkKigPAUlKK8fDMO
	v8rBb7QXV0uBJCdgH2jtx/CckfLzgiUHa+G5qQ60KxVIXqaxs5AtG/6cMmIVnTPrvN7sUA
	CVwm8MdH5CS+nR4xolZnkP3CPaWJ4rQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qq3mmOY6gJEswSy9R12Vzf45x2MaQS6GPoYPpNmAhUg=;
	b=Nban7P44zD/VETEEhIEjgEffASbwsGn1RwEKulb6T8/bSmtEVO788g7J6MvJ4jiSREIhXv
	yLTWp8Ia8jqFN9CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Wj30k6Qe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Nban7P44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qq3mmOY6gJEswSy9R12Vzf45x2MaQS6GPoYPpNmAhUg=;
	b=Wj30k6QeNnEuRdGMfWL3HJvDjtKDlhVeoX7WPMosj8zVD3V/7LkKj7jkKigPAUlKK8fDMO
	v8rBb7QXV0uBJCdgH2jtx/CckfLzgiUHa+G5qQ60KxVIXqaxs5AtG/6cMmIVnTPrvN7sUA
	CVwm8MdH5CS+nR4xolZnkP3CPaWJ4rQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qq3mmOY6gJEswSy9R12Vzf45x2MaQS6GPoYPpNmAhUg=;
	b=Nban7P44zD/VETEEhIEjgEffASbwsGn1RwEKulb6T8/bSmtEVO788g7J6MvJ4jiSREIhXv
	yLTWp8Ia8jqFN9CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82E0913A3E;
	Fri, 29 Aug 2025 14:43:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iL/QHqu8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 13/61] ALSA: aw2: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:48 +0200
Message-ID: <20250829144342.4290-14-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 9C85D5C22B
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

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/aw2/aw2-alsa.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index bf9b3c84f554..e2c501f4394c 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -397,10 +397,10 @@ static int snd_aw2_pcm_prepare_capture(struct snd_pcm_substream *substream)
 static int snd_aw2_pcm_trigger_playback(struct snd_pcm_substream *substream,
 					int cmd)
 {
-	int status = 0;
 	struct aw2_pcm_device *pcm_device = snd_pcm_substream_chip(substream);
 	struct aw2 *chip = pcm_device->chip;
-	spin_lock(&chip->reg_lock);
+
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		snd_aw2_saa7146_pcm_trigger_start_playback(&chip->saa7146,
@@ -413,20 +413,19 @@ static int snd_aw2_pcm_trigger_playback(struct snd_pcm_substream *substream,
 							  stream_number);
 		break;
 	default:
-		status = -EINVAL;
+		return -EINVAL;
 	}
-	spin_unlock(&chip->reg_lock);
-	return status;
+	return 0;
 }
 
 /* capture trigger callback */
 static int snd_aw2_pcm_trigger_capture(struct snd_pcm_substream *substream,
 				       int cmd)
 {
-	int status = 0;
 	struct aw2_pcm_device *pcm_device = snd_pcm_substream_chip(substream);
 	struct aw2 *chip = pcm_device->chip;
-	spin_lock(&chip->reg_lock);
+
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		snd_aw2_saa7146_pcm_trigger_start_capture(&chip->saa7146,
@@ -439,10 +438,9 @@ static int snd_aw2_pcm_trigger_capture(struct snd_pcm_substream *substream,
 							 stream_number);
 		break;
 	default:
-		status = -EINVAL;
+		return -EINVAL;
 	}
-	spin_unlock(&chip->reg_lock);
-	return status;
+	return 0;
 }
 
 /* playback pointer callback */
-- 
2.50.1

