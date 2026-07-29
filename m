Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2003AFCEE
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314318; cv=none; b=BIVfpdtKw1OqsFa+D+hYoQ3rT9/02uqzpu7i9A9EXHOz+iNjnHFFvlhxymw0nqZPJb8DyY+q6zSrtVGrT+p1FhgJUUNbx46MTLq7BVhP4rhfg58Pr0+DApUdWpybEnWr5RELlwpB69Cf2hV1VEaTFr0iKgiVaKscQk3IBzDtFbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314318; c=relaxed/simple;
	bh=WxVqyQD08SwuWAU5ccCoouJImh7fIlVx0mn8G4Nyusc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ueySUKb2iMETqXp6vamUqpdVMrcvR/6jQoh83Jup7qQOH8HKOyJ/r1c5xS+7AQwn1a+zH2CTOK1xJclmBIDyxL81ANLGq3s4+4ypyCltUm6zNxP7D2zwCpuve0ygES61d0Zdb5W7hwMdJNfZRXT+9Z2sO5TZKemmDCjo0HsW1Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S5WiXpKP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HayleWxK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yiUMCzZ3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AuNNRQ16; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S5WiXpKP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HayleWxK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yiUMCzZ3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AuNNRQ16"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 581437C9B1;
	Wed, 29 Jul 2026 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoAYvuN8jiDPUsc5ANFOV8yjx0WkTiiopRdKJD+if1s=;
	b=S5WiXpKPFvkqBT8YgzFrCaUU7nKKVRoc/5vcQ+MfeoG+uYTTv/WWvoinx7of/ZJtxxAqhD
	5w7PGBGJrxhBuyaWzvZNgWNsA0sdXSbb+2fp0tmeOPSrEYVCEpwa9TbJNmL4HmGeKZgP8l
	getlGGC8e12VPjCw869ubUeFHR43NUM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoAYvuN8jiDPUsc5ANFOV8yjx0WkTiiopRdKJD+if1s=;
	b=HayleWxK2kMpaJYGeHIDlRsKiifmrC04FjjqmE6ulXL2imOhKisV9eZ6CJw/gn0rUlUyXc
	oin9HAb3N2UbV4Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yiUMCzZ3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AuNNRQ16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoAYvuN8jiDPUsc5ANFOV8yjx0WkTiiopRdKJD+if1s=;
	b=yiUMCzZ3E80hwTpK2OzgHCnKkm6xKp6OanrCGqyKp0OikRvN2jFRvG0k3pJiOuvXzDu8Wz
	uFMmbXUI9Vnxs8WrYbbH+WyB5CskKpGp3AxrEEfKOdTafM7j9vDl4ULdjtyr7i7xYhAuhi
	7Jxo/GhfFJZb1yNsQ4eXxJOhCG5p1YE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoAYvuN8jiDPUsc5ANFOV8yjx0WkTiiopRdKJD+if1s=;
	b=AuNNRQ16kjwv5O7CAOy++4jAefkoD0WC8vfVk1taiSps0vs1bLedBLFD6kSTD31OMo2QqK
	1Vx8t3jmwf9U3yDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68AE0779DB;
	Wed, 29 Jul 2026 08:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aJ1GGNm7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 14/14] ALSA: sh: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:32 +0200
Message-ID: <20260729083735.120219-15-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729083735.120219-1-tiwai@suse.de>
References: <20260729083735.120219-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 581437C9B1
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sh/aica.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 8196e1bf0416..078fc7fc08f9 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -518,8 +518,9 @@ static const struct snd_kcontrol_new snd_aica_pcmvolume_control = {
 static int load_aica_firmware(void)
 {
 	int err;
-	const struct firmware *fw_entry;
 	spu_reset();
+
+	const struct firmware *fw_entry __free(firmware) = NULL;
 	err = request_firmware(&fw_entry, "aica_firmware.bin", &pd->dev);
 	if (unlikely(err))
 		return err;
@@ -527,7 +528,6 @@ static int load_aica_firmware(void)
 	spu_disable();
 	spu_memload(0, fw_entry->data, fw_entry->size);
 	spu_enable();
-	release_firmware(fw_entry);
 	return err;
 }
 
-- 
2.55.0

