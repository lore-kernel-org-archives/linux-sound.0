Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666E3479899
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030368; cv=none; b=nJlme21yaorFTGnEqv8QSffv6UkGWj42so3ENWzjjHRlZ9rt8EYg/5KJy6BNeqREmV5lwvgRy8KxKQF8k/B6/Xc0b6ID0SUTOQM0KIrbILjChqq7DWX5MvaaDijcMy4LC0QDhL5sDcNjn7ZOGcB/8RGafr00oo9+uQ1FP70VPoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030368; c=relaxed/simple;
	bh=Zu5ixrXQz1HwCk/B6QXn6d1+ud0jBvwg7kqmnrlP3kg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uv/Wtq2HCdFwZzlKrdLE2gqOi6+If788778EyWCJD4Wm5+gVsZQtGskd9IdDapclJLbdcUiSVLVwb+nYKNdoquhNCDYyIEpQ+F/XyhmRMGTZPGdri2PmlZRr/MmJiMxToVOOarpuF2jCp2eNR4Oj8DHkGwuH7wBx9kuQ8ZA4pAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BlWpA2kd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BmzKeVvm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0CnhVggm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7Z5mBUf/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BlWpA2kd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BmzKeVvm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0CnhVggm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Z5mBUf/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 056CB3DF4;
	Thu,  6 Aug 2026 15:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4b82haCd+gAQJyLjzWE3iZo5e4EATRl5rNjjbUiqSk=;
	b=BlWpA2kd04rMigFllE+f7+mI5vykPdvoAzGxdhl2ErNTHucVksb+PGgasteY4aybrNCrj5
	+G11jmr0dj6fZ7dTdtl9gkJM0oKKHxoHmdjvnAUE4z2Zx5O1qlhDlupJw85vd91hrEqost
	g9i/S+ut1VFT9OSEdH9KJpLVNULP36M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4b82haCd+gAQJyLjzWE3iZo5e4EATRl5rNjjbUiqSk=;
	b=BmzKeVvm76kI41wyu9mLwlJzFki22fmCDkSR/FZUAB+a+Aum2Z67trus7bXyizZoeEctjU
	Aeew0ySHvUor3XDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0CnhVggm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="7Z5mBUf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4b82haCd+gAQJyLjzWE3iZo5e4EATRl5rNjjbUiqSk=;
	b=0CnhVggmTh4nRms/yF2fpZdYvqJedudPssF0N6kRgrR2bGMGIziAbF7EaTcOLwsYOEcVCQ
	uavJ7GgtDazWmnOTcUoqCd3OXjBvAwKqZd9x6ZPh7jTnTGSg7vMh4wkYoG4bwZBxeQ6MuN
	jlweD/A56/kNwKP7j8XGiWb9oyZFBBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4b82haCd+gAQJyLjzWE3iZo5e4EATRl5rNjjbUiqSk=;
	b=7Z5mBUf/TCYSKqcG7nuclz9LYlkfr3Zh7LYY/5WtIi7hq0exuhEUT8QUfPV3GoOn6B8EU3
	v3KACu4DeQD/73BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A75F779CD;
	Thu,  6 Aug 2026 15:32:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mHfgFA2pdGpaFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 15:32:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 5/6] ALSA: mts64: Check card index validity at probe
Date: Thu,  6 Aug 2026 17:32:22 +0200
Message-ID: <20260806153227.1460166-6-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806153227.1460166-1-tiwai@suse.de>
References: <20260806153227.1460166-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 056CB3DF4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Although mts64 driver has a check of the given devptr->id value, it
doesn't check for a negative id, which is often given as "none" or
such value when bound via sysfs.  This may lead to OOB access for
index[] and other parameters.

Add a sanity check for the card index and warn/correct it if it's a
value out of the range.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mts64.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/drivers/mts64.c b/sound/drivers/mts64.c
index 36e9eab204ca..cefaa00b83e7 100644
--- a/sound/drivers/mts64.c
+++ b/sound/drivers/mts64.c
@@ -900,6 +900,12 @@ static int snd_mts64_probe(struct platform_device *pdev)
 	p = platform_get_drvdata(pdev);
 	platform_set_drvdata(pdev, NULL);
 
+	if (dev < 0) {
+		dev_warn(&pdev->dev,
+			 "Invalid card index %d, using default 0\n", dev);
+		dev = 0;
+	}
+
 	if (dev >= SNDRV_CARDS)
 		return -ENODEV;
 	if (!enable[dev]) 
-- 
2.55.0

