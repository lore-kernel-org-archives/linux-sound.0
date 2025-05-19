Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22B11DE2CE
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 21:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689641; cv=none; b=RreCx5wlu9NpwWPKA5W44KBUgZiIGDEK0h6KjlhLaE6FVJitYIc43rLrg43FjG3swDhIHX4V+6EU8VZey0Qg2u/3rBveieuu+GrsvIlEHumz1maM4zNmpIzwOyfAOREiJfsN51ijnD1uTKw3aZs1jzHlAXjjjqJXk27HEle05b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689641; c=relaxed/simple;
	bh=kn9M0TfAISBxX9ZFmKd9LHO8xbyaYXtDSeK7Z7AlaS0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IfRx4JTrKRambpEAufSksKFIVMBG9j77W9xYF/2msaeTqunK6Vlb2WuvkOTh+gFHQI7R+ccP1T7sdz1ueSJD2WKnv98qGJMdUGFZppRReX50YhwGtL+/wZaYNru6+JrUyC2UMB6KCEwhs11SaUT8j/3H2OQoGTUwYhvGWUSSj/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MvD7mB5/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r8yiJFUb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iqxb6Y9i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1s+wZ0FI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MvD7mB5/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r8yiJFUb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iqxb6Y9i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1s+wZ0FI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7A0BE21F90;
	Mon, 19 May 2025 21:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747689638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ymShWVYc6jgIcF0P1Jg2tFRSXSn7oVOuWR1q+f9RkZ8=;
	b=MvD7mB5/m1bKBYiihLpjvgci5xMOmYvU60tbOeVgFoD5FZsY8e0h6CSpGdu70ZKFr6k6Ou
	fUaKlNR+gzfobIK5a2T6U1Zm98/0+HWx+v/fiE+V21B3S9ISnYk8A/P3pNX+PsWDnlwRQO
	j+khELBd7D6UPgWuktorBbrrSy+X5bg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747689638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ymShWVYc6jgIcF0P1Jg2tFRSXSn7oVOuWR1q+f9RkZ8=;
	b=r8yiJFUbT1XzRF8eUFdDENyDpHBKsIgd5NlUxmruJLdmaoTSIgii6CiDuQbSUSGkX9aHvk
	juLKcviequhYCBDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iqxb6Y9i;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1s+wZ0FI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747689637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ymShWVYc6jgIcF0P1Jg2tFRSXSn7oVOuWR1q+f9RkZ8=;
	b=iqxb6Y9iySpGkVfjIuqu+ecpgtruut1SQdR5QZbw92WVk7CaXRKbbp/yKQgtsmyVMBYqUJ
	tDdrwHgpAz8ZCeVmIpxknsS0OTFLA3HN2tpo+Xr6+IFnb+WkTMskvcX1i85l7skmWfrntK
	3KbKH84aQ0KzqC8WNoe5dN4gh1phrYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747689637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ymShWVYc6jgIcF0P1Jg2tFRSXSn7oVOuWR1q+f9RkZ8=;
	b=1s+wZ0FIUNE4jV+NeXDtjb2nnRxgQen2r9CBaGn6jFlH4ypwEd61Ydue2fQb10w9yOet1m
	9bH34e1Lpd1fPADg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6ADC413A30;
	Mon, 19 May 2025 21:20:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jmo0GaWgK2heJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 May 2025 21:20:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Kill timer properly at removal
Date: Mon, 19 May 2025 23:20:30 +0200
Message-ID: <20250519212031.14436-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7A0BE21F90
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]

The USB-audio MIDI code initializes the timer, but in a rare case, the
driver might be freed without the disconnect call.  This leaves the
timer in an active state while the assigned object is released via
snd_usbmidi_free(), which ends up with a kernel warning when the debug
configuration is enabled, as spotted by fuzzer.

For avoiding the problem, put timer_shutdown_sync() at
snd_usbmidi_free(), so that the timer can be killed properly.
While we're at it, replace the existing timer_delete_sync() at the
disconnect callback with timer_shutdown_sync(), too.

Reported-by: syzbot+d8f72178ab6783a7daea@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/681c70d7.050a0220.a19a9.00c6.GAE@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 9ab746ba367d..3a8a977ed359 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1530,6 +1530,7 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
 			snd_usbmidi_in_endpoint_delete(ep->in);
 	}
 	mutex_destroy(&umidi->mutex);
+	timer_shutdown_sync(&umidi->error_timer);
 	kfree(umidi);
 }
 
@@ -1553,7 +1554,7 @@ void snd_usbmidi_disconnect(struct list_head *p)
 	spin_unlock_irq(&umidi->disc_lock);
 	up_write(&umidi->disc_rwsem);
 
-	timer_delete_sync(&umidi->error_timer);
+	timer_shutdown_sync(&umidi->error_timer);
 
 	for (i = 0; i < MIDI_MAX_ENDPOINTS; ++i) {
 		struct snd_usb_midi_endpoint *ep = &umidi->endpoints[i];
-- 
2.49.0

