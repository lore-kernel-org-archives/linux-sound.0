Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E164B2165E7
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738181; cv=none; b=L/XLQoSptC951VAqBH7MsQAugZmZrz9Nb3ajan7o4pTQxiJGokZQnIzkfQtnGOBNstFGni+pTLNxE+aoXdxw9Bf8Esd5AhyVqNvY3HbwvYGQ0ET0jtROVHAJCCj9dLUAG3QOV5P0u8tePJZJm//xaGpt/C3yfgBcxR3hdUs0Gso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738181; c=relaxed/simple;
	bh=URjoTf02L0zEjKyodJiwEC5RCggY9epwmUY7vLlw4ho=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=I1m0cuT8P7SGkD2Ca8YICzmpTh8trTiogwnaHL8DS6sNCGaWlxULKwLcQac9mA8z6Gf7Otl+W1AOxA05r2ALrtp6I6hx9v0cHr5/AhxJaZl7Z+b30dmI+5kHaeQluF32aBRSZ++zImhILeeJMAajFP/W3YT4ulnuWe0VuA9W2Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SFnx85ra; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JDwZyUPq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SFnx85ra; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JDwZyUPq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SFnx85ra";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JDwZyUPq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SFnx85ra";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JDwZyUPq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 141991F45F;
	Mon,  9 Dec 2024 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733738178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LCaEluGX4YG2NuLCTB6eS3A/4v42E+0vH+45O6OUltI=;
	b=SFnx85raPZqO89/WCBuyDPTv/aH0whjIsznNLO4D5JzfeK5UVsGvYCLRUCSVCN445odFWN
	sL56VySYs0XjzoZ62SLtY520cbVb+VOD+IGpGZgd/B6XWBpzoYqQuiR4G8LUsK9T7Q/sXP
	+YN0EpI5+r/jYaKYZVeawGLaVtnHNQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733738178;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LCaEluGX4YG2NuLCTB6eS3A/4v42E+0vH+45O6OUltI=;
	b=JDwZyUPqhoAA2CjqiW7N52c5XHyU+NXm3uydhaL376oC1dKHaRmS+MXyaLa6JUPYFZxf92
	o8Ve/SiDTnZ6bLAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733738178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LCaEluGX4YG2NuLCTB6eS3A/4v42E+0vH+45O6OUltI=;
	b=SFnx85raPZqO89/WCBuyDPTv/aH0whjIsznNLO4D5JzfeK5UVsGvYCLRUCSVCN445odFWN
	sL56VySYs0XjzoZ62SLtY520cbVb+VOD+IGpGZgd/B6XWBpzoYqQuiR4G8LUsK9T7Q/sXP
	+YN0EpI5+r/jYaKYZVeawGLaVtnHNQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733738178;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LCaEluGX4YG2NuLCTB6eS3A/4v42E+0vH+45O6OUltI=;
	b=JDwZyUPqhoAA2CjqiW7N52c5XHyU+NXm3uydhaL376oC1dKHaRmS+MXyaLa6JUPYFZxf92
	o8Ve/SiDTnZ6bLAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEE16138D2;
	Mon,  9 Dec 2024 09:56:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2SXfOMG+VmfoKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Dec 2024 09:56:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: control: Avoid WARN() for symlink errors
Date: Mon,  9 Dec 2024 10:56:12 +0100
Message-ID: <20241209095614.4273-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Using WARN() for showing the error of symlink creations don't give
more information than telling that something goes wrong, since the
usual code path is a lregister callback from each control element
creation.  More badly, the use of WARN() rather confuses fuzzer as if
it were serious issues.

This patch downgrades the warning messages to use the normal dev_err()
instead of WARN().  For making it clearer, add the function name to
the prefix, too.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Reported-by: syzbot+4e7919b09c67ffd198ae@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/675664c7.050a0220.a30f1.018c.GAE@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Use dev_err() with the card object instead of pr_warn()

 sound/core/control_led.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 65a1ebe87776..e33dfcf863cf 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -668,10 +668,16 @@ static void snd_ctl_led_sysfs_add(struct snd_card *card)
 			goto cerr;
 		led->cards[card->number] = led_card;
 		snprintf(link_name, sizeof(link_name), "led-%s", led->name);
-		WARN(sysfs_create_link(&card->ctl_dev->kobj, &led_card->dev.kobj, link_name),
-			"can't create symlink to controlC%i device\n", card->number);
-		WARN(sysfs_create_link(&led_card->dev.kobj, &card->card_dev.kobj, "card"),
-			"can't create symlink to card%i\n", card->number);
+		if (sysfs_create_link(&card->ctl_dev->kobj, &led_card->dev.kobj,
+				      link_name))
+			dev_err(card->dev,
+				"%s: can't create symlink to controlC%i device\n",
+				 __func__, card->number);
+		if (sysfs_create_link(&led_card->dev.kobj, &card->card_dev.kobj,
+				      "card"))
+			dev_err(card->dev,
+				"%s: can't create symlink to card%i\n",
+				__func__, card->number);
 
 		continue;
 cerr:
-- 
2.43.0

