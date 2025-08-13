Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AEF2690D9
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073801; cv=none; b=ugz8YKFXoANFbaFXMdK7Z8DFTTFhFZudz/OW4FKBgy2kb+cOVRVAuFR4VkbSlzIMtVXaQXRuAol7RiWF1bwXTIROQ93U40h6BQolwyQIbdzfg5Ib1ZEfKxTDiZX1kKdy0hNl4NJhd+Fcxl6x4kHZvjV+nn4GxwHrhxDgVkounGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073801; c=relaxed/simple;
	bh=F9GNlTsIvHDq4xVJy8hIxmu+l+Kz8di2w09AU5RlHRE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=b0Q23QhYhRlYnOJ4LG/42q1oO6LXGgcERPyB0KPZuKugCRS48p5EDN2HfoDoJdPb0IhCEyjE7sgfRTM53QZdVyqVklY18Y1ZJhd3hzpO0TW4GAKL2caEQ5117G6UPpRQgXBbIChMQkzbDEcQI9Qui2WfTDqvKFfi1lpTeD8uRuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QfB/coq0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dFtspbGi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2Jc2prXL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i6stHBcO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QfB/coq0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dFtspbGi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Jc2prXL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i6stHBcO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DA7E61F461;
	Wed, 13 Aug 2025 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755073794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/oItZnY4o1kD2ploKwOCFkbuHDkwcMjOj1j/tdGqas4=;
	b=QfB/coq0bOLFJjMn0cBKIlmrwgL0fhSReotuMGr/qAUps3jS+q9HNnkJarlHnjiHiir4Y7
	m4QMcKQhQFNcjF+OhOrKgvjr+tTVa702MhMdlgz3KewutxkdT9Lg8VeILtSPzJ8+sL0FCA
	vndFhG27k3w4q5cNUInxW1k1kRJXWGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755073794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/oItZnY4o1kD2ploKwOCFkbuHDkwcMjOj1j/tdGqas4=;
	b=dFtspbGi5bOzexDctw4NqiNP79PAtoUJ9kOwM3z1ahgdXukCKziro4Rc/HshotYhzHjy/y
	QK00zJfbDMQTMqCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2Jc2prXL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=i6stHBcO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755073793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/oItZnY4o1kD2ploKwOCFkbuHDkwcMjOj1j/tdGqas4=;
	b=2Jc2prXLxmPFP1OSfvplApibTpyPSXe1KObVCRWjwphTZPcWCipEkxawISx4H4v3ZDHFdo
	X37pEgUwzc1qUhARLpfRA+NAwvvb1vs4V5r0Lw7NsCrF3rGs4+8Yy8bCYbZwHLFDnPcqtU
	mo5Z9ibXJH6r6KSs4XU3cBIIhNvYxrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755073793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/oItZnY4o1kD2ploKwOCFkbuHDkwcMjOj1j/tdGqas4=;
	b=i6stHBcO4zpNhMfHv3Jh7vEUVU55v5lBGa82gjbtBzWHmsB698cv4SS6fe0XairBFC7PF8
	8UQddbYps8hiBZBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF84213929;
	Wed, 13 Aug 2025 08:29:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EuZxLQFNnGiFCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Aug 2025 08:29:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq/oss: Fix NULL dereference by auto-free
Date: Wed, 13 Aug 2025 10:29:51 +0200
Message-ID: <20250813082952.5094-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: DA7E61F461
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

The use of auto-cleanup in snd_seq_oss_midi_check_new_port() caused
rather confusion, as it's keeping the assigned pointer with
no_free_ptr() while it's referred in the left-hand side.

Since the auto-cleanup doesn't make the code easier to follow, revert
the change in this function and manage the reference manually
instead, and fix the regression by the previous change.

Reported-by: syzbot+51c1105d06b79f38316d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/689c4625.050a0220.51d73.00ba.GAE@google.com
Fixes: 8b887676dc1f ("ALSA: seq: oss/midi: Cleanup with guard and auto-cleanup")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_midi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index 6d6a1a0dc6c0..023e5d0a4351 100644
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -130,7 +130,7 @@ int
 snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 {
 	int i;
-	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
+	struct seq_oss_midi *mdev;
 
 	/* the port must include generic midi */
 	if (! (pinfo->type & SNDRV_SEQ_PORT_TYPE_MIDI_GENERIC))
@@ -146,6 +146,7 @@ snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 	mdev = find_slot(pinfo->addr.client, pinfo->addr.port);
 	if (mdev) {
 		/* already exists */
+		snd_use_lock_free(&mdev->use_lock);
 		return 0;
 	}
 
@@ -170,7 +171,7 @@ snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 	/* create MIDI coder */
 	if (snd_midi_event_new(MAX_MIDI_EVENT_BUF, &mdev->coder) < 0) {
 		pr_err("ALSA: seq_oss: can't malloc midi coder\n");
-		kfree(no_free_ptr(mdev));
+		kfree(mdev);
 		return -ENOMEM;
 	}
 	/* OSS sequencer adds running status to all sequences */
@@ -187,13 +188,13 @@ snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 	if (i >= max_midi_devs) {
 		if (max_midi_devs >= SNDRV_SEQ_OSS_MAX_MIDI_DEVS) {
 			snd_midi_event_free(mdev->coder);
-			kfree(no_free_ptr(mdev));
+			kfree(mdev);
 			return -ENOMEM;
 		}
 		max_midi_devs++;
 	}
 	mdev->seq_device = i;
-	midi_devs[mdev->seq_device] = no_free_ptr(mdev);
+	midi_devs[mdev->seq_device] = mdev;
 
 	return 0;
 }
-- 
2.50.1

