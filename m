Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01862474263
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937995; cv=none; b=sSS7C+DhLWo0Rih+OBVdzDMiCCuuunICHBcIuyjFsw/mGyzyBSoOTHPH6jGb2ZtJZMUBTQCevPy7erYhr2qrCS0YeCmfZtSAHipOYWrXGpg+LzfiIl+C9PzPaNk2KjNP82f63y85z6bG5+VQoPpdPY7WWX9tp7SbS0nJwW3e4QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937995; c=relaxed/simple;
	bh=Y9T3BuVNnrHAE8choomGBlIB8Q0E3zs2HF7j2IiYiOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bODYJ7q9DO9PNRNeK6aU7r8Gp8CmpbrEJis/WNJjEwOWnXoYBhx71kUy8uVtfAqAvMpE6C5x9Rsc9ZkbJpwQ63ND1YNMI0NgHLKFpCuQSsPQppUDPqhUFAN8Px7R9nBZmkwAGetOR2e+bvwTOUtazfrpTHqVcaLIidOq2yVWlD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SOEA5wAq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jWQGJm03; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HgS3Utw3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cY3SB7K4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SOEA5wAq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jWQGJm03";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HgS3Utw3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cY3SB7K4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D57053DF8;
	Wed,  5 Aug 2026 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iTDUyIxBgINrl2yVbL48anxlfF4HEp/1VEFiPrW3Uxk=;
	b=SOEA5wAqZr9aefwljJVSN6yG1Jd0UktUk2W/EPGlSPi3rKVJpzPdOSDy7TEsdVB9BjwZZk
	MDfwBETAcdJ2lbGHi2KLNipqtyp/5wMNjuBghTAIzpyDCwbNUajkda6ONIyESA0QpOa+fF
	rZfX87sT6ITTJdMF4lQTzNowgiU8iP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iTDUyIxBgINrl2yVbL48anxlfF4HEp/1VEFiPrW3Uxk=;
	b=jWQGJm033agX3fJKCqNuRRabHpBDvC4KrhrQxUtQZrm0w8vyEcFb3ELmKlpNy97ovDKHKP
	O7SUB1Y18QArNQCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iTDUyIxBgINrl2yVbL48anxlfF4HEp/1VEFiPrW3Uxk=;
	b=HgS3Utw3T60kWCwSggiXoxxHbsmzpYGrU9epvsZ0Q19IHbYJ2dzAkOrH1fNHJ12rOl73I1
	hMRfS1/VJ0e3lmIpQEnBYle+ulxA3UWGplc1lOugnqOVA4knd20rUeHBZ66HMigyVd87pV
	v6wFgn45pNChMi46kvy6+/Khjo3sMSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iTDUyIxBgINrl2yVbL48anxlfF4HEp/1VEFiPrW3Uxk=;
	b=cY3SB7K4YsN2BzT2jQ1euslFttUaS9zLHdomyg+tH9mT4YBCPVzhOQrW4s0ZldinCrhZML
	R1HMsmpgk2/q9nDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3088E779EF;
	Wed,  5 Aug 2026 13:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cLOkCjhAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 06/31] ASoC: aw88399: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:07 +0200
Message-ID: <20260805135247.670693-7-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/aw88399-lib.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/aw88399-lib.c b/sound/soc/codecs/aw88399-lib.c
index 5c7982891def..809c2faa0c0c 100644
--- a/sound/soc/codecs/aw88399-lib.c
+++ b/sound/soc/codecs/aw88399-lib.c
@@ -1282,7 +1282,7 @@ static int aw88399_dev_init(struct aw88399 *aw88399, struct aw_container *aw_cfg
 
 int aw88399_request_firmware_file(struct aw88399 *aw88399)
 {
-	const struct firmware *cont = NULL;
+	const struct firmware *cont __free(firmware) = NULL;
 	int ret;
 
 	aw88399->aw_pa->fw_status = AW88399_DEV_FW_FAILED;
@@ -1298,13 +1298,11 @@ int aw88399_request_firmware_file(struct aw88399 *aw88399)
 
 	aw88399->aw_cfg = devm_kzalloc(aw88399->aw_pa->dev,
 			struct_size(aw88399->aw_cfg, data, cont->size), GFP_KERNEL);
-	if (!aw88399->aw_cfg) {
-		release_firmware(cont);
+	if (!aw88399->aw_cfg)
 		return -ENOMEM;
-	}
+
 	aw88399->aw_cfg->len = (int)cont->size;
 	memcpy(aw88399->aw_cfg->data, cont->data, cont->size);
-	release_firmware(cont);
 
 	ret = aw88395_dev_load_acf_check(aw88399->aw_pa, aw88399->aw_cfg);
 	if (ret) {
-- 
2.55.0

