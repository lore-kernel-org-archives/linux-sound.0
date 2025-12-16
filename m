Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA64132ED44
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894336; cv=none; b=dRd1rIjgM1HaL5msTX+v8vJHCfCieQEsSMpRZ7SUF0ON0402J0okeqmOrriviTFUWM8C7JioUdfVAnIVVojPLWn9d6SLz+tb4RSu+9Fe4zVfoPlPDbAYPB60B37+W32OJmY/fwvO5UUsQM/nCi3ohTSuh+MnhLiDzhG4YDQAT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894336; c=relaxed/simple;
	bh=o5E7bFr3lxYuT0bdWkblerIa9kO5QO/YbADH6Uq8WXI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nq5aZKf6xsY80/V2EJpoaxMyjUVTK1JbZl9MMWdJK7qVF/BmBg7uJAl48EooQACiggfDkzwHEnmfLoIVFKonvVQNzQSMRXJpMeTDimO6IaATFApwhepn9rvXDFSueQHyppnw8mpO0Nqd5Be8QzxFXmzenJeGGqYYOMOmPcGvzec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GjF/os7n; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QCZDQ6RZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o+yU5B5Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9yjgoc7h; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GjF/os7n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QCZDQ6RZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o+yU5B5Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9yjgoc7h"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A2117336A6;
	Tue, 16 Dec 2025 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHU6PVaV+PhJgE+om41thLYQlqzUMg3xIsprbjXaPgc=;
	b=GjF/os7ncZDIt3HvvOWgSxf8Az6gtcsUoPKQ7iGZEP0gjVwKCmXA7Ydk57H61y5n/aee4J
	aqGqgI/T2FwT3xIPO+xV0tCpNjGQ9q4+apCVQm6+ZRcJzXjg2P7i2kZjgIIOFLzbSunkTB
	3EmSQ89SocKbXEdftm1M9FgXFTwoSy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894327;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHU6PVaV+PhJgE+om41thLYQlqzUMg3xIsprbjXaPgc=;
	b=QCZDQ6RZmT8rheyEOmF7OzOYnv70zHvNOiOQcCDSxrkx8zu9m9OUo9IZbsKEy18Iof7Sc5
	KgZVrnDE/yddOCCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=o+yU5B5Z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9yjgoc7h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHU6PVaV+PhJgE+om41thLYQlqzUMg3xIsprbjXaPgc=;
	b=o+yU5B5ZlGujvMcrF70O8Vo+A7uIfPgsNX/NaxVL9PF4iD0YjposiQv3miGI2hrckT/wP6
	Jldx1PKxvE1h5o4wdKXum3gONgQBE/22AHR1zbYIco2ONDVEuk1/z6z0jQ6w2/iG+moOr8
	GM+0EdkpQ8C5XuETvNcNcyhN6b3V6HQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHU6PVaV+PhJgE+om41thLYQlqzUMg3xIsprbjXaPgc=;
	b=9yjgoc7hUhVmgJBiKNLa7bBGRC+9LWkmst2fjjdK7273DdnPwagB/+gw13vAG473QpNvwO
	ayAn7f5n85tcVdDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 633373EA65;
	Tue, 16 Dec 2025 14:12:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yIK2F7ZoQWk7OwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:12:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/5] ALSA: hda/tegra: Clean up runtime PM with guard()
Date: Tue, 16 Dec 2025 15:11:49 +0100
Message-ID: <20251216141154.172218-5-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216141154.172218-1-tiwai@suse.de>
References: <20251216141154.172218-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: A2117336A6
X-Spam-Flag: NO
X-Spam-Score: -3.01

Use guard(pm_runtime_active) for replacing the manual calls of
pm_runtime_get_sync() and pm_runtime_put().

Merely code cleanups and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/tegra.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/hda/controllers/tegra.c b/sound/hda/controllers/tegra.c
index 6ab338f37db5..31c14c4bbe68 100644
--- a/sound/hda/controllers/tegra.c
+++ b/sound/hda/controllers/tegra.c
@@ -592,30 +592,26 @@ static void hda_tegra_probe_work(struct work_struct *work)
 	struct platform_device *pdev = to_platform_device(hda->dev);
 	int err;
 
-	pm_runtime_get_sync(hda->dev);
+	guard(pm_runtime_active)(hda->dev);
 	err = hda_tegra_first_init(chip, pdev);
 	if (err < 0)
-		goto out_free;
+		return;
 
 	/* create codec instances */
 	err = azx_probe_codecs(chip, 8);
 	if (err < 0)
-		goto out_free;
+		return;
 
 	err = azx_codec_configure(chip);
 	if (err < 0)
-		goto out_free;
+		return;
 
 	err = snd_card_register(chip->card);
 	if (err < 0)
-		goto out_free;
+		return;
 
 	chip->running = 1;
 	snd_hda_set_power_save(&chip->bus, power_save * 1000);
-
- out_free:
-	pm_runtime_put(hda->dev);
-	return; /* no error return from async probe */
 }
 
 static void hda_tegra_remove(struct platform_device *pdev)
-- 
2.52.0

