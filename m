Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEC91BA29E
	for <linux-sound@vger.kernel.org>; Mon,  9 Sep 2024 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889622; cv=none; b=c3Z31YUWyuC6YIiXkX2gEfyRcjero8Ig9pXaVcay5xKt9mdnrYTHl8AWxBVMbnSex2NRV84Kn1r5sTj/eFEPcK3l8luPI1jHfTZn+LNJmMVzVzNN2LJT3FmLT1tdtXMFOu3jVss05PPIrRyurSaVfpa1vHnC4ucIGiqbPYpkJYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889622; c=relaxed/simple;
	bh=sZ7rtChX2IozYoA1o28CfCA2NO170offC/ueGgTsG9I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Qzl/rwBTqH2dhxqsSl4NZ827wIyjkFHVUyXd5WaHdFuw9HvGpxPJlR+9k076QPr7rFhVkXbAJVxALP30AF4XpUOGSmRMgUd/ISuU34Lih30WI9aytDXAn8sl2MB/TXaxfDyFb8MtuchPUQ/Sx/D0Q6gLRvCPEhObZ4RqPNRyUQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ypgflo+v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k25v/YHK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ypgflo+v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k25v/YHK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ypgflo+v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k25v/YHK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ypgflo+v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k25v/YHK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C8661F7BD;
	Mon,  9 Sep 2024 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725889618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Rn76Yu+eXmeuFMKrHAVyKh1Mzxo+uijVnj3H7r3ZgT4=;
	b=Ypgflo+vh3G4LeGVzRxGaSPDhvOTFCTR7q9RP2TLYys6jW0Zl/ApYNrBWDP7jkrQSAP6AV
	cGABDQ/ObI08KIFLh7wqKnebFWQbpP0nEnB8f7/KE8Sl9ftik6bG6pqQ7SGUDTPn23sZIT
	qU1tymr6wfrwNWwjvScJAoxKe2pmme4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725889618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Rn76Yu+eXmeuFMKrHAVyKh1Mzxo+uijVnj3H7r3ZgT4=;
	b=k25v/YHK2jZAuyP7Zw72ApmpQvPVqx8myIRTLTisB/oSwXUNcNWRhrzwf/+1OmYOfOuGaJ
	vTA0Sq8r/KSu1aDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ypgflo+v;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="k25v/YHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725889618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Rn76Yu+eXmeuFMKrHAVyKh1Mzxo+uijVnj3H7r3ZgT4=;
	b=Ypgflo+vh3G4LeGVzRxGaSPDhvOTFCTR7q9RP2TLYys6jW0Zl/ApYNrBWDP7jkrQSAP6AV
	cGABDQ/ObI08KIFLh7wqKnebFWQbpP0nEnB8f7/KE8Sl9ftik6bG6pqQ7SGUDTPn23sZIT
	qU1tymr6wfrwNWwjvScJAoxKe2pmme4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725889618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Rn76Yu+eXmeuFMKrHAVyKh1Mzxo+uijVnj3H7r3ZgT4=;
	b=k25v/YHK2jZAuyP7Zw72ApmpQvPVqx8myIRTLTisB/oSwXUNcNWRhrzwf/+1OmYOfOuGaJ
	vTA0Sq8r/KSu1aDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E440F13312;
	Mon,  9 Sep 2024 13:46:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5H5uNlH83mY+aAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Sep 2024 13:46:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: Use non-SG allocation for the communication buffers
Date: Mon,  9 Sep 2024 15:47:43 +0200
Message-ID: <20240909134744.25426-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0C8661F7BD
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The azx_bus->dma_type is referred only for allocating the
communication buffers like CORB/RIRB, and the allocation size is
small.  Hence it doesn't have to be S/G buffer allocation, which is an
obvious overkill.  Use the standard SNDRV_DMA_TYPE_DEV_WC instead.

This was changed to SNDRV_DMA_TYPE_DEV_WC_SG in the commit
37137ec26c2c ("ALSA: hda: Once again fix regression of page
allocations with IOMMU") as a workaround for IOMMU-backed
allocations.  But this is no longer needed since the allocation with
SNDRV_DMA_TYPE_DEV_WC itself was fixed in the commit 9c27301342a5
("ALSA: memalloc: Use DMA API for x86 WC page allocations, too").

So this patch reverts the previous workaround in this piece of code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b79020adce63..edeaf3ee273c 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1821,7 +1821,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 
 	/* use the non-cached pages in non-snoop mode */
 	if (!azx_snoop(chip))
-		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC_SG;
+		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC;
 
 	if (chip->driver_type == AZX_DRIVER_NVIDIA) {
 		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");
-- 
2.43.0

