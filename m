Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19843B841D
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024829; cv=none; b=UrJcYaMmJc7iLVXBwXJt8gTqQbsAC1wz1eGaJC1HWls2Nizd70OJ9hw4H3cHU3NT1vZ+oKoJjr3huox9PmbCGv6+Ucty7KDLBKuOSOA3RZdFSnjf8cDNNm4RfcUTdrtzVGUxchAOVcMQ7G4I7Qn+1gZkPKCk+smGnIOl/OY4z5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024829; c=relaxed/simple;
	bh=Lac8XGdCK118N2gtHH5oMuwZzygjCf6rQN91OJ7BOwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8Tycjx8WsxpkW57M953205pzIKanD4BwDupvLaNvl254agpx2XhR2qq8NDzGbxdu/ufXRSS2msIgnS8yeNEz74QKRbvjTPgxoDUe0VDi5nInhxjJq3LJqZC8silCkAPDsIdNeDfQBYK08eTZtXB+/ubPe9Pm+7Vsl2cBdA1ya0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cM2FAweU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Dnoa3gYT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b5jUGJZV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KUtClVkq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cM2FAweU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dnoa3gYT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b5jUGJZV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KUtClVkq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8A0BF800D7;
	Thu,  6 Aug 2026 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLcR9brRv5EgVVCeq9AlEFcitCd/uek2s6ziVKAQZEM=;
	b=cM2FAweUQxParF4GKJIQXVRhkgqR3pLzcv/dMW3gAYkXJe5LvMAZwEKSpe2oTEWZuV18G7
	XEftis0cDDk/RYxarWfNyOyHGHC3IsFqPPYPRMq1HRcBY/8eGgTHKHi6lmGZoEkZRyHETP
	+qnUVYCH1qW8tXuy4XLD83NDiLtaBSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLcR9brRv5EgVVCeq9AlEFcitCd/uek2s6ziVKAQZEM=;
	b=Dnoa3gYTGKGWjPXoVAUYiQ5a+DZ1zIh7+ocwQDQknhEdGiGytCaI3Q6Xeyo5HordK2mRac
	f/t1cN+XDhP21WBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=b5jUGJZV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KUtClVkq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLcR9brRv5EgVVCeq9AlEFcitCd/uek2s6ziVKAQZEM=;
	b=b5jUGJZV0jxALEjg0rAPaP23a///HzhJbqol/qY3TcqJE5P3ns6ZHKVpKd6Xxa9yRNzt03
	M2Y0MP6LpkTU9EFIdpJh+rL8Nkymbo6jDkOEplUC5BP9yY78G6pkBnGGBNWHwbVrmPwMzg
	98jOzIWM90ywELmIWVsNDXKvP64a6ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024817;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLcR9brRv5EgVVCeq9AlEFcitCd/uek2s6ziVKAQZEM=;
	b=KUtClVkqedPbL/RP6JlSa1aX0tyHSnqDdK3smnfIkrY/+ih0K0HkZ2RSNEiwUlUUVKgNwA
	Pfa7R7x4Xsa35tDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCDE2779D2;
	Thu,  6 Aug 2026 14:00:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yE6ULGqTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 05/31] ASoC: aw88395: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:37 +0200
Message-ID: <20260806140006.1412298-6-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 8A0BF800D7
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/aw88395/aw88395.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index e9ff2c79ac15..2f4108624d13 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -457,7 +457,7 @@ static void aw88395_hw_reset(struct aw88395 *aw88395)
 
 static int aw88395_request_firmware_file(struct aw88395 *aw88395)
 {
-	const struct firmware *cont = NULL;
+	const struct firmware *cont __free(firmware) = NULL;
 	struct aw_container *aw_cfg;
 	int ret;
 
@@ -473,13 +473,11 @@ static int aw88395_request_firmware_file(struct aw88395 *aw88395)
 			AW88395_ACF_FILE, cont ? cont->size : 0);
 
 	aw_cfg = devm_kzalloc(aw88395->aw_pa->dev, struct_size(aw_cfg, data, cont->size), GFP_KERNEL);
-	if (!aw_cfg) {
-		release_firmware(cont);
+	if (!aw_cfg)
 		return -ENOMEM;
-	}
+
 	aw_cfg->len = (int)cont->size;
 	memcpy(aw_cfg->data, cont->data, cont->size);
-	release_firmware(cont);
 
 	aw88395->aw_cfg = aw_cfg;
 
-- 
2.55.0

