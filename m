Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9661552EB
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885667; cv=none; b=YrpnHfva4nOTrFsw2tqjkDfDmvefBEs4kwsRrKKfgyrk5+1j4+a7JA+NoMLzzJU8fxAYw5cAVdKivf3nQ3GOFwjNYX+h2xW1JsdU56QjTVqcQPF6YK/F0UQ0+9cBaRr9xBmLNW+IkzFN+i8dE2ayhfu12+P0leB5uPJK0Lyzf3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885667; c=relaxed/simple;
	bh=DN2WNxJQi3mwZcFRkYgYDHAwiy6eEnjrKyQOzMsXApo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jd/Ov7K7PxNGUherx75VmKyckiYR7DqzuwWoSC3TQfj0UbP1PjA2AoV7oMy7ckUG3JGCpj5j/wLnKhg7hfgPSdprQq5EMOrraDvQQT6SzcqQ38XwH9NEWHgTrKaS3FiLnkSuTR9bvEIc/OMKa+GI8wl/yKpa6nTBuWVlgYLPEqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xhOZ9UvS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jnApzyTT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xhOZ9UvS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jnApzyTT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xhOZ9UvS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jnApzyTT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xhOZ9UvS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jnApzyTT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4FCDC1F76B;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLCIgmURgEbP6zwj6aMCg/Te9dyi+yrjpoT0SiUH7ek=;
	b=xhOZ9UvSrQF6wqK7H3S/Tzc4xUnX/z/mlTMgieq4c0yJjfPPv+iU3Dg4c6Ie9h1lKaLhLf
	jv2BzfxA3wL+yuJ870JGrq3yos8EyRmtYnEYVCoSFXZjuLffXGpJsZpDcUILDch3KMVPYk
	gFgsqFd3CH18eGeF2ozypyrWvkxLBqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLCIgmURgEbP6zwj6aMCg/Te9dyi+yrjpoT0SiUH7ek=;
	b=jnApzyTTUMJwpNwdowgc5VSyXd3WHZUZs+SeojBCQUZvYKvY16xf5HCXtOmZxpYmy68fvS
	SPYf0wvmaAvASKCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xhOZ9UvS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jnApzyTT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLCIgmURgEbP6zwj6aMCg/Te9dyi+yrjpoT0SiUH7ek=;
	b=xhOZ9UvSrQF6wqK7H3S/Tzc4xUnX/z/mlTMgieq4c0yJjfPPv+iU3Dg4c6Ie9h1lKaLhLf
	jv2BzfxA3wL+yuJ870JGrq3yos8EyRmtYnEYVCoSFXZjuLffXGpJsZpDcUILDch3KMVPYk
	gFgsqFd3CH18eGeF2ozypyrWvkxLBqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLCIgmURgEbP6zwj6aMCg/Te9dyi+yrjpoT0SiUH7ek=;
	b=jnApzyTTUMJwpNwdowgc5VSyXd3WHZUZs+SeojBCQUZvYKvY16xf5HCXtOmZxpYmy68fvS
	SPYf0wvmaAvASKCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3506C13A24;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OA7CC9gQ02ciOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:07:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/9] ALSA: atmel: Convert to DEFINE_SIMPLE_DEV_PM_OPS() macro
Date: Thu, 13 Mar 2025 18:07:20 +0100
Message-ID: <20250313170731.26943-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313170731.26943-1-tiwai@suse.de>
References: <20250313170731.26943-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4FCDC1F76B
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer DEFINE_SIMPLE_DEV_PM_OPS() macro instead of
SIMPLE_DEV_PM_OPS() together with pm_ptr(), which makes
CONFIG_PM_SLEEP ifdefs superfluous.

Merely a cleanup, there should be no actual code change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/atmel/ac97c.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index d8f8e08f1bb7..84e264f335ca 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -817,7 +817,6 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	return retval;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int atmel_ac97c_suspend(struct device *pdev)
 {
 	struct snd_card *card = dev_get_drvdata(pdev);
@@ -836,11 +835,7 @@ static int atmel_ac97c_resume(struct device *pdev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(atmel_ac97c_pm, atmel_ac97c_suspend, atmel_ac97c_resume);
-#define ATMEL_AC97C_PM_OPS	&atmel_ac97c_pm
-#else
-#define ATMEL_AC97C_PM_OPS	NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(atmel_ac97c_pm, atmel_ac97c_suspend, atmel_ac97c_resume);
 
 static void atmel_ac97c_remove(struct platform_device *pdev)
 {
@@ -864,7 +859,7 @@ static struct platform_driver atmel_ac97c_driver = {
 	.remove		= atmel_ac97c_remove,
 	.driver		= {
 		.name	= "atmel_ac97c",
-		.pm	= ATMEL_AC97C_PM_OPS,
+		.pm	= pm_ptr(&atmel_ac97c_pm),
 		.of_match_table = atmel_ac97c_dt_ids,
 	},
 };
-- 
2.43.0

