Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F53B2D6608
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142340; cv=none; b=OIEN6iF8bD/dgNjcRFGWRUbB0RkuRjLvoj2gDnGpJPQ2GXi7OtqrKuwyRO+L5p8W+6RLzwhri+cCE0k1843WzP0qiIdac39rR9w+itVFpsaTeUot8/VChoCjmlFHp6TkQk3clBQIs53XwUtZCvQgVYgoMTRTY8H8lDZ8gJxX8l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142340; c=relaxed/simple;
	bh=Nxntt5NeQd4iMvGzZ1G+fVsCDKLaO65iQMJ9SkIlVoE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tH8xMSVfrJ2KsrEB9ysTTMmSWA51hP/yiC2eF/MjaKkCl5OWU9uFZpmBJM87B0fXkjsaoDkNQnxD5E6yY1Vat1pIhvPrgQIefuSLl3aEskV706cg/tLI2vHpAcHEwWce+AKHuvczdkvgBiQsNCx56u6Mb6GsBXYIxVo9fWntVmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DGcISE6e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mezmolr7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DGcISE6e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mezmolr7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DGcISE6e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mezmolr7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DGcISE6e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mezmolr7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6AF6C211B0;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj9jLZ5OvXld1zsRWvKz4gWGXXFBTuxdn089Yhk4GDg=;
	b=DGcISE6eRl8CUpQlQVujvaw7VrXSB8o2w4LH5vOX4nG7RJz3y6A2LsjKcHUltnnAdroCLq
	0M5iwctPGlqpTiXspPDn1SDHDg+oMHo3B7VUcvCZSsdB6jZtF4X1/oV4q02si60kO1tw+x
	CVYQ5STpyMmdSRMET2odewL5Wg7Mi6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj9jLZ5OvXld1zsRWvKz4gWGXXFBTuxdn089Yhk4GDg=;
	b=mezmolr7Gn6J2+Ym35YDOxAjxzbgsfzsLiQsWPyx/38UzhrDSMzwxBNsPhcn+j6hhnkrH4
	7ZEUSIB9v9U+rUAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DGcISE6e;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mezmolr7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj9jLZ5OvXld1zsRWvKz4gWGXXFBTuxdn089Yhk4GDg=;
	b=DGcISE6eRl8CUpQlQVujvaw7VrXSB8o2w4LH5vOX4nG7RJz3y6A2LsjKcHUltnnAdroCLq
	0M5iwctPGlqpTiXspPDn1SDHDg+oMHo3B7VUcvCZSsdB6jZtF4X1/oV4q02si60kO1tw+x
	CVYQ5STpyMmdSRMET2odewL5Wg7Mi6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj9jLZ5OvXld1zsRWvKz4gWGXXFBTuxdn089Yhk4GDg=;
	b=mezmolr7Gn6J2+Ym35YDOxAjxzbgsfzsLiQsWPyx/38UzhrDSMzwxBNsPhcn+j6hhnkrH4
	7ZEUSIB9v9U+rUAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F0B4136DC;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WBsXEfKQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 072/103] ALSA: maestro3: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:54 +0200
Message-ID: <20250710100727.22653-73-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 6AF6C211B0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/maestro3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index e61e15774706..e092097599ff 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -1846,7 +1846,7 @@ snd_m3_pcm(struct snd_m3 * chip, int device)
 
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, chip->card->driver);
+	strscpy(pcm->name, chip->card->driver);
 	chip->pcm = pcm;
 	
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -2648,14 +2648,14 @@ __snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	switch (pci->device) {
 	case PCI_DEVICE_ID_ESS_ALLEGRO:
 	case PCI_DEVICE_ID_ESS_ALLEGRO_1:
-		strcpy(card->driver, "Allegro");
+		strscpy(card->driver, "Allegro");
 		break;
 	case PCI_DEVICE_ID_ESS_CANYON3D_2LE:
 	case PCI_DEVICE_ID_ESS_CANYON3D_2:
-		strcpy(card->driver, "Canyon3D-2");
+		strscpy(card->driver, "Canyon3D-2");
 		break;
 	default:
-		strcpy(card->driver, "Maestro3");
+		strscpy(card->driver, "Maestro3");
 		break;
 	}
 
-- 
2.50.0

