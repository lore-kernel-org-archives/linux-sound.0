Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A061A8062A
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321126; cv=none; b=BOqQ1/WxtQfMHrCCMFMPT2cLfpvPlL8NDyXbCUOCgDV/k4UGzKvkLsLu3AxEgfgn0dWDh3K1WOADBL86Cq4hNye7eIWWUJhKctPdhvBLscreR6l7Y9SxVMoiYc7yOVL1R9fmt6c9XZS3Enb/hKiv5nodwTF6+Xsy08Aa5TJFwhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321126; c=relaxed/simple;
	bh=+3/t1QhnXi5LeQeL2vF3dXyf6lkogwW0uYp+iexHjVc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y/fkWmMBZdfcFfIBCQwnuvG2lEWoJi5b4tSxaHM7pTnXDfhbHrzfgKJ8IpD9DLoxUnwBBMAv2N/01g02zrk6Gz5r29ZDnhJJnU886PeG45iS/PY2fiinw+IC1ZhjydHNkGz4EJfp5gLZ+0vdIYLDOczGOOsWfpiYMr3YdfjB+m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dOeAO6pL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7bSZ7F5M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dOeAO6pL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7bSZ7F5M; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dOeAO6pL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7bSZ7F5M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dOeAO6pL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7bSZ7F5M"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6448B2230F;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zznsNNFM1an/LPEUUyOSCoz1lrvKfb3yYqyo3WUTjIM=;
	b=dOeAO6pLykpgyv3Ni7WbnlLVQwMG25+1Oh7X2CchAdq1htk18HLJK2euKPMP4Z9J5K/HZs
	sA4c8wnwarILkyIdqO5nz6ZMkri9KcHgMttC+WU9eZiBMTCFLynyzr2Wqt0jTY2AKN0FXv
	Tjxxw1p3xmSH07FyesFK94qK2cq+HpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zznsNNFM1an/LPEUUyOSCoz1lrvKfb3yYqyo3WUTjIM=;
	b=7bSZ7F5MkvBdkvgNm7fyJZFhujYIU5Iw/Bk/ywj5WhU9Xgf/bKf0ZkFNhZGTdGQUxFKtYI
	HK1Gk/wTinH1xHBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zznsNNFM1an/LPEUUyOSCoz1lrvKfb3yYqyo3WUTjIM=;
	b=dOeAO6pLykpgyv3Ni7WbnlLVQwMG25+1Oh7X2CchAdq1htk18HLJK2euKPMP4Z9J5K/HZs
	sA4c8wnwarILkyIdqO5nz6ZMkri9KcHgMttC+WU9eZiBMTCFLynyzr2Wqt0jTY2AKN0FXv
	Tjxxw1p3xmSH07FyesFK94qK2cq+HpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zznsNNFM1an/LPEUUyOSCoz1lrvKfb3yYqyo3WUTjIM=;
	b=7bSZ7F5MkvBdkvgNm7fyJZFhujYIU5Iw/Bk/ywj5WhU9Xgf/bKf0ZkFNhZGTdGQUxFKtYI
	HK1Gk/wTinH1xHBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45077139B9;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0O1QDyCnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 15/29] ALSA: ali5451: Embed suspend image into struct snd_ali
Date: Wed,  7 Feb 2024 16:51:26 +0100
Message-Id: <20240207155140.18238-16-tiwai@suse.de>
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
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[38.62%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Instead of allocating the memory with an additional devm_kmalloc(),
just put the image into the existing struct snd_ali.  The allocation
size isn't too big, hence it works better with less allocation calls.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ali5451/ali5451.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 2378a39abaeb..9d48638a3ab4 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -244,7 +244,7 @@ struct snd_ali {
 	spinlock_t	voice_alloc;
 
 #ifdef CONFIG_PM_SLEEP
-	struct snd_ali_image *image;
+	struct snd_ali_image image;
 #endif
 };
 
@@ -1829,13 +1829,9 @@ static int ali_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct snd_ali *chip = card->private_data;
-	struct snd_ali_image *im;
+	struct snd_ali_image *im = &chip->image;
 	int i, j;
 
-	im = chip->image;
-	if (!im)
-		return 0;
-
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
 	for (i = 0; i < chip->num_of_codecs; i++)
 		snd_ac97_suspend(chip->ac97[i]);
@@ -1872,13 +1868,9 @@ static int ali_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct snd_ali *chip = card->private_data;
-	struct snd_ali_image *im;
+	struct snd_ali_image *im = &chip->image;
 	int i, j;
 
-	im = chip->image;
-	if (!im)
-		return 0;
-
 	spin_lock_irq(&chip->reg_lock);
 	
 	for (i = 0; i < ALI_CHANNELS; i++) {
@@ -2112,13 +2104,6 @@ static int snd_ali_create(struct snd_card *card,
 		return err;
 	}
 
-#ifdef CONFIG_PM_SLEEP
-	codec->image = devm_kmalloc(&pci->dev, sizeof(*codec->image),
-				    GFP_KERNEL);
-	if (!codec->image)
-		dev_warn(card->dev, "can't allocate apm buffer\n");
-#endif
-
 	snd_ali_enable_address_interrupt(codec);
 	codec->hw_initialized = 1;
 	return 0;
-- 
2.35.3

