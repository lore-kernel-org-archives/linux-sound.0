Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECDA1AF0BB
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887918; cv=none; b=qLZX66FDHqZLim7/kc8lUDGFYzI7J2teG4kSmozbo3UChSThKXulqGg2Ch+jgWVpm7nCEQu3mDK/BMpBbQgfSYP4YQqoWckHonA6Bk4q/8RQoBkW84x2BzWfvoJNYCTZdfd47ElyIvFs8azwxjQ4klvNW0gtwpUvTdz8+dWGU8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887918; c=relaxed/simple;
	bh=BEL6JiUdbowwg62DkWoNPPN+GG0Vx1XyJiulOabQRiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgPSY1LY0Dsvm+19dXhOc4mRc6Sv+ahT/YkW8el/SM32GWW36soPOvnegautm444Vy7dLiO7wEfvVtpkezRT5TXBwV3VcMfXo+49JcyOPNfjaLcxp32K+hTaS5J5Wtqo2sWiUBNvEvfmKRhKe7iqjls2qRHrbWJCXwjfU9jmM74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L0H84jDW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8cxDV44N; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L0H84jDW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8cxDV44N; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L0H84jDW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8cxDV44N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L0H84jDW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8cxDV44N"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 85097211F1;
	Thu, 13 Mar 2025 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOWPK3PkqKpQ9lPEXJg9kZ1nGZemit5HYJ8VlYr5kPw=;
	b=L0H84jDWTeiu4UXzx6Pg+b9F1dci9Us/m2W1/I8gWS7zbL9a8uc+l5u29ZZgloBaYwH2m2
	J3jrszL5mLAESMmMAoMtJR/NW6cwZ4ceWTjqG1oXoVqDUbyqpVhn9kuGSw0H+GoqaK6RIH
	JVgB/zPQgLJeAtbqPApo0ZQA7M30rvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOWPK3PkqKpQ9lPEXJg9kZ1nGZemit5HYJ8VlYr5kPw=;
	b=8cxDV44NdKp9rDFRSFaJf45tSANDeTuteLSH0kR5wHIwIh0UN7xQq/m4cjemfUwJw0LN5F
	s7UYBK0YrncfDTBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=L0H84jDW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8cxDV44N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOWPK3PkqKpQ9lPEXJg9kZ1nGZemit5HYJ8VlYr5kPw=;
	b=L0H84jDWTeiu4UXzx6Pg+b9F1dci9Us/m2W1/I8gWS7zbL9a8uc+l5u29ZZgloBaYwH2m2
	J3jrszL5mLAESMmMAoMtJR/NW6cwZ4ceWTjqG1oXoVqDUbyqpVhn9kuGSw0H+GoqaK6RIH
	JVgB/zPQgLJeAtbqPApo0ZQA7M30rvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOWPK3PkqKpQ9lPEXJg9kZ1nGZemit5HYJ8VlYr5kPw=;
	b=8cxDV44NdKp9rDFRSFaJf45tSANDeTuteLSH0kR5wHIwIh0UN7xQq/m4cjemfUwJw0LN5F
	s7UYBK0YrncfDTBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64359139D2;
	Thu, 13 Mar 2025 17:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GDsnF+0Y02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 65/89] ASoC: mediatek: mt6797: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:10 +0100
Message-ID: <20250313174139.29942-66-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 85097211F1
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 9159b42adf6a..f62a32f2f2b6 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -879,15 +879,15 @@ static const struct of_device_id mt6797_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt6797_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt6797_afe_pm_ops = {
-	SET_RUNTIME_PM_OPS(mt6797_afe_runtime_suspend,
-			   mt6797_afe_runtime_resume, NULL)
+	RUNTIME_PM_OPS(mt6797_afe_runtime_suspend,
+		       mt6797_afe_runtime_resume, NULL)
 };
 
 static struct platform_driver mt6797_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt6797-audio",
 		   .of_match_table = mt6797_afe_pcm_dt_match,
-		   .pm = &mt6797_afe_pm_ops,
+		   .pm = pm_ptr(&mt6797_afe_pm_ops),
 	},
 	.probe = mt6797_afe_pcm_dev_probe,
 	.remove = mt6797_afe_pcm_dev_remove,
-- 
2.43.0

