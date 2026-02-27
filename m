Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B049329375
	for <linux-sound@vger.kernel.org>; Fri, 27 Feb 2026 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207832; cv=none; b=ce4HZ2c6/rfFi9NQ+qfH1eZxy8+f8P/Xg+Ovq9d2qHtgtb4oJxGyA2RHlMTY2hl3bwtlgFrCVgaHp+F5SisSSSAjQwCxgZZgQV39Iy8USwnl2pkjyaHqeRvpGvAMLxJ2+EIyrLs13ZDwmE1+QXdes92g7qHYCBfTT4SPNoL6KCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207832; c=relaxed/simple;
	bh=5xc6UfOWJTBu4O/NXVsNVHxbOpXwik0UvJO+cgyLFqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UsK3RSqD897MMTx+hzkf+WCS/62IbDHZouDTc84VL1QzkHYbCfKlasModzqJJ5GUDpP+mobQZFb8PX1LmLJcdmWqlc31TWsElTO4oYgbJERQzrLMFJh858+WCAJFgS7S5D73az2xEvRxEnVUAxRaeT/umNuXxLVWyhDEbictPqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LbjpAwll; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lDD0CLiY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LbjpAwll; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lDD0CLiY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LbjpAwll";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lDD0CLiY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LbjpAwll";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lDD0CLiY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B8CBC4DEF0;
	Fri, 27 Feb 2026 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772207826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=seF+skIhQjcT0DJwzpAVgl5lc2iPtKKZ3XgsWoU5S6Q=;
	b=LbjpAwllIg2xPBefQ33KLqnaO5HpXtGVWERsIiSXjJAyXedEGRcZphad+PtH7ezq2wSOxi
	aGYHzwOfDLDgu5nZFXBrWzuf2U0eDsXhNammuBDJxGFZHvKNYVr+8/hOMGA4IFLqInvwG2
	koG7kHu7EJQAmy6f6kc8fuAWJzdd7no=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772207826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=seF+skIhQjcT0DJwzpAVgl5lc2iPtKKZ3XgsWoU5S6Q=;
	b=lDD0CLiYBU/nL2Adhq74yIAW4ytOjCkKXV70hCy7TUffCYlFSCw5rMHyDoCcG9cy51w+7v
	elFb0+gkTqWnyLDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772207826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=seF+skIhQjcT0DJwzpAVgl5lc2iPtKKZ3XgsWoU5S6Q=;
	b=LbjpAwllIg2xPBefQ33KLqnaO5HpXtGVWERsIiSXjJAyXedEGRcZphad+PtH7ezq2wSOxi
	aGYHzwOfDLDgu5nZFXBrWzuf2U0eDsXhNammuBDJxGFZHvKNYVr+8/hOMGA4IFLqInvwG2
	koG7kHu7EJQAmy6f6kc8fuAWJzdd7no=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772207826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=seF+skIhQjcT0DJwzpAVgl5lc2iPtKKZ3XgsWoU5S6Q=;
	b=lDD0CLiYBU/nL2Adhq74yIAW4ytOjCkKXV70hCy7TUffCYlFSCw5rMHyDoCcG9cy51w+7v
	elFb0+gkTqWnyLDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90EED3EA69;
	Fri, 27 Feb 2026 15:57:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xkYOItK+oWm0RgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Feb 2026 15:57:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH] ALSA: firewire: dice: Fix printf warning with W=1
Date: Fri, 27 Feb 2026 16:57:00 +0100
Message-ID: <20260227155705.1557224-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

The use of snprintf() may cause a warning with W=1 due to the possibly
truncated string.  As the truncation doesn't really matter (and won't
happen practically) in the case of dice driver, just shut it up by
replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/dice/dice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index 85d265c7d544..f7a50bae4b55 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -122,7 +122,7 @@ static void dice_card_strings(struct snd_dice *dice)
 	fw_csr_string(dev->config_rom + 5, CSR_VENDOR, vendor, sizeof(vendor));
 	strscpy(model, "?");
 	fw_csr_string(dice->unit->directory, CSR_MODEL, model, sizeof(model));
-	snprintf(card->longname, sizeof(card->longname),
+	scnprintf(card->longname, sizeof(card->longname),
 		 "%s %s (serial %u) at %s, S%d",
 		 vendor, model, dev->config_rom[4] & 0x3fffff,
 		 dev_name(&dice->unit->device), 100 << dev->max_speed);
-- 
2.53.0

