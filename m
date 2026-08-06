Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D817F1E47CC
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024838; cv=none; b=FUWN4hDL4Mcl9FDdsk+cSanWTJG4hBP2qHptTwAWm4IBPvmE/TUwh5gLm/6hfdUCh4yLbIL4JXXfzYUmHpxUwdJCne3559mOUkpf6WDC7utWivd99lnE1/KAtc1OMdEfzN/Bl1tYv2Fzf+KhrjyGu9XS2LsyWsJAZKRY9eH7Aqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024838; c=relaxed/simple;
	bh=tAUsUjCC9QrDLHF3CFj9UxFwOrzvlct0ruiY3GKJYfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPRHb53TH/jW4yrwoBd/XR22GMw4P485LFhg5BO84KcXWmdNduP4HKr3c3TYymhu5o/7IJ+icz/35xDo0u2dXhrAK4y3zxKUz6OyntYyRiO8+8AW5Xy1xa7xDTh8L6QzcB2aeUlZSIhKOqw9zT3cOlPGPERkGUNvD/QqcZZzc2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z520NgKn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WchX5nrj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cTqHt+zd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cJ7JlLma; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z520NgKn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WchX5nrj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cTqHt+zd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cJ7JlLma"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C2CFD3E14;
	Thu,  6 Aug 2026 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kze3EFe0ilC+BrWImkcnhse2YnCwOxrsXqvVgwJjvUY=;
	b=z520NgKnyYHK8Y1LUwmz/hUsHw0GoX47bgGTuHPw652VBkT3y/x4cchZhRfIB6AcUQ3ZwO
	RHrcpVabz7JTMMy09IaRT03XfRSLVMoWZ+T2hJHSc7ppx9hIqrkyReQwwAppZFUlh5pE3W
	ZJ5wxPZrAJgQCntA02f8f8hXOrVX16w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024829;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kze3EFe0ilC+BrWImkcnhse2YnCwOxrsXqvVgwJjvUY=;
	b=WchX5nrjy5/ZnhEzb0dcy7zvcGlzbyPJK32d7hxkT6Xey8QLgh0+8W8fUfETY94Cq2rSxr
	Q5WGWg6qIRSReCBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cTqHt+zd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cJ7JlLma
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kze3EFe0ilC+BrWImkcnhse2YnCwOxrsXqvVgwJjvUY=;
	b=cTqHt+zd4ojphvXRDyqzx4BySjKO7+XAawsLokmy6Jw8UgaxTvv6x4ona1wWUgkkatIos0
	zBrlWbGGO6NCFhmU98RhHOh6RG5j+QuQ0/piljayqRGMif0W3gcX5FhMqysyhSQVfQUGEB
	VuMUL6j8IvRv9say2B4UFPNb4IhMD88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kze3EFe0ilC+BrWImkcnhse2YnCwOxrsXqvVgwJjvUY=;
	b=cJ7JlLmaXQJXtsY/LOQ0NejDvW2XLiEddfXg/Q7KB7NGZcMioRVu4C7XGPfYVNqaao8cB+
	0lqkee3Bb2T1PZDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C81E4779F6;
	Thu,  6 Aug 2026 14:00:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uMU+L2yTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v2 14/31] ASoC: rt5575: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:46 +0200
Message-ID: <20260806140006.1412298-15-tiwai@suse.de>
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
X-Rspamd-Queue-Id: C2CFD3E14
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,realtek.com:email,suse.de:mid,suse.de:email,suse.de:dkim];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt5575-spi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5575-spi.c b/sound/soc/codecs/rt5575-spi.c
index d5b3a57c8866..750f1f7169e6 100644
--- a/sound/soc/codecs/rt5575-spi.c
+++ b/sound/soc/codecs/rt5575-spi.c
@@ -93,7 +93,6 @@ static void rt5575_spi_burst_write(struct spi_device *spi, u32 addr, const u8 *t
 int rt5575_spi_fw_load(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
-	const struct firmware *firmware;
 	int i, ret;
 	static const char * const fw_path[] = {
 		"realtek/rt5575/rt5575_fw1.bin",
@@ -104,6 +103,7 @@ int rt5575_spi_fw_load(struct spi_device *spi)
 	static const u32 fw_addr[] = { 0x5f400000, 0x5f600000, 0x5f7fe000, 0x5f7ff000 };
 
 	for (i = 0; i < ARRAY_SIZE(fw_addr); i++) {
+		const struct firmware *firmware __free(firmware) = NULL;
 		ret = request_firmware(&firmware, fw_path[i], dev);
 		if (ret) {
 			dev_err(dev, "Request firmware failure: %d\n", ret);
@@ -111,7 +111,6 @@ int rt5575_spi_fw_load(struct spi_device *spi)
 		}
 
 		rt5575_spi_burst_write(spi, fw_addr[i], firmware->data, firmware->size);
-		release_firmware(firmware);
 	}
 
 	return 0;
-- 
2.55.0

