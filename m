Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18391E674B
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037662; cv=none; b=f51qi17jveSiZdG0xJVtfq/qGFB+DWAoWYfqzDTu3/7Ogv6qkclyctcrGD6SuaXKOsMFJk4TWrinjiRyBTr1ByYxcnSSljePtGJVAgKO4YRBxabOY5hEb9Jgej5+oQZQrkL+4XCkegQtaIYrw3c9SsizttyUaEd866v1oWb9QeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037662; c=relaxed/simple;
	bh=sTg+NqZJy1fNZN4LRcSPzPdMjdXFsFQnFjYI+rS9hUw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ehww2Bk5wksyDbJVmC9PDtKiWQ4fDztNo1ONo8y93N3XhII/BzPN/fw0VvMqSD7vd8JaTBtY8IEwy8vKQvgx3ykjQo7w7i4JpbeHh3808pwq4mnoZjV0YJTyUOAtGdXWZkFwWhtEJOSV7IO9yYlQCncUOme+IkIdoYk6ASxO+rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VgeK083Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B13B2ox1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VgeK083Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B13B2ox1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VgeK083Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B13B2ox1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VgeK083Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B13B2ox1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E96C621D1A;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mnUXg+F1mFQwBp57cMNCdi+1ZxT/x11GpC4dckPifc=;
	b=VgeK083QIjSj/6eexsIQn7ZcX35M6poX9QLYb+zU7ipXJKL9SVeE0aGMoYHb7ddcdNxygf
	j6vbhY5sdtIJfE+tUbKkiWEKfO6BQyOdUfNWs3v48RKsXXIe4HJAcwlV+jbls7WQPS6ZNC
	eG0jsdMgOn7LQ5xnA9DDlQqfHav+0Hs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mnUXg+F1mFQwBp57cMNCdi+1ZxT/x11GpC4dckPifc=;
	b=B13B2ox1vUwqp5addGB4Q/mLhv6aIwTK1htPkmIj3tVKE4JwtByk5TXDLgBsPOuuCl6mr9
	nCxbkouTJXWAXFAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mnUXg+F1mFQwBp57cMNCdi+1ZxT/x11GpC4dckPifc=;
	b=VgeK083QIjSj/6eexsIQn7ZcX35M6poX9QLYb+zU7ipXJKL9SVeE0aGMoYHb7ddcdNxygf
	j6vbhY5sdtIJfE+tUbKkiWEKfO6BQyOdUfNWs3v48RKsXXIe4HJAcwlV+jbls7WQPS6ZNC
	eG0jsdMgOn7LQ5xnA9DDlQqfHav+0Hs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mnUXg+F1mFQwBp57cMNCdi+1ZxT/x11GpC4dckPifc=;
	b=B13B2ox1vUwqp5addGB4Q/mLhv6aIwTK1htPkmIj3tVKE4JwtByk5TXDLgBsPOuuCl6mr9
	nCxbkouTJXWAXFAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD28F13A7D;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +NX2MNl3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/54] ALSA: virmidi: Use standard print API
Date: Wed,  7 Aug 2024 15:33:59 +0200
Message-ID: <20240807133452.9424-10-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.21 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.949];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.21

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/virmidi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/virmidi.c b/sound/drivers/virmidi.c
index 58012de90c38..5f7b65ad63e3 100644
--- a/sound/drivers/virmidi.c
+++ b/sound/drivers/virmidi.c
@@ -83,9 +83,9 @@ static int snd_virmidi_probe(struct platform_device *devptr)
 	vmidi->card = card;
 
 	if (midi_devs[dev] > MAX_MIDI_DEVICES) {
-		snd_printk(KERN_WARNING
-			   "too much midi devices for virmidi %d: force to use %d\n",
-			   dev, MAX_MIDI_DEVICES);
+		dev_warn(&devptr->dev,
+			 "too much midi devices for virmidi %d: force to use %d\n",
+			 dev, MAX_MIDI_DEVICES);
 		midi_devs[dev] = MAX_MIDI_DEVICES;
 	}
 	for (idx = 0; idx < midi_devs[dev]; idx++) {
@@ -155,7 +155,7 @@ static int __init alsa_card_virmidi_init(void)
 	}
 	if (!cards) {
 #ifdef MODULE
-		printk(KERN_ERR "Card-VirMIDI soundcard not found or device busy\n");
+		pr_err("Card-VirMIDI soundcard not found or device busy\n");
 #endif
 		snd_virmidi_unregister_all();
 		return -ENODEV;
-- 
2.43.0

