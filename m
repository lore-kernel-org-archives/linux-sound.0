Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7042624DFF9
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024821; cv=none; b=OqA9axixOxjDurTErqmBXV/P6/8wVdZz9is0HS+q5RMPgH4eSQ3HMkcebDSq5zn4zq2WurpC39XTzPCWqmhvsCDwhko+MbAdwwLAzYfouHAopFXLR9ZLDQp6JJZYklsoZAmECjY+nAZbq+v+80APxquHPptHlaWhem+D0VEM3cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024821; c=relaxed/simple;
	bh=zfr9qmgIDveLox92VPfp52p198TyuhemBKhIiOxegWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TemcgRK8azUrLFboQ33i0YpVHJjQwFT4jBNH/Y5JRmmOBz12qqKKPHKVsE55T7sZFtZ5p148IqkzS91RD2mkX1ua6MF1UPa41YHYw4eXySGzo9/ZopYNGPPpV7vxA+XU13g6xxoiWL5EC29bDbY+/II27pClhfKYrQ7VfpZ/D5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l1LqwIUk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hDAYKQE4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MWhA+YU6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SuZp0LkL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l1LqwIUk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hDAYKQE4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MWhA+YU6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SuZp0LkL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 864733E1F;
	Thu,  6 Aug 2026 14:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJh5xNLDenbOX5j3aKaqrxEQpcrPEPg8E1R9Ai0+PqA=;
	b=l1LqwIUk1YPctAo+3YT3ISxxv1SFUp7xIKGIvHczQRn02mDn05V/xLED7ZCfWVCuoSDwjL
	a5GpS0gm31IeRn25ywXE11rQ0aad1lXANFO7SOBLFUfAd0Rl3izNXvOl3Sk2eci/V5BBPN
	lQljcd2lf+nH8EpDQ9Xv1FS+c9PNvzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJh5xNLDenbOX5j3aKaqrxEQpcrPEPg8E1R9Ai0+PqA=;
	b=hDAYKQE4J9oyK6vWjwAqhaenKNIdrrJhHZQ+iUT4l6rvDBYLgkNVNpjnHdbfTLWfEQj6TO
	iZUmxbyvkKM859BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MWhA+YU6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SuZp0LkL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJh5xNLDenbOX5j3aKaqrxEQpcrPEPg8E1R9Ai0+PqA=;
	b=MWhA+YU6/CnXayrLO25/Dz3tYuQyXp5mzkSd1MdADOjP6FaN7EHbywbARahoOeh+x9qP+l
	4HYel6uo8sTcYBemFx1evdnlcFLfgEduwIM24B3Du0gBdqOxRtcI5U9Qg2xHwZwJJU1wAc
	EXIXs45w6GdC6qvEcCfQiNyxj0GVRjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJh5xNLDenbOX5j3aKaqrxEQpcrPEPg8E1R9Ai0+PqA=;
	b=SuZp0LkLrFbY5Z9ZSFmQ2VYBCWDFHtv20/N/vNiHHStJNllxT2MBU/g9qSTt73voFs8rAu
	axG5Nfk2d3F/pbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 621EE779C5;
	Thu,  6 Aug 2026 14:00:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gNRdFmqTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 03/31] ASoC: aw88166: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:35 +0200
Message-ID: <20260806140006.1412298-4-tiwai@suse.de>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 864733E1F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/aw88166.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index b72f87f677dd..d2a138211c59 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -1570,7 +1570,7 @@ static int aw88166_dev_init(struct aw88166 *aw88166, struct aw_container *aw_cfg
 
 static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 {
-	const struct firmware *cont = NULL;
+	const struct firmware *cont __free(firmware) = NULL;
 	const char *fw_name;
 	int ret;
 
@@ -1590,13 +1590,11 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 
 	aw88166->aw_cfg = devm_kzalloc(aw88166->aw_pa->dev,
 			struct_size(aw88166->aw_cfg, data, cont->size), GFP_KERNEL);
-	if (!aw88166->aw_cfg) {
-		release_firmware(cont);
+	if (!aw88166->aw_cfg)
 		return -ENOMEM;
-	}
+
 	aw88166->aw_cfg->len = (int)cont->size;
 	memcpy(aw88166->aw_cfg->data, cont->data, cont->size);
-	release_firmware(cont);
 
 	ret = aw88395_dev_load_acf_check(aw88166->aw_pa, aw88166->aw_cfg);
 	if (ret) {
-- 
2.55.0

