Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABA22D5C82
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142236; cv=none; b=I+uHbidr1urjK6eBUm8UtqXAeWQcnv7s2tEMCrWl4HqjjbK2DKumyqawuMMvkd1KeOBfsGr2In1ZRjHCpvQXo5H2mh7M9tRSlOWJ6mmJ8Og9k++uzsVplC9FniCvkDkvkYpPaYjIuoL/VVytcctDX1flyaUPg3VkxoWumHCfFUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142236; c=relaxed/simple;
	bh=KI156Cxan/4nPrvPez8ANeY36RSisgnobVrohP+ty/k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGgSeeCIe1r+Bcb3ZnNO9lZY1OKhabiLzSoIxVOWT5KCp9FEwbKC9l919JAkZveyybh5TUrz37Kh7IOS7LgvNkMpNc3ZJQTKzQNNUW+ApRThJ/x+/XPz27TEvetDsTND6lj2+kjgE04ku+FHqkNDiuKPw8Ya5qsvzR7ZmTI5ms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H7A2/4Zx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L1m0PFV3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H7A2/4Zx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L1m0PFV3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H7A2/4Zx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L1m0PFV3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H7A2/4Zx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L1m0PFV3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5B72C2116F;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ToFfUEnntbdtfGU7GKkX9XFPAzoIZHvEi8dL7a0wJk=;
	b=H7A2/4Zxh7AbzHJnYa+NgYnC0s4VuNGW8XVnakIXp6bCa/OWOMl15iITG2Z3yWlUOAp33L
	3oxHBxABpb0pftxApVL5nXIPN702M0K5CkHpcsYPc+jOvRA2zoOTIgltBWy5Gw89Xx7NZ8
	QKIu3GbjL5ZLqrxaus/lNgnOKCGia5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ToFfUEnntbdtfGU7GKkX9XFPAzoIZHvEi8dL7a0wJk=;
	b=L1m0PFV3hQdmb6ofqX9UxCfxwxTuaNrr2PrPe1x6MEiKgrOSz+ZKxYc6avPR0vZOLmsJSz
	YP/IsdmBKR3oySAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="H7A2/4Zx";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=L1m0PFV3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ToFfUEnntbdtfGU7GKkX9XFPAzoIZHvEi8dL7a0wJk=;
	b=H7A2/4Zxh7AbzHJnYa+NgYnC0s4VuNGW8XVnakIXp6bCa/OWOMl15iITG2Z3yWlUOAp33L
	3oxHBxABpb0pftxApVL5nXIPN702M0K5CkHpcsYPc+jOvRA2zoOTIgltBWy5Gw89Xx7NZ8
	QKIu3GbjL5ZLqrxaus/lNgnOKCGia5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ToFfUEnntbdtfGU7GKkX9XFPAzoIZHvEi8dL7a0wJk=;
	b=L1m0PFV3hQdmb6ofqX9UxCfxwxTuaNrr2PrPe1x6MEiKgrOSz+ZKxYc6avPR0vZOLmsJSz
	YP/IsdmBKR3oySAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 418C8136DC;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qOB8Du6Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 042/103] ALSA: ad1889: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:24 +0200
Message-ID: <20250710100727.22653-43-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 5B72C2116F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ad1889.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index ac27a93ce4ff..020cbb467e7e 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -605,7 +605,7 @@ snd_ad1889_pcm_init(struct snd_ad1889 *chip, int device)
 
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	
 	chip->pcm = pcm;
 	chip->psubs = NULL;
@@ -866,8 +866,8 @@ __snd_ad1889_probe(struct pci_dev *pci,
 		return err;
 	chip = card->private_data;
 
-	strcpy(card->driver, "AD1889");
-	strcpy(card->shortname, "Analog Devices AD1889");
+	strscpy(card->driver, "AD1889");
+	strscpy(card->shortname, "Analog Devices AD1889");
 
 	/* (3) */
 	err = snd_ad1889_create(card, pci);
-- 
2.50.0

