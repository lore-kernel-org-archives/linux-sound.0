Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8805974402
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159481; cv=none; b=JIALGRs9fmT9UlC6hyHA0BTgOIGkmXHSHW9QZMJ77Zl2D//9fIcZFyjucLEddL40yWroNNl2y+wV8o8xj9EEWlOJz7f5nonfkUc5idFNLv/DWYrVdqfpw45C5vbbyqh8e+jpmhr5FDV1SH8Z8Z9PdTQHwXHMecWvZTmRc+6E2EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159481; c=relaxed/simple;
	bh=aXyNXmiLcOtdgmZzMX802blV3FIVmHzap05IuKFFgyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r21P7YvxK9VAX0ffrEth9oyulK7acdVmPh2H/KtQ1e0kJ/eq0ErN68+bxWu3FAkMPn2PlsJ83vf9uSIcmCvpPjxClU/uA/S5uT+xC7sYcFTTrJU+TARlqsMwT4j/iuWbcqq2J6CDIBW2F1al42yqrVMzmvEhqWrv+z6RGwFfhyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yE097U9l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8BA7/5N/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yE097U9l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8BA7/5N/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yE097U9l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8BA7/5N/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yE097U9l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8BA7/5N/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D88605C6FA;
	Wed,  8 May 2024 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F3VfaCKPzytzQKOcXRcgf2TId2IsuAsQQ++N11vIlZM=;
	b=yE097U9lPZ+Y0YMYaWG8uZK3E+rLfKxRGEuwVq3LkvGD/po25spNuZJ2q76doNkURqGO3u
	G0mm3ZYltJq4acwp9N92xckn0Y/aDAdpqc0XKgOy8oXwoc4/UyZqO952km2dPTjc7Gp0Ce
	tiJGFRz7k1gFzsQsAAKI9940HymWVIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F3VfaCKPzytzQKOcXRcgf2TId2IsuAsQQ++N11vIlZM=;
	b=8BA7/5N/yiaaS/Yn/Xhv+BjJoKisMfoqf3QYzWpJao6r+yi5MtCCKnEjteKEciI0f3WGBt
	6NrvqKRbeMX9MUAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F3VfaCKPzytzQKOcXRcgf2TId2IsuAsQQ++N11vIlZM=;
	b=yE097U9lPZ+Y0YMYaWG8uZK3E+rLfKxRGEuwVq3LkvGD/po25spNuZJ2q76doNkURqGO3u
	G0mm3ZYltJq4acwp9N92xckn0Y/aDAdpqc0XKgOy8oXwoc4/UyZqO952km2dPTjc7Gp0Ce
	tiJGFRz7k1gFzsQsAAKI9940HymWVIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F3VfaCKPzytzQKOcXRcgf2TId2IsuAsQQ++N11vIlZM=;
	b=8BA7/5N/yiaaS/Yn/Xhv+BjJoKisMfoqf3QYzWpJao6r+yi5MtCCKnEjteKEciI0f3WGBt
	6NrvqKRbeMX9MUAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE75713A27;
	Wed,  8 May 2024 09:11:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MNZcKbVBO2YcFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:11:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 4/7] ALSA: kunit: Add missing module descriptions
Date: Wed,  8 May 2024 11:11:23 +0200
Message-ID: <20240508091128.25274-5-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508091128.25274-1-tiwai@suse.de>
References: <20240508091128.25274-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[]

Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
let's add the missing information.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/sound_kunit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/sound_kunit.c b/sound/core/sound_kunit.c
index 165bd0f5338a..bfed1a25fc8f 100644
--- a/sound/core/sound_kunit.c
+++ b/sound/core/sound_kunit.c
@@ -308,5 +308,6 @@ static struct kunit_suite sound_utils_suite = {
 };
 
 kunit_test_suite(sound_utils_suite);
+MODULE_DESCRIPTION("Sound core KUnit test");
 MODULE_AUTHOR("Ivan Orlov");
 MODULE_LICENSE("GPL");
-- 
2.43.0

