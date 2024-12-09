Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C4D21516B
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733733573; cv=none; b=KrArxP6EX90aqjp0pEuULtKdRyP7E2km8bmtlcNCV9tQskBoSolbFAt1+e9ZFhwNU9+6tbobAyOxeb7xWE7bmsdvBm/x0cViwaIPOCKVmTIgvRNXw/sX0yNq9UeEymGx9L1tA1YHu3pozCqbCL8NvrCH9A7q9pEanhn2b/PgI78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733733573; c=relaxed/simple;
	bh=GeZXboRnWhIOwdi9DSnBeSIncxHIAEx5m2LDDRYaZBg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=j4hLEozn19sKoURbG+NTxknY0/WrMxi1bgx0md+7eFL/yVMt1eC6/8GTg6d6Fc5EVU1JYCQy6aEm3zCh7chFTsuMSrKarcDOni0m3VZZiUV1n2/mGszLz6m0EBHiZGM0ynLeL+tLShZnen/2Aqxb/7RKAORJJnjv0uRaCUPGfHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YwSSM81x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aA3Wa33Y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YwSSM81x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aA3Wa33Y; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YwSSM81x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aA3Wa33Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YwSSM81x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aA3Wa33Y"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 320F51F7C5;
	Mon,  9 Dec 2024 08:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733733570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BW2NWS/1dmZUsbhZ0Zbcy9G6SQj9gmDQvCtsEfMWlFI=;
	b=YwSSM81x9LaQMW+JuvoFdbXZrA215Uv+2rDH8M2fjRc3djKTLY/VX1JfB+rJtwKx0mgpnJ
	D+oZ7+9jMbcMiWP3xQrN2/iWEiNm4gZ/+YM6evUg0XeTPXhysA9zj7HvSnRDv1kqdJGnjE
	Cj1ahSfrSz3FnHaEdNTI4kwSTgXyVJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733733570;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BW2NWS/1dmZUsbhZ0Zbcy9G6SQj9gmDQvCtsEfMWlFI=;
	b=aA3Wa33Y/GJEvzmymRuQh+4enEH3NyjkAX0icbatyFM7Fbd4ekegVREAJgX6ah5MOEUjB3
	pXNZxRlrZq1IrJBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733733570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BW2NWS/1dmZUsbhZ0Zbcy9G6SQj9gmDQvCtsEfMWlFI=;
	b=YwSSM81x9LaQMW+JuvoFdbXZrA215Uv+2rDH8M2fjRc3djKTLY/VX1JfB+rJtwKx0mgpnJ
	D+oZ7+9jMbcMiWP3xQrN2/iWEiNm4gZ/+YM6evUg0XeTPXhysA9zj7HvSnRDv1kqdJGnjE
	Cj1ahSfrSz3FnHaEdNTI4kwSTgXyVJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733733570;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BW2NWS/1dmZUsbhZ0Zbcy9G6SQj9gmDQvCtsEfMWlFI=;
	b=aA3Wa33Y/GJEvzmymRuQh+4enEH3NyjkAX0icbatyFM7Fbd4ekegVREAJgX6ah5MOEUjB3
	pXNZxRlrZq1IrJBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13387138A5;
	Mon,  9 Dec 2024 08:39:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hq5cA8KsVmcEEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Dec 2024 08:39:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: control: Avoid WARN() for symlink errors
Date: Mon,  9 Dec 2024 09:39:25 +0100
Message-ID: <20241209083928.30941-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Using WARN() for showing the error of symlink creations don't give
more information than telling that something goes wrong, since the
usual code path is a lregister callback from each control element
creation.  More badly, the use of WARN() rather confuses fuzzer as if
it were serious issues.

This patch downgrades the warning messages to use the normal pr_warn()
instead of WARN().  For making it clearer, add the function name to
the prefix, too.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Reported-by: syzbot+4e7919b09c67ffd198ae@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/675664c7.050a0220.a30f1.018c.GAE@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control_led.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 65a1ebe87776..ab04edf7e9aa 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -668,10 +668,14 @@ static void snd_ctl_led_sysfs_add(struct snd_card *card)
 			goto cerr;
 		led->cards[card->number] = led_card;
 		snprintf(link_name, sizeof(link_name), "led-%s", led->name);
-		WARN(sysfs_create_link(&card->ctl_dev->kobj, &led_card->dev.kobj, link_name),
-			"can't create symlink to controlC%i device\n", card->number);
-		WARN(sysfs_create_link(&led_card->dev.kobj, &card->card_dev.kobj, "card"),
-			"can't create symlink to card%i\n", card->number);
+		if (sysfs_create_link(&card->ctl_dev->kobj, &led_card->dev.kobj,
+				      link_name))
+			pr_warn("%s: can't create symlink to controlC%i device\n",
+				__func__, card->number);
+		if (sysfs_create_link(&led_card->dev.kobj, &card->card_dev.kobj,
+				      "card"))
+			pr_warn("%s: can't create symlink to card%i\n",
+				__func__, card->number);
 
 		continue;
 cerr:
-- 
2.43.0

