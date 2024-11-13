Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1463A1FDFBA
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496250; cv=none; b=ENFAXLUY9Bo9XdhfOpbTqTKKNyLeuPY/cEzfcYIiSqEYHMapnsTXgsOaCHBlmcjx01D/OZ9hPo52P9p93hhtny5omLdu/8IyahKWdOARZxKkNSmLlqqohlduJACH1Yxq2OCEKhitzf4p1iuvOMTtWtmyVxINGJTV8s+uZQRopvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496250; c=relaxed/simple;
	bh=j6gSxfRnzrhCbZAR157s9+Qkgs0pGRxRwm1G7R/tD2c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQTKCLxk53by+nI7G3iKoAToZ7oqrO5RKE29ks1/ega3Q2XYzmt4P6PwGD8jpaoUqshbQqxeEF9y2TeNyAiZrFPrwfd5tDcDSB0Wh6RYxyRvNHzRqkd5kk+51bWk5Nj/rzcgqqeiznStBLVKIJZFcq8OPsE4xvpKqE6JoTm7Go4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ByGpY6CG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4GFKoJ+v; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ByGpY6CG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4GFKoJ+v; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ByGpY6CG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4GFKoJ+v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ByGpY6CG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4GFKoJ+v"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4FE3C1F38C;
	Wed, 13 Nov 2024 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkCU0pI44EbXKVEJZ7z8wt+JZ9PcIL1nv5AI6h2c0Po=;
	b=ByGpY6CGl7K0THNJffTIIev8NjDL8TdEDahj+1MjDdAAvNVM+OrAfv339SwVQP7SJXbjqg
	3W8/DWvOhbX+VvSkp/1I871q9tRFQWVUwCt58KCUDsesSMntzFEhRQB2qdvyAZHBhJImFC
	Vb5pvfcRoHqyetsh4nb+Jwmb0/kOpUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkCU0pI44EbXKVEJZ7z8wt+JZ9PcIL1nv5AI6h2c0Po=;
	b=4GFKoJ+vOldAgWPACYgelgq9nY9FaW4vqfTN4k8NZoMi7EfY2Py0DUL8RjbYeGSy+b1ACb
	qtp10CU35cQZKwAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ByGpY6CG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4GFKoJ+v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkCU0pI44EbXKVEJZ7z8wt+JZ9PcIL1nv5AI6h2c0Po=;
	b=ByGpY6CGl7K0THNJffTIIev8NjDL8TdEDahj+1MjDdAAvNVM+OrAfv339SwVQP7SJXbjqg
	3W8/DWvOhbX+VvSkp/1I871q9tRFQWVUwCt58KCUDsesSMntzFEhRQB2qdvyAZHBhJImFC
	Vb5pvfcRoHqyetsh4nb+Jwmb0/kOpUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkCU0pI44EbXKVEJZ7z8wt+JZ9PcIL1nv5AI6h2c0Po=;
	b=4GFKoJ+vOldAgWPACYgelgq9nY9FaW4vqfTN4k8NZoMi7EfY2Py0DUL8RjbYeGSy+b1ACb
	qtp10CU35cQZKwAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3227813301;
	Wed, 13 Nov 2024 11:10:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IJ4ECzaJNGe3UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Nov 2024 11:10:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/5] ALSA: us122l: Use snd_card_free_when_closed() at disconnection
Date: Wed, 13 Nov 2024 12:10:36 +0100
Message-ID: <20241113111042.15058-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241113111042.15058-1-tiwai@suse.de>
References: <20241113111042.15058-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4FE3C1F38C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

The USB disconnect callback is supposed to be short and not too-long
waiting.  OTOH, the current code uses snd_card_free() at
disconnection, but this waits for the close of all used fds, hence it
can take long.  It eventually blocks the upper layer USB ioctls, which
may trigger a soft lockup.

An easy workaround is to replace snd_card_free() with
snd_card_free_when_closed().  This variant returns immediately while
the release of resources is done asynchronously by the card device
release at the last close.

The loop of us122l->mmap_count check is dropped as well.  The check is
useless for the asynchronous operation with *_when_closed().

Fixes: 030a07e44129 ("ALSA: Add USB US122L driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/us122l.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index 1be0e980feb9..ca5fac03ec79 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -606,10 +606,7 @@ static void snd_us122l_disconnect(struct usb_interface *intf)
 	usb_put_intf(usb_ifnum_to_if(us122l->dev, 1));
 	usb_put_dev(us122l->dev);
 
-	while (atomic_read(&us122l->mmap_count))
-		msleep(500);
-
-	snd_card_free(card);
+	snd_card_free_when_closed(card);
 }
 
 static int snd_us122l_suspend(struct usb_interface *intf, pm_message_t message)
-- 
2.43.0

