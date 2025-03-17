Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C753230BE1
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205581; cv=none; b=flKXr0x5TFFQJzcl4p4LGHVDz+s0XA2uwUpoEMZRhyETBWN72M7BBZw66lB7DuS5MdqdhdHBuX1euNPa9ges7DV2jN7XP+WarZYmnmg2wwvN4i/sWRF+uR4Ip4xbj/NXa/2dl5svdP3wrzS3Lv8QOfTtEr3DD0UtDKa8i8yp388=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205581; c=relaxed/simple;
	bh=vTn3zLlPxVg1Pun1wyDPHlryGpAPKbs6ILbCFEOhNUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+nLqA/S5fXN4P9NUArJGXe3sX065Sd99KMDDfL28S7ZxQ2/iOyLTzWEFa4dyrzH82B/eRrEym376kiW7knaS9kYtqEb0uu0bMzRNgSjaRxvoYwQQCG2I0oCxUuQ9bSE3DkC4fEW5UdxP4iyOqPiJROyt7D2dLBJ+VwNyj3bmbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WRsXuPus; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=obAohphv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WRsXuPus; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=obAohphv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WRsXuPus";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="obAohphv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WRsXuPus";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="obAohphv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CAEB5220D2;
	Mon, 17 Mar 2025 09:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ja/+Kzg3R5DydWGyat0nHpsJx5yiPl5rSjlPBbA4EUw=;
	b=WRsXuPusaNt5KnuIJQz/p4BwaB4EZfdPeZCkExBI5WNbrV82Vz8fO4CGCtDNFd1uX2SfE8
	ilW6L6tnRMqIWoVItNCo1xhxEz2om7oMa6eAiIBlsBEDPYrQNjYa6m5FYQHlIuC1fOsR1e
	vRO43uhA+hnFdg3Cwc/Fhw/STEhT6MQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ja/+Kzg3R5DydWGyat0nHpsJx5yiPl5rSjlPBbA4EUw=;
	b=obAohphv9oWyc6HADFAv07ZjP5Ol/Wr34zkNkzcgp7mSgfX/q1VRyBnrHZS/BEt3kUo2J8
	ZSg9uuwpyovXHGAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ja/+Kzg3R5DydWGyat0nHpsJx5yiPl5rSjlPBbA4EUw=;
	b=WRsXuPusaNt5KnuIJQz/p4BwaB4EZfdPeZCkExBI5WNbrV82Vz8fO4CGCtDNFd1uX2SfE8
	ilW6L6tnRMqIWoVItNCo1xhxEz2om7oMa6eAiIBlsBEDPYrQNjYa6m5FYQHlIuC1fOsR1e
	vRO43uhA+hnFdg3Cwc/Fhw/STEhT6MQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ja/+Kzg3R5DydWGyat0nHpsJx5yiPl5rSjlPBbA4EUw=;
	b=obAohphv9oWyc6HADFAv07ZjP5Ol/Wr34zkNkzcgp7mSgfX/q1VRyBnrHZS/BEt3kUo2J8
	ZSg9uuwpyovXHGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB700132CF;
	Mon, 17 Mar 2025 09:56:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qHiYKMnx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 71/88] ASoC: mediatek: mt8195: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:33 +0100
Message-ID: <20250317095603.20073-72-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 8016bfb35015..5d025ad72263 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3188,15 +3188,15 @@ static const struct of_device_id mt8195_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt8195_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt8195_afe_pm_ops = {
-	SET_RUNTIME_PM_OPS(mt8195_afe_runtime_suspend,
-			   mt8195_afe_runtime_resume, NULL)
+	RUNTIME_PM_OPS(mt8195_afe_runtime_suspend,
+		       mt8195_afe_runtime_resume, NULL)
 };
 
 static struct platform_driver mt8195_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt8195-audio",
 		   .of_match_table = mt8195_afe_pcm_dt_match,
-		   .pm = &mt8195_afe_pm_ops,
+		   .pm = pm_ptr(&mt8195_afe_pm_ops),
 	},
 	.probe = mt8195_afe_pcm_dev_probe,
 	.remove = mt8195_afe_pcm_dev_remove,
-- 
2.43.0

