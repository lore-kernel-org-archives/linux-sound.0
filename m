Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6353A46A61E
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931355; cv=none; b=WGtx3JdRa9EPVkQxuL1dD/g5NsSfLUEDWQ/5hgz/mgEILJMbPDKoAquuYtr2UXHiYMHHPaUwqXEH9k3hdgtOnkBxCGmcBamaUy0XZNJ4oQn8f7E4kZsu8u3MY9H97YDcaYhQiUsrxiPoK7IizrtGFDQkadR512GSIIYT55ktLPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931355; c=relaxed/simple;
	bh=krvrvRDla0hroe8NOTCw+XFWpn7WQG9dLX7zb4N3n4k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXAEG3Tyg2ZUSpMvFSfrerpIItCQLEgzUu4yLePKp9J4S39SwmlAh95nRvmRmzO5XYuReA0ib+jfD0RygKb8Z9QbiB1McAw+6kZJVy+3qwaZlDQ+W8hVhIRIs+a0MGCp/289QHtuQ40BtSRrEZb28373Ih/uJTrP2ozs6v5LEY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b3m5sgsk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=olaxVGef; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XUVov2XH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SfO1dmle; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b3m5sgsk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="olaxVGef";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XUVov2XH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SfO1dmle"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 25C6C21F43;
	Fri,  2 Oct 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVK8a3qCeHVpe4c3jghwuQ2DsxaF8BmMLp9ZELzG1os=;
	b=b3m5sgskkExd0S5fVPeaU/BNbPO6maV3KHp2D9NCmOIrOk2OheTBnXyi5RnfJxWAxy/uBS
	BgPy8Yu0lB1CvkXeNIEf+3uvN8L6pVil37qgXooTUnd4M8ZV1WD54+yxDCKJz8VDPgjY+p
	KbS/aa9f85e6Da+D0ohr0b+XhppThow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVK8a3qCeHVpe4c3jghwuQ2DsxaF8BmMLp9ZELzG1os=;
	b=olaxVGef7qkYRMHEQQqKYTqA97YwrScGvVX17vBEM3P+ZPYQ4tNVwCrjIIs38lBLjt3rzn
	HpyY2OHU6WRGWPAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XUVov2XH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SfO1dmle
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVK8a3qCeHVpe4c3jghwuQ2DsxaF8BmMLp9ZELzG1os=;
	b=XUVov2XHkW9Cm5FrkcfI/xd7GWi0Wh+1Y/OydJ2mkb652B8sIoqcG8Qm/lzeUjzAxgAY8H
	65uHE+fcJ2+uRLpGHb/vCunXBFbcIcSpcUt5qXyN4ZVpIHC6luj6qMCxi7i4PVzXkQSXPt
	5ApPwDcmOOv6p9T6eHrTaFXEAZHywRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVK8a3qCeHVpe4c3jghwuQ2DsxaF8BmMLp9ZELzG1os=;
	b=SfO1dmleNT9N2+Mm3pwj7CcvFsM39/AlNMINPUUVqN9AOvlUkK1rkPrImQPPkNimZS2XFM
	GZHGLWjMUCPY6dDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0813713C14;
	Fri,  2 Oct 2026 08:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T26
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 25/32] ALSA: rme32: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:55:03 +0200
Message-ID: <20261002085517.693510-26-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002085517.693510-1-tiwai@suse.de>
References: <20261002085517.693510-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 25C6C21F43
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme32.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 454a30a2c07e..d1b3a0a82834 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -1810,11 +1810,11 @@ static void snd_rme32_card_free(struct snd_card *card)
 }
 
 static int
-__snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct rme32 *rme32;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	int err;
 
 	if (dev >= SNDRV_CARDS) {
@@ -1858,16 +1858,11 @@ __snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int
-snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_rme32_probe(pci, pci_id));
-}
-
 static struct pci_driver rme32_driver = {
 	.name =		KBUILD_MODNAME,
 	.id_table =	snd_rme32_ids,
-- 
2.55.0

