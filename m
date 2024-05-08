Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA78C74419
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159945; cv=none; b=ojDbru5+2s9WeET3yy15WFZOcpYVjk+DDXVjxQjg7x/pkgxOc49zRntTf7Dxn9C2+JOR2nV+n1hLveNb0l2BaGriI5eUdn/u1AIQZLxD7ZmSEYoFEePLQ3NE841Pzpcv8MJW189ZCyO9RavnYFgyoNHT+jqN+WQ3s7j19AAMCqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159945; c=relaxed/simple;
	bh=Y0efM1+qHEJfC4OddC8BrxDHBvmcl5W9PsvtNvgefvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bW0dk48sPN28q6UhRT1AYvE4pvmnR4oCrCwvdwtnxh4aLI6gGT0GVLSdxH+JZoKLRvj4j8Kmatw8gT9JJUv40W7kG/X7SYuqaE8LLlrEOxvS2DjhkwAj/ic9sF0nNw/zxrz4C2fd3fWaQfnbrThvrBhi0JRVU2Ut73Kb0tAp7T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k6i9gNOR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eui3YB5C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k6i9gNOR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eui3YB5C; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k6i9gNOR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eui3YB5C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k6i9gNOR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eui3YB5C"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 12CD034E9F;
	Wed,  8 May 2024 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yVI5xZqOQVocOJ97DEMMQ1Y+WSI5sn+yHzDIRPz6Rr4=;
	b=k6i9gNORmCLb7uyZB8PBVNh+Nb6xexSTxD5Y54n+nKtS5PekEo47nbSsR7ibMwSISjFcXy
	O9evi9k8qnZgdoolqw1KXvAVBQ3bj5Fw8Lwi3hdFOehiebMVJvIjnS10GjYW9VMxr/jiXn
	YErECO9mx1J02wJecAWAHUUnne54r/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yVI5xZqOQVocOJ97DEMMQ1Y+WSI5sn+yHzDIRPz6Rr4=;
	b=eui3YB5C6W9kVDAhzSrBT975SKLd33ygHK3a1r3J7/ddawzH/zTJKL//L4lqKaET3e+Lp7
	F5kQF5cNSG11pwCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yVI5xZqOQVocOJ97DEMMQ1Y+WSI5sn+yHzDIRPz6Rr4=;
	b=k6i9gNORmCLb7uyZB8PBVNh+Nb6xexSTxD5Y54n+nKtS5PekEo47nbSsR7ibMwSISjFcXy
	O9evi9k8qnZgdoolqw1KXvAVBQ3bj5Fw8Lwi3hdFOehiebMVJvIjnS10GjYW9VMxr/jiXn
	YErECO9mx1J02wJecAWAHUUnne54r/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yVI5xZqOQVocOJ97DEMMQ1Y+WSI5sn+yHzDIRPz6Rr4=;
	b=eui3YB5C6W9kVDAhzSrBT975SKLd33ygHK3a1r3J7/ddawzH/zTJKL//L4lqKaET3e+Lp7
	F5kQF5cNSG11pwCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8FD013A27;
	Wed,  8 May 2024 09:19:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OGOpM4RDO2bFGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:19:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 4/7] ASoC: dmaengine: Add missing module description
Date: Wed,  8 May 2024 11:19:03 +0200
Message-ID: <20240508091909.27062-5-tiwai@suse.de>
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
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
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
 sound/soc/soc-generic-dmaengine-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 092ca09f3631..c29082eea09f 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -491,4 +491,5 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_unregister);
 
+MODULE_DESCRIPTION("ASoC helpers for generic PCM dmaengine API");
 MODULE_LICENSE("GPL");
-- 
2.43.0

