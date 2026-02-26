Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FB84279F6
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120883; cv=none; b=W5klcIc9Wq5koeq7k57BV2UAg2Z/QRNM0aySEkXhzwawxlKujHCUZOpZq9KnnkZyPHL9811SSJgtdBMNWF79GEuht9vThTNpgKFo1cFHcdPo33ZYnCsrdOivJY4DWk0NGn+S1MFZXL4lfpiGpq1SFnvjKFsHqsUauKHRZn0/2AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120883; c=relaxed/simple;
	bh=GT0U6WeK0Q3W1eRSkwKfmSspq0Txr+Rf1YxZId2CyUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gHrHeKlQLkDVcDIAhIGHsnwt7oybZ7VhR05kgSWb9v2mm01OYwHd6Uefd6Ei5AUGzzd5x2o4ZTJvUAIqHF561f0b8BWz+H4t+L4Zthp6maO61B0au5QZOc/ByR6yqyikXKbugJlThhBAhMtrqdWDFcAWYXN01J73dnrzX8LvUTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yROect2r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ORE+xB4X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yROect2r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ORE+xB4X; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yROect2r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ORE+xB4X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yROect2r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ORE+xB4X"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 133A44D30E;
	Thu, 26 Feb 2026 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TFjicT8+4OjWCusYB3v2bELqGHuYwXaGp3FcuGDOygo=;
	b=yROect2rMYU1vIFrcIWzVqt+tRt4xR/SBOlvmDIQ6orTYRAnRmxqtBnw6FtNUJ63UHF/WD
	SpWtTvG4wuYq1sWm/zWXJsrBDGhp/hLKBq+yjZxajvJ0RodzLKPHVw0vtKpQRawzwpI575
	7GV1pGq0Bi9TgfbZvDo5p7Pxs8V4ilo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TFjicT8+4OjWCusYB3v2bELqGHuYwXaGp3FcuGDOygo=;
	b=ORE+xB4Xc+gXPzalTANg3eaM9CWTdm7AH/2We8bt8uTGPfQw7z8RLavQ2yNopHA1pmw/vP
	BfOut3S7ZLW+ANAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TFjicT8+4OjWCusYB3v2bELqGHuYwXaGp3FcuGDOygo=;
	b=yROect2rMYU1vIFrcIWzVqt+tRt4xR/SBOlvmDIQ6orTYRAnRmxqtBnw6FtNUJ63UHF/WD
	SpWtTvG4wuYq1sWm/zWXJsrBDGhp/hLKBq+yjZxajvJ0RodzLKPHVw0vtKpQRawzwpI575
	7GV1pGq0Bi9TgfbZvDo5p7Pxs8V4ilo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TFjicT8+4OjWCusYB3v2bELqGHuYwXaGp3FcuGDOygo=;
	b=ORE+xB4Xc+gXPzalTANg3eaM9CWTdm7AH/2We8bt8uTGPfQw7z8RLavQ2yNopHA1pmw/vP
	BfOut3S7ZLW+ANAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8A6B3EA62;
	Thu, 26 Feb 2026 15:47:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id d1yNMytroGkacAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 15:47:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Fix comments for sdca_irq_request()
Date: Thu, 26 Feb 2026 16:47:52 +0100
Message-ID: <20260226154753.1083320-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

The kernel-doc comments for sdca_irq_request() contained some typos
that lead to build warnings with W=1.  Let's correct them.

Fixes: b126394d9ec6 ("ASoC: SDCA: Generic interrupt support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sdca/sdca_interrupts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index d9e22cf40f77..95b1ab4ba1b0 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -265,9 +265,9 @@ static int sdca_irq_request_locked(struct device *dev,
 }
 
 /**
- * sdca_request_irq - request an individual SDCA interrupt
+ * sdca_irq_request - request an individual SDCA interrupt
  * @dev: Pointer to the struct device against which things should be allocated.
- * @interrupt_info: Pointer to the interrupt information structure.
+ * @info: Pointer to the interrupt information structure.
  * @sdca_irq: SDCA interrupt position.
  * @name: Name to be given to the IRQ.
  * @handler: A callback thread function to be called for the IRQ.
-- 
2.53.0

