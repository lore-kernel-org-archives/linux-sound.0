Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CABD1DE8BE
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728390368; cv=none; b=qG/QOozDhTaIfV5O8bJU5eoZ8642laOei7Vgc1NDvj+PdQ7HsZMUyT4hAU9X0P+vWrcFZ9YteFtyz3JyTMfH7UJFVwM0K2aCzg06c7sW96Io43yElJT0HWjbwX8zKm4obP5sHfLUnxJdS5cQ49PHf19Vsm4tgHAwfF/ZArflPso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728390368; c=relaxed/simple;
	bh=FEAF7pY4SqjiMDIEhqNatDE9NBFpmQDx34BgxVaIDRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHe64FWYini2FlNCb7dLzjaKaLQLKbCdW6IJiOOxMM0w/BeQ7JkXzpHiP6VehuDlzq5vJKkbOPo1NUtg8q6zLQjJGXhgNMBC1ekD6LC8jYsF1kRO3ihMPdFIgT4m/6U/eg9M+Q44qz8Fscx6tVJJTiLWd7J16p5P0JWd+4QUfD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kubt6orn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3aBaCVVM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kubt6orn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3aBaCVVM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kubt6orn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3aBaCVVM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kubt6orn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3aBaCVVM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 995C221BF1;
	Tue,  8 Oct 2024 12:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728390364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LFdpxZ/udUkY7V4BJIy4CSmJgKN/Xc5WzG5jY9SDxj0=;
	b=kubt6ornZSU1RhVl4ab0/gLa1hLx6lJxZtYFl7fHSFvs/JbY1g5S2xVuAteYZRSBAHVRLL
	x6CY2uEqnRLJRkO2zNeqIMQWithBfB+hVOeSZKA8jdRagN0rE5c0o6UKmoksjTma4ro2+J
	EuVsqDGWNovZaK4REF1aeu0Ccgrtnog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728390364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LFdpxZ/udUkY7V4BJIy4CSmJgKN/Xc5WzG5jY9SDxj0=;
	b=3aBaCVVMZkbvxySXS1A6cJQQw4qePQ3O3Vy+WASsiVOkYHcfL0Sx/IVu2HbfPRU1XL/g2X
	ooFdWt1unVXjHkBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kubt6orn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3aBaCVVM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728390364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LFdpxZ/udUkY7V4BJIy4CSmJgKN/Xc5WzG5jY9SDxj0=;
	b=kubt6ornZSU1RhVl4ab0/gLa1hLx6lJxZtYFl7fHSFvs/JbY1g5S2xVuAteYZRSBAHVRLL
	x6CY2uEqnRLJRkO2zNeqIMQWithBfB+hVOeSZKA8jdRagN0rE5c0o6UKmoksjTma4ro2+J
	EuVsqDGWNovZaK4REF1aeu0Ccgrtnog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728390364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LFdpxZ/udUkY7V4BJIy4CSmJgKN/Xc5WzG5jY9SDxj0=;
	b=3aBaCVVMZkbvxySXS1A6cJQQw4qePQ3O3Vy+WASsiVOkYHcfL0Sx/IVu2HbfPRU1XL/g2X
	ooFdWt1unVXjHkBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 843B1137CF;
	Tue,  8 Oct 2024 12:26:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fVO0H9wkBWeNdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Oct 2024 12:26:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 1/2] ALSA: hda: tas2781: Fix missing setup at runtime PM
Date: Tue,  8 Oct 2024 14:26:55 +0200
Message-ID: <20241008122658.9549-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 995C221BF1
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email,suse.com:url];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

tas2781_runtime_suspend() clears the playback_started flag, hence it
leads to inconsistent state after runtime suspend is triggered, as if
the device hasn't been opened yet.  Also, the counterpart,
alc2781_runtime_resume() doesn't call tasdevice_tuning_switch(), and
this also causes the inconsistency.

This patch corrects the superfluous flag clearance and the missing
call.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Link: https://bugzilla.suse.com/show_bug.cgi?id=1230132
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/tas2781_hda_i2c.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 370d847517f9..6d173b721fd0 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -864,10 +864,8 @@ static int tas2781_runtime_suspend(struct device *dev)
 	/* The driver powers up the amplifiers at module load time.
 	 * Stop the playback if it's unused.
 	 */
-	if (tas_hda->priv->playback_started) {
+	if (tas_hda->priv->playback_started)
 		tasdevice_tuning_switch(tas_hda->priv, 1);
-		tas_hda->priv->playback_started = false;
-	}
 
 	mutex_unlock(&tas_hda->priv->codec_lock);
 
@@ -889,6 +887,9 @@ static int tas2781_runtime_resume(struct device *dev)
 	 */
 	tasdevice_apply_calibration(tas_hda->priv);
 
+	if (tas_hda->priv->playback_started)
+		tasdevice_tuning_switch(tas_hda->priv, 0);
+
 	mutex_unlock(&tas_hda->priv->codec_lock);
 
 	return 0;
-- 
2.43.0

