Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95EA1AE843
	for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732111873; cv=none; b=YFOvEBhhNPbA/xuGsUohTHYoKCvR6nfuV7qI5XvleVfwWJlUVsdlZJ6SbLSJqIb+nY6h1Z/a7Se9TX0r/C4K044UKnPvHl/nPJLW8FcalPwY21OFacJAAhRoPl1MZxPClA90UYmb1D5XKY+T5DS9Xvuvb675Uo4XhI2PjwNaZPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732111873; c=relaxed/simple;
	bh=OfTI8dK3uIizdbthLH8Luh6iIFq/1jHlqfFQ+tsCi7c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=QTX7iwqiLxQulV9EVOJmnYiqRxLz7GRA2ZGPlDb+9shV77X++cz90MOaMuLgRA+yfm0+aVFIVEzch3TwjMZeyzxQ08Hfd/eKSf4fozlXuEX3bpKganoae6TlFgeAqfmKxTxviRykbMw+0v+6RF6H/ZTHAVzw5/Nn30uHWzWGyVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s8TgF2s5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Rsf0PBD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s8TgF2s5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Rsf0PBD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s8TgF2s5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Rsf0PBD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s8TgF2s5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Rsf0PBD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 17DDC1F79C;
	Wed, 20 Nov 2024 14:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732111870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8B+D06eLE9/VC4rYHFk3cGfzs151/Wonbq9cT29mDnw=;
	b=s8TgF2s5JEos1yauzmcuibn54+xPqWbDkrM+qxpY84lKnzvc62ceEdnA59q0zqORmXu6PO
	qwF4uS/nBVZOykwQoXDFbVfJh1LkpshZt9HTSYCcR2Tjh6Ldqpfvis6c3Xe869IcMFmJ3y
	cLU4V4LnnqQOnA2RQlRS7+W+DhOgJo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732111870;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8B+D06eLE9/VC4rYHFk3cGfzs151/Wonbq9cT29mDnw=;
	b=5Rsf0PBDibQuRukX7bBCbbjpfJfEv82it+16q8QPT2sYjn0CTyeoB4nP8Db1sD7AiPG+0e
	s63gq6K13CgKzgDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=s8TgF2s5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5Rsf0PBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732111870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8B+D06eLE9/VC4rYHFk3cGfzs151/Wonbq9cT29mDnw=;
	b=s8TgF2s5JEos1yauzmcuibn54+xPqWbDkrM+qxpY84lKnzvc62ceEdnA59q0zqORmXu6PO
	qwF4uS/nBVZOykwQoXDFbVfJh1LkpshZt9HTSYCcR2Tjh6Ldqpfvis6c3Xe869IcMFmJ3y
	cLU4V4LnnqQOnA2RQlRS7+W+DhOgJo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732111870;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8B+D06eLE9/VC4rYHFk3cGfzs151/Wonbq9cT29mDnw=;
	b=5Rsf0PBDibQuRukX7bBCbbjpfJfEv82it+16q8QPT2sYjn0CTyeoB4nP8Db1sD7AiPG+0e
	s63gq6K13CgKzgDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09DF6137CF;
	Wed, 20 Nov 2024 14:11:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jgbGAf7tPWdOLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Nov 2024 14:11:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Add sanity NULL check for the default mmap fault handler
Date: Wed, 20 Nov 2024 15:11:02 +0100
Message-ID: <20241120141104.7060-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 17DDC1F79C
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

A driver might allow the mmap access before initializing its
runtime->dma_area properly.  Add a proper NULL check before passing to
virt_to_page() for avoiding a panic.

Reported-by: syzbot+4bf62a7b1d0f4fdb7ae2@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 47027fa4eb28..381a476a1045 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3813,9 +3813,11 @@ static vm_fault_t snd_pcm_mmap_data_fault(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 	if (substream->ops->page)
 		page = substream->ops->page(substream, offset);
-	else if (!snd_pcm_get_dma_buf(substream))
+	else if (!snd_pcm_get_dma_buf(substream)) {
+		if (WARN_ON_ONCE(!runtime->dma_area))
+			return VM_FAULT_SIGBUS;
 		page = virt_to_page(runtime->dma_area + offset);
-	else
+	} else
 		page = snd_sgbuf_get_page(snd_pcm_get_dma_buf(substream), offset);
 	if (!page)
 		return VM_FAULT_SIGBUS;
-- 
2.43.0

