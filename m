Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921331B10E
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421843; cv=none; b=CtvbAonqENCo3opKaQJA+g0geGWj9oY/86LriK1whA9fjQ1kpWbe9X+D4wx2cfv5LMgVzCug83kQyKhUa3TQtco+lVFBhqApAhZWIuX41nM6jZhh2Y+keMIC13S/BXQReTsxPTLAl7iWFbq5tmYAkAdnWFIRZnfOCfcsi5avkbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421843; c=relaxed/simple;
	bh=pMLQU6j7pk5mARF6N+7jvs5jgmRidPGI+lwXXeqRnmY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lenbcTCJjX6ldV8EKgBITh6tKrQ8d6zwxth9v0Me5YEtHhPvaCOOys0iGkBsLUQaK2XlJiQQDfsy8NYUYcX5t2CaMNxBaJGFJRSlJuqQrxXFa5SKqN7Tw5W6PQ9cGv0Gm60eLUp9W0k32046lCv3P5CFsTvCI2BfQhB8FRu800A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rTXe3XJk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZqNZ1soM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TtcF9cWd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oEq2kU5e; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rTXe3XJk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZqNZ1soM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TtcF9cWd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oEq2kU5e"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 69DE71FB65;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj0QzBc63Bl9FCh0jQxszXNryK9JJP5rxMjilH4K9vw=;
	b=rTXe3XJkUDkaRoOeoOP95/1n7GRKNaC5Lnhdq6+j3dmDS61ljOd82xs93/9nucb8/0h4Ci
	QvYPdv/8QBLEMqAQJF2mAc8fedqw8KFUG0SeDvsffBdOrJsLX1HaKpwZMLyLZF6VzcBBOr
	ztZOZUaqCaNkNIzC4YttwRpV945FCpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj0QzBc63Bl9FCh0jQxszXNryK9JJP5rxMjilH4K9vw=;
	b=ZqNZ1soMUUIRnDaTUIRFlEhlDqMtBaREolo7HFeAYf296hg5J1BXc/ZLb4klToxhd5rA1d
	NRfU2dqU0D3wEvBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TtcF9cWd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oEq2kU5e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj0QzBc63Bl9FCh0jQxszXNryK9JJP5rxMjilH4K9vw=;
	b=TtcF9cWd/J3p1ZVMe55xoeZIn4IpWjADP7MS0SoyZoc9NyFQyu6fqQvyzRPutmNW3F4JRt
	bkG3F04WgOBSNFDUCi8mgexmyPPXnU6GjAHN/CuYIqqdyMztOTK/vy4Mai9g6J3wmLGDN7
	wJKXHY1rDynDUGZoe0Aetyv6iJhy1qA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj0QzBc63Bl9FCh0jQxszXNryK9JJP5rxMjilH4K9vw=;
	b=oEq2kU5e+cYISbfomPK6b3jeyqaAYCz9/UM3OOoyCUtfpj6vFmIjOsw/3zh8LaHqqTbf6M
	g0Pv+CqnuOEkVFDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5809313ABA;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wI33FPYgwGi6TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Sep 2025 12:43:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/14] ALSA: aoa: Don't split string across lines
Date: Tue,  9 Sep 2025 14:43:22 +0200
Message-ID: <20250909124331.10670-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909124331.10670-1-tiwai@suse.de>
References: <20250909124331.10670-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 69DE71FB65
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
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

We shouldn't split a quoted string, as it worsens the grep-ability.
Put back to the single line, which also makes checkpatch.pl happier.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/aoa/soundbus/i2sbus/pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index fe11fee3c78f..4c480ad2c05d 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -637,8 +637,8 @@ static inline void handle_interrupt(struct i2sbus_dev *i2sdev, int in)
 				if (!(status & ACTIVE) && (!in || (status & 0x80)))
 					break;
 				if (--timeout <= 0) {
-					printk(KERN_ERR "i2sbus: timed out "
-					       "waiting for DMA to stop!\n");
+					printk(KERN_ERR
+					       "i2sbus: timed out waiting for DMA to stop!\n");
 					break;
 				}
 				udelay(1);
-- 
2.50.1

