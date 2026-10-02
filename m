Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C56463B84
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931346; cv=none; b=hBWoxbVjU0iV/Zx0vhc59LMjkcmIDSd2/NGDNAwmvvcMxahDiM5ieSKYMUyAYi8CAb8MbB0Q5KajDkGYttaLu80coNc75o4YGIn14oBNR8WdSmc9tEmYHzwT5DvKNgqlcMnd/v3AcCMIJWKbA2FVDMgWdWiVsoh+nIbJSG9nQTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931346; c=relaxed/simple;
	bh=NQpSdyQ9NyuABGbcibv722aiiruiU2xcZWKS60s6hL8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKi4cGap4V+xzEljls9Ktw21NyVJbGyL8N38qWfjZQAflEVe/oUT+Qs8kCM1H9MHU8LUe4QpgjYlXNDT6nxTONQTAoj1K4fqtYAHlfVWVASIjyFoqe30ZPTDE7+zTbOZScIJTYPBxwcIFPE+4WcDWxgj11BuPqR5ekVkGZm/F34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EVi+QNJ8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ERXynQc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GGvQ7Bk4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QiHk8N0Z; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EVi+QNJ8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ERXynQc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GGvQ7Bk4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QiHk8N0Z"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B3F6021F92;
	Fri,  2 Oct 2026 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsLwC6Ar4pNh5Sb9nHbBMFgIUM0sO2MFrkQOJE/Gf/k=;
	b=EVi+QNJ80PX/zvzudFCD6jQAe9BWq5mVViyo6rbqmpVxCyCm/y1EpPt5IPO0S8CEsY8sXm
	2aQ++NJZubzSoJMWDxzmNW212AcoArIqCUZ9jZef5CYZwltjTnReRnsmoYhuikgTvBmRoA
	aBgFQQIMwnUqz6eBqji5Bn9YUd4bIhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsLwC6Ar4pNh5Sb9nHbBMFgIUM0sO2MFrkQOJE/Gf/k=;
	b=+ERXynQcIl1tWqGjztg39uTv9C4uy7ToUvv5uG/te4adpLXMFqWiN6qBrN5/2ATmmJUIRv
	EbUScpXO5Q03fiCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsLwC6Ar4pNh5Sb9nHbBMFgIUM0sO2MFrkQOJE/Gf/k=;
	b=GGvQ7Bk4Y2BsfOBwvtyL9i1bS97QVQAuGnxkB37TzRDv4/dAFmlaaJIgT+M3fqdImqEqyL
	RW/dOHSV4FEba2yZSI80wmDEEjxCGyTZRXBY9uxWjz7D69l85m7ukUcJb0+tqiZ4mUG79I
	UAYgNEKubEQ795356qjn4oBN7f1PIWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsLwC6Ar4pNh5Sb9nHbBMFgIUM0sO2MFrkQOJE/Gf/k=;
	b=QiHk8N0Z2AVYPjUQA4oooB26pfBzjqbzQckFQFWvxq67rcnnavFwwrEEqRGxM38siC63OZ
	h4lHpSVe6vfAk8BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EBE6313C07;
	Fri,  2 Oct 2026 08:55:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T13
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 12/32] ALSA: cs5535audio: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:50 +0200
Message-ID: <20261002085517.693510-13-tiwai@suse.de>
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
 sound/pci/cs5535audio/cs5535audio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index 0ebf6c02b1ef..e09f7bc9e23a 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -283,11 +283,11 @@ static int snd_cs5535audio_create(struct snd_card *card,
 	return 0;
 }
 
-static int __snd_cs5535audio_probe(struct pci_dev *pci,
-				   const struct pci_device_id *pci_id)
+static int snd_cs5535audio_probe(struct pci_dev *pci,
+				 const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct cs5535audio *cs5535au;
 	int err;
 
@@ -329,16 +329,11 @@ static int __snd_cs5535audio_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_cs5535audio_probe(struct pci_dev *pci,
-				 const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_cs5535audio_probe(pci, pci_id));
-}
-
 static struct pci_driver cs5535audio_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_cs5535audio_ids,
-- 
2.55.0

