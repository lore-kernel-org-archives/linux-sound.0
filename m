Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C286E44E02A
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931354; cv=none; b=dTLJZw/tawVfcPDq26qbgzAWyUr6+RwlaXk5NgwetKw0EUpDfNAAkeQBKTEVQlC7EXKy+JmiOuFiyFl/Yme3f9xDZ8r3Wt/IMtd4iRllFGLu18h1Gs8oVKh+p24xvX7pN4Wd7ixTSyZHOOlIUAFuDTAMYVcql9zuUKhoogagdo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931354; c=relaxed/simple;
	bh=y02ByKYDe+z95R6oOJlqFaE6uL1vzAE1wN/37TCBiUM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuQv9CwlxfOlxZxOuGpYIy8pOgLrrG5y1hcSqvU2GipYLxyhaorZjde1f2nYf5dtqK3BuN2fXm2/hzaUVPpDeDWV4K7LLSrTBUXwypBmaqSirV+pJ/v+fYcaMd/ExSQZaWglg1LjUcwNBi0VZwmhQUIS655FWzUMOC4mE3z7kUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I+/zUbYn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X8pqsgG2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ouxYU6ab; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+6XYBJIF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I+/zUbYn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X8pqsgG2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ouxYU6ab";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+6XYBJIF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B29A31FE53;
	Fri,  2 Oct 2026 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43pdTbiFAGFsxRNGoOKHWX9Tnjoum/qHl9MXjqPS4xg=;
	b=I+/zUbYn6urALg78KIsGYa6OAfLqfJikV5Uu/HK4pBQT4KakYVDRfxVxM29cmhY7wGKBfC
	Z9x4Th8Y2u1VvNuBF0ZM1Y2ORSx4OvGm7DOHRIWvbdTP2Qe+nKfmdLV463a/0WaHN/HSHF
	JYHAZ5E48gQk1pegjgovA8rs8ZmYPAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931346;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43pdTbiFAGFsxRNGoOKHWX9Tnjoum/qHl9MXjqPS4xg=;
	b=X8pqsgG2Ur4UxEVvna3g3E6k+jg+cQ9XGxyEWr6vqeo57UxubUTc1OW9114NI2XD3tsWFd
	adAT/zZp2dVa0dDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43pdTbiFAGFsxRNGoOKHWX9Tnjoum/qHl9MXjqPS4xg=;
	b=ouxYU6abi+EpdL8nFaRWRjseq74c+CkmRndC11BQN95xltXc8Dle/7NDo5K6aI+fMTXnU7
	lQUW735N6avNQGyq2M103tBMEQRoyOwAtQnfsr2/wpuSdYgIlrkuaoE6vtF6pPe+u6r68W
	fE749W0LmOWLz1eOgusV7G+l4y40wxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43pdTbiFAGFsxRNGoOKHWX9Tnjoum/qHl9MXjqPS4xg=;
	b=+6XYBJIFFVe1+YsewRVgHCvPzpBak3gACOBv+QkSYylovKKxtpAqBZTg436B7jwyKyD8kJ
	Qbce7FKuaDMcD0Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2917413C0F;
	Fri,  2 Oct 2026 08:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T21
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 20/32] ALSA: intel8x0: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:58 +0200
Message-ID: <20261002085517.693510-21-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c  | 14 +++++---------
 sound/pci/intel8x0m.c | 13 ++++---------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index e2ea9016a73e..339024182a26 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -3167,10 +3167,10 @@ static int check_default_spdif_aclink(struct pci_dev *pci)
 	return 0;
 }
 
-static int __snd_intel8x0_probe(struct pci_dev *pci,
-				const struct pci_device_id *pci_id)
+static int snd_intel8x0_probe(struct pci_dev *pci,
+			      const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct intel8x0 *chip;
 	int err;
 	struct shortname_table *name;
@@ -3244,13 +3244,9 @@ static int __snd_intel8x0_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
-	return 0;
-}
+	card = NULL; /* probe succeeded, don't release as error */
 
-static int snd_intel8x0_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_intel8x0_probe(pci, pci_id));
+	return 0;
 }
 
 static struct pci_driver intel8x0_driver = {
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 27dbf6125427..38a15ebf94b2 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -1218,10 +1218,10 @@ static struct shortname_table {
 	{ 0 },
 };
 
-static int __snd_intel8x0m_probe(struct pci_dev *pci,
-				 const struct pci_device_id *pci_id)
+static int snd_intel8x0m_probe(struct pci_dev *pci,
+			       const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct intel8x0m *chip;
 	int err;
 	struct shortname_table *name;
@@ -1262,15 +1262,10 @@ static int __snd_intel8x0m_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_intel8x0m_probe(struct pci_dev *pci,
-			       const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_intel8x0m_probe(pci, pci_id));
-}
-
 static struct pci_driver intel8x0m_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_intel8x0m_ids,
-- 
2.55.0

