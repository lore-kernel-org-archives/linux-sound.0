Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5B57442E
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159486; cv=none; b=N76jbl1hHTKe6pBOLdgAlQh6HCZtb0zLw4/aY/Osa2DHuhJXZK7OFomwCFII1E1UlcZLP9u4iF9m8J5PTH+Ehr2Rd4oFPdIERL/KcMwy1C0U5dNlvjv8yTBRx3AR0+kAOOr0KeBI7s35is4DqOektFUFkQoyqxrz3PSp/VVVIdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159486; c=relaxed/simple;
	bh=xxPodLwYBtAzISH/lrurk15T4C8APdC0Bsl27M/x568=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vme+8Yv84i05U4+Z85qjbPJMzIMaKBRTWDmUp7lWhptUZSfEDojApx7zbVLIPVbezIcrfWV/FNQtQXiTUeYW4y7E4bRHuf5Q7rUjvRJwqj/SNcdAa8+VEZ9+TyaLJfFDR7kvQPvINymH8b5kUpV9+kvHyDrFFxZL6ZI1YViBULg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GNBjVuFE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f1K2Yami; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GNBjVuFE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f1K2Yami; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GNBjVuFE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f1K2Yami";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GNBjVuFE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f1K2Yami"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1332022089;
	Wed,  8 May 2024 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pIaBNScw9oS7M2VO+UK/+g2TQJfVjUBt9UrYiX4JxM=;
	b=GNBjVuFEvvcrm8YnW2A9q4S/bn6BIV8mm/MeeVYocR2WvEnpRpbKHXaMD7KWJ34zdiMxUA
	bUKQYDm6O/I1vpCMpOIu4WYK25h7GaFH35LEZvQqX/xZfMbSkA5smUv4TeyrA8bPUzK/nJ
	/O84P89ciXSwoE5cy2V6YqQvU6TTUVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pIaBNScw9oS7M2VO+UK/+g2TQJfVjUBt9UrYiX4JxM=;
	b=f1K2YamiQo01BtBGr1IcCSDqTYeciVrhxv+4FYkQHlesvgHoJXzaIdk8YuixD2DNSP+Jl2
	iw7Y5rv+9fN1TBBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pIaBNScw9oS7M2VO+UK/+g2TQJfVjUBt9UrYiX4JxM=;
	b=GNBjVuFEvvcrm8YnW2A9q4S/bn6BIV8mm/MeeVYocR2WvEnpRpbKHXaMD7KWJ34zdiMxUA
	bUKQYDm6O/I1vpCMpOIu4WYK25h7GaFH35LEZvQqX/xZfMbSkA5smUv4TeyrA8bPUzK/nJ
	/O84P89ciXSwoE5cy2V6YqQvU6TTUVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pIaBNScw9oS7M2VO+UK/+g2TQJfVjUBt9UrYiX4JxM=;
	b=f1K2YamiQo01BtBGr1IcCSDqTYeciVrhxv+4FYkQHlesvgHoJXzaIdk8YuixD2DNSP+Jl2
	iw7Y5rv+9fN1TBBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEB5713A3D;
	Wed,  8 May 2024 09:11:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oEpENbVBO2YcFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:11:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 5/7] ALSA: pcmtest: Add missing module descriptions
Date: Wed,  8 May 2024 11:11:24 +0200
Message-ID: <20240508091128.25274-6-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.63 / 50.00];
	BAYES_HAM(-2.83)[99.25%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.63
X-Spam-Flag: NO

Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
let's add the missing information.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcmtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index b8bff5522bce..21cefaf5419a 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -772,6 +772,7 @@ static void __exit mod_exit(void)
 	platform_device_unregister(&pcmtst_pdev);
 }
 
+MODULE_DESCRIPTION("Virtual ALSA driver for PCM testing/fuzzing");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ivan Orlov");
 module_init(mod_init);
-- 
2.43.0

