Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEE64749FA
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938004; cv=none; b=lAnyFAMX5lM/aPplzwwTZBxb1A0rk6Wq3C9xTWBwJWkCK+gqWljokCsVXd7l8RaxrUpiGfIzMvtDfGgA0PXJAn3naesj8thifhXwpLgJvDtxx41MlxAre/+tRO8l6I4QkagZQmOicIURUWTFdonIBCqsH+81Uf7z0h+r9f3Plt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938004; c=relaxed/simple;
	bh=Bu1ghSCPHI5Zpr21WAs4ahvZres8/CU7go3RBIrzhaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4wMF9FJLln6JRuIvBOSdaIdzL7VqaxltPT79waOI0QuZZNWJYnKAYyXYx+4cz3C1eBFTnQKD7roq+a5mL+1XwIhhYYUcs7bvV4ewzEKKXlXjoCTFzwxgwA0T02LiNA3KGd2oJEiv+jTvbtzBjRRjmq+fS/zQJWyET+X1z1Dj+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RQzKzMSE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HTdBVcjI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gnSE7Wmw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=key/SfRc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RQzKzMSE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HTdBVcjI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gnSE7Wmw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="key/SfRc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 35E697F03A;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVY9Z+vs7piGW/Bbbssix+RHmrUJrbKHw9kH3kp1WiI=;
	b=RQzKzMSEixP8qXEOQGL87q1VB3f7MwYCjrsdKEfMH1IWyrScId253JEyVSQbkKSkLy4s3F
	HupVj0k6aW+OIA6tv8O3zJ5lrVcP9kGn3DkONi+eeeFfoyjTRhJvjWcqft3ozzSDQKq8gU
	0M4iWxm5ek8AmebCow7l5eKmdJe3EDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVY9Z+vs7piGW/Bbbssix+RHmrUJrbKHw9kH3kp1WiI=;
	b=HTdBVcjILIOI6u2ql6bZ1WE1KJSgslHecQPQw/aw6XeXPS/+Ilcx13s3a8Fp1Lq4mdIomR
	aNZ/KNv4uXiTU/Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gnSE7Wmw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="key/SfRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVY9Z+vs7piGW/Bbbssix+RHmrUJrbKHw9kH3kp1WiI=;
	b=gnSE7Wmw+Z2d23Ej3uq23hm7tIwfmL7OpIlxvV9l2VVPXwTkoWkrJ6DSjEIkmgThKYI+eJ
	Yscq+g5Y9H4EBvBmRSbXqWgHvbnwxxSEA4kbsKiY/paLp9HYQ3z/d/+HrF1lpKrMfD60bR
	iD8sm5Y8REyvFgCfmBdiUxA6yrwZCCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVY9Z+vs7piGW/Bbbssix+RHmrUJrbKHw9kH3kp1WiI=;
	b=key/SfRcUFeLymmBGqYf73oNrw4N+eCNfVA+Cj+XWpZ53jLZItWHOwDjSBMktOycL6bJvx
	SwXBQzJYP5A0WbCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 982C4779F8;
	Wed,  5 Aug 2026 13:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ADjvIzlAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 15/31] ASoC: rt5677: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:16 +0200
Message-ID: <20260805135247.670693-16-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email,suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 35E697F03A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt5677.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 3e4d1dbce740..4757017cc83d 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -849,11 +849,11 @@ static int rt5677_parse_and_load_dsp(struct rt5677_priv *rt5677, const u8 *buf,
 
 static int rt5677_load_dsp_from_file(struct rt5677_priv *rt5677)
 {
-	const struct firmware *fwp;
 	struct device *dev = rt5677->component->dev;
-	int ret = 0;
+	int ret;
 
 	/* Load dsp firmware from rt5677_elf_vad file */
+	const struct firmware *fwp __free(firmware) = NULL;
 	ret = request_firmware(&fwp, "rt5677_elf_vad", dev);
 	if (ret) {
 		dev_err(dev, "Request rt5677_elf_vad failed %d\n", ret);
@@ -861,9 +861,7 @@ static int rt5677_load_dsp_from_file(struct rt5677_priv *rt5677)
 	}
 	dev_info(dev, "Requested rt5677_elf_vad (%zu)\n", fwp->size);
 
-	ret = rt5677_parse_and_load_dsp(rt5677, fwp->data, fwp->size);
-	release_firmware(fwp);
-	return ret;
+	return rt5677_parse_and_load_dsp(rt5677, fwp->data, fwp->size);
 }
 
 static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
-- 
2.55.0

