Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E6757E3
	for <linux-sound@vger.kernel.org>; Wed, 22 May 2024 07:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716361478; cv=none; b=XLFvWayZJtrMmnjDERG0SgBcMUv2XEsbDTPrT/txiiWq0JpBcX0jDhkrazmrLOc8eWHPERgPKQLDATVTQdrRopbiMNfkR10mPdzaHS/BwkHw0J2BAwnNaywJ4JlSdRIUpopVDHVl2hnJxWt/CiqdS+4+rlZZa4Fgr+lEU1iYmnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716361478; c=relaxed/simple;
	bh=cpmZ08w3lPhIDQx2Hp5LG2DgBN6jL1wuwQU/ira7uMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJak4Gl0kd6J6JlorVHfGk8qTMTHpsN+e4jAzci546yhJfUy2eAVQFZ9sCQhIRDSApXXuIrwRnUyQZr+SKqXDZzMnP8cVS6dHE5hMvCP2dJs6wJ0hscPe9gNwf5pNq4J03InWJoY08Ev3F+kH10tj+4K17ZdsQhE8/GZoRqs/84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qe1sGf8x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vrp10BRd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qe1sGf8x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vrp10BRd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qe1sGf8x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vrp10BRd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qe1sGf8x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vrp10BRd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 49CD65C6AA;
	Wed, 22 May 2024 07:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716361469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFIo3eLfelVzOKd9qGFONAMBfGVZEOxl2rSPEdWnNlk=;
	b=qe1sGf8xq7qrc3fytp1J/pTk3u61TghvYeLC+wk5VJKTFSyuKl72bT1KsT3SgaPYDxAokh
	Ef6YayryJvtxYwH2THYTE4Ttp91Zhhd6hjeuXpx3hmyLdwD4CpEGR+zvh2/x6bt9bfub0H
	Od4+q4yGblSuVLBcAZssnhVXIbS2Z9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716361469;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFIo3eLfelVzOKd9qGFONAMBfGVZEOxl2rSPEdWnNlk=;
	b=Vrp10BRdSDZxeLIPTqrs0Ey/s1JP7hYR9q+GGTE6aICDVQdUb7ibl17baXjdbTNzf9bIsV
	RAJq/PykUWe69XDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qe1sGf8x;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Vrp10BRd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716361469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFIo3eLfelVzOKd9qGFONAMBfGVZEOxl2rSPEdWnNlk=;
	b=qe1sGf8xq7qrc3fytp1J/pTk3u61TghvYeLC+wk5VJKTFSyuKl72bT1KsT3SgaPYDxAokh
	Ef6YayryJvtxYwH2THYTE4Ttp91Zhhd6hjeuXpx3hmyLdwD4CpEGR+zvh2/x6bt9bfub0H
	Od4+q4yGblSuVLBcAZssnhVXIbS2Z9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716361469;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFIo3eLfelVzOKd9qGFONAMBfGVZEOxl2rSPEdWnNlk=;
	b=Vrp10BRdSDZxeLIPTqrs0Ey/s1JP7hYR9q+GGTE6aICDVQdUb7ibl17baXjdbTNzf9bIsV
	RAJq/PykUWe69XDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 128EE13A7A;
	Wed, 22 May 2024 07:04:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AOwaA/2YTWZOGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 May 2024 07:04:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH 2/2] ALSA: core: Enable proc module when CONFIG_MODULES=y
Date: Wed, 22 May 2024 09:04:40 +0200
Message-ID: <20240522070442.17786-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070442.17786-1-tiwai@suse.de>
References: <20240522070442.17786-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 49CD65C6AA
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]

We used '#ifdef MODULE' for judging whether the system supports the
sound module or not, and /proc/asound/modules is created only when
'#ifdef MODULE' is true.  The check is not really appropriate, though,
because the flag means only for the sound core and the drivers are
still allowed to be built as modules even if 'MODULE' is not set in
sound/core/init.c.

For fixing the inconsistency, replace those ifdefs with 'ifdef
CONFIG_MODULES'.  One place for a NULL module check is rewritten with
IS_MODULE(CONFIG_SND) to be more intuitive.  It can't be changed to
CONFIG_MODULES; otherwise it would hit a WARN_ON() incorrectly.

This is a slight behavior change; the modules proc entry appears now
no matter whether the sound core is built-in or not as long as modules
are enabled on the kernel in general.  This can't be avoided due to
the nature of kernel builds.

Link: https://lore.kernel.org/r/20240520170349.2417900-1-xu.yang_2@nxp.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index ac072614d1ea..4e52bbe32786 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -50,7 +50,7 @@ MODULE_PARM_DESC(slots, "Module names assigned to the slots.");
 static int module_slot_match(struct module *module, int idx)
 {
 	int match = 1;
-#ifdef MODULE
+#ifdef CONFIG_MODULES
 	const char *s1, *s2;
 
 	if (!module || !*module->name || !slots[idx])
@@ -77,7 +77,7 @@ static int module_slot_match(struct module *module, int idx)
 		if (!c1)
 			break;
 	}
-#endif /* MODULE */
+#endif /* CONFIG_MODULES */
 	return match;
 }
 
@@ -311,9 +311,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	}
 	card->dev = parent;
 	card->number = idx;
-#ifdef MODULE
-	WARN_ON(!module);
-#endif
+	WARN_ON(IS_MODULE(CONFIG_SND) && !module);
 	card->module = module;
 	INIT_LIST_HEAD(&card->devices);
 	init_rwsem(&card->controls_rwsem);
@@ -969,7 +967,7 @@ void snd_card_info_read_oss(struct snd_info_buffer *buffer)
 
 #endif
 
-#ifdef MODULE
+#ifdef CONFIG_MODULES
 static void snd_card_module_info_read(struct snd_info_entry *entry,
 				      struct snd_info_buffer *buffer)
 {
@@ -997,7 +995,7 @@ int __init snd_card_info_init(void)
 	if (snd_info_register(entry) < 0)
 		return -ENOMEM; /* freed in error path */
 
-#ifdef MODULE
+#ifdef CONFIG_MODULES
 	entry = snd_info_create_module_entry(THIS_MODULE, "modules", NULL);
 	if (!entry)
 		return -ENOMEM;
-- 
2.43.0

