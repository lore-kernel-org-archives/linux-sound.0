Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F27045516D
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931346; cv=none; b=DZtCK1Jx9/ZD4fQjq5FPouuNtIJOjsLn2E20Oh0YDauUYxDPoSzNhIDQ1EDtKzjYgz1zRSuyQmI5nsnkhZ1lsKNmk6tC5bAZjnR/JsfZJx5CyDarO6oVJ1rnfEBQAV+M7FcfZwL2pcjFw2JCmWv4ATyYpwv+QRlc0F09EGyEhc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931346; c=relaxed/simple;
	bh=BrYrpqXX6kUCTfGxnKysEeuoax+55l5anI4R73VzmaE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4of8ikJ1ZbRjt3iiFzXMUDOE5jXacKuOxTAObOql1IMqztXZzrjR1WuxRMfpXbpA6U6JdwhbPt4e20IhPUxULepp6NpslIoqWOMQeUC9QNdN7FEZUG/j+z3Sc/G0mQ+O2fIhmis9Lhdgrj5WdJsV6V3mmZIAAOvUgbCrJB83H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CnL7iQXN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V8K4VJT0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Pyiu7GU4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YKpMIUnJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CnL7iQXN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V8K4VJT0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Pyiu7GU4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YKpMIUnJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0EE1B1FE3E;
	Fri,  2 Oct 2026 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7UU2ES5VrkpMaF+hzjNc41BV99GduJLg+w3YMUx77lQ=;
	b=CnL7iQXNNKKFDDeIoy+3qbcK2447+Mqvq14opCxK+OYZvQaJG1ur50LRfOHCsjwSocL3vV
	JdjocSvqY+Tiraqh/fdcgguom90UWD2SAXSZ9bwHrMLkXajdzp4ShYAyDsrdmMh0b8De3y
	TXCdphbN3xUeuKT6bsP4WBuFvPjkap0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7UU2ES5VrkpMaF+hzjNc41BV99GduJLg+w3YMUx77lQ=;
	b=V8K4VJT0hxf+Xpi3tuEB+zPZUIztYxPcZZL3sHwgq3WQB09FHlMJd/7X5JjknHq0d2wm4j
	ktw5dWIxJcFt7KBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7UU2ES5VrkpMaF+hzjNc41BV99GduJLg+w3YMUx77lQ=;
	b=Pyiu7GU4QXvjD5JEl1bSoZyi7fj12BzmrPBvzVhKkK2mdfGvhws2Ft3GQYrfMnxt1wqMnL
	VLK3YB7EHOjIeX34p2c4MeUbTfX0KTqo+TdVbLQaXJVKqRPSneK2iWDWzIuKyXnCqZ2kJm
	kU+sLJcL+qvOK00zxrxmVWrwVmV2oDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7UU2ES5VrkpMaF+hzjNc41BV99GduJLg+w3YMUx77lQ=;
	b=YKpMIUnJBDVuDtAj5SS3nDGpqdGUf9Q/cJXDHDccSC8ev1Kxh52vtENz+57WRpheLhx/AS
	idQMqAflksfliwBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1893A13C02;
	Fri,  2 Oct 2026 08:55:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T7
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 06/32] ALSA: atiixp: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:44 +0200
Message-ID: <20261002085517.693510-7-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/atiixp.c       | 13 ++++---------
 sound/pci/atiixp_modem.c | 13 ++++---------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index b738295b41e5..e1d36cd7945b 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1550,10 +1550,10 @@ static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
 }
 
 
-static int __snd_atiixp_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_atiixp_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct atiixp *chip;
 	int err;
 
@@ -1598,15 +1598,10 @@ static int __snd_atiixp_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_atiixp_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_atiixp_probe(pci, pci_id));
-}
-
 static struct pci_driver atiixp_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_atiixp_ids,
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 8aaeb197ce45..4984a345b4b2 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -1182,10 +1182,10 @@ static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
 }
 
 
-static int __snd_atiixp_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_atiixp_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct atiixp_modem *chip;
 	int err;
 
@@ -1225,15 +1225,10 @@ static int __snd_atiixp_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_atiixp_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_atiixp_probe(pci, pci_id));
-}
-
 static struct pci_driver atiixp_modem_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_atiixp_ids,
-- 
2.55.0

