Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0032D5C9C
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142260; cv=none; b=QXrl2y5sUECPTQ0fAM0UOanCth7lYLiG3Du9fAgxp8vXavUYfHymkiJmqHEwh3NvEbJ+oPALMtJYuGNsxE/fnDHH4q9llii3GCMveHgGUgt4Bzsxfg9k+1qb45Fhkcv+TxE/REvE+AsMS0KWIqHAUKc0CiJeJ3GGW3H1ubMeKJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142260; c=relaxed/simple;
	bh=GCPT1H1xOIJTdNYz0t4nQRhq9kpXu7fcII4kLmTXqxA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQAQ/ayVB4BuZz7REpFsqS/SxGmwrwsTy/cWHYJcEHTJvNKHtHW/qCt2lFY7r687frUEyzR+gYXVf8uI1N38QEhW3vacbsCowD9AZHqc2U1bIfZDflbmSQft8uDuC3JQDLPcnNUK0Vmep8R3ZdbLHGETFP4NWu1VmFid+yiKJtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OPMi+heh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lacuc76K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OPMi+heh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lacuc76K; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OPMi+heh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lacuc76K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OPMi+heh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lacuc76K"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D90DD2119E;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aXZOzy68fclIi6K244hUIa+a1jQsSHShsBjEzJpo71I=;
	b=OPMi+hehbDE9zE0Lqfe32uru1WN4DrNaFnl1h+1wfjWw22dW4v4CbNxVpncj45a5uzoRS6
	aPJ97GSGh2p/Njc3zPAPD8cfK5qdyU+FdhG7DwIjzayHvyPNY6uRx3bRvcpnICq7rLJdPR
	Kwxeqc6Y6V2t65JDJV43Fwkb7+09oc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aXZOzy68fclIi6K244hUIa+a1jQsSHShsBjEzJpo71I=;
	b=Lacuc76K2vhzwQihHzS1WaNqceEZeugV0XNNw0xxIrRYtOwaRtOr60BM4o4+cOjrnkuPgY
	7yVXa0dbvd4LMqBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aXZOzy68fclIi6K244hUIa+a1jQsSHShsBjEzJpo71I=;
	b=OPMi+hehbDE9zE0Lqfe32uru1WN4DrNaFnl1h+1wfjWw22dW4v4CbNxVpncj45a5uzoRS6
	aPJ97GSGh2p/Njc3zPAPD8cfK5qdyU+FdhG7DwIjzayHvyPNY6uRx3bRvcpnICq7rLJdPR
	Kwxeqc6Y6V2t65JDJV43Fwkb7+09oc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aXZOzy68fclIi6K244hUIa+a1jQsSHShsBjEzJpo71I=;
	b=Lacuc76K2vhzwQihHzS1WaNqceEZeugV0XNNw0xxIrRYtOwaRtOr60BM4o4+cOjrnkuPgY
	7yVXa0dbvd4LMqBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFCC6136DC;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2HSjLe6Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 046/103] ALSA: als4000: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:28 +0200
Message-ID: <20250710100727.22653-47-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/als4000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index 3f4f3037f71f..eb159497c905 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -877,8 +877,8 @@ static int __snd_card_als4000_probe(struct pci_dev *pci,
 
 	snd_als4000_configure(chip);
 
-	strcpy(card->driver, "ALS4000");
-	strcpy(card->shortname, "Avance Logic ALS4000");
+	strscpy(card->driver, "ALS4000");
+	strscpy(card->shortname, "Avance Logic ALS4000");
 	sprintf(card->longname, "%s at 0x%lx, irq %i",
 		card->shortname, chip->alt_port, chip->irq);
 
-- 
2.50.0

