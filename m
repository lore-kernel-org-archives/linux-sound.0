Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F39E4749F8
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938004; cv=none; b=sZCOZU0dCwdtyNTPy/8oF5U8G2Qupwic22tUouIDqcBriuAFaCZUqMJozvGapcHpnYSi+yQFW4A+mj1eG3/RB7jrzJ12QH1V8KH5Jv6V7qLjsPkzGeVK7h9XgDFVCM9bT8xtSyGopyL6KAgBBzl1FNFb/heusBzwnpN9ec2OnY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938004; c=relaxed/simple;
	bh=uVCGciQQhLjt9o8SSTntN1Iqup+JnQkdXz6tGUXM5aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hc6vPwgCUTX7swFkZZU9yIG5gaBb9nFAmKRk1e/00ApgpOr2CMYTLBtjnxZdF5Ywu002whVIMFKSenVzz7kQTECmYpiGEFZGWuN+j0J0abehy7QArIK/stNYYsiyoAbnMjcBP18wWLMQfFVlxCM1ESRchG17Bildvh63iwZ2PtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e+DlJq0i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uR8uUwXK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pncxqydG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wYCjnNQa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e+DlJq0i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uR8uUwXK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pncxqydG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wYCjnNQa"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 48DD23DF4;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9BPagttg27tI22Q8+JZLlvVcYdUnPPsHz7wVk68L5Y=;
	b=e+DlJq0ipPCh/pRobkr8mlHOCY1fGpVULjHydNrLcZo4XKBobcoxcPv1E7QHsNaYeHde3/
	hfPOl7c0bYXhV6l9byOdUvw3OjW9rGOT2p2ejCTed8WyAFlZ2P54LqUebqWALi/FJof2e9
	JgduTquP28dBhQu9jpmUjYV8hPGH4eQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9BPagttg27tI22Q8+JZLlvVcYdUnPPsHz7wVk68L5Y=;
	b=uR8uUwXKd0oIlhkaDEytx8oMSrHt1/ankWpPJ0N3rYcfxeP4NLx432psUp7KXCONQBnTYe
	5Ro5Ov8UAsQiZmAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pncxqydG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wYCjnNQa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9BPagttg27tI22Q8+JZLlvVcYdUnPPsHz7wVk68L5Y=;
	b=pncxqydGcul9VZxy2taf+x1BVz3jM3MjHoSaejJbizMUD1/OqZaZDgIOcPHsPn/j24oun3
	OBctavLDTKQVEdtBhgx91QOhviYmVZlHErsSEiaf1lZjUAFP7DlzcgcPVeI1hjqxPjbhIe
	aJ66LTXv3cHmXszZsth2yJdkYfZ36P0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9BPagttg27tI22Q8+JZLlvVcYdUnPPsHz7wVk68L5Y=;
	b=wYCjnNQaI9PP2lXJnnBej4NuwEa6b1X4ecdPhLxXd6S2XA9vE1fASn5ybmQaZSw9MxF9z3
	/yHbBQiEFCUZ7kCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B405779FD;
	Wed,  5 Aug 2026 13:52:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MBCzIDpAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 20/31] ASoC: tas5805m: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:21 +0200
Message-ID: <20260805135247.670693-21-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 48DD23DF4
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/tas5805m.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index f76e04b403b5..d32796a6fa75 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -457,7 +457,6 @@ static int tas5805m_i2c_probe(struct i2c_client *i2c)
 	struct tas5805m_priv *tas5805m;
 	char filename[128];
 	const char *config_name;
-	const struct firmware *fw;
 	int ret;
 
 	regmap = devm_regmap_init_i2c(i2c, &tas5805m_regmap);
@@ -502,24 +501,20 @@ static int tas5805m_i2c_probe(struct i2c_client *i2c)
 
 	snprintf(filename, sizeof(filename), "tas5805m_dsp_%s.bin",
 		 config_name);
+	const struct firmware *fw __free(firmware) = NULL;
 	ret = request_firmware(&fw, filename, dev);
 	if (ret)
 		return ret;
 
 	if ((fw->size < 2) || (fw->size & 1)) {
 		dev_err(dev, "firmware is invalid\n");
-		release_firmware(fw);
 		return -EINVAL;
 	}
 
 	tas5805m->dsp_cfg_len = fw->size;
 	tas5805m->dsp_cfg_data = devm_kmemdup(dev, fw->data, fw->size, GFP_KERNEL);
-	if (!tas5805m->dsp_cfg_data) {
-		release_firmware(fw);
+	if (!tas5805m->dsp_cfg_data)
 		return -ENOMEM;
-	}
-
-	release_firmware(fw);
 
 	/* Do the first part of the power-on here, while we can expect
 	 * the I2S interface to be quiet. We must raise PDN# and then
-- 
2.55.0

