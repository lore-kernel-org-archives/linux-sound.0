Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE65F439F77
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010687; cv=none; b=IseP5ff6/iK4RP+i2BejOctpp334EJ90vDqmxUC1F6dV7MhtI0dsspNiQTZ2Fbb9F0k6VgLcbDpXl3IOj++tGsrqlPc+T9uWo1GG6zJkXuNUtt+gDHcwP38x8ZGAcKQiGC1qHV48bhjC+lbL4nklpgMOS95cfD7Sano8P6GC030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010687; c=relaxed/simple;
	bh=823xIoteBm4jZB5U1rJAX8KH/ucK3a51cvHbF3E7MZ8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HFJf+rVSDES0e3Iiqnf6qVnmhAgGIA/7YtHObrbFkr6HOZf6yewn1ojORZ/+uCyn2XW8x4RRCkw2oxPifiLNXLkArV7CY86S3FGfhtyxdX22gg98sNlTSTmriitZagfUtZWs6LHTdaMLtGFCE10R5InZ4vVCGkKG/o3kVg2n0mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xbn81fay; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7RIZ4udD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kg+LKawq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tRPWOdUb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xbn81fay";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7RIZ4udD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kg+LKawq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tRPWOdUb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9660D3E1A;
	Thu,  6 Aug 2026 10:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786010679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rMJlsqlSDbvLKfpiq5VAtVKIgGIL3cH4Qx+IuKok++A=;
	b=xbn81fayxf+usN+39ANrxvZ9LAna37XaZ7Bi2jWKIAvCFC5f3QQIl8z9LJkeU5avRGZy5a
	MXpiMSmFuVzOKycSz5a/35L/ptaWbTnzu+HiFlJFJcwaaf7Cg8LRJ+xC7mzKKODZfW9dQr
	DO05DXoDV6TiNzYwnDlnjlUtCVP/uwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786010679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rMJlsqlSDbvLKfpiq5VAtVKIgGIL3cH4Qx+IuKok++A=;
	b=7RIZ4udDOH+ehLDu6sjyPdmyH59Nxl1Pj+0VqMjP8diSZNXO5F+Iy31702/cqA9217y9sD
	X48eQtZ1KZMn8JCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kg+LKawq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tRPWOdUb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786010675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rMJlsqlSDbvLKfpiq5VAtVKIgGIL3cH4Qx+IuKok++A=;
	b=kg+LKawqBYMJrC2+8ujjETLBKclIFu8rshHPg4EEL2LYryWO/dekiiqxxFO0jZtYypkpyZ
	6WeCjR0HZEbIEjsc5gHmokPYoG8av5aVZXgRLhCtJusuyQwKXmZ9MMVegAcwhaj8EI7kO8
	Nc8ep4OroBavBuQrOOv35OpdeA6kMAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786010675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rMJlsqlSDbvLKfpiq5VAtVKIgGIL3cH4Qx+IuKok++A=;
	b=tRPWOdUbK4fzQQ3amuKVjQNPD7ZuoGcvChcaGL5R/xRdmtJgKFwYyINTHULjAaOIczJzpM
	SPt0Xny5Dtk8VQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B26C779B6;
	Thu,  6 Aug 2026 10:04:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YtbTHDNcdGrsTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 10:04:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: dummy: Check card index validity at probe
Date: Thu,  6 Aug 2026 12:04:31 +0200
Message-ID: <20260806100433.1287393-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
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
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,appspotmail.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 9660D3E1A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

snd_dummy_probe() blindly trusts that the given devptr->id value is
within the proper card index range.  It's OK for the devices the
driver itself creates at the module probe time, but if the device is
bound manually via sysfs interface, this could be -1 as "none", and
this leads to OOB access for index[] and other parameters.

Add a sanity check for the card index and warn/correct it if it's a
value out of the range.

Reported-by: syzbot+2fb5d1f7cc4c1f132bcc@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/6a73bd4d.01d0871a.3a0d52.0005.GAE@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/dummy.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 8836799727ea..022247354732 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -1042,6 +1042,12 @@ static int snd_dummy_probe(struct platform_device *devptr)
 	int idx, err;
 	int dev = devptr->id;
 
+	if (dev < 0 || dev >= SNDRV_CARDS) {
+		dev_warn(&devptr->dev,
+			 "Invalid card index %d, using default 0\n", dev);
+		dev = 0;
+	}
+
 	err = snd_devm_card_new(&devptr->dev, index[dev], id[dev], THIS_MODULE,
 				sizeof(struct snd_dummy), &card);
 	if (err < 0)
-- 
2.55.0

