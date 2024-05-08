Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4637D74424
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159945; cv=none; b=RxtmmRT/9deUw8gCcTy8WpNCAffD42F8z/H0berxzDq+pp6I6xIo7TFdBBNi5EwO5rFsZf50dnBNqGQ7AcEHR5/kAALqsO9l1gP0dh2GEDb9BucLB/PkxW72/DYp3NlIwvUmjjxV8SGDDQH/REXS1Cw7+SEet/P+JyXwS5J9g5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159945; c=relaxed/simple;
	bh=OrpKn4K+HbTMZNItSc2zx1kyygzzqMsRE0J5m0otJB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+hR5Yqi2aB8Qs7i5/Q0e/AF5v1eszQSymm6vGqHdZdSYPotWRzXdie9CT+7hRobIdNyaWxChFVGm1uP4i2lX1mcvKXu8XDFlGdg6Tf8whZpSk2JAVjrv2WvH3PSo0Ai9pflDrfvvRugg0dFwHY+EXvICCvzMjcv4P9chVxQf4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EIV3wmym; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JaRnoPrQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EIV3wmym; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JaRnoPrQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EIV3wmym";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JaRnoPrQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EIV3wmym";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JaRnoPrQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 842875C714;
	Wed,  8 May 2024 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjEoQV0/xwc345af8H0wegTFJA8L1fo8wxAAlpcyfPY=;
	b=EIV3wmymJriRVVmfbLs7S+jPm9fmhlBSEqkAES9y5og9xIusl19CYl4uHk/8QgfVS2sZCC
	Iiz0ZBXU/hszeXAWTr+4PG6ypo9z/s4rsYtC6NT6Nl0kuBA8zNS1IQDAVNFZ3PvwW5z/dz
	QFhykm9cy56/T2etEKuf4CTw8JiMEXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjEoQV0/xwc345af8H0wegTFJA8L1fo8wxAAlpcyfPY=;
	b=JaRnoPrQOYVSuXhS+BTVbYkAlMUpwVyGNqeQ9FJ56gNuquq84yLWb59keF5kO6MVXXvnOl
	X6nG/OUa5t58u+Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjEoQV0/xwc345af8H0wegTFJA8L1fo8wxAAlpcyfPY=;
	b=EIV3wmymJriRVVmfbLs7S+jPm9fmhlBSEqkAES9y5og9xIusl19CYl4uHk/8QgfVS2sZCC
	Iiz0ZBXU/hszeXAWTr+4PG6ypo9z/s4rsYtC6NT6Nl0kuBA8zNS1IQDAVNFZ3PvwW5z/dz
	QFhykm9cy56/T2etEKuf4CTw8JiMEXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjEoQV0/xwc345af8H0wegTFJA8L1fo8wxAAlpcyfPY=;
	b=JaRnoPrQOYVSuXhS+BTVbYkAlMUpwVyGNqeQ9FJ56gNuquq84yLWb59keF5kO6MVXXvnOl
	X6nG/OUa5t58u+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51BA913A27;
	Wed,  8 May 2024 09:19:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sO0xEoVDO2bFGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:19:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 6/7] ASoC: ux500: Add missing module description
Date: Wed,  8 May 2024 11:19:05 +0200
Message-ID: <20240508091909.27062-7-tiwai@suse.de>
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
 sound/soc/ux500/ux500_msp_dai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index cde0dd8e2569..3fd13e8dd110 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -820,4 +820,5 @@ static struct platform_driver msp_i2s_driver = {
 };
 module_platform_driver(msp_i2s_driver);
 
+MODULE_DESCRIPTION("ASoC Ux500 I2S driver");
 MODULE_LICENSE("GPL v2");
-- 
2.43.0

