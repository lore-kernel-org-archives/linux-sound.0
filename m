Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997E473C62
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937987; cv=none; b=Ga5gwVtHSlGy6jh4NBUXzAFclzqBdK5FoPKBAmlISBhd2QY3Sn+ZVw7a/JQfoVc9TL2XtF52dzoElqyLgEuPcGO99igIlv7pvt63eJ40GbVfvwEq5T17fhdzncIkx0emFG4M10c4Mu4PYapWBwLfJgsU9Hqg6XMWw0KzzG7Z/mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937987; c=relaxed/simple;
	bh=zfr9qmgIDveLox92VPfp52p198TyuhemBKhIiOxegWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+hB7h31wPzBtvjLq7ShdaN2CAFzV21DZGM9xoifvV9FnJFjxhRK4W7Ph3oYnSIRFbSMDZD8kUyWvHP+POgt+scHoFhD1uDjblAQ4mGsZ0PMDEVVCeqd4EW7BO2fWYzlvkts0QwNb9KjXb3rK+91SHBHDA/JH8CRzdFazo0LGMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m0vxuTaD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dYsEJivE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iz7l/XcP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bu2ZeibA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m0vxuTaD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dYsEJivE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iz7l/XcP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bu2ZeibA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD1B23DF4;
	Wed,  5 Aug 2026 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJh5xNLDenbOX5j3aKaqrxEQpcrPEPg8E1R9Ai0+PqA=;
	b=m0vxuTaDNK/jr2N7qsunLfkE9CiaiHocf/LLXQ2C9Ap5JMmRr9eC1Ypo0UEeUE1E7dqaOA
	N8UyumjpCVEfzktUQuDK62OwLIyZNfZlHgzIeBZWpykGBIakIaILWsi3CR9XnzzxCWS/38
	7ZucM29d4OVCV8iHuR0HNUzUuWLQD9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937980;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJh5xNLDenbOX5j3aKaqrxEQpcrPEPg8E1R9Ai0+PqA=;
	b=dYsEJivE9g2suZDOcWsUb/O/nzp8KmSZ4F23IhXfRQszIuelamB2fHlrcMvPdcKYTamBvq
	HBCCVZWAeJ5qMWCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="iz7l/XcP";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bu2ZeibA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJh5xNLDenbOX5j3aKaqrxEQpcrPEPg8E1R9Ai0+PqA=;
	b=iz7l/XcP/pBkuljz6gNlWL3GdYFZs4V7qHZbxco+UiD1/RwWEO+cPthK9SOrNL5UeRdxrM
	GjcO+Ufnzz31bI3y/xXPkuESMad70h0zU3BSb0jumRlF6Gqz54kZZ5ck37m+XMnK8+B74m
	PPQrw4sfNpPzFVrv4/ek/A3O80oDMcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJh5xNLDenbOX5j3aKaqrxEQpcrPEPg8E1R9Ai0+PqA=;
	b=bu2ZeibAzVfAHcTSGWM6fQUX/K1Wjai59jQKCYYzcEzh+mTe6kHkZoRS29MhKbkxt3kJUf
	m2tJ0PJjQ4J4gsBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA650779EC;
	Wed,  5 Aug 2026 13:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YBpoLDdAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 03/31] ASoC: aw88166: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:04 +0200
Message-ID: <20260805135247.670693-4-tiwai@suse.de>
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: DD1B23DF4
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

