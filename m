Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3504080BE2
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321129; cv=none; b=W7CogaUfpB544JFkSeCs4Ltt+fQ6dK7XmIjTS1pQFHmmEtSpUaoSL68Q/zte/VVZyYQ5dSm2Zeu2c5NO1sxPVGGo6WpM1VjWwLffzwrT4XeronfMO6UwueCE6MCqEQwhldQFzqFNbqExCdloTNrkXBJ57f80uH5Jw6rzbRz5uiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321129; c=relaxed/simple;
	bh=C4sQcdjpeWWcvV/ymRaHidBFcus+jOw5znsfV15qhyM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R4DtA6lOhpSrOZiuDcWf8Pa8LCftIOFJlnVMWFm/a6CnBjANMYKFNNrPgOLsGEMdzItSzdYfTsCe+NjyJnrSKG2ttR4T6d42bFUJ1B9ty3/N7pnuI+V/k8unWKP3eJwUz+WO08+h01KRu59SaHDFgT2KwQ/R1BrBBOB8MY8pnWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vbAkn60T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1anFTRVf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vbAkn60T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1anFTRVf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vbAkn60T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1anFTRVf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vbAkn60T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1anFTRVf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0BF9722333;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3sYY9dH4jNephRSgJJ0NbDmxP9K9epcBIJjOE+R3rQ=;
	b=vbAkn60TErltfJZZfcgJs3WOm/JdolJvrpv1gGFFlrMD7YoKKNHSVVeMJn4L2d5OUhy7Rd
	h2xBN4vz335j9R62VP/UW1mlnsuMB9eGky5okI2AXp9v6pvPh/xnjGocYhBoT+5bJIJ+16
	oKTJuFSBOTiQ95viFmA8JYNMXdjbEPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3sYY9dH4jNephRSgJJ0NbDmxP9K9epcBIJjOE+R3rQ=;
	b=1anFTRVfeXD9gVyYXwyuOr2AEhzr3cQKU7Z9MCZWKvkGQT8KPnXkZaYlI2VuIQnN7zJTjm
	9XMVma94d8bc0EBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3sYY9dH4jNephRSgJJ0NbDmxP9K9epcBIJjOE+R3rQ=;
	b=vbAkn60TErltfJZZfcgJs3WOm/JdolJvrpv1gGFFlrMD7YoKKNHSVVeMJn4L2d5OUhy7Rd
	h2xBN4vz335j9R62VP/UW1mlnsuMB9eGky5okI2AXp9v6pvPh/xnjGocYhBoT+5bJIJ+16
	oKTJuFSBOTiQ95viFmA8JYNMXdjbEPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3sYY9dH4jNephRSgJJ0NbDmxP9K9epcBIJjOE+R3rQ=;
	b=1anFTRVfeXD9gVyYXwyuOr2AEhzr3cQKU7Z9MCZWKvkGQT8KPnXkZaYlI2VuIQnN7zJTjm
	9XMVma94d8bc0EBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1E8A139B9;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QHOoNSCnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 19/29] ALSA: cs4281: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:30 +0100
Message-Id: <20240207155140.18238-20-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vbAkn60T;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1anFTRVf
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.09)[64.59%]
X-Spam-Score: -0.10
X-Rspamd-Queue-Id: 0BF9722333
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

This ends up with the allocation of a few additional bytes for the
register dumps even if it's not really used, but the code
simplification should justify the cost.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs4281.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index 0c9cadf7b3b8..0cc86e73cc62 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -470,10 +470,7 @@ struct cs4281 {
 
 	struct gameport *gameport;
 
-#ifdef CONFIG_PM_SLEEP
 	u32 suspend_regs[SUSPEND_REGISTERS];
-#endif
-
 };
 
 static irqreturn_t snd_cs4281_interrupt(int irq, void *dev_id);
@@ -1897,8 +1894,6 @@ static int snd_cs4281_probe(struct pci_dev *pci,
 /*
  * Power Management
  */
-#ifdef CONFIG_PM_SLEEP
-
 static const int saved_regs[SUSPEND_REGISTERS] = {
 	BA0_JSCTL,
 	BA0_GPIOR,
@@ -1987,18 +1982,14 @@ static int cs4281_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(cs4281_pm, cs4281_suspend, cs4281_resume);
-#define CS4281_PM_OPS	&cs4281_pm
-#else
-#define CS4281_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(cs4281_pm, cs4281_suspend, cs4281_resume);
 
 static struct pci_driver cs4281_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_cs4281_ids,
 	.probe = snd_cs4281_probe,
 	.driver = {
-		.pm = CS4281_PM_OPS,
+		.pm = &cs4281_pm,
 	},
 };
 	
-- 
2.35.3

