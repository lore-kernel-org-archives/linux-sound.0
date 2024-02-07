Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0F580045
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321129; cv=none; b=jtDBOzYyil9mRzqrp2izwwJ4JH3WcASIN3g9CP9gfsn5VbZfPfW2zd29gDmVF9z+kqMZEbxCxEAjpfBF55aNoVKencLMZctZK+cgBqRvqAiUloTCn/0jweVi3fo+WAfHC8qOTZwcYq1ZiyRZjV0fzsJU0uFKg31jNhG4tBmNpbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321129; c=relaxed/simple;
	bh=LFcq+sQunpjhHnXUmliaRbD+AxqT07idmnBu0xVvjmI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OqGFvg5BsrcrB+DmS0stVXkr3GL7wCKUB4fKVip4wA5Yg977Dos4fm5725Q20UpmdQZ7lflGDiduUALMfwg3w7Yi5g37T2uwssXHxvLvsRdYjezeE7DUB4FM2zJGAEjL3ZTpPtvr4qi/XvMXIKsrKybb4fTFd7hqoJaVvnftRBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bnL4Y/rl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I28IbGO1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bnL4Y/rl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I28IbGO1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bnL4Y/rl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I28IbGO1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bnL4Y/rl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I28IbGO1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B00AE1FC29;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDYlozzJoNiSDlgW9hPmCl4hrWomjUtNLLnJFgd7OWM=;
	b=bnL4Y/rl2FGoIVJbQmvr9AFxMq+zdq27wvNbK6Gmkiyx7vFNWPG8hXsGBWKDPfvwLQiViD
	MbjkrP0ucN6+nAEEQRJWiCfqRIZWpNkAfNdsrGpDkn97T/wBg9sQRjIK4bHkoLMuEX9ZYy
	Dbq/v/uIfsUx69vkNCrWpfxF8zShBSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDYlozzJoNiSDlgW9hPmCl4hrWomjUtNLLnJFgd7OWM=;
	b=I28IbGO18S1ZKvIVPGB2voggD2lJ2KvhHuiuFkoG/DKWVKVguL3VCr9fMuMDeqqqgUxZGc
	T6aQfiz/AXYRr6CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDYlozzJoNiSDlgW9hPmCl4hrWomjUtNLLnJFgd7OWM=;
	b=bnL4Y/rl2FGoIVJbQmvr9AFxMq+zdq27wvNbK6Gmkiyx7vFNWPG8hXsGBWKDPfvwLQiViD
	MbjkrP0ucN6+nAEEQRJWiCfqRIZWpNkAfNdsrGpDkn97T/wBg9sQRjIK4bHkoLMuEX9ZYy
	Dbq/v/uIfsUx69vkNCrWpfxF8zShBSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDYlozzJoNiSDlgW9hPmCl4hrWomjUtNLLnJFgd7OWM=;
	b=I28IbGO18S1ZKvIVPGB2voggD2lJ2KvhHuiuFkoG/DKWVKVguL3VCr9fMuMDeqqqgUxZGc
	T6aQfiz/AXYRr6CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8798A13A41;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MB2iHyGnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 23/29] ALSA: fm801: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:34 +0100
Message-Id: <20240207155140.18238-24-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240207155140.18238-1-tiwai@suse.de>
References: <20240207155140.18238-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="bnL4Y/rl";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=I28IbGO1
X-Spamd-Result: default: False [4.66 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.03)[56.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.66
X-Rspamd-Queue-Id: B00AE1FC29
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

This ends up with the allocation of a few additional bytes for the
register dumps even if it's not really used, but the code
simplification should justify the cost.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/fm801.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 62b3cb126c6d..7f4834c2d5e6 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -222,9 +222,7 @@ struct fm801 {
 	struct snd_tea575x tea;
 #endif
 
-#ifdef CONFIG_PM_SLEEP
 	u16 saved_regs[0x20];
-#endif
 };
 
 /*
@@ -1339,7 +1337,6 @@ static int snd_card_fm801_probe(struct pci_dev *pci,
 	return snd_card_free_on_error(&pci->dev, __snd_card_fm801_probe(pci, pci_id));
 }
 
-#ifdef CONFIG_PM_SLEEP
 static const unsigned char saved_regs[] = {
 	FM801_PCM_VOL, FM801_I2S_VOL, FM801_FM_VOL, FM801_REC_SRC,
 	FM801_PLY_CTRL, FM801_PLY_COUNT, FM801_PLY_BUF1, FM801_PLY_BUF2,
@@ -1396,18 +1393,14 @@ static int snd_fm801_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_fm801_pm, snd_fm801_suspend, snd_fm801_resume);
-#define SND_FM801_PM_OPS	&snd_fm801_pm
-#else
-#define SND_FM801_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_fm801_pm, snd_fm801_suspend, snd_fm801_resume);
 
 static struct pci_driver fm801_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_fm801_ids,
 	.probe = snd_card_fm801_probe,
 	.driver = {
-		.pm = SND_FM801_PM_OPS,
+		.pm = &snd_fm801_pm,
 	},
 };
 
-- 
2.35.3

