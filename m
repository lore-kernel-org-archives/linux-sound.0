Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAD722DF94
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205551; cv=none; b=lfnIzOw7obYsd0FYor1OPLJSzu6H1A2eu19JDAsS9qqwppCd8jGMX7qhu4+C3UvsBJaOc7D44HaPihgnicu43Z3xSwGB7LIDt08iQt91nwsx2T9F3nfWZDbOwrr6XFaC6b0j3Z+fugiA/hMpZQaotd0pPBU9jI2aT5DiDkUUrXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205551; c=relaxed/simple;
	bh=nJP7mPfg3vrsEit8HXXIcQYIbL6PXIzfZ1aVAEMSxcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndEEuJT8gQxNFzWWI2cxtjGqxllebM68ViS9CeP0Pf+G1KiRit1pV+Xcp2Vcfsjv/uuxZpi4HDcLB3yv0z+tvEfyVklAejq3U2IgJwS9oK46FB+DDIx4+hBkd18vQyeej7ejf9o+eYjeRo9N41YxIt7peki54qVrgGSAry0bjBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NBYSHR7I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q7QW9RGj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NBYSHR7I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q7QW9RGj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NBYSHR7I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q7QW9RGj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NBYSHR7I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q7QW9RGj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C52722080;
	Mon, 17 Mar 2025 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vu3EeT4E6q+UAR4EwSSPaFn0r6G5kUkIz3QytbgkCfk=;
	b=NBYSHR7Iqv6QRGIAZCCwuVGjYa8tm64Y6J1YczaDFFjAcw3G/6twNBFve3ZH5B11zPpQX1
	84jBYUywFUY+voXFawzGxqFgFhRNsODF8USaZbmQ/cBf3C18HSKiE8wIXteYrP/M8iMIpz
	NvAOpb9yy3m/ViWIzyQPvCwxWcxjD3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205384;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vu3EeT4E6q+UAR4EwSSPaFn0r6G5kUkIz3QytbgkCfk=;
	b=q7QW9RGjGz3mmtZencseONUco35jrYkEm6IeNjhSx9JMa0kbYzS70GZtYHWtT32dALR35M
	tVcl1MdDYzBc7SAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vu3EeT4E6q+UAR4EwSSPaFn0r6G5kUkIz3QytbgkCfk=;
	b=NBYSHR7Iqv6QRGIAZCCwuVGjYa8tm64Y6J1YczaDFFjAcw3G/6twNBFve3ZH5B11zPpQX1
	84jBYUywFUY+voXFawzGxqFgFhRNsODF8USaZbmQ/cBf3C18HSKiE8wIXteYrP/M8iMIpz
	NvAOpb9yy3m/ViWIzyQPvCwxWcxjD3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205384;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vu3EeT4E6q+UAR4EwSSPaFn0r6G5kUkIz3QytbgkCfk=;
	b=q7QW9RGjGz3mmtZencseONUco35jrYkEm6IeNjhSx9JMa0kbYzS70GZtYHWtT32dALR35M
	tVcl1MdDYzBc7SAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B8B513A2C;
	Mon, 17 Mar 2025 09:56:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aN7lFMjx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 63/88] ASoC: mediatek: mt2701: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:25 +0100
Message-ID: <20250317095603.20073-64-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
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

