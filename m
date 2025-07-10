Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD2F2D59F8
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142119; cv=none; b=SFV+hspQSfaoFmBMHp/aW1/67wNmfbulqYIN+1FqwxxeBnRfEM8boAnkYkow8nuvWA5np6udG3e9X6LVN4HAtE1QkHlbK/p8JfOGHCMLdn5b9ZiWfh7e0z641tkeqq9ULJ0WW+s7LIrrbWA5ntG/1rnCofXcZPIBzCWApfaqAg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142119; c=relaxed/simple;
	bh=WUOfIZVf5UgGNRzXwNZesah+T5NyvaoXvNpKyKTd9Gw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5wQfm7mrbJ2HAq8SlJMJrVR2izoFPza9FozgMIqSe9jj9AyWLLfgLdcshLipnpcgijbIZ69qYCFb2T+ThdgZ7fETCcmpXvWa5guzOBmfq25BgdFhp983povFX/3ub8src+2QPd6ae5OT3FVeG9IQcY90dfcLj96Ro0fnTPkl2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a0h1L2d/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+EsTZlVW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a0h1L2d/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+EsTZlVW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a0h1L2d/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+EsTZlVW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a0h1L2d/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+EsTZlVW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 672A81F458;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7u22+6nMFMyyb/ljgyLdwxH7ou9s8tLMcpFj8p1QWU=;
	b=a0h1L2d//wfNEskE3vzNbbsR2VlKGpVnIFYfY8ofHvTMfbl3/bhi/M5yXMO0Fd/O+WcWR2
	XGKoF5w9h8AfCF8yX2giKclnG6HEHpQxuDdxJQe3gFP7Zekkhkp3U2JmtImlQA45JuMy/F
	NA/hQuMdR9IJo+HkX5IuymrctlYsYE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7u22+6nMFMyyb/ljgyLdwxH7ou9s8tLMcpFj8p1QWU=;
	b=+EsTZlVWc0g91inIDWmPxDdy18+WZ072H+PII3vXDRDZQ+EjYPfwdJ7nQvsHNSi6qcS1HY
	gFvhSIeZVXM0WRDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="a0h1L2d/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+EsTZlVW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7u22+6nMFMyyb/ljgyLdwxH7ou9s8tLMcpFj8p1QWU=;
	b=a0h1L2d//wfNEskE3vzNbbsR2VlKGpVnIFYfY8ofHvTMfbl3/bhi/M5yXMO0Fd/O+WcWR2
	XGKoF5w9h8AfCF8yX2giKclnG6HEHpQxuDdxJQe3gFP7Zekkhkp3U2JmtImlQA45JuMy/F
	NA/hQuMdR9IJo+HkX5IuymrctlYsYE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7u22+6nMFMyyb/ljgyLdwxH7ou9s8tLMcpFj8p1QWU=;
	b=+EsTZlVWc0g91inIDWmPxDdy18+WZ072H+PII3vXDRDZQ+EjYPfwdJ7nQvsHNSi6qcS1HY
	gFvhSIeZVXM0WRDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E0A513A70;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MEqwEeyQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 027/103] ALSA: cs423x: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:09 +0200
Message-ID: <20250710100727.22653-28-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 672A81F458
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cs423x/cs4236.c     | 2 +-
 sound/isa/cs423x/cs4236_lib.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
index ad20bb2649bd..e36cc147651a 100644
--- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -510,7 +510,7 @@ static int snd_cs423x_pnpbios_detect(struct pnp_dev *pdev,
 		return -ENODEV;
 
 	/* prepare second id */
-	strcpy(cid, pdev->id[0].id);
+	strscpy(cid, pdev->id[0].id);
 	cid[5] = '1';
 	cdev = NULL;
 	list_for_each_entry(iter, &(pdev->protocol->devices), protocol_list) {
diff --git a/sound/isa/cs423x/cs4236_lib.c b/sound/isa/cs423x/cs4236_lib.c
index 1a03cff6915b..eaaf39aae526 100644
--- a/sound/isa/cs423x/cs4236_lib.c
+++ b/sound/isa/cs423x/cs4236_lib.c
@@ -1023,7 +1023,7 @@ int snd_cs4236_mixer(struct snd_wss *chip)
 	if (snd_BUG_ON(!chip || !chip->card))
 		return -EINVAL;
 	card = chip->card;
-	strcpy(card->mixername, snd_wss_chip_id(chip));
+	strscpy(card->mixername, snd_wss_chip_id(chip));
 
 	if (chip->hardware == WSS_HW_CS4235 ||
 	    chip->hardware == WSS_HW_CS4239) {
-- 
2.50.0

