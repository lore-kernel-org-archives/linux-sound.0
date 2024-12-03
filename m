Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427541F4274
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235516; cv=none; b=S0ozTUW7pepkHRef1IBOgqDhFiTFDBzArptXmYvU7x7+21KkVanWtziC73A76/OAXg2+Kcncx7Lke+bJAGYndx41VKJZ2ldFvJlioF6uNOdVJz0BBs2VG19cJeUetToTwrx8RFtl9SOrW9a841PRpVu7ZpT1V9jRBJan8R2afY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235516; c=relaxed/simple;
	bh=YztdrWnIgnKsREHPsuo9b9KQLmMKPzQ5A5VID9lDSK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5ZiGvyGg+cmTfFpGsa1ITCsyB6WzSlYu0Dr5A4UyXKfsP5fATZwRmPIKCC6l4pXt8GhBh+DRQC7eE2a/fa4vds9xUdpvXBBtputUgxYbrQWskkq6UZ0UxLpBz8XRsOdTFvB5yJTm5VG4dRLmX2ZnF37mpQKwei5SjzysyMj1ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lPk0p5gC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wHvz+djG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lPk0p5gC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wHvz+djG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lPk0p5gC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wHvz+djG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lPk0p5gC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wHvz+djG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C296C1F453;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q92DFTUhCSpTbGdKqoVxyGSFTDp1d+MJ+S0M7/J400A=;
	b=lPk0p5gCNsvTpy3HJz2RjSV8vsNKG/JNAhS3yePyINGZwfFLpZ1ezdP/iXF4ZzsjxBDLna
	lwUh9ONKLy8ogNq137PnTJEp2sc+L0sQgNQQq5WEaHGuxZMjA7WddYIZcePPAT5fJhbgqr
	lzOvN3yla6iImYpw/dVGNSS4D/lr6kY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q92DFTUhCSpTbGdKqoVxyGSFTDp1d+MJ+S0M7/J400A=;
	b=wHvz+djGckGjrgG7cIMxHdxZhlPo/egSewu4242cEHi66shvKO2BXtJBsUxLp8vPk7jRmH
	LPchCAk9rQrAs4Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q92DFTUhCSpTbGdKqoVxyGSFTDp1d+MJ+S0M7/J400A=;
	b=lPk0p5gCNsvTpy3HJz2RjSV8vsNKG/JNAhS3yePyINGZwfFLpZ1ezdP/iXF4ZzsjxBDLna
	lwUh9ONKLy8ogNq137PnTJEp2sc+L0sQgNQQq5WEaHGuxZMjA7WddYIZcePPAT5fJhbgqr
	lzOvN3yla6iImYpw/dVGNSS4D/lr6kY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q92DFTUhCSpTbGdKqoVxyGSFTDp1d+MJ+S0M7/J400A=;
	b=wHvz+djGckGjrgG7cIMxHdxZhlPo/egSewu4242cEHi66shvKO2BXtJBsUxLp8vPk7jRmH
	LPchCAk9rQrAs4Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5F1113A15;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KHf8JzgTT2etMAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Dec 2024 14:18:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 3/5] ASoC: SDCA: Use *-y for Makefile
Date: Tue,  3 Dec 2024 15:18:18 +0100
Message-ID: <20241203141823.22393-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203141823.22393-1-tiwai@suse.de>
References: <20241203141823.22393-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

We should use *-y instead of *-objs in Makefile for the module
objects.  *-objs is used rather for host programs.

Fixes: 3a513da1ae33 ("ASoC: SDCA: add initial module")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sdca/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index c296bd5a0a7c..5d1ddbbfbf62 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-sdca-objs	:= sdca_functions.o sdca_device.o
+snd-soc-sdca-y	:= sdca_functions.o sdca_device.o
 
 obj-$(CONFIG_SND_SOC_SDCA)	+= snd-soc-sdca.o
-- 
2.43.0

