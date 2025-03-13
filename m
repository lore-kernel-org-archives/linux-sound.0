Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060498635C
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887924; cv=none; b=midFsrp8ZPuHuFxXb3C1UPdmCUDLAYCmqyTcg/g4Zrjf64zgR3uoP32fzQz58n/nV4Di3zYI1cNGUz3SSwsbyQ2506Jo7+ZhWU4MT94U63vfV1xRAkD180oiGe6ThDIO9COCLoE0J1+Ac7MRXJEdg6xOXgESXLYDbo/145wiadY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887924; c=relaxed/simple;
	bh=btTc6SYsAQHTMRU68pJ76wGW/9C3RhyklakzJ8UYHRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wo5rOScRQz/IZZTb4aNk82TD0ONBAJsGuns3PblrO+tZWjwTE1nZDdvLFdrHRLHPUDPxzjw8uJq9eY8C6EECmJaxV/MegkUsq7LNJuUJA3Un+PvgyRpV+YU02m7I8cdeBJ/dOfT8EW3T2uKjjWMBevUDwjWsZN7XMXsGjcy6+b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mdKd52ah; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1XUEx9iz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mdKd52ah; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1XUEx9iz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mdKd52ah";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1XUEx9iz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mdKd52ah";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1XUEx9iz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC50B211F2;
	Thu, 13 Mar 2025 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEJKSvrzcw4NvNtYTzmJaXBGKgIy+riAeuxgNNiHCTQ=;
	b=mdKd52ahjTPJAp5ECTkPlye/x90SU3Icja4I8erIMWJof72edtY2pMfLp7ifIPgpK8EVwj
	TFxWnUbVoaWyFkrRGgij+Ars8Eq/dxaT2YE15+0OtVL7G9qe9Qsw5vTEbQoasVh/PvDaHE
	PXPrlxs8kN4leFCqJj1x1xPxa2rsG1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEJKSvrzcw4NvNtYTzmJaXBGKgIy+riAeuxgNNiHCTQ=;
	b=1XUEx9izVV6Q+6QIyoxXFMYFGd5Ls6gfqzH9MsECY2jHcomu8HV8OX7ici4oriTvdkE/pZ
	Pi9bTz1SEgkqVHDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEJKSvrzcw4NvNtYTzmJaXBGKgIy+riAeuxgNNiHCTQ=;
	b=mdKd52ahjTPJAp5ECTkPlye/x90SU3Icja4I8erIMWJof72edtY2pMfLp7ifIPgpK8EVwj
	TFxWnUbVoaWyFkrRGgij+Ars8Eq/dxaT2YE15+0OtVL7G9qe9Qsw5vTEbQoasVh/PvDaHE
	PXPrlxs8kN4leFCqJj1x1xPxa2rsG1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEJKSvrzcw4NvNtYTzmJaXBGKgIy+riAeuxgNNiHCTQ=;
	b=1XUEx9izVV6Q+6QIyoxXFMYFGd5Ls6gfqzH9MsECY2jHcomu8HV8OX7ici4oriTvdkE/pZ
	Pi9bTz1SEgkqVHDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C15013A24;
	Thu, 13 Mar 2025 17:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ADrXIO0Y02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 66/89] ASoC: mediatek: mt7986: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:11 +0100
Message-ID: <20250313174139.29942-67-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index 7db090414d59..7a6ad9116e55 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -589,15 +589,15 @@ static const struct of_device_id mt7986_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt7986_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt7986_afe_pm_ops = {
-	SET_RUNTIME_PM_OPS(mt7986_afe_runtime_suspend,
-			   mt7986_afe_runtime_resume, NULL)
+	RUNTIME_PM_OPS(mt7986_afe_runtime_suspend,
+		       mt7986_afe_runtime_resume, NULL)
 };
 
 static struct platform_driver mt7986_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt7986-audio",
 		   .of_match_table = mt7986_afe_pcm_dt_match,
-		   .pm = &mt7986_afe_pm_ops,
+		   .pm = pm_ptr(&mt7986_afe_pm_ops),
 	},
 	.probe = mt7986_afe_pcm_dev_probe,
 	.remove = mt7986_afe_pcm_dev_remove,
-- 
2.43.0

