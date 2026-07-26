Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD9F1DF75A
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 07:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785052106; cv=none; b=AUb2s6e9Sh7YOhvdbNfhRYPlRbPIbPL+/bdGQeOyXWggtgUD+xe90DxrUPStoPAYw+GuwLrBFjoGoP6P1CO3yQNry+nfCrm77+I3NCFaYB5KUcOnlvqwglj3NHAfqID+Gv4Wwg2l7ePihI4syec4r0+yaCMoYhr4K/1KZoUTMpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785052106; c=relaxed/simple;
	bh=vrYe7C8kDn+UnCSspnkSYaY7/dVFTMKPdMYXhYYfbWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TLYi+SHjjbSEFgEifIOuivNwoMiR62URw0Xd2+IaIYiQmjrESSFBx91Wx7XbzWDymvWumY/eR7RTR32rKfsutrOkn0ZjNSwnqp2TYFd5B/LGyGNl/qkM39HHm//3jFg7z7nxF2zIQSc3hHZDRRqifxAYVF2KXSijpjf5Pknn8ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XMDiHj92; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+XCTZmjL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XMDiHj92; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+XCTZmjL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XMDiHj92";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+XCTZmjL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XMDiHj92";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+XCTZmjL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 800907D49E;
	Sun, 26 Jul 2026 07:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785052103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZXfclmU8Gmgf4Op6CMRnoTf6i1EP01eVBMKfEAq+Rkc=;
	b=XMDiHj92Yd2MywEnidrE4CYpRfiXLGobc7FbQTqSC02et++SxNinTWONnnfddJrhSt2xmy
	dZMJTJqL9LXs5Rkb9rSISuusvv/yo0xo7Bp0ioq7zMo5sS3c38uIHlzlTHDuScoNA0Blkw
	i+Omnu6aAOYhhuIfJnwOaKG8Upt3Ngg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785052103;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZXfclmU8Gmgf4Op6CMRnoTf6i1EP01eVBMKfEAq+Rkc=;
	b=+XCTZmjLddjHp4svR2N7XnTZsiptk6OeWXJESQuZ9k0QKOHOsiZwRZRnzG3ZJxTc9UVPfT
	qHKcZZtaYBWTXsDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XMDiHj92;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+XCTZmjL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785052103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZXfclmU8Gmgf4Op6CMRnoTf6i1EP01eVBMKfEAq+Rkc=;
	b=XMDiHj92Yd2MywEnidrE4CYpRfiXLGobc7FbQTqSC02et++SxNinTWONnnfddJrhSt2xmy
	dZMJTJqL9LXs5Rkb9rSISuusvv/yo0xo7Bp0ioq7zMo5sS3c38uIHlzlTHDuScoNA0Blkw
	i+Omnu6aAOYhhuIfJnwOaKG8Upt3Ngg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785052103;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZXfclmU8Gmgf4Op6CMRnoTf6i1EP01eVBMKfEAq+Rkc=;
	b=+XCTZmjLddjHp4svR2N7XnTZsiptk6OeWXJESQuZ9k0QKOHOsiZwRZRnzG3ZJxTc9UVPfT
	qHKcZZtaYBWTXsDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B4B6779B9;
	Sun, 26 Jul 2026 07:48:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r1NkFMe7ZWqRJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 26 Jul 2026 07:48:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Subject: [PATCH] ALSA: 6fire: Fix UAF at error handling during probe
Date: Sun, 26 Jul 2026 09:48:19 +0200
Message-ID: <20260726074821.2288158-1-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim];
	TAGGED_RCPT(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 800907D49E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Although 6fire driver had a few fixes for dealing with the early error
handling during the probe phase, it forgot a pending URB before
freeing the resources, which may lead to a UAF.

This patch addresses it by doing the almost same cleanup procedure
like the normal disconnect phase at the error path.

Reported-and-tested-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Closes: https://lore.kernel.org/20260724030900.1984491-1-shuangpeng.kernel@gmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/chip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/6fire/chip.c b/sound/usb/6fire/chip.c
index 2c5648966412..6cf410a92fa2 100644
--- a/sound/usb/6fire/chip.c
+++ b/sound/usb/6fire/chip.c
@@ -150,6 +150,10 @@ static int usb6fire_chip_probe(struct usb_interface *intf,
 	return 0;
 
 destroy_chip:
+	chip->shutdown = true;
+	if (card)
+		snd_card_disconnect(card);
+	usb6fire_chip_abort(chip);
 	snd_card_free(card);
 	return ret;
 }
-- 
2.55.0

