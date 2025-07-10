Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7ED2D59EA
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142089; cv=none; b=CemhFhSM+IcMcupOoNe142OzgbclPWkODVLB+BeSXbpJmmbX9CFnZcP2tTxdT4SSS00fDy9esbylPTmH5VwmGUSN7wx1SdtNH0hdTdBG4fPS80HaD86/9QueQeOsndtKwoOl4CMf+/9wqCvqF2CEiAoSzdVYo+4oxUBjhufm8kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142089; c=relaxed/simple;
	bh=1Q3kwR8Hm3NP/tNuTG2c2jXno8Iucr5tWHKCwGHo1bs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y75GE+pPc4HrCtSlqtVCbZ2pkUrKfzjuGileYViImd47Rp2gU+14vh+KRq2URxOmy1kG+VEkjjI7tE20ovZvueQS59+pbNlSBFkBuwexf76y814Ow39/BWgPFW0YDlSkBZq4ICIQSlrbwPnUwTwwhMN6N3O92U6DTTmE7V0PGXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eDg23PZ2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KHnHwBZz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Eim6Zxst; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YWXvamoC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eDg23PZ2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KHnHwBZz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Eim6Zxst";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YWXvamoC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F32671F453;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d7XIrR/L/+yngYTCUBAbhKKw6WESO6CcCujA6BgFnE=;
	b=eDg23PZ2BPHIfe0E2/9ZZg7y60OJqchsY8GaflGO9a4wJ5JyuZIaovPmuVgHFBSjRKfJq8
	WoI0vaabtMQ85Qpq+oc3OR/T3bwTyyo023OUa9bywyGr5SNk/yJA5u+VSmc/5ymaaJE9J2
	WyQqBHBROgbfo6ZS+KD38T8kiiKykp8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d7XIrR/L/+yngYTCUBAbhKKw6WESO6CcCujA6BgFnE=;
	b=KHnHwBZzR4f9Ru9kDdh11O4ErwT7PbYcl9Eqq3wQR1502qrLXQUYvp1Cw134zWli6kgL1Y
	5CmHBFGEwN+u63AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Eim6Zxst;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YWXvamoC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d7XIrR/L/+yngYTCUBAbhKKw6WESO6CcCujA6BgFnE=;
	b=Eim6Zxste1KJ28AXR8dPBba9eNdcvPqdgMSswQNlvUv3+IuaWOXrlHS2RQncjqccQge3jK
	xMpe431Z9JZDo9g3oHF/XqvuulvoTr4sVSzK/K0HItEo5hdJr0q/Oug9WVhQeEG2J8M67P
	oiCTv+fUs8AV88YL/thGdZhpn6k3yxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d7XIrR/L/+yngYTCUBAbhKKw6WESO6CcCujA6BgFnE=;
	b=YWXvamoC9YPOvqsZHirWxpxrwXPVF58zpKStH1RB2V9wKXxxS5/IilSZFSePK+XcQX/VPz
	IO7CZChqf04DSIDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF23813AAB;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CF5PMeqQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 016/103] ALSA: firewire: fireface: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:58 +0200
Message-ID: <20250710100727.22653-17-tiwai@suse.de>
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
X-Rspamd-Queue-Id: F32671F453
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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
 sound/firewire/fireface/ff-hwdep.c | 2 +-
 sound/firewire/fireface/ff.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
index 8a741b3b0436..ca5c5dee71f2 100644
--- a/sound/firewire/fireface/ff-hwdep.c
+++ b/sound/firewire/fireface/ff-hwdep.c
@@ -197,7 +197,7 @@ int snd_ff_create_hwdep_devices(struct snd_ff *ff)
 	if (err < 0)
 		return err;
 
-	strcpy(hwdep->name, ff->card->driver);
+	strscpy(hwdep->name, ff->card->driver);
 	hwdep->iface = SNDRV_HWDEP_IFACE_FW_FIREFACE;
 	hwdep->ops = hwdep_ops;
 	hwdep->private_data = ff;
diff --git a/sound/firewire/fireface/ff.c b/sound/firewire/fireface/ff.c
index 6e84e4787259..5d2c4fbf4434 100644
--- a/sound/firewire/fireface/ff.c
+++ b/sound/firewire/fireface/ff.c
@@ -27,9 +27,9 @@ static void name_card(struct snd_ff *ff)
 
 	name = names[ff->unit_version];
 
-	strcpy(ff->card->driver, "Fireface");
-	strcpy(ff->card->shortname, name);
-	strcpy(ff->card->mixername, name);
+	strscpy(ff->card->driver, "Fireface");
+	strscpy(ff->card->shortname, name);
+	strscpy(ff->card->mixername, name);
 	snprintf(ff->card->longname, sizeof(ff->card->longname),
 		 "RME %s, GUID %08x%08x at %s, S%d", name,
 		 fw_dev->config_rom[3], fw_dev->config_rom[4],
-- 
2.50.0

