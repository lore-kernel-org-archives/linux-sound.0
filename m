Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D231A55C
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280667; cv=none; b=f2C6bWr3DDHAbgwCRVX+E978IEg3obyWXPBoFKruomehZmJPdtmxnHySLwixD235+yAClvRxJArXojOtDkf1MjvwZ3KR998S9Q7QtcutOF9cQ+enO8ijG/r63L4A6d18VXnIX0O3dOqtIHeOPawn30ON3iAMsxdRL3FGYF0tJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280667; c=relaxed/simple;
	bh=CFyGA65dIj1hu1CQmjlsAZKoQN3za4EBuYtp0htbTHM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fCNfyNrIcpAYavO7cBbhklTy0Q++k45nzcStMVHJtVZUoYlwlBGduBUl/E2iigiVPpX9i1lWJIISVvWgU0kggKWYaw512EZh+oX09cEzdAKnWNU6P8EPlYRlGrxLdDpFZIenhZYzqVBDO4+sjqKXS9a0gpIGcMyB/ufgkZ+jXUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tLTOl+on; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P2mVsfVm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tLTOl+on; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P2mVsfVm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tLTOl+on";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P2mVsfVm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tLTOl+on";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P2mVsfVm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 081C6223E5;
	Wed, 27 Aug 2025 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FOEeoiKhJX/aYHRKM/nBxNFwHz3BhaU0lboy14qwf4=;
	b=tLTOl+onlrmTbRqVGEBHKQqkH87Zo0LK6LL1XFXx2Ei37SCxWzBi3qHdSWxkjqyKbbqDKm
	Hr+4ExUv5Mn9Wm2GCUHNdtXyH7uUvqQRMRVKN/KbQYV5h2u8cQP3CReSsna+lllhAkC9Gp
	r+nS7m3IbLDaBdh3pR9Ri1se38IyvhQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FOEeoiKhJX/aYHRKM/nBxNFwHz3BhaU0lboy14qwf4=;
	b=P2mVsfVmSp0tS75HsxpdifvD+1fHTKu1StmZj9miG/lBCdIzCDlv8z3ed5inC4ozCW/UC6
	2vG59lcjXWYCHNBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tLTOl+on;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=P2mVsfVm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FOEeoiKhJX/aYHRKM/nBxNFwHz3BhaU0lboy14qwf4=;
	b=tLTOl+onlrmTbRqVGEBHKQqkH87Zo0LK6LL1XFXx2Ei37SCxWzBi3qHdSWxkjqyKbbqDKm
	Hr+4ExUv5Mn9Wm2GCUHNdtXyH7uUvqQRMRVKN/KbQYV5h2u8cQP3CReSsna+lllhAkC9Gp
	r+nS7m3IbLDaBdh3pR9Ri1se38IyvhQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FOEeoiKhJX/aYHRKM/nBxNFwHz3BhaU0lboy14qwf4=;
	b=P2mVsfVmSp0tS75HsxpdifvD+1fHTKu1StmZj9miG/lBCdIzCDlv8z3ed5inC4ozCW/UC6
	2vG59lcjXWYCHNBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E304F13867;
	Wed, 27 Aug 2025 07:29:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SH4cNtGzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 18/25] ALSA: hda/intel: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 09:28:58 +0200
Message-ID: <20250827072916.31933-19-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 081C6223E5
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 1bb3ff55b115..1e13678428d2 100644
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

