Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965D437C908
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024839; cv=none; b=dkyluDOxaaZqkV9khWRHiKpDc94Wh/M4FoYo+gGp2yEP1467ByOcydPP0Sb3PinZ0zbSijgMXOljr27dUqbovLAB4yOyLRr00mywuoYAeK3+FtKF1qhtlMDgaYigI1dZAkR1D21hyLrkBXZzi/37h2x4l4H4WJVPv0LmkUhBxX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024839; c=relaxed/simple;
	bh=0bRHNYOXAO5FBLPxpxk7x54lVb+WpDN9ziZSzIEQxB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KxfmhqsmEdWkghKLmAlNN6uzM9uJrpmljVZKrEjsK1nEb4wrbtQ8X9rzdA/7EcSDqwSU6bQFUtF8X2IRLSoEJ3OA1zX7PWEoq9yHT9Nm5iUOzb6i61PnxwuTxtky9WQ26+gNmRE1L354Vr1RNdy/ENFpAf4p7OQos/G8tei+ImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kBkdNF1e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CkUlVyd4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bcvGUKxZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aBIDFecS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kBkdNF1e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CkUlVyd4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bcvGUKxZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aBIDFecS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 99D75800D1;
	Thu,  6 Aug 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z2bfLO+o7E06VQNZ9LcnbfkHDMB7UaLD9RM00yrmM8=;
	b=kBkdNF1ecBVUy5MBPeT3sLob2THaaep0lyPE0NJPBMgUCCkRKFfP0razmCqduuraDZ5PG5
	u16ORX6M18/kap7QEKegVU8Sl5t0fj1Jf3p4cEC1fR2BzkGwtbXBJQMac6CBCxPtTxtrV5
	IWNrMG3N5M0JLYrj/kxDIjH7yvlqsA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z2bfLO+o7E06VQNZ9LcnbfkHDMB7UaLD9RM00yrmM8=;
	b=CkUlVyd4FAB/EcFKIQcFy+5+06BcdJ/vvuWNG5Cbm6a97KbPSYu+Vx24Pib4pCSNqHboGm
	Hlg5bSh5KuGMekBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bcvGUKxZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aBIDFecS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z2bfLO+o7E06VQNZ9LcnbfkHDMB7UaLD9RM00yrmM8=;
	b=bcvGUKxZk78Eybw/U9m1UvcirkvNClB28tPcdQDwyC53ZWGpzij4M9RpJIGa8uSDsHdIU0
	buHEuMdhY2pmae1cyRFoG21TlJUppz/TAnyShVAN7klFIj8j4NPe03GS2ARb2AJ4mymAuc
	6Asn9BM2xsprs18G2CHXA8KXC2zn/2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z2bfLO+o7E06VQNZ9LcnbfkHDMB7UaLD9RM00yrmM8=;
	b=aBIDFecSYihp7XxTMm5IxUA2242sbMZpGwdr+12LBqDywm3/hAqO5+9CZUTVhf3CQOBfMB
	qXOIo9pZcXR5hADQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F6BF77A20;
	Thu,  6 Aug 2026 14:00:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gNWzGW6TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Subject: [PATCH v2 21/31] ASoC: tlv320aic31xx: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:53 +0200
Message-ID: <20260806140006.1412298-22-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 99D75800D1
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
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
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>
Cc: Sen Wang <sen@ti.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/tlv320aic31xx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 1d2e0ea6d4fe..43bcbc5449e1 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1720,18 +1720,14 @@ static int tlv320dac3100_fw_load(struct aic31xx_priv *aic31xx,
 static int tlv320dac3100_load_coeffs(struct aic31xx_priv *aic31xx,
 				     const char *fw_name)
 {
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	int ret;
 
 	ret = request_firmware(&fw, fw_name, aic31xx->dev);
 	if (ret)
 		return ret;
 
-	ret = tlv320dac3100_fw_load(aic31xx, fw->data, fw->size);
-
-	release_firmware(fw);
-
-	return ret;
+	return tlv320dac3100_fw_load(aic31xx, fw->data, fw->size);
 }
 
 static int aic31xx_i2c_probe(struct i2c_client *i2c)
-- 
2.55.0

