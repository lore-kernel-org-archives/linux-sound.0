Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548241EA0B8
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037664; cv=none; b=FVXpOa8P0iGw5LvP/EwBEQGeLoCKoGsSZsNUntUCGiEAiZX20/thJBUw+M9JIUU45Lwg6v/G7A1fUrDYhHXR6KUblw3RFOTfFLW+zD16j2LH0m18ocjpYJoPzeNEvYcW3NIAQ8SBTYH0rIiFg+QJkuu3bd5fXvGSG3yRpDffE2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037664; c=relaxed/simple;
	bh=P42nlJX1LuHxWy1OgnZq0SsPBDwEO9aRiNY4tTzv6i0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOT0Bk5uM0eXXvuP6tiqs/1fyyU4cV5cKNFcZ2ykI2Ob+N1aAX5xJCu2XTsHjw7tv/hXHShAg52RkASVtRqy6mC/gW3AEKJ4BHXYY4i5X3sATVJ/3xkiHKZGxf6fx+HtzbOZqSNSBNq3SESF83dGsev/X9SNkoJZnoIbWSPkyWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rj8pYEcr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8+yuxM/Z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rj8pYEcr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8+yuxM/Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rj8pYEcr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8+yuxM/Z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rj8pYEcr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8+yuxM/Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 604321FB8D;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FqNBvZqYDesEvJWLwBMLAaKHdD/kLIH3kPoWGfknPII=;
	b=rj8pYEcrqjumA7fd/kkzGxJ9wtACyCVyWZPpamoSL8ezbLu4oWFrmD1PyExxUHvB2yBHnM
	lVvkprkvan/Faj4IZVNpzk1t/lzgJ0yLz/O55re6r2xa1vF2xwZFQkfrlfstYxC8gAbERh
	hSCBj5rRSzqQ5sUIGBMG+PRYJcEpqfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FqNBvZqYDesEvJWLwBMLAaKHdD/kLIH3kPoWGfknPII=;
	b=8+yuxM/ZypgCfTTTPsBG5ZOVxIrky6ljAbxxsV5WWa9vxOeZcSrNxvtV6NJkdMzmBBipij
	X8vSYJsY9tKgSODg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rj8pYEcr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="8+yuxM/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FqNBvZqYDesEvJWLwBMLAaKHdD/kLIH3kPoWGfknPII=;
	b=rj8pYEcrqjumA7fd/kkzGxJ9wtACyCVyWZPpamoSL8ezbLu4oWFrmD1PyExxUHvB2yBHnM
	lVvkprkvan/Faj4IZVNpzk1t/lzgJ0yLz/O55re6r2xa1vF2xwZFQkfrlfstYxC8gAbERh
	hSCBj5rRSzqQ5sUIGBMG+PRYJcEpqfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FqNBvZqYDesEvJWLwBMLAaKHdD/kLIH3kPoWGfknPII=;
	b=8+yuxM/ZypgCfTTTPsBG5ZOVxIrky6ljAbxxsV5WWa9vxOeZcSrNxvtV6NJkdMzmBBipij
	X8vSYJsY9tKgSODg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D67C13B03;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8BHhDdp3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 12/54] ALSA: aloop: Use standard print API
Date: Wed,  7 Aug 2024 15:34:02 +0200
Message-ID: <20240807133452.9424-13-tiwai@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 604321FB8D
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use pr_err() instead of open-coded printk() just for code
simplification.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 439d12ad8787..3650d47b7d58 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1896,7 +1896,7 @@ static int __init alsa_card_loopback_init(void)
 	}
 	if (!cards) {
 #ifdef MODULE
-		printk(KERN_ERR "aloop: No loopback enabled\n");
+		pr_err("aloop: No loopback enabled\n");
 #endif
 		loopback_unregister_all();
 		return -ENODEV;
-- 
2.43.0

