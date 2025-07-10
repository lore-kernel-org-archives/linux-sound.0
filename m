Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F2F2D660A
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142346; cv=none; b=bs2Qut8xhNUzGPqQwTBUDsuQAg3AZw1+GQkgs/Ao4KytyVD4/RDZTMriHGxVx31oEMBQ4zUSkzpeut+B4lmRj3puqIzRU8tgu0RVSAylJNKSwo8jezzB/dfR6ExgNK2yGERPBUdivXJmzQWAzYVvUIzXjegiD8Gw0Py8ovlxb20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142346; c=relaxed/simple;
	bh=e+S1L/ZfXOozzwlT2ehWMgTOgus+u/h6bKUxfUUAORM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YLT7fa2Qxoit8aK7awV039koCroGk+9Uom2/trcL/Pl6y7umCOx6oTGCG0hiYPQr7pOO/rtvM7fK4Mwj2zft0GZKrvH1mpilnkTCt/d2pZ/iFtuCZzK4mxqVTKZKi28ksAnDIS2Tqy6nx4Hd4fY3gDgBaO9J6PF8HLAIu6cyIQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bFkds6uK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ubfiPNtF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bFkds6uK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ubfiPNtF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bFkds6uK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ubfiPNtF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bFkds6uK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ubfiPNtF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BA380211B1;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5zlY77nTr2Rk3GrPO39nKKaCFcW41+NQ+JtmGJUg5o=;
	b=bFkds6uKBjahijP/N1wESAjMUW0+l6BesKFYO1/Ww1aEC/xHDXi1De1CCxPElas2xmtyeC
	tLSD2ySyp+rbY3AOSkeS+OYL+Oq4huPeiftWTWG++q+cp0DDXmpiy6QM61Apa5ocERfB9c
	jZJM9QFBwpz/BsEYXltjaenEtNOapTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5zlY77nTr2Rk3GrPO39nKKaCFcW41+NQ+JtmGJUg5o=;
	b=ubfiPNtFFCI3DDoEcKOoyGPeroQxRg2xmC5NoU0PXNYYi3tOMf+nzkMsgpKspzU2qFCWIw
	TOTXht1tYy2e3MCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5zlY77nTr2Rk3GrPO39nKKaCFcW41+NQ+JtmGJUg5o=;
	b=bFkds6uKBjahijP/N1wESAjMUW0+l6BesKFYO1/Ww1aEC/xHDXi1De1CCxPElas2xmtyeC
	tLSD2ySyp+rbY3AOSkeS+OYL+Oq4huPeiftWTWG++q+cp0DDXmpiy6QM61Apa5ocERfB9c
	jZJM9QFBwpz/BsEYXltjaenEtNOapTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5zlY77nTr2Rk3GrPO39nKKaCFcW41+NQ+JtmGJUg5o=;
	b=ubfiPNtFFCI3DDoEcKOoyGPeroQxRg2xmC5NoU0PXNYYi3tOMf+nzkMsgpKspzU2qFCWIw
	TOTXht1tYy2e3MCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9BCA3136DC;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mOeXJPKQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 074/103] ALSA: nm256: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:56 +0200
Message-ID: <20250710100727.22653-75-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
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
 sound/pci/nm256/nm256.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index cd4dc43dbff1..39464d171f6b 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -1595,13 +1595,13 @@ static int snd_nm256_probe(struct pci_dev *pci,
 
 	switch (pci->device) {
 	case PCI_DEVICE_ID_NEOMAGIC_NM256AV_AUDIO:
-		strcpy(card->driver, "NM256AV");
+		strscpy(card->driver, "NM256AV");
 		break;
 	case PCI_DEVICE_ID_NEOMAGIC_NM256ZX_AUDIO:
-		strcpy(card->driver, "NM256ZX");
+		strscpy(card->driver, "NM256ZX");
 		break;
 	case PCI_DEVICE_ID_NEOMAGIC_NM256XL_PLUS_AUDIO:
-		strcpy(card->driver, "NM256XL+");
+		strscpy(card->driver, "NM256XL+");
 		break;
 	default:
 		dev_err(&pci->dev, "invalid device id 0x%x\n", pci->device);
-- 
2.50.0

