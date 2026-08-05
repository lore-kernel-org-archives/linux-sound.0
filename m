Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C96472F73
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937987; cv=none; b=V6wKTIMPeH2BgPT10CkcwoSoSjB3xMsnbnv8fPzE/PvaEV5/C+oWooq2Ng1EHSdr8f8Nq0SVzGK4S4Q7YjSLijtJq14sflhk957Z4RUtkARoMC54I/ATtxxF8W9OEB2UZt+HVK4IOi63RbGDSxlvt6J8uxCEOVcKPUgbMCZYE9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937987; c=relaxed/simple;
	bh=pUfh71gCFH/VBsn/04LRDnX0JsUJj5cRS5v3lHjLFu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6yYns5cBRQuepSxf3wYd2IL7MXUDc0XF/veEHlqQz72FymcX3TEUYBo30TvuFn/fdac3pxd1Eeis/2UEfn6vt2kNhnzLCcRKiYoB+U/XxmjipjkYUtekQeWY4BYPGLw0ODxL+S3gmQgHIFde6/1bpo7hqJr3hfttGg/ZfGx9N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=he3zjg6g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6IvbMuP+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q232uVe+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/kRUjw82; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="he3zjg6g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6IvbMuP+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q232uVe+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/kRUjw82"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8F5CF3DF2;
	Wed,  5 Aug 2026 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1eEQ/k6ldgf/ZkxXGNy7ZeSPleNIeE8Gjd6DIax+IVs=;
	b=he3zjg6gaUr0vGXJMK5dxs5urMsnK15GXlPZoN2YKpi+LF5sYMh7XBQFj7LIcj5Q5maqlk
	IppAccn8mRcsfjr84qK1T+b0ah1OZKiHZsg5HMY4YTiFL+zj9mvh7dSF7sdabr5vPUMXiz
	E+iGWGef0HHF2Bj6ByGwsf++fU4hdd8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1eEQ/k6ldgf/ZkxXGNy7ZeSPleNIeE8Gjd6DIax+IVs=;
	b=6IvbMuP+pNKQkukFyX7Zf4t2Mrt+Qb6iZkwawgVL//g52Spk+7X08y4DijFaMMRGd2vm3b
	1asEIcXi5TxvWhCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1eEQ/k6ldgf/ZkxXGNy7ZeSPleNIeE8Gjd6DIax+IVs=;
	b=Q232uVe+lw6oe7Yihf3uEPwLLWJZe3XlQlYQndXE5kqYC+19xInDT3TYOggbaRKlQxVQDw
	p7pGHOOVrOlIREQU6JT3ruw7hETfpX4stiZMfQ3LgiUx5jntTlFqnN0K19G30CE6S/lQHX
	w+gMxcJmeFlepmt650bpcJKbQ9msQxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1eEQ/k6ldgf/ZkxXGNy7ZeSPleNIeE8Gjd6DIax+IVs=;
	b=/kRUjw82B11VVhky330UxV6jyosCn8jucfkK710EXhA/zni+kEFCe9c4g8qAaNbfr/89/6
	4DuAhySlc3v0jaCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D610779C3;
	Wed,  5 Aug 2026 13:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sNWIGTdAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 01/31] ASoC: aw87390: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:02 +0200
Message-ID: <20260805135247.670693-2-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/aw87390.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 8150670fde2d..5555c45dffcc 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -248,7 +248,7 @@ static const struct snd_kcontrol_new aw87390_controls[] = {
 
 static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 {
-	const struct firmware *cont = NULL;
+	const struct firmware *cont __free(firmware) = NULL;
 	int ret;
 
 	aw87390->aw_pa->fw_status = AW87390_DEV_FW_FAILED;
@@ -263,14 +263,11 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 
 	aw87390->aw_cfg = devm_kzalloc(aw87390->aw_pa->dev,
 				struct_size(aw87390->aw_cfg, data, cont->size), GFP_KERNEL);
-	if (!aw87390->aw_cfg) {
-		release_firmware(cont);
+	if (!aw87390->aw_cfg)
 		return -ENOMEM;
-	}
 
 	aw87390->aw_cfg->len = cont->size;
 	memcpy(aw87390->aw_cfg->data, cont->data, cont->size);
-	release_firmware(cont);
 
 	ret = aw88395_dev_load_acf_check(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret) {
-- 
2.55.0

