Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C27C2D5C95
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142266; cv=none; b=t3ODKiSgxkYy84QVgX+/KsX+rFxQZ2TdO2AZqWimPqZ1kC84KcAbp12JppQd/TfZPlo/Yhb4Ni2LaJ5jTbADvDrP6HIPKhBHSjE7S6wc+c28+PdzN9N689k28OJ3x8B9pZslLq7nSAOk5Cc19fvmE1ogA4JdO/2f/E7UxBva5vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142266; c=relaxed/simple;
	bh=d25nrjSzZ0WD1UQ1Ae42pERk3i6dJtsoH7rsmQ3Tlr4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoRT5sChJQjEcZrA8u2L92MgY9FwMJRZHqpA7dIhESBtHuDj1elT5U8zAwWNgR2gB1OoSf8Z+QpHYouPc5V6q0DcJwoh98fp6YwP2hG0CVH8N7lmQMVG4unoS/I7vAxyDVSPFUjgmbWe6XF9GOZix9d2p8phClVmDv+JsOFvzHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cl5n1A+o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1Jhbisga; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cl5n1A+o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1Jhbisga; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cl5n1A+o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1Jhbisga";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cl5n1A+o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1Jhbisga"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0414A211A0;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTKyIRCnMtmwrUDdUOT35byViJhi+Zy8y0aWEArA/Jg=;
	b=Cl5n1A+om5qTDTkFBXSDdT6/jAz2u48mv2DryQ0D9Aaz7i3IGLoAxlK72cVPWqG1q5XImi
	QY62CWmL90audk2i06RpK5zrmpkhuNvGFYxJ0Lei99Sqq3Z9nx6mctP5GCNB6fvPoubPwn
	kQ0CwAL/MYtsqrnzem8Htth8x7WDYj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTKyIRCnMtmwrUDdUOT35byViJhi+Zy8y0aWEArA/Jg=;
	b=1Jhbisga+a0TWOX3NHgwz6bLmggZKyDAVoxcHhPLfWCsULegAmAUAmGNLwdVMz8EfgG2hI
	2rpkfZKZ0/MAt6CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTKyIRCnMtmwrUDdUOT35byViJhi+Zy8y0aWEArA/Jg=;
	b=Cl5n1A+om5qTDTkFBXSDdT6/jAz2u48mv2DryQ0D9Aaz7i3IGLoAxlK72cVPWqG1q5XImi
	QY62CWmL90audk2i06RpK5zrmpkhuNvGFYxJ0Lei99Sqq3Z9nx6mctP5GCNB6fvPoubPwn
	kQ0CwAL/MYtsqrnzem8Htth8x7WDYj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTKyIRCnMtmwrUDdUOT35byViJhi+Zy8y0aWEArA/Jg=;
	b=1Jhbisga+a0TWOX3NHgwz6bLmggZKyDAVoxcHhPLfWCsULegAmAUAmGNLwdVMz8EfgG2hI
	2rpkfZKZ0/MAt6CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE79613A70;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AIoiNe6Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 047/103] ALSA: asihpi: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:29 +0200
Message-ID: <20250710100727.22653-48-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/asihpi/asihpi.c  | 10 +++++-----
 sound/pci/asihpi/hpi6000.c |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index cbd964f87349..8419f2b6e589 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -1257,7 +1257,7 @@ static int snd_card_asihpi_pcm_new(struct snd_card_asihpi *asihpi, int device)
 
 	pcm->private_data = asihpi;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "Asihpi PCM");
+	strscpy(pcm->name, "Asihpi PCM");
 
 	/*? do we want to emulate MMAP for non-BBM cards?
 	Jack doesn't work with ALSAs MMAP emulation - WHY NOT? */
@@ -2310,7 +2310,7 @@ static int snd_asihpi_clksrc_info(struct snd_kcontrol *kcontrol,
 		uinfo->value.enumerated.item =
 				uinfo->value.enumerated.items - 1;
 
-	strcpy(uinfo->value.enumerated.name,
+	strscpy(uinfo->value.enumerated.name,
 	       clkcache->s[uinfo->value.enumerated.item].name);
 	return 0;
 }
@@ -2530,7 +2530,7 @@ static int snd_card_asihpi_mixer_new(struct snd_card_asihpi *asihpi)
 	if (snd_BUG_ON(!asihpi))
 		return -EINVAL;
 	card = asihpi->card;
-	strcpy(card->mixername, "Asihpi Mixer");
+	strscpy(card->mixername, "Asihpi Mixer");
 
 	err =
 	    hpi_mixer_open(asihpi->hpi->adapter->index,
@@ -2741,7 +2741,7 @@ static int snd_asihpi_hpi_new(struct snd_card_asihpi *asihpi, int device)
 	err = snd_hwdep_new(asihpi->card, "HPI", device, &hw);
 	if (err < 0)
 		return err;
-	strcpy(hw->name, "asihpi (HPI)");
+	strscpy(hw->name, "asihpi (HPI)");
 	hw->iface = SNDRV_HWDEP_IFACE_LAST;
 	hw->ops.open = snd_asihpi_hpi_open;
 	hw->ops.ioctl = snd_asihpi_hpi_ioctl;
@@ -2889,7 +2889,7 @@ static int snd_asihpi_probe(struct pci_dev *pci_dev,
 	    by enable_hwdep  module param*/
 	snd_asihpi_hpi_new(asihpi, 0);
 
-	strcpy(card->driver, "ASIHPI");
+	strscpy(card->driver, "ASIHPI");
 
 	sprintf(card->shortname, "AudioScience ASI%4X",
 			asihpi->hpi->adapter->type);
diff --git a/sound/pci/asihpi/hpi6000.c b/sound/pci/asihpi/hpi6000.c
index 72aa135d69f8..b08578c93c6a 100644
--- a/sound/pci/asihpi/hpi6000.c
+++ b/sound/pci/asihpi/hpi6000.c
@@ -608,7 +608,7 @@ static void adapter_get_asserts(struct hpi_adapter_obj *pao,
 		phr->u.ax.assert.p2 = 0;
 		phr->u.ax.assert.count = 1;	/* assert count */
 		phr->u.ax.assert.dsp_index = -1;	/* "dsp index" */
-		strcpy(phr->u.ax.assert.sz_message, "PCI2040 error");
+		strscpy(phr->u.ax.assert.sz_message, "PCI2040 error");
 		phr->u.ax.assert.dsp_msg_addr = 0;
 		gw_pci_read_asserts = 0;
 		gw_pci_write_asserts = 0;
-- 
2.50.0

