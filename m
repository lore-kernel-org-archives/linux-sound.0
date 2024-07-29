Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55400146A9B
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722254958; cv=none; b=o2A2NI9acK3q1PEPyF1Rlq4RGcWrneO9nUK5MWcPzGiRQVWKO2CFp5WePL26fuU8TH3RClfCxjNCc9swG3yfVjkxVIRMI4rB43+8n+XiiGz3KbDPf3T7dncveK4RT/XK+Kk4ko2mhmTUAroIsolHEJcSU3n2fh8RJeP6OfiHoEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722254958; c=relaxed/simple;
	bh=yBQ7krytrxq8Xp+uFJr2fpw0hI3jI7rZw8fQKaOCuLk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rWBSMS+oWhzz74XncDd0AfoBNn/BoFhasH6v33A+VxnRbs5R7nUhFhv3cPtKSK3PX5d7kYDhfgRsqy2afHaPO6lkEkMHLUvq0JvKAeRLE3Mpsr4UwQlFCSdAGK99/aJrQ7A/HRVHMKfXTeeMK9G0aSrTipIL6+6+YbOnOCBzgGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u6Fr4UVs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Uueoosul; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u6Fr4UVs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Uueoosul; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u6Fr4UVs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uueoosul";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u6Fr4UVs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uueoosul"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 76E251F790;
	Mon, 29 Jul 2024 12:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722254955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WIt5xoUQqQJBhwJ03iAkco92Lxd0cy7zd5BmBq9J7dI=;
	b=u6Fr4UVsUrF2u76KJPLdkt40P4qiOXz03h01sGT46wFJwYyHVQxB7O4Usptkr6pHyTKg0e
	3y+5rFlMT/O33r/VWJ+k7wWOZY84i+FmClPm6XRm8zC2hmyF5GioKMETEelaTOVZkVq3oI
	i0058maNwBIx8hHYB8zW5+BS2haX7sw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722254955;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WIt5xoUQqQJBhwJ03iAkco92Lxd0cy7zd5BmBq9J7dI=;
	b=UueoosulMt1UH3+SSoDQinUw7DutHOQ7Iw0JhyvjnKBh5+lDAlMw+ujyE9RkQ1q/mHZELL
	W/3noR90QBgOO/DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722254955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WIt5xoUQqQJBhwJ03iAkco92Lxd0cy7zd5BmBq9J7dI=;
	b=u6Fr4UVsUrF2u76KJPLdkt40P4qiOXz03h01sGT46wFJwYyHVQxB7O4Usptkr6pHyTKg0e
	3y+5rFlMT/O33r/VWJ+k7wWOZY84i+FmClPm6XRm8zC2hmyF5GioKMETEelaTOVZkVq3oI
	i0058maNwBIx8hHYB8zW5+BS2haX7sw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722254955;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WIt5xoUQqQJBhwJ03iAkco92Lxd0cy7zd5BmBq9J7dI=;
	b=UueoosulMt1UH3+SSoDQinUw7DutHOQ7Iw0JhyvjnKBh5+lDAlMw+ujyE9RkQ1q/mHZELL
	W/3noR90QBgOO/DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 526D9138A7;
	Mon, 29 Jul 2024 12:09:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6HDYEmuGp2awPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jul 2024 12:09:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: Use non-SG allocation for the communication buffers
Date: Mon, 29 Jul 2024 14:09:50 +0200
Message-ID: <20240729120951.6601-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

The azx_bus->dma_type is referred only for allocating the
communication buffers like CORB/RIRB, and the allocation size is
small.  Hence it doesn't have to be S/G buffer allocation, which is an
obvious overkill.  Use the standard SNDRV_DMA_TYPE_DEV_WC instead.

Looking at the commit history, this change was done together with a
workaround of memalloc fixes, and it must come from misunderstanding
of the data used there.

Fixes: 37137ec26c2c ("ALSA: hda: Once again fix regression of page allocations with IOMMU")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b33602e64d17..ad474ca9b24e 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1809,7 +1809,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 
 	/* use the non-cached pages in non-snoop mode */
 	if (!azx_snoop(chip))
-		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC_SG;
+		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC;
 
 	if (chip->driver_type == AZX_DRIVER_NVIDIA) {
 		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");
-- 
2.43.0

