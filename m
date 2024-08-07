Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572011EA0BB
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037663; cv=none; b=bKr3ffAliulOWzGXtYIHWYgvB1O45HtPvvdEsVOAV7jwEJzWQp6uAsVnewnhNdsXcjxt0tA4pG1hpxqOJiuNHEBLOznDoxevIE8KRtdSF1Y9YzFWA8IBxCjZLiiknzDmOo3Lzuy39BfpaV3+SsYHmZqDC72Y3FuyjYPeqpsjBX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037663; c=relaxed/simple;
	bh=TfFtUMed2lcG0JjiTY7FEkFqsviQ4+fJwIixCMYKWIo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpuAtovsX2DeN6KpNKgdY5nh/KdQcsNfAmGPo6T5k0e+KBLt+/s0K3dF6nbfZvA89N06hOFulbofNKRKKsQZpwEGczWklRo7mVDxj1jjC9ynixZIg6sUWOckEwMI3bDq+QR3d1DCCAUVzkRWdcsk+UwTto2H3ww7RjRs2Fd7plg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e0qprCrp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=27HNfMHm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e0qprCrp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=27HNfMHm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e0qprCrp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="27HNfMHm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e0qprCrp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="27HNfMHm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8D0FA21D1E;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ja08xpOtklHzdzhkYUa7m8CU9Edz9i4Ae0fl2agIruk=;
	b=e0qprCrpvKbbKP6JXAy97DZtgyhyIB0XbZt9jCRb1yUmxs/uxddjVMoOyFCCiOjGt85zax
	3mx+QFC/DWoEJ6EwUZuH6irqxOsNBFssZYU1VLCnmU7KHsIdvSeiCUoTeVzegOrX++KcY3
	fP/6A9EHSiShS07jSEAxJNZMKzhLNN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ja08xpOtklHzdzhkYUa7m8CU9Edz9i4Ae0fl2agIruk=;
	b=27HNfMHmPvchmvLdNZ3LAG15ULgs/5ro61BDnDcHnh39+R44KHFMV7UNflt5SWuUwu9raW
	Yr/nwXwtVa5hOtDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e0qprCrp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=27HNfMHm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ja08xpOtklHzdzhkYUa7m8CU9Edz9i4Ae0fl2agIruk=;
	b=e0qprCrpvKbbKP6JXAy97DZtgyhyIB0XbZt9jCRb1yUmxs/uxddjVMoOyFCCiOjGt85zax
	3mx+QFC/DWoEJ6EwUZuH6irqxOsNBFssZYU1VLCnmU7KHsIdvSeiCUoTeVzegOrX++KcY3
	fP/6A9EHSiShS07jSEAxJNZMKzhLNN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ja08xpOtklHzdzhkYUa7m8CU9Edz9i4Ae0fl2agIruk=;
	b=27HNfMHmPvchmvLdNZ3LAG15ULgs/5ro61BDnDcHnh39+R44KHFMV7UNflt5SWuUwu9raW
	Yr/nwXwtVa5hOtDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6850F13A7D;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cAixF9p3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 13/54] ALSA: dummy: Use standard print API
Date: Wed,  7 Aug 2024 15:34:03 +0200
Message-ID: <20240807133452.9424-14-tiwai@suse.de>
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
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8D0FA21D1E
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Use pr_*() macro instead of open-coded printk() just for code
simplification.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/dummy.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 52ff6ac3f743..8f5df9b3aaaa 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -1033,8 +1033,7 @@ static int snd_dummy_probe(struct platform_device *devptr)
 	dummy->card = card;
 	for (mdl = dummy_models; *mdl && model[dev]; mdl++) {
 		if (strcmp(model[dev], (*mdl)->name) == 0) {
-			printk(KERN_INFO
-				"snd-dummy: Using model '%s' for card %i\n",
+			pr_info("snd-dummy: Using model '%s' for card %i\n",
 				(*mdl)->name, card->number);
 			m = dummy->model = *mdl;
 			break;
@@ -1168,7 +1167,7 @@ static int __init alsa_card_dummy_init(void)
 	}
 	if (!cards) {
 #ifdef MODULE
-		printk(KERN_ERR "Dummy soundcard not found or device busy\n");
+		pr_err("Dummy soundcard not found or device busy\n");
 #endif
 		snd_dummy_unregister_all();
 		return -ENODEV;
-- 
2.43.0

