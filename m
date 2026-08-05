Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04FF474275
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937997; cv=none; b=sUiSe+h9t5ggJnjZ05c04fIn3Vse16gUTW4pG1N/DxMlzwBN6njfKFK/2swL1YIWc70m/CiEAZ0yQPwB/qoey9KbnJzFK/pXwgnRhnawYWmWOuQZ/7oiZRpirZ1+uAKDEDBB6H8+6VdqB/GOid64HjMgnVeDGz6sQ6fYVa4aeYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937997; c=relaxed/simple;
	bh=tAUsUjCC9QrDLHF3CFj9UxFwOrzvlct0ruiY3GKJYfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TpynyjbELsqKkp3wPp6eBn0AsqT231JmrJ3Tdn0m+AGF8loGSf9QjUb9MPO33IRmjQI8eRZ2DCG5TR9m7ip+2pi8qgz0NoH5+87yvof3Ll2P1asyxOeFOInxj2yy4X40eb5ZR0z8OwEqNULj62hm6JV3BmI2nHGh73vuPWSUIlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UaLAKXxN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gENlQsY4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EYPIQQAo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t22+zkAQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UaLAKXxN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gENlQsY4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EYPIQQAo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t22+zkAQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 58DF37F0BE;
	Wed,  5 Aug 2026 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kze3EFe0ilC+BrWImkcnhse2YnCwOxrsXqvVgwJjvUY=;
	b=UaLAKXxNZIgLMR+5SxcAsj7iwovhp4dVuBESeyui5qFM+ZNJLN2x+zbWYFc1CM0bdERxEe
	R1iwUVBy2IRZg0WLbS/IaAEPxnLRSwXGYQhsyPAwWGqYgzorqUgeaMZyyvem8MkXJUPrzS
	lMt0F/kf9d5eZgeomSdq8XrOapKmy7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kze3EFe0ilC+BrWImkcnhse2YnCwOxrsXqvVgwJjvUY=;
	b=gENlQsY4xsG85wuH3KQI7CFBzCVlgqgXQrVTqWTMtUp/0EQ3OGuPu2Isaq/5Mhn/OCcqIa
	s9qrKxLrnPKygeBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EYPIQQAo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=t22+zkAQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kze3EFe0ilC+BrWImkcnhse2YnCwOxrsXqvVgwJjvUY=;
	b=EYPIQQAoncPRAgRsm66p7Wid4ORhzkMs9feN//rKEDFM095z3GlQvJiBKXZ+gEJnH7RUUL
	52sopqCElNORn4w6+EC9SbAgC+h53slWer9fm5fzqLGjaoIqeQ2M44xSjEBgGkfYHusHhN
	qGtm97hBybQPHoNfavF9x+5DANwXzq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kze3EFe0ilC+BrWImkcnhse2YnCwOxrsXqvVgwJjvUY=;
	b=t22+zkAQGPBm9bvJa0zgo7EjV6QXKP8ULZJozJ+pFLk12NTgHNfIkdm7ZSjk5oAtOYRM8E
	4KSeZqCas0HS7lBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 705CB779F7;
	Wed,  5 Aug 2026 13:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QE0DGjlAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 14/31] ASoC: rt5575: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:15 +0200
Message-ID: <20260805135247.670693-15-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 58DF37F0BE
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
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

