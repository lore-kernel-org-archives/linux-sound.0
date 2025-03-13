Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6998029A9
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887935; cv=none; b=HO92BrcFoxcSy+qsWaWt12LaocPoy6I8dgoGqmJuzjM8KR2x3BXdxIEQlCAgwna9rcLcKfJawyKn4T64NDG5bqVJnIsVZ0EiJRMYuXX2X2uY6Sp5k05B5P6DaIedC4vXhu9pPe+B2ztd8E0txlMYCmfqsC+v5xMbFQzODNgULbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887935; c=relaxed/simple;
	bh=kWG4EMlqwHMCDZhtS+ktGQ63fdbIrk+uXLol54ifXNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p32IdqnW7IjNzMsaJxk5gCuZhapZXGzufVMCzmGoeC3YKBLUiTcXNvAnAHtbExxusbq9rgIdP2DszDnzrvLBwSOqcWqCy/9Yg8kaXk/NrXTk0OW1/FZuwwU5tUauKeh9CHm86xPdXa8N+aDAUTGuWKbSMjrRuKkSeuoOU0gROuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XaGRZlpz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9QhLoHZ5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XaGRZlpz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9QhLoHZ5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XaGRZlpz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9QhLoHZ5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XaGRZlpz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9QhLoHZ5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0EAE4211F6;
	Thu, 13 Mar 2025 17:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT5zpVee2NoaX9XJftb4uCq3lhHPw0uk6AmnrSqAfiE=;
	b=XaGRZlpzCoh6PJCy/JfFQFCl6FExOttVKjB4EM1ao0zwM1TLEZlGxw0+vv7LpATZdqALxO
	9tnWPeXjIugLBJgkeYOZDv0DM3eciXvg1/0apFHBHa8nJIu1fGZcJPRxQcFVIeC96AL4vk
	Klnduj3pdk5FQ/4G94SCdOWaRvm1Vfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT5zpVee2NoaX9XJftb4uCq3lhHPw0uk6AmnrSqAfiE=;
	b=9QhLoHZ5Xo6kq2GXzOB0YUDkPJoznloelJAMC/0A8uZebvH2Qjq7L4W5U8n55b8+qPeuzJ
	VsCiQ1rZgD8Rn9Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT5zpVee2NoaX9XJftb4uCq3lhHPw0uk6AmnrSqAfiE=;
	b=XaGRZlpzCoh6PJCy/JfFQFCl6FExOttVKjB4EM1ao0zwM1TLEZlGxw0+vv7LpATZdqALxO
	9tnWPeXjIugLBJgkeYOZDv0DM3eciXvg1/0apFHBHa8nJIu1fGZcJPRxQcFVIeC96AL4vk
	Klnduj3pdk5FQ/4G94SCdOWaRvm1Vfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT5zpVee2NoaX9XJftb4uCq3lhHPw0uk6AmnrSqAfiE=;
	b=9QhLoHZ5Xo6kq2GXzOB0YUDkPJoznloelJAMC/0A8uZebvH2Qjq7L4W5U8n55b8+qPeuzJ
	VsCiQ1rZgD8Rn9Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E008413A24;
	Thu, 13 Mar 2025 17:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wEh7Ne0Y02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 68/89] ASoC: mediatek: mt8183: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:13 +0100
Message-ID: <20250313174139.29942-69-tiwai@suse.de>
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
X-Spam-Score: -2.80
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 3f377ba4ad53..d083b4bf0f95 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1257,15 +1257,15 @@ static const struct of_device_id mt8183_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt8183_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt8183_afe_pm_ops = {
-	SET_RUNTIME_PM_OPS(mt8183_afe_runtime_suspend,
-			   mt8183_afe_runtime_resume, NULL)
+	RUNTIME_PM_OPS(mt8183_afe_runtime_suspend,
+		       mt8183_afe_runtime_resume, NULL)
 };
 
 static struct platform_driver mt8183_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt8183-audio",
 		   .of_match_table = mt8183_afe_pcm_dt_match,
-		   .pm = &mt8183_afe_pm_ops,
+		   .pm = pm_ptr(&mt8183_afe_pm_ops),
 	},
 	.probe = mt8183_afe_pcm_dev_probe,
 	.remove = mt8183_afe_pcm_dev_remove,
-- 
2.43.0

