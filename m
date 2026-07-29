Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10AC248F7C
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314281; cv=none; b=Dmk8OSA+C7HbWcebXZ5+EY9CMt8bJdyMKHu3pf4HVMBRMLUIzqBy/LSQEQyxSWmr3GKTqbPj+eGhOWPl3uPHlzzAGD9mvx3IBh30j2A9iNvBLm5Ymby8AU3+VIWvg4QMLJ24n9wmvsn0WmiQLfHF+YHU/jsYzSZAav6ZFHtB1vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314281; c=relaxed/simple;
	bh=Sp1U0ERNp0Ze0XqzCjPcurObb54pQthNftaAbh7jMss=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZJofuVLFNuhxuQpbVID9gWpJQCvxBBZLW5c7bGZE/Kz5VfT/Jjmng5+3q6prW0+nXLrGZQpNlTQnSe9afRwuhs8HVa2qUl5gKZTckZJl6VCCCDUr6uIDDIjIEY78lXzCbGWP9hZO1xmpYT0ICnVrxC/O1Pl8HGcXCCAEkFPVjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XrfNG4zM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UNeTWsNR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t1/2M+de; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kKCJ0M3y; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XrfNG4zM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UNeTWsNR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t1/2M+de";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kKCJ0M3y"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 007537C99F;
	Wed, 29 Jul 2026 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laFBc6nYoICxWzykrEcWZpDghgnUGjAyLzFq6CMe59Q=;
	b=XrfNG4zMwXCX1SUSVXctog9/2rIdLfEF1P4JvJcxOfJT3UGQyuBiOmKWU5AsRtAqclxdqQ
	PWoQK0iJlSGv/BgA0U6/w7cX0oYlxotu80r215YaC1KN6Ffh+4L6uMtpm4Aj0r5XhE/8+g
	7si38dj0QgtuOTFwGcnw1YZhYVgocsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314268;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laFBc6nYoICxWzykrEcWZpDghgnUGjAyLzFq6CMe59Q=;
	b=UNeTWsNROiKPxhdeeHBgh55pSlWCUZ8znvtC+qavXlHJQJcItF2/UFIDSAIPUEXbTWuJIQ
	6k4m9Y/WSAjUYLCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laFBc6nYoICxWzykrEcWZpDghgnUGjAyLzFq6CMe59Q=;
	b=t1/2M+deZnSH7HGAhK6qpKNuymmJjxyNZqijNy5PDbLKqVTv8G42vhz3s9WS7BxOKGZtb4
	3+FtcovJQKkpIAtdg7EzcAxYV08+0GVClb91ozizyP8QPXYmZM6weuqfwFMYC5hv8wykcl
	ydg/7i2BQY1s07AMHQwDmRFSxfrDX24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laFBc6nYoICxWzykrEcWZpDghgnUGjAyLzFq6CMe59Q=;
	b=kKCJ0M3yXOh09kiO18POmRwcwliUgB3uDG8Lke7U1YKDSOzOiPY5GnzERu4EWGkni7OAjl
	2wSpGQ+0ozmAauAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5B4F779B9;
	Wed, 29 Jul 2026 08:37:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wCX7Mte7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/14] ALSA: msnd: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:22 +0200
Message-ID: <20260729083735.120219-5-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729083735.120219-1-tiwai@suse.de>
References: <20260729083735.120219-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.983];
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

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/msnd/msnd_pinnacle.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/isa/msnd/msnd_pinnacle.c b/sound/isa/msnd/msnd_pinnacle.c
index 0d5f4461a7bc..eac6e22362cc 100644
--- a/sound/isa/msnd/msnd_pinnacle.c
+++ b/sound/isa/msnd/msnd_pinnacle.c
@@ -367,7 +367,8 @@ static int snd_msnd_init_sma(struct snd_msnd *chip)
 static int upload_dsp_code(struct snd_card *card)
 {
 	struct snd_msnd *chip = card->private_data;
-	const struct firmware *init_fw = NULL, *perm_fw = NULL;
+	const struct firmware *init_fw __free(firmware) = NULL;
+	const struct firmware *perm_fw __free(firmware) = NULL;
 	int err;
 
 	outb(HPBLKSEL_0, chip->io + HP_BLKS);
@@ -375,28 +376,21 @@ static int upload_dsp_code(struct snd_card *card)
 	err = request_firmware(&init_fw, INITCODEFILE, card->dev);
 	if (err < 0) {
 		dev_err(card->dev, LOGNAME ": Error loading " INITCODEFILE);
-		goto cleanup1;
+		return err;
 	}
 	err = request_firmware(&perm_fw, PERMCODEFILE, card->dev);
 	if (err < 0) {
 		dev_err(card->dev, LOGNAME ": Error loading " PERMCODEFILE);
-		goto cleanup;
+		return err;
 	}
 
 	memcpy_toio(chip->mappedbase, perm_fw->data, perm_fw->size);
 	if (snd_msnd_upload_host(chip, init_fw->data, init_fw->size) < 0) {
 		dev_warn(card->dev, LOGNAME ": Error uploading to DSP\n");
-		err = -ENODEV;
-		goto cleanup;
+		return -ENODEV;
 	}
 	dev_info(card->dev, LOGNAME ": DSP firmware uploaded\n");
-	err = 0;
-
-cleanup:
-	release_firmware(perm_fw);
-cleanup1:
-	release_firmware(init_fw);
-	return err;
+	return 0;
 }
 
 #ifdef MSND_CLASSIC
-- 
2.55.0

