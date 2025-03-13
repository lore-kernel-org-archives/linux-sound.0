Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1A21DDA24
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887906; cv=none; b=RYcN2YxeT8W61ZCMeYI3+V6BHtU5VoRNvZj2cEmU3eESlAVqcWkjr+9Zr4rHngOiDN9xfzuo2RXQCBV6xYL41FThAqlfKKHD68KcKcYWqEMHzoTlJIKuFOVtR9GgM0yjUv3WKyXBwQWVh8uLVbiLM1dopJBM8MYFS+CXO8E9FS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887906; c=relaxed/simple;
	bh=nJP7mPfg3vrsEit8HXXIcQYIbL6PXIzfZ1aVAEMSxcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzBNrTBV1fl8ATTVJDDea5O0ThiSZetuZSjV8wVhjOKS7nhCJACEk26sRYSOL0UgnHFt1jRb/3KY455+YJYieIQ2BJZm6va5wZJcf8kWFcMDh7aAGOl0m+k/NIb249h2eWXZ6LUU+nSYSPLWRIMlB5X7LflcOObJBKCr7uPPG88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cJLB9wfA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Bwi9EP5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cJLB9wfA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Bwi9EP5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cJLB9wfA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Bwi9EP5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cJLB9wfA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Bwi9EP5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D6551F78F;
	Thu, 13 Mar 2025 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vu3EeT4E6q+UAR4EwSSPaFn0r6G5kUkIz3QytbgkCfk=;
	b=cJLB9wfAC8cDMUy6tPyBU6yYgd1qDDh7RVyUS0J+oSPXlyz9ldk68RSxQ824sWJ9fJn730
	zCZ4gxMGYchL4O9R7rLotME9AIpYyv22taWgT+F1wpqfxe3+0D7aKcA1CkWBCP3DNeSmxM
	F89tR+ODVmrd/jJeLwElX9DklG4NfR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vu3EeT4E6q+UAR4EwSSPaFn0r6G5kUkIz3QytbgkCfk=;
	b=3Bwi9EP5ILLvfk/IDk3FGMM3ZkJCmuyiGDL6vbI6LCYF9TnbNKhizOP50WcNzSRqPUGf8F
	+1hnz1O6yXZ5qdAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cJLB9wfA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3Bwi9EP5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vu3EeT4E6q+UAR4EwSSPaFn0r6G5kUkIz3QytbgkCfk=;
	b=cJLB9wfAC8cDMUy6tPyBU6yYgd1qDDh7RVyUS0J+oSPXlyz9ldk68RSxQ824sWJ9fJn730
	zCZ4gxMGYchL4O9R7rLotME9AIpYyv22taWgT+F1wpqfxe3+0D7aKcA1CkWBCP3DNeSmxM
	F89tR+ODVmrd/jJeLwElX9DklG4NfR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vu3EeT4E6q+UAR4EwSSPaFn0r6G5kUkIz3QytbgkCfk=;
	b=3Bwi9EP5ILLvfk/IDk3FGMM3ZkJCmuyiGDL6vbI6LCYF9TnbNKhizOP50WcNzSRqPUGf8F
	+1hnz1O6yXZ5qdAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3706E13A24;
	Thu, 13 Mar 2025 17:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oOcRDO0Y02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 64/89] ASoC: mediatek: mt2701: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:09 +0100
Message-ID: <20250313174139.29942-65-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 5D6551F78F
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 5f11bc5438bd..fcae38135d93 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1462,15 +1462,15 @@ static const struct of_device_id mt2701_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt2701_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt2701_afe_pm_ops = {
-	SET_RUNTIME_PM_OPS(mt2701_afe_runtime_suspend,
-			   mt2701_afe_runtime_resume, NULL)
+	RUNTIME_PM_OPS(mt2701_afe_runtime_suspend,
+		       mt2701_afe_runtime_resume, NULL)
 };
 
 static struct platform_driver mt2701_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt2701-audio",
 		   .of_match_table = mt2701_afe_pcm_dt_match,
-		   .pm = &mt2701_afe_pm_ops,
+		   .pm = pm_ptr(&mt2701_afe_pm_ops),
 	},
 	.probe = mt2701_afe_pcm_dev_probe,
 	.remove = mt2701_afe_pcm_dev_remove,
-- 
2.43.0

