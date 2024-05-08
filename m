Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787F474418
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159944; cv=none; b=ECfd8BPbJbTHLsgLB5BiCdb4+K2x0Xez0xVmdkeD0LFftWa/pJ9ZQ5kcxlByuCMCLnHju6i3ECDJK+/7KmFOHhsPKh60CToJMB+pgFr48131hN3QWMBo8Hefj5bcchQSGAR2yNsZXb8Cj4xVa/MUB8LMQfKOqb7nM+qInWGRc1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159944; c=relaxed/simple;
	bh=vnt6Kvo44tR5gz8yXtEBX6ZL6pgwj47kXmlSKnOn2M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxRvCi4FggIJTIJmH+cubI1XUhQ1SPNJnWKH7CoznV4GTLKZzufGIE8gwqGvBc47paR1LShScrwpe5ztFpuZK7D417M+Ad229ag8f2zwsBJqusWrrIdjDvFcD8Mvlr0MDAqsMc9icdJUfb+MGnfgiSS0Fc5bOWKwlBpUas/TNBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1QVM05w+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g7QKVXiG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1QVM05w+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g7QKVXiG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1QVM05w+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g7QKVXiG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1QVM05w+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g7QKVXiG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A486B34E9C;
	Wed,  8 May 2024 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLyeEQWmj0K66YiKcca9mNq3pKw7GaEyEY29r91p/Hw=;
	b=1QVM05w+7H1C+X1M67XsPyNwjjb6JmXa/51zfkQDh2+pLT3NdLqzHG0xEVSIlyuwpZQGRj
	PyNzpojOzx4gx9sNQd4NkOh0feB+XYjpNmWDA5VaVxXNEoKXmOPqXtDJlbv4OCWdTQbFBM
	VxLDzX1zbyivaHdHAQTLlyw1n60ZHHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLyeEQWmj0K66YiKcca9mNq3pKw7GaEyEY29r91p/Hw=;
	b=g7QKVXiGxgGqroMn/zwv8QRYsp983fIA/hqBnnwy8paGiTpUbZzajrFd/RJiFoJNDhvqTC
	X4YFj/azxXe52PCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLyeEQWmj0K66YiKcca9mNq3pKw7GaEyEY29r91p/Hw=;
	b=1QVM05w+7H1C+X1M67XsPyNwjjb6JmXa/51zfkQDh2+pLT3NdLqzHG0xEVSIlyuwpZQGRj
	PyNzpojOzx4gx9sNQd4NkOh0feB+XYjpNmWDA5VaVxXNEoKXmOPqXtDJlbv4OCWdTQbFBM
	VxLDzX1zbyivaHdHAQTLlyw1n60ZHHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLyeEQWmj0K66YiKcca9mNq3pKw7GaEyEY29r91p/Hw=;
	b=g7QKVXiGxgGqroMn/zwv8QRYsp983fIA/hqBnnwy8paGiTpUbZzajrFd/RJiFoJNDhvqTC
	X4YFj/azxXe52PCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 713B613A27;
	Wed,  8 May 2024 09:19:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GDJVGoRDO2bFGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:19:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 2/7] ASoC: sigmadsp: Add missing module description
Date: Wed,  8 May 2024 11:19:01 +0200
Message-ID: <20240508091909.27062-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508091909.27062-1-tiwai@suse.de>
References: <20240508091909.27062-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.78
X-Spam-Level: 
X-Spamd-Result: default: False [-6.78 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.98)[99.89%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]

Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
let's add the missing information.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/sigmadsp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 56546e2394ab..201f74e3a7ae 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -805,4 +805,5 @@ int sigmadsp_restrict_params(struct sigmadsp *sigmadsp,
 }
 EXPORT_SYMBOL_GPL(sigmadsp_restrict_params);
 
+MODULE_DESCRIPTION("Analog Devices SigmaStudio firmware helpers");
 MODULE_LICENSE("GPL");
-- 
2.43.0

