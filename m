Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C1A1AF0A8
	for <linux-sound@vger.kernel.org>; Mon,  4 Nov 2024 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714798; cv=none; b=qcr5YT4dBxYZtqUcLz7ql0qsIiQ5CRG+5hbHANCd3sREFOazxJvU9T8BYbAg8dW+fhX5p3a5dxGyFkLPlZtoMZ+//LwopWGDR4fn/rf0hQ1fp35ftshWAk5+2cBY5XcoO6ZT2YK7Mn11W4ERD1xB6NYgmqSdGIh83UPNrBwGBmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714798; c=relaxed/simple;
	bh=JmtvEw/u/AghLzWja4k/2XjqaVAf7g4OIIL0W/Axvts=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=W3We84SJP32MAZLip6y92MKUwlx3cF1l/UkQ+tgEtgRZ6gEi58JTZzWiOJjyPqcq4gtvze4vUN0Pz0g6dbzRYTMByamcuS8Nigp6wUXx8w+hng9lOnIxwq2VAUy6zNfD5q6YuFSAgMkUSTKaM29kCh6w9mFhcW9DOfy4Ct7RbUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C11noZCs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pEAuDAfj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C11noZCs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pEAuDAfj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C11noZCs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pEAuDAfj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C11noZCs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pEAuDAfj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 28B7321BB6;
	Mon,  4 Nov 2024 10:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730714793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FByBFvGLrMrUihL0maXOmieE4CUb+/GeNtgPAnQRw3w=;
	b=C11noZCs0PVteldgjiiQ4STWCyb3Kf7St5J5LwFHsg79ZER165WtPlVIAW9QVsvim34C1Y
	Z9ALYk43zfumhj7laoO6wYfOvowQNi7I6ljkVpMZMYoIaYSNxqCfsM9OI5V3bPjFtbssYP
	q85zFREHSSjr0t4eT18bBWzLE9vau+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730714793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FByBFvGLrMrUihL0maXOmieE4CUb+/GeNtgPAnQRw3w=;
	b=pEAuDAfjAkOHpi5fmW+o6xNgBbfRzx3LEEBibFDvp82jgZP1xME0TXAh5xZ1oWFqebbbEu
	3E5U3VmQfgx/+9AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=C11noZCs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pEAuDAfj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730714793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FByBFvGLrMrUihL0maXOmieE4CUb+/GeNtgPAnQRw3w=;
	b=C11noZCs0PVteldgjiiQ4STWCyb3Kf7St5J5LwFHsg79ZER165WtPlVIAW9QVsvim34C1Y
	Z9ALYk43zfumhj7laoO6wYfOvowQNi7I6ljkVpMZMYoIaYSNxqCfsM9OI5V3bPjFtbssYP
	q85zFREHSSjr0t4eT18bBWzLE9vau+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730714793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FByBFvGLrMrUihL0maXOmieE4CUb+/GeNtgPAnQRw3w=;
	b=pEAuDAfjAkOHpi5fmW+o6xNgBbfRzx3LEEBibFDvp82jgZP1xME0TXAh5xZ1oWFqebbbEu
	3E5U3VmQfgx/+9AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F7E113736;
	Mon,  4 Nov 2024 10:06:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XjSYAqmcKGfqKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 Nov 2024 10:06:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: Don't enumeration invalid groups for legacy rawmidi
Date: Mon,  4 Nov 2024 11:07:34 +0100
Message-ID: <20241104100735.16127-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 28B7321BB6
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

The legacy rawmidi tries to enumerate all possible UMP groups
belonging to the UMP endpoint.  But currently it shows all 16 ports
when the UMP endpoint is configured with static blocks, although most
of them may be unused.

There was already a fix for the sequencer client side to ignore such
groups in the commit 3bfd7c0ba184 ("ALSA: seq: ump: Skip useless ports
for static blocks"), and this commit is a similar fix for UMP
rawmidi devices; it adds simply the check for the validity of each
group that has been already parsed.  (Note that the group info was
moved to snd_ump_endpoint.groups[] by the commit 0642a3c5cacc0321c755
("ALSA: ump: Update substream name from assigned FB names")).

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index cf22a17e38dd..7d59a0a9b037 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1233,7 +1233,7 @@ static int fill_legacy_mapping(struct snd_ump_endpoint *ump)
 
 	num = 0;
 	for (i = 0; i < SNDRV_UMP_MAX_GROUPS; i++)
-		if (group_maps & (1U << i))
+		if ((group_maps & (1U << i)) && ump->groups[i].valid)
 			ump->legacy_mapping[num++] = i;
 
 	return num;
-- 
2.43.0

