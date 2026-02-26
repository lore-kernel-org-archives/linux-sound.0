Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F726410D29
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120678; cv=none; b=UrpkToeAfQgCRE68LXLJpiHY/dge/K81L/6SdlZUYDoNynXMNSMlcMqR5SznVEsPldGaCfmXoQ/eGXNh+zLrvKfNqAHp0OdTUh6psmSTPcUEjUpQPQ9vOphmJUbGw/6v3hHBhCTuuXCVRMAAkARwl3F6F6P4FjUf/fjCc2EPWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120678; c=relaxed/simple;
	bh=GT0U6WeK0Q3W1eRSkwKfmSspq0Txr+Rf1YxZId2CyUI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZjjAdCpnWrNmjXhyNpF5A1JU8LqFSLmzdXf6gcLVvep+H1vBckcVyay+7ta+DGyEWS6RNGZdGg/qJQL5bSvGU1gObYDpsmnxws7Y71LPpY1VcsDzPCyhaqDEpY/SnqjGKe0SR52H3HbbXi7AntllVz9rkjwKfxBWwkAM17uOXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qdt9aU6/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K+ZHCmMw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qdt9aU6/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K+ZHCmMw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qdt9aU6/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K+ZHCmMw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qdt9aU6/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K+ZHCmMw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 28F421FA9C;
	Thu, 26 Feb 2026 15:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFjicT8+4OjWCusYB3v2bELqGHuYwXaGp3FcuGDOygo=;
	b=Qdt9aU6/s9IMU+mkRfwfm84PTEJYj894ydm5LfTtrWJyyR8sKn92KFJk2Ovl148n5aqRO1
	/7kLzLzoOz91PLCrRMWC/wjTxy7HD64YFhapxliwYPLhjwtvIM6s7s6eXPIbYLXj7Qmg8G
	56LnBHJPHvlq3Xy+Ffc+PeOT+g5CdBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFjicT8+4OjWCusYB3v2bELqGHuYwXaGp3FcuGDOygo=;
	b=K+ZHCmMwsS67Nt5eOk5c5yWYCC8IaSkGkbSy9Q8FcLJXCzTshec9gdWvcK7Ty/k58gGigC
	MBKVevJUR6hVwECA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFjicT8+4OjWCusYB3v2bELqGHuYwXaGp3FcuGDOygo=;
	b=Qdt9aU6/s9IMU+mkRfwfm84PTEJYj894ydm5LfTtrWJyyR8sKn92KFJk2Ovl148n5aqRO1
	/7kLzLzoOz91PLCrRMWC/wjTxy7HD64YFhapxliwYPLhjwtvIM6s7s6eXPIbYLXj7Qmg8G
	56LnBHJPHvlq3Xy+Ffc+PeOT+g5CdBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFjicT8+4OjWCusYB3v2bELqGHuYwXaGp3FcuGDOygo=;
	b=K+ZHCmMwsS67Nt5eOk5c5yWYCC8IaSkGkbSy9Q8FcLJXCzTshec9gdWvcK7Ty/k58gGigC
	MBKVevJUR6hVwECA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C98A3EA6B;
	Thu, 26 Feb 2026 15:44:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yPfoAVJqoGnMawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 15:44:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/4] ASoC: SDCA: Fix comments for sdca_irq_request()
Date: Thu, 26 Feb 2026 16:43:50 +0100
Message-ID: <20260226154414.1081568-5-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226154414.1081568-1-tiwai@suse.de>
References: <20260226154414.1081568-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
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

