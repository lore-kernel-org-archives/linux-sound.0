Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7080037
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321129; cv=none; b=roXnKIJUvxGJsPvP1ZADw96QYSSGzAEZ6+7C6GEGJck/b2IjcUR4vjBB0di4Y7XqbX5DG/M5wqsi65WyakRYbOvZxcyt7+YpCP4N7EAeQIig2KQ59rioLuEzViL3Q8L5/QBoYCawFIG9WFirnv1D8550Y2iEftFItgzVt24XwkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321129; c=relaxed/simple;
	bh=KOC7QAkUMZj2/YPJGNFl4VdKdqvdwetkWEz0xrcXLro=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ewbP3u75gOf+Ag/jpk9rNn//xbahbB1ZeAJWHah9XZlmBGUNH4sDekxij6Fhqx2fc6ZhZLVx2Kat3nVLvkysnHA7UbQIkP8+pDEZwcHdd5pBJRttUc54ak4cusBUsbBCaNiy3+N4rvVDOVddbu5k0dXkCk0ZU2vqQyZtV1AMpac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GnDxtZud; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yvJwv7JY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GnDxtZud; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yvJwv7JY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GnDxtZud";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yvJwv7JY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GnDxtZud";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yvJwv7JY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8AF5C22317;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPL+/zLn/nzlLVlESumRshnJm86UjAvROmC7bdX8vuU=;
	b=GnDxtZudbScI7DR6bTYpwKMXBf1hRz8IAVMrcf6TL/30ujnRQaPye4cAm86KtyHQi934UK
	G+mXO2cL2YoHyp/rl2MNVjtqUa0JxBITKjdiBYiQG7uSQz36MMzhLiTacbmlaK0PAVgbr2
	AsIlIYxE2bwP8O+EcsWLqRLWLq0Wd6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPL+/zLn/nzlLVlESumRshnJm86UjAvROmC7bdX8vuU=;
	b=yvJwv7JYJ4VyYlQqZyW8tGPHLSX8QgwzP6xCBOPMz+H1nPMRseJCY65ROJkqn5VqmVv4y5
	Es5dKwBCFg8FD/Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPL+/zLn/nzlLVlESumRshnJm86UjAvROmC7bdX8vuU=;
	b=GnDxtZudbScI7DR6bTYpwKMXBf1hRz8IAVMrcf6TL/30ujnRQaPye4cAm86KtyHQi934UK
	G+mXO2cL2YoHyp/rl2MNVjtqUa0JxBITKjdiBYiQG7uSQz36MMzhLiTacbmlaK0PAVgbr2
	AsIlIYxE2bwP8O+EcsWLqRLWLq0Wd6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPL+/zLn/nzlLVlESumRshnJm86UjAvROmC7bdX8vuU=;
	b=yvJwv7JYJ4VyYlQqZyW8tGPHLSX8QgwzP6xCBOPMz+H1nPMRseJCY65ROJkqn5VqmVv4y5
	Es5dKwBCFg8FD/Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C61A139D8;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SADlGCCnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 16/29] ALSA: ali5451: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:27 +0100
Message-Id: <20240207155140.18238-17-tiwai@suse.de>
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
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.62
X-Spamd-Result: default: False [3.62 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.08)[63.29%]
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

This ends up with the allocation of a few additional bytes for the
image even if it's not really used, but the code-simplification should
justify the cost.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ali5451/ali5451.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 9d48638a3ab4..31e51e2df655 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -243,9 +243,7 @@ struct snd_ali {
 	spinlock_t	reg_lock;
 	spinlock_t	voice_alloc;
 
-#ifdef CONFIG_PM_SLEEP
 	struct snd_ali_image image;
-#endif
 };
 
 static const struct pci_device_id snd_ali_ids[] = {
@@ -1824,7 +1822,6 @@ static int snd_ali_mixer(struct snd_ali *codec)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ali_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -1900,11 +1897,7 @@ static int ali_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ali_pm, ali_suspend, ali_resume);
-#define ALI_PM_OPS	&ali_pm
-#else
-#define ALI_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(ali_pm, ali_suspend, ali_resume);
 
 static void snd_ali_free(struct snd_card *card)
 {
@@ -2166,7 +2159,7 @@ static struct pci_driver ali5451_driver = {
 	.id_table = snd_ali_ids,
 	.probe = snd_ali_probe,
 	.driver = {
-		.pm = ALI_PM_OPS,
+		.pm = &ali_pm,
 	},
 };                                
 
-- 
2.35.3

