Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30E63E63AC
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172957; cv=none; b=S8Wahrm7bqjg7sXSuijny6RaNnI9Xc0Cb9B5AHL+QO3pyG3SpoBlSrxocZ0/tryfP7okzOhx/kVlVYKakYqWU785yqz1ImHAOV6WGFL5ttwvov0wzk627kkZ6PuzycJ32cwlBLw9fGJSnlb615Etmd6flnMpQYDa6DpZUgfPds8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172957; c=relaxed/simple;
	bh=+SlYM3b0C44SUm+04ubTOrvHQVGP+jkqWLRiWAf23ow=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBfj7Hl9p1RvQxZ0R0WlJpYOAh0jKxtwT+gx3uhM5K4mrkbW3raGY/aYK2Aij6cQ3Nmt59WxzmZ0lqwBkvmTI73Nnwab3vSi1y4Kx+G1tmi9eLiqPwlZj4oV7k8mWe6wSSUxrz0U+fGw9Dd0etRHtsJxDP861tMCAk82LYEs4SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iQLpb04K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KuZfln1M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iQLpb04K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KuZfln1M; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iQLpb04K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KuZfln1M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iQLpb04K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KuZfln1M"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 67B606A942;
	Tue, 14 Apr 2026 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776172941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrg+E1++g4BNq4qHvAUxB9iDOZFWsyv0OH4zFCNmEHU=;
	b=iQLpb04K79xXzh14jRRxllDtHIIau2hepif5YAhukhFOGu9Wgt4/IOY8zctvm7BV36Qj9w
	+HW3ROyXb4O5Dny34EhcSnAHIrYdpuSxE0vbYaex+cAQfjtTOyxgJPsSwHGb0EQg6bED01
	qotsUFcfPBUuZddCZAEr/B1BVo0S+DA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776172941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrg+E1++g4BNq4qHvAUxB9iDOZFWsyv0OH4zFCNmEHU=;
	b=KuZfln1MiIF0D8rvWpTNkITtexn11B14Z+xFAbF2j36/OTmBBSSV+zBP+y7hbNzXKxUT0N
	PcQHo8CGaN3R0KCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776172941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrg+E1++g4BNq4qHvAUxB9iDOZFWsyv0OH4zFCNmEHU=;
	b=iQLpb04K79xXzh14jRRxllDtHIIau2hepif5YAhukhFOGu9Wgt4/IOY8zctvm7BV36Qj9w
	+HW3ROyXb4O5Dny34EhcSnAHIrYdpuSxE0vbYaex+cAQfjtTOyxgJPsSwHGb0EQg6bED01
	qotsUFcfPBUuZddCZAEr/B1BVo0S+DA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776172941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrg+E1++g4BNq4qHvAUxB9iDOZFWsyv0OH4zFCNmEHU=;
	b=KuZfln1MiIF0D8rvWpTNkITtexn11B14Z+xFAbF2j36/OTmBBSSV+zBP+y7hbNzXKxUT0N
	PcQHo8CGaN3R0KCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E3294B476;
	Tue, 14 Apr 2026 13:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KErMEY0/3mnbOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 13:22:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/4] ALSA: 6fire: Fix leftover global pointers after probe failures
Date: Tue, 14 Apr 2026 15:22:12 +0200
Message-ID: <20260414132218.411013-3-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414132218.411013-1-tiwai@suse.de>
References: <20260414132218.411013-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

snd-usb-6fire driver holds devices[] and chips[] pointer arrays to
keep the usb_device and sfire_chip objects assigned to multiple
interfaces.  Those are, however, not properly cleared at the error
path of usb6fire_chip_probe(), which may confuse the later probes.
Also, the use of two pointer arrays makes things complicated; chips[]
may be NULL while devices[] may be left over.

For addressing this inconsistency, unify the pointer arrays, and use
only chips[] for managing the multiple devices, while the device is
checked with chip->dev pointer, instead.  Also, the assignment of
chips[] is moved at a later point where the probe successfully
returns, so that we don't leave the pointer there after the error.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/chip.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/usb/6fire/chip.c b/sound/usb/6fire/chip.c
index 18a25449bcd3..dd787de986b1 100644
--- a/sound/usb/6fire/chip.c
+++ b/sound/usb/6fire/chip.c
@@ -31,7 +31,6 @@ static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX; /* Index 0-max */
 static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR; /* Id for card */
 static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP; /* Enable card */
 static struct sfire_chip *chips[SNDRV_CARDS] = SNDRV_DEFAULT_PTR;
-static struct usb_device *devices[SNDRV_CARDS] = SNDRV_DEFAULT_PTR;
 
 module_param_array(index, int, NULL, 0444);
 MODULE_PARM_DESC(index, "Index value for the 6fire sound device");
@@ -85,19 +84,17 @@ static int usb6fire_chip_probe(struct usb_interface *intf,
 	/* look if we already serve this card and return if so */
 	guard(mutex)(&register_mutex);
 	for (i = 0; i < SNDRV_CARDS; i++) {
-		if (devices[i] == device) {
-			if (chips[i])
-				chips[i]->intf_count++;
+		if (chips[i] && chips[i]->dev == device) {
+			chips[i]->intf_count++;
 			usb_set_intfdata(intf, chips[i]);
 			return 0;
-		} else if (!devices[i] && regidx < 0)
+		} else if (!chips[i] && regidx < 0)
 			regidx = i;
 	}
 	if (regidx < 0) {
 		dev_err(&intf->dev, "too many cards registered.\n");
 		return -ENODEV;
 	}
-	devices[regidx] = device;
 
 	/* check, if firmware is present on device, upload it if not */
 	ret = usb6fire_fw_init(intf);
@@ -123,7 +120,6 @@ static int usb6fire_chip_probe(struct usb_interface *intf,
 			device->bus->busnum, device->devnum);
 
 	chip = card->private_data;
-	chips[regidx] = chip;
 	chip->dev = device;
 	chip->regidx = regidx;
 	chip->intf_count = 1;
@@ -151,7 +147,10 @@ static int usb6fire_chip_probe(struct usb_interface *intf,
 		dev_err(&intf->dev, "cannot register card.");
 		goto destroy_chip;
 	}
+
 	usb_set_intfdata(intf, chip);
+	chips[regidx] = chip;
+
 	return 0;
 
 destroy_chip:
@@ -169,7 +168,6 @@ static void usb6fire_chip_disconnect(struct usb_interface *intf)
 	if (chip) { /* if !chip, fw upload has been performed */
 		chip->intf_count--;
 		if (!chip->intf_count) {
-			devices[chip->regidx] = NULL;
 			chips[chip->regidx] = NULL;
 
 			/*
-- 
2.53.0

