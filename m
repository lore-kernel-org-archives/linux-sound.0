Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EDF466B5E
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931346; cv=none; b=WWKwe2Gu0zoooC5iv+OJNjuVHEZJ5AfqFnWoZW6CIQwNtlTrTjeeoAQWpG6TGVlaLHfrNAHeL/fF4KK3prU4i6oGz1lMV+rrOKEwkRJ9M/ThwmH2S+nVM3w/Cm2IrogaYuIyB1MEKQYCkCKGZbFDDFIfhFggnSmYnjEKpBjI8m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931346; c=relaxed/simple;
	bh=fKVXOdrQSgdNB945YCg/gqQo11LnYKWee7gpnHVd++A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bh1kd/zBAX1rVxVcLdWlDKfqydcM03kLJNyN7XJJLk9MgytYHOBXChUbHLXhgUNoJUwChlAYZBfEMYryJf0oP/o+Jw5jadJ0BjpSm0pYT2qp0pvfDok/y8zd9mjtZFCpIBUfFpbQ29MUd7frGuR+IDlmuzVja+SVJuw9T0cSsrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hja7nmOt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XNc/3Ws9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s0tx9KkP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MKWnWMMI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hja7nmOt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XNc/3Ws9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s0tx9KkP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MKWnWMMI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DFBB021F94;
	Fri,  2 Oct 2026 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zRPnc5WpPViz4VP1wHVISqEjYx5BSo4KYZOwlsWE+aU=;
	b=Hja7nmOtqDcB+VX+3W4XxonE1khVMCKEw5xvDkN1Twi1KkbrBZJQnqB2Fr/0PAzqgT9KiI
	xcnxTEgO2isLnCBjsZfSIn/+xeC2G67j0onN1p8bBh407rtE9GiatS90U/8J4WjTCBcKZX
	RbNTixj87xWQJbeeBbX86KDgC1aIR7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zRPnc5WpPViz4VP1wHVISqEjYx5BSo4KYZOwlsWE+aU=;
	b=XNc/3Ws9mdw+fiqdKIxCoZEsFrMmS7m5err9R7V3qfznADQKpqIrC+bG6THu4QyQOrCDrH
	T4Rile+7DbCQ6kAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zRPnc5WpPViz4VP1wHVISqEjYx5BSo4KYZOwlsWE+aU=;
	b=s0tx9KkPtWdWZMwlGvYYAXa7yqTIhBQaXzZF34DZ5U1rVmLhObMSxzM2zdYQXJ4rUd7ncU
	m3DTue6C/s+D/KlSVaY7d2FLV9129Bt19fmc9So+wSwCKlmcqorSeaXi4hjS9xVUWumI9Q
	kPV0v3810YL/IFh4l3En2OK+n9NWIvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zRPnc5WpPViz4VP1wHVISqEjYx5BSo4KYZOwlsWE+aU=;
	b=MKWnWMMI+uStcV1fD2tG5LNZfah9JRMALz++ZSSBl3xmPFrhzwg4vKxKXKCX2Oq1+vDzHN
	eaHK5RunZLEcV6Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2181A13C08;
	Fri,  2 Oct 2026 08:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T14
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 13/32] ALSA: echoaudio: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:51 +0200
Message-ID: <20261002085517.693510-14-tiwai@suse.de>
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
 sound/pci/echoaudio/echoaudio.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 214d68657707..e6d92fe50696 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -1934,11 +1934,11 @@ static int snd_echo_create(struct snd_card *card,
 }
 
 /* constructor */
-static int __snd_echo_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
+static int snd_echo_probe(struct pci_dev *pci,
+			  const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct echoaudio *chip;
 	char *dsp;
 	int err;
@@ -2097,17 +2097,11 @@ static int __snd_echo_probe(struct pci_dev *pci,
 	dev_info(card->dev, "Card registered: %s\n", card->longname);
 
 	pci_set_drvdata(pci, chip);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_echo_probe(struct pci_dev *pci,
-			  const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_echo_probe(pci, pci_id));
-}
-
-
 static int snd_echo_suspend(struct device *dev)
 {
 	struct echoaudio *chip = dev_get_drvdata(dev);
-- 
2.55.0

