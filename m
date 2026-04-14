Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1E3E63AC
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172963; cv=none; b=YtQ7pI+BMzdFh4Y1bK3Sam2jDyzE4dFJmB6kwscnAsTH10T9/UvDsDAZBNxnPLm4+65buYRM6haldysLhTtvqjpFgMwsLy9XjRdiOabAzVLPgWyvDHTst5eAO8WVRN/MEFiK10IYpQjpGIsVkTwK16nfpMTdBTsQta6DZAPMjnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172963; c=relaxed/simple;
	bh=iD/DJwtHuASDCqXeqZXAU79dKE3zqbvGxW/fFPHUv9k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RpyGk9Y8cqWAiVC52eGsj0WWXpXmNbpfAtKxBelu8WCjvyT+frjBt+FK2ZsWohJxZnUZfYXPLy5+iKh3gggNlcp5j7g1i7tr6oa/ZLwX8GTbpdQUMpNlqpQQw5mQdVW+/souIF64ON3Fg+PRBUfURE1SGu8zV4RVdshdo1Sd7Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g+QIsZUd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZGq0GuRA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g+QIsZUd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZGq0GuRA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g+QIsZUd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZGq0GuRA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g+QIsZUd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZGq0GuRA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C73A6A944;
	Tue, 14 Apr 2026 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776172941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hc/i/W6FMM8nSyU00T8m7OmDBE/JkD5rIsNPHhe/w+E=;
	b=g+QIsZUdcCxlx04/FBzMVX8ZBHsvMgJtOVX88x3Xd5x8A7SxIVDO9np29vbSL7zwadhsJR
	BsvGYuuEYbaBZCUdmwsZY7dVG7NZCyYFZhPYSuSPL3aN59h4lcVXtdW7Bvl/B9EAdBLd0t
	wvS3F7ty57dsvLba+K5xgwAtWxwhfAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776172941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hc/i/W6FMM8nSyU00T8m7OmDBE/JkD5rIsNPHhe/w+E=;
	b=ZGq0GuRA7Kg2/7W2ce0Kk2Gf4g32Oj97/LS1vKENcFxTclBBApafRulb3OJPvQbIDdVqqQ
	cldVwdh8MwwvkLAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776172941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hc/i/W6FMM8nSyU00T8m7OmDBE/JkD5rIsNPHhe/w+E=;
	b=g+QIsZUdcCxlx04/FBzMVX8ZBHsvMgJtOVX88x3Xd5x8A7SxIVDO9np29vbSL7zwadhsJR
	BsvGYuuEYbaBZCUdmwsZY7dVG7NZCyYFZhPYSuSPL3aN59h4lcVXtdW7Bvl/B9EAdBLd0t
	wvS3F7ty57dsvLba+K5xgwAtWxwhfAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776172941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hc/i/W6FMM8nSyU00T8m7OmDBE/JkD5rIsNPHhe/w+E=;
	b=ZGq0GuRA7Kg2/7W2ce0Kk2Gf4g32Oj97/LS1vKENcFxTclBBApafRulb3OJPvQbIDdVqqQ
	cldVwdh8MwwvkLAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F24D4B478;
	Tue, 14 Apr 2026 13:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id INjKGY0/3mnbOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 13:22:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/4] ALSA: 6fire: Reduce multi-level conditionals in usb6fire_chip_disconnect()
Date: Tue, 14 Apr 2026 15:22:13 +0200
Message-ID: <20260414132218.411013-4-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spam-Level: 
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

The current code has deep indentation levels because of multiple if's.
Make it returning and reduce the multi-level conditionals for
increasing the code readability.

No functional change, just but a code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/chip.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/sound/usb/6fire/chip.c b/sound/usb/6fire/chip.c
index dd787de986b1..556882bd9022 100644
--- a/sound/usb/6fire/chip.c
+++ b/sound/usb/6fire/chip.c
@@ -165,26 +165,29 @@ static void usb6fire_chip_disconnect(struct usb_interface *intf)
 
 	guard(mutex)(&register_mutex);
 	chip = usb_get_intfdata(intf);
-	if (chip) { /* if !chip, fw upload has been performed */
-		chip->intf_count--;
-		if (!chip->intf_count) {
-			chips[chip->regidx] = NULL;
+	/* if !chip, fw upload has been performed */
+	if (!chip)
+		return;
 
-			/*
-			 * Save card pointer before teardown.
-			 * snd_card_free_when_closed() may free card (and
-			 * the embedded chip) immediately, so it must be
-			 * called last and chip must not be accessed after.
-			 */
-			card = chip->card;
-			chip->shutdown = true;
-			if (card)
-				snd_card_disconnect(card);
-			usb6fire_chip_abort(chip);
-			if (card)
-				snd_card_free_when_closed(card);
-		}
-	}
+	chip->intf_count--;
+	if (chip->intf_count)
+		return;
+
+	chips[chip->regidx] = NULL;
+
+	/*
+	 * Save card pointer before teardown.
+	 * snd_card_free_when_closed() may free card (and
+	 * the embedded chip) immediately, so it must be
+	 * called last and chip must not be accessed after.
+	 */
+	card = chip->card;
+	chip->shutdown = true;
+	if (card)
+		snd_card_disconnect(card);
+	usb6fire_chip_abort(chip);
+	if (card)
+		snd_card_free_when_closed(card);
 }
 
 static const struct usb_device_id device_table[] = {
-- 
2.53.0

