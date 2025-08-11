Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A301EB5C2
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906963; cv=none; b=kUMNgIDLGDmWzik7+FiGY7ggOP4gOyvdw2+ShkmFVtsqroU3rpN0H/4rRt2YEM97V3w0dShAmVvQxnK3M/eX+gBXV1USJSYj1MvnmRDeWH54I1zpI0ICL4wqyLG1xM4kDxsfm6PvPZG9hhCgE9PNMHZtGJcC0f56xcIavTkONkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906963; c=relaxed/simple;
	bh=57XvMyryxtVaeEb0aIX19TDcrSR+ZVvZx8f9sPi/tWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X0xUqpQUo/K/K412hvVDUqXRpbl7tD0tytLy08BhrpDNkE89UMV8eI8o9bJIC9/pB14pStwdKRXIeOxH2l8TxOfOrLN5vxGXGy+mu3Sbg/tub8K2wd6bxe/oyQbACDyHg9nEVT5AxbXmDKOXaGXITFiAqEKRR9jnLVMXFWiE1ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mYbrbe47; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X1AEDNT8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mYbrbe47; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X1AEDNT8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mYbrbe47";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X1AEDNT8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mYbrbe47";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X1AEDNT8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 69C405BE3E;
	Mon, 11 Aug 2025 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExlxRgpcE9XdFkr+FdBV1ZqVFFJIR/YJbyap2w7R6R4=;
	b=mYbrbe47dOUOZlCxD0palCvsw7TTvMo6+DP7fQR2F0diNZHDn97lPVqAMGh4qYlw4Fznvc
	DTAQlQ9vgX9viHc0Wb4i7HS4dTXDYHFGvZfLkh+qv2vTFY29hFZFLh48ZK3g+H78+tuXz/
	KkosysooixpAU8D9iASQ2YK47mo3h3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExlxRgpcE9XdFkr+FdBV1ZqVFFJIR/YJbyap2w7R6R4=;
	b=X1AEDNT8PVsq3Z83H1iKmbpCrd/DaV8wAmuzn6f2xnq7L4/hoXkODwQVU91G7WvYNSEU5H
	7TNMJQfdrNbcJ5Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mYbrbe47;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=X1AEDNT8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExlxRgpcE9XdFkr+FdBV1ZqVFFJIR/YJbyap2w7R6R4=;
	b=mYbrbe47dOUOZlCxD0palCvsw7TTvMo6+DP7fQR2F0diNZHDn97lPVqAMGh4qYlw4Fznvc
	DTAQlQ9vgX9viHc0Wb4i7HS4dTXDYHFGvZfLkh+qv2vTFY29hFZFLh48ZK3g+H78+tuXz/
	KkosysooixpAU8D9iASQ2YK47mo3h3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExlxRgpcE9XdFkr+FdBV1ZqVFFJIR/YJbyap2w7R6R4=;
	b=X1AEDNT8PVsq3Z83H1iKmbpCrd/DaV8wAmuzn6f2xnq7L4/hoXkODwQVU91G7WvYNSEU5H
	7TNMJQfdrNbcJ5Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3494A13479;
	Mon, 11 Aug 2025 10:08:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CPOyCxHBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 18/25] ALSA: hda/intel: Use guard() for mutex locks
Date: Mon, 11 Aug 2025 12:07:52 +0200
Message-ID: <20250811100807.7962-19-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 69C405BE3E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_RATELIMIT(0.00)[to_ip_from(RLs9qncch5cpanyka9neihc978)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index fcf67e97a546..37918363b8bc 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -915,17 +915,17 @@ static void azx_shutdown_chip(struct azx *chip)
 static void azx_add_card_list(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
-	mutex_lock(&card_list_lock);
+
+	guard(mutex)(&card_list_lock);
 	list_add(&hda->list, &card_list);
-	mutex_unlock(&card_list_lock);
 }
 
 static void azx_del_card_list(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
-	mutex_lock(&card_list_lock);
+
+	guard(mutex)(&card_list_lock);
 	list_del_init(&hda->list);
-	mutex_unlock(&card_list_lock);
 }
 
 /* trigger power-save check at writing parameter */
@@ -942,7 +942,7 @@ static int __maybe_unused param_set_xint(const char *val, const struct kernel_pa
 	if (pm_blacklist > 0)
 		return 0;
 
-	mutex_lock(&card_list_lock);
+	guard(mutex)(&card_list_lock);
 	list_for_each_entry(hda, &card_list, list) {
 		chip = &hda->chip;
 		if (!hda->probe_continued || chip->disabled ||
@@ -950,7 +950,6 @@ static int __maybe_unused param_set_xint(const char *val, const struct kernel_pa
 			continue;
 		snd_hda_set_power_save(&chip->bus, power_save * 1000);
 	}
-	mutex_unlock(&card_list_lock);
 	return 0;
 }
 
-- 
2.50.1

