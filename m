Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F48145561F
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931345; cv=none; b=Icdu4lcU3JeEpuaAb0B3Q6nZSqzDhEdanX3Yx0rYQUGn1F1/1ezdn/LdjhavxostTeQWM2pilMfP3c625bUJXkLVWLqaskIjRjtw6hJORcl5GKjjOs9u6q32NkX9CQN9m+wuSP6Zm8vBPal9omX+2R+nxFGWeoLldWfEnKUrgsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931345; c=relaxed/simple;
	bh=6oZaoOuDlSgnMVwNNAl851WkcO2dQpwottX/KcxzB0o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IsPO2NYukeu9GzcCpHcgcpDD+ih582wEb7YPNp3bLYM0wDWN7kz/ev4pEb0ZgvoTvFMfJStGBF/PCCt7TWBYVyOSNawgrH7jOYT9PhYyJJoZ47qHojqoos2SSShDcGKXplRp7uENRA7dQngXwgWXFbJHzsAU2zIoAwxIlkdDb5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uAqj3INg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xPjH7bAp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BLShwVvy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7H3lAXdv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uAqj3INg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xPjH7bAp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BLShwVvy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7H3lAXdv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 286431FE44;
	Fri,  2 Oct 2026 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bm392AInERSwnxtN9VsV0MOLBas5hx5MPq1IXh6MERw=;
	b=uAqj3INgXeQCpfBze/QHR5wITuobBJBKdpIUNKRPAuxQZ1jWRp42fsS3LKI1xn9rVmYf8q
	sF/s5NNzklahXElhunn0TjQEIZMPQO1y5QQlFLYoHq+2pkiKajo2sS7B9s9t/ell+R5TE3
	YJdZW99a2cYgiK47iPWKYVCH0EeAj+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bm392AInERSwnxtN9VsV0MOLBas5hx5MPq1IXh6MERw=;
	b=xPjH7bApq5/pM6ISR2jmt8CHJQmRDbXM52xBQ/z9OK5mLvVTnhBKW2A7H6hbkNODrsuIm0
	JScZK+m5ytgvH9Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BLShwVvy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7H3lAXdv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bm392AInERSwnxtN9VsV0MOLBas5hx5MPq1IXh6MERw=;
	b=BLShwVvyN2FGjdzIktwjpLI+FJpIwxT+tP0sKFd8zpZKX0Nxc2v0z1vFvA1ISgaCP8qBxG
	2MOh657Wt9Q6mOtd6cX9hdyIHp2htAHe//0PMoAZOqW8Ta6H/hDYYTbnRqo9T/K9E/5vMY
	pAwFlgCeKzUbbgAcGEGFrOyKW42a/Ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bm392AInERSwnxtN9VsV0MOLBas5hx5MPq1IXh6MERw=;
	b=7H3lAXdvnkD91c67th236BJqtj89g5AWW6toxuChtRM3w7GqYAfRkqVPPGjH+K2gn7VrSv
	w4SZxP2s3t63INCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A6B3133CF;
	Fri,  2 Oct 2026 08:55:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T8
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 07/32] ALSA: au88x0: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:45 +0200
Message-ID: <20261002085517.693510-8-tiwai@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 286431FE44
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/au88x0/au88x0.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
index bb02945793f0..87a24f0c86e7 100644
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -192,10 +192,10 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci)
 
 // constructor -- see "Constructor" sub-section
 static int
-__snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	vortex_t *chip;
 	int err;
 
@@ -303,18 +303,13 @@ __snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		return err;
 	// (7)
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	vortex_connect_default(chip, 1);
 	vortex_enable_int(chip);
 	return 0;
 }
 
-static int
-snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_vortex_probe(pci, pci_id));
-}
-
 // pci_driver definition
 static struct pci_driver vortex_driver = {
 	.name = KBUILD_MODNAME,
-- 
2.55.0

