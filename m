Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF669472F76
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937995; cv=none; b=c+cMe5kNmmIEzcAzysTanphlXj9e+qr0+IJ4tWavtzXNfkGVmZ/ra9Z7fxYgEvK0It62PZR+idqz3D+zBN8PxdO+032BBnR2GElCl/BXEHrM0KmKh4x4MGtZJ0cGa7AiEb+goi1y+AZMYljRakEQ5U/DMe4M28vcrrK/hucRwAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937995; c=relaxed/simple;
	bh=WVs7CYtmve25x69d27AOPhH/S6cVg1pKxShn+HK9u9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agLnzY/bkN22NgesI57ppw05GwQn8liYy/knIeOXFZ7XiU7h6+Ah9h6WInmcQKl9bG0uOFsuW33zcw6aeQGdBkr9khIvfFvhy6hA7l5J2dcqOrPfNjPZjjXm428lnvgqMHgeoJBqizCi3dcN8+THq92FdE7tjkKp8XxJo3XMc/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RgJobtcw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4Ql8LwwN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v2+2RA9p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TYIe8iSY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RgJobtcw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Ql8LwwN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v2+2RA9p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TYIe8iSY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DC8E03DFA;
	Wed,  5 Aug 2026 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuO+MUy+1uRzX1DRrOuzF9dgijdfPNPED5OCI3l40Yc=;
	b=RgJobtcwZkfGUAvdrT8zd/GCRVGCL72fLYbaUJFFXBrVSdsTtJgsP+LaquTffRPpOaBtqj
	gwL7GgpusdRQq1vtZBG+A/JxIILQPsjXE50+q6JlgHimyOewMf5x8rIARe+x/Tl9G5J4y5
	HXY//aqWYbpWOwibF5IDXZQ8s5ZAy6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuO+MUy+1uRzX1DRrOuzF9dgijdfPNPED5OCI3l40Yc=;
	b=4Ql8LwwN0N+CJsdAtQ859320ls2PUmny+UeoUdOD/tviBx1mMf1b/Pt1LqSu7Q8Qv6kERb
	op5ILcj2QP7zVRDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuO+MUy+1uRzX1DRrOuzF9dgijdfPNPED5OCI3l40Yc=;
	b=v2+2RA9p4MaEt+Dnw0o6pikya4nf9ZclYIFHL0UJh11mteaxK3EdinBevTv/YcfHZeRKF0
	Zmi8kTRR0mmj2hb1ezQyhcEHd0eJo9gN8NzEG4JucYKfxCNPJWtkpT6nMVqFTj5uXKsjAS
	VkuTaMVkZY+4hPQ3NbKXpp+S6jVl6DY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuO+MUy+1uRzX1DRrOuzF9dgijdfPNPED5OCI3l40Yc=;
	b=TYIe8iSYNQvtgzhJ939egKOCrWO6cTmIfjHdoj/wtCfs5uyQFcyy2N1/YypArXmATI+Yjx
	nY+BY5XGY/uVGTAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A3D6779F0;
	Wed,  5 Aug 2026 13:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +CzVFDhAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Nick Li <nick.li@foursemi.com>
Subject: [PATCH 07/31] ASoC: fs-amp-lib: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:08 +0200
Message-ID: <20260805135247.670693-8-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Nick Li <nick.li@foursemi.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/fs-amp-lib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/fs-amp-lib.c b/sound/soc/codecs/fs-amp-lib.c
index c8f56617e370..a562c72fc524 100644
--- a/sound/soc/codecs/fs-amp-lib.c
+++ b/sound/soc/codecs/fs-amp-lib.c
@@ -221,7 +221,7 @@ static void fs_print_firmware_info(struct fs_amp_lib *amp_lib)
 
 int fs_amp_load_firmware(struct fs_amp_lib *amp_lib, const char *name)
 {
-	const struct firmware *cont;
+	const struct firmware *cont __free(firmware) = NULL;
 	struct fs_fwm_header *hdr;
 	int ret;
 
@@ -237,7 +237,6 @@ int fs_amp_load_firmware(struct fs_amp_lib *amp_lib, const char *name)
 	dev_info(amp_lib->dev, "Loading %s - size: %zu\n", name, cont->size);
 
 	hdr = devm_kmemdup(amp_lib->dev, cont->data, cont->size, GFP_KERNEL);
-	release_firmware(cont);
 	if (!hdr)
 		return -ENOMEM;
 
-- 
2.55.0

