Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A6F3A1A22
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024822; cv=none; b=rpQ/KL/Zqx0q8p3NtFKOyezRuj+UezHyS/gMjeytrI1diro/XKsA8w07bnV2Lak0tZ83jm5uxfVs1HuBtlbfDfns0YWWR12vpV6TeM+2e8+j1Jk/TNfIl+vlWzpykvZkE1f1bT7FgEpXsUla7IGYsxcZYytC5FyGgrNjLwHeLUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024822; c=relaxed/simple;
	bh=pUfh71gCFH/VBsn/04LRDnX0JsUJj5cRS5v3lHjLFu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r02Y1w4qKDRxBCG1mptI2laEVRppnkRJynIN6H9kwh01o6ohGn2CPLcEeHDv+nZiIZuLguZ1B3mwo0kkFBMdv3m3faadZNuRFHcVMNRd6Bar7oCog2vOvMeAJM1q3pbGabwZTQqMUU9xK9GtTe1KAhTV3SOz2xIVP7ssn0dBf9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WORMVhMQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2oTE/mG/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T0oIngYT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1JiIV8S2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WORMVhMQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2oTE/mG/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T0oIngYT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1JiIV8S2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 223A5800CA;
	Thu,  6 Aug 2026 14:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1eEQ/k6ldgf/ZkxXGNy7ZeSPleNIeE8Gjd6DIax+IVs=;
	b=WORMVhMQY95+Fhqb1GJtfeZ0C1KD7u6RtB3HDzd4YVm5ZGR9GeYtBNsz88g9KNbabgO1Vt
	BPls2kzJUfAK37qZa06blEOtz2Ni/OlX7zGiTI2aqED/pEW7hyfHSlIhVl/EH3kFP4nG3K
	XncETdyjheqZSvZWTMPnfq0pNmT942U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1eEQ/k6ldgf/ZkxXGNy7ZeSPleNIeE8Gjd6DIax+IVs=;
	b=2oTE/mG/Lsj3EwjhHwlKM/3PQurxyPxRNISHs7jLnN8lqurhoDIuPIiaC/MHnKkG/5jQzn
	ubfqAmtaZDPH5XDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=T0oIngYT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1JiIV8S2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1eEQ/k6ldgf/ZkxXGNy7ZeSPleNIeE8Gjd6DIax+IVs=;
	b=T0oIngYTSb9s3eXvmPc7zf+X8uL6WbhCmyBe1ShGXQr3x3MR71StrLp5MXQ8aO7fH+9v7W
	H+Deumv7W+XkcrRHSasTTU3SSQPQOmTJdC+Xz9BEK7KHYaAJv7uHsAdmbta8/xSYYxw5iO
	7gHS549BciXHM9kFFHfRA5uwx+u7C+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1eEQ/k6ldgf/ZkxXGNy7ZeSPleNIeE8Gjd6DIax+IVs=;
	b=1JiIV8S2l0u7g0jKXggVwxzMgbybyultv7Nlnjfb6lq8+06QyN3fpyjpiL8vUvDTyEh0MT
	4z07X3nLiYfTSrAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F24F1779C0;
	Thu,  6 Aug 2026 14:00:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ADWqOWmTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 01/31] ASoC: aw87390: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:33 +0200
Message-ID: <20260806140006.1412298-2-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
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
X-Rspamd-Queue-Id: 223A5800CA
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

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

