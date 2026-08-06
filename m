Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC82931CC
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024838; cv=none; b=HRKdU6rRLiMKv45u8QpscztaKNs0VDyCMVdIbTW6smnH0y2sZk+WQUpaLLRtdAeT+oOEpbmpHtmhP50rtBVElnZWn56fTc6gXURaWaXYTYayBOONYfgKgRHMtmfoZ6tBDr/FsI72WWnQg3eOXOGXQ2KPTSFRCXEoBAvuZ/5Z4/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024838; c=relaxed/simple;
	bh=uVCGciQQhLjt9o8SSTntN1Iqup+JnQkdXz6tGUXM5aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VboKSLd13DHPlCUepjckeOvqqLOeDJRt/2lcftNO30rhhtTGwL5K91RpvU+ZFhK2CWhu6+WdWJkx8OQmM+wwsRGeTl49p7bichhg4aCN2LtpKTaH40gaIy7mM50T04WKN3ASHAoZMeYF+PgkH62TZvR5Qtf2h4a3KogxZBYLqqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EVf8PGFk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xGSrWZGt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IV91iru4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ETFenVhu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EVf8PGFk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xGSrWZGt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IV91iru4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ETFenVhu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9285A3E26;
	Thu,  6 Aug 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9BPagttg27tI22Q8+JZLlvVcYdUnPPsHz7wVk68L5Y=;
	b=EVf8PGFkSwFLXJDEnMJxln+eFAiVUX0vXt25OkheShjzfUXAbfuduoJhxGDqENhG3pO0gQ
	eTWVY06MNAwbdfGK3icNAhmLzjt5pvpD0XnJPa8A2u9PR8l79UlbrI1PB+spyNKp2SjkaP
	fBU8bCrpbz5NBO8bt9Ds8vUExww/oZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9BPagttg27tI22Q8+JZLlvVcYdUnPPsHz7wVk68L5Y=;
	b=xGSrWZGtJ7g6J2w9CX7oMaJte1vf5ayQpG79z3dQ22sk8H7EaFVp1qrIVZ3LBEWC5+AS1l
	KXKC6RQRzgny8sBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IV91iru4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ETFenVhu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9BPagttg27tI22Q8+JZLlvVcYdUnPPsHz7wVk68L5Y=;
	b=IV91iru41CAkdEZ6IYHinGRMdYHPphmPSq5075kdOfgcLs+xuudEWZGlLoKwXkqIU0xdBz
	KKOzRGTP4DzoTkwtAlVx3wVveEdtvePg++1TtAaO/tB98kuvkX2snrklKukGMfvTRMQkNW
	NydFN/YJYil+MvKnmpcd+dNSRQAqJVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9BPagttg27tI22Q8+JZLlvVcYdUnPPsHz7wVk68L5Y=;
	b=ETFenVhu172ZUisxqgVqal95c0NrAbr+HNZeYq8PWfBEBcu5pXTw3yMOiWn+D/e17g6Wq+
	fEdKXZDHAUAqW/CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4110477A1F;
	Thu,  6 Aug 2026 14:00:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0HIsDm6TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 20/31] ASoC: tas5805m: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:52 +0200
Message-ID: <20260806140006.1412298-21-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
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
X-Rspamd-Queue-Id: 9285A3E26
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

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

