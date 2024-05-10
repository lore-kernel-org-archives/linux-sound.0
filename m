Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA418165FD1
	for <linux-sound@vger.kernel.org>; Fri, 10 May 2024 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715336060; cv=none; b=dmxA66nQ1evSzRMFO3IPKz0Ra6lYBhopFZQBXKprxdt6mVHf4fbHpa1l0sOkRasUo5H/Qr/yjsxQ68ULfPSU4YSJYXUHn6DHhmN2B2/DZSt4s1VghKFYj7NBpoBTt6ptkXU+nwSOxVMOEXs/2MULukeWengtdGmicm+GT8MAN8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715336060; c=relaxed/simple;
	bh=PCx8x1+k7j0wnKeq0/KIml1GgBZC6p5FwbdB2w177xo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=K3iKfh55gPp1XToXKgulbhCrVkoBMEcsjCQRYtSTgvqudKx/zVTNE5w7B2Ic1S48Bf6QFwlRfdW3Q8lSbeKSgq5VWE76/lbWF4CQ89SwKRdIBU3P9zyZ5RDrNMzBhTniBu0ZacUbWYiMQgznJMYQucyC8VZcoHe7VdBt83KNziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=07GnU6Kr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=auE/u/pe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=07GnU6Kr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=auE/u/pe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="07GnU6Kr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="auE/u/pe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="07GnU6Kr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="auE/u/pe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 72C973F3D7;
	Fri, 10 May 2024 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715336051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tu4GhJaRk4DLrKF6rEfXy1AMKVNU4zAaSJGNVfE+nyk=;
	b=07GnU6KrMlTLkTOjFk0acZR0CtFMld0EOixBq2Xo6OiZH68R5wvKkvRYCQnMjrKxtr1NBE
	NdtivI1sXbRqOnbGVuTm/SnCa9RIiu28J0/U5vC4/WB9UxspRawuLRsI5cptqvAZ4B+GeG
	tTIT8WW8reZ1eDTO/V2VuPyl76ISuLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715336051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tu4GhJaRk4DLrKF6rEfXy1AMKVNU4zAaSJGNVfE+nyk=;
	b=auE/u/peTEbTLa1vmpkG1fjrj1wihyVd24M+twi9ruXVHab/bm6hO5KciLvV5FFFnDv9im
	dt1QQz1u3SAnHrAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715336051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tu4GhJaRk4DLrKF6rEfXy1AMKVNU4zAaSJGNVfE+nyk=;
	b=07GnU6KrMlTLkTOjFk0acZR0CtFMld0EOixBq2Xo6OiZH68R5wvKkvRYCQnMjrKxtr1NBE
	NdtivI1sXbRqOnbGVuTm/SnCa9RIiu28J0/U5vC4/WB9UxspRawuLRsI5cptqvAZ4B+GeG
	tTIT8WW8reZ1eDTO/V2VuPyl76ISuLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715336051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tu4GhJaRk4DLrKF6rEfXy1AMKVNU4zAaSJGNVfE+nyk=;
	b=auE/u/peTEbTLa1vmpkG1fjrj1wihyVd24M+twi9ruXVHab/bm6hO5KciLvV5FFFnDv9im
	dt1QQz1u3SAnHrAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 553291386E;
	Fri, 10 May 2024 10:14:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2E9WE3PzPWaDRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 May 2024 10:14:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: Fix deadlocks with kctl removals at disconnection
Date: Fri, 10 May 2024 12:14:23 +0200
Message-ID: <20240510101424.6279-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

In snd_card_disconnect(), we set card->shutdown flag at the beginning,
call callbacks and do sync for card->power_ref_sleep waiters at the
end.  The callback may delete a kctl element, and this can lead to a
deadlock when the device was in the suspended state.  Namely:

* A process waits for the power up at snd_power_ref_and_wait() in
  snd_ctl_info() or read/write() inside card->controls_rwsem.

* The system gets disconnected meanwhile, and the driver tries to
  delete a kctl via snd_ctl_remove*(); it tries to take
  card->controls_rwsem again, but this is already locked by the
  above.  Since the sleeper isn't woken up, this deadlocks.

An easy fix is to wake up sleepers before processing the driver
disconnect callbacks but right after setting the card->shutdown flag.
Then all sleepers will abort immediately, and the code flows again.

So, basically this patch moves the wait_event() call at the right
timing.  While we're at it, just to be sure, call wait_event_all()
instead of wait_event(), although we don't use exclusive events on
this queue for now.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=218816
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 4ed5037d8693..89c8354862c4 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -516,6 +516,14 @@ void snd_card_disconnect(struct snd_card *card)
 		}
 	}
 
+#ifdef CONFIG_PM
+	/* wake up sleepers here before other callbacks for avoiding potential
+	 * deadlocks with other locks (e.g. in kctls);
+	 * then this notifies the shutdown and sleepers would abort immediately
+	 */
+	wake_up_all(&card->power_sleep);
+#endif
+
 	/* notify all connected devices about disconnection */
 	/* at this point, they cannot respond to any calls except release() */
 
@@ -543,7 +551,6 @@ void snd_card_disconnect(struct snd_card *card)
 	}
 
 #ifdef CONFIG_PM
-	wake_up(&card->power_sleep);
 	snd_power_sync_ref(card);
 #endif
 }
-- 
2.43.0

