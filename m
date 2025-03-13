Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20E1DC985
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741888004; cv=none; b=i5yUprAp93dSMs9QrCj4wVIe2OhcheQlgalffYWLz5f+FUgDnYMsCDruRFdTtMVDCzN6t2gyuxMhyrbIyOEKF/dCYSQp6aZ53v3SyWjyWR3+ONj4uKy462GaCdhClp2cg1/6XHw9hx45IReENqKM2wy1H15dTmeX9qyf2Wy96uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741888004; c=relaxed/simple;
	bh=i8XgxxUTBHf0STe7J/WS/0BMS5yuL42JssczC8QI7uI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9rsrchgvFMfQPhwYQaR4xGcLg6iFOZTE38/8AlI2YYLVQagw2BbGI/3dFGO0zbgxr7snqgE+m4vMV3WhLa1axy+LGGxB2LC+nbIr7kDYI8XmktVOKaOz+NZ4oEXJipKl8w/u5mzaFTnfAw/HUY7ELgBnQmjjevKiydn5IY3zF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QPI2X3A7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R0ZGMAXh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QPI2X3A7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R0ZGMAXh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QPI2X3A7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R0ZGMAXh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QPI2X3A7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R0ZGMAXh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6CCE2211FF;
	Thu, 13 Mar 2025 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGk43MJv2LL3ItCvgdJUy8nTcbmSzwSdCLlSswLFCtI=;
	b=QPI2X3A7HnKOtC3TA4s+zvJKYQL8V6KoMHLAWZ929LLs7PeWvT5U6Qp/z/ML4AIH59sucH
	LOcJ/CHAkymlnL9VYLyQtPG7okpMNApONhFjBGXgrGtA2CrozfOUTtf1E+JBaqibhxNBsZ
	G2PSN0p0eaBkwioVtxRvDT6fsIud/FM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGk43MJv2LL3ItCvgdJUy8nTcbmSzwSdCLlSswLFCtI=;
	b=R0ZGMAXh2mq9YCojVOuRuxywrePECRcRFj6WdU57G3WaNMrUTMIarPAzIPHvKSvc6RqfDm
	sboRxbnGLgW62aCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QPI2X3A7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R0ZGMAXh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGk43MJv2LL3ItCvgdJUy8nTcbmSzwSdCLlSswLFCtI=;
	b=QPI2X3A7HnKOtC3TA4s+zvJKYQL8V6KoMHLAWZ929LLs7PeWvT5U6Qp/z/ML4AIH59sucH
	LOcJ/CHAkymlnL9VYLyQtPG7okpMNApONhFjBGXgrGtA2CrozfOUTtf1E+JBaqibhxNBsZ
	G2PSN0p0eaBkwioVtxRvDT6fsIud/FM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGk43MJv2LL3ItCvgdJUy8nTcbmSzwSdCLlSswLFCtI=;
	b=R0ZGMAXh2mq9YCojVOuRuxywrePECRcRFj6WdU57G3WaNMrUTMIarPAzIPHvKSvc6RqfDm
	sboRxbnGLgW62aCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 486A1139D2;
	Thu, 13 Mar 2025 17:42:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AJ1rEPEY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 87/89] ASoC: xtensa: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:32 +0100
Message-ID: <20250313174139.29942-88-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6CCE2211FF
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/xtensa/xtfpga-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 4eaa9011405f..678ded059b95 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -629,8 +629,8 @@ MODULE_DEVICE_TABLE(of, xtfpga_i2s_of_match);
 #endif
 
 static const struct dev_pm_ops xtfpga_i2s_pm_ops = {
-	SET_RUNTIME_PM_OPS(xtfpga_i2s_runtime_suspend,
-			   xtfpga_i2s_runtime_resume, NULL)
+	RUNTIME_PM_OPS(xtfpga_i2s_runtime_suspend,
+		       xtfpga_i2s_runtime_resume, NULL)
 };
 
 static struct platform_driver xtfpga_i2s_driver = {
@@ -639,7 +639,7 @@ static struct platform_driver xtfpga_i2s_driver = {
 	.driver  = {
 		.name = "xtfpga-i2s",
 		.of_match_table = of_match_ptr(xtfpga_i2s_of_match),
-		.pm = &xtfpga_i2s_pm_ops,
+		.pm = pm_ptr(&xtfpga_i2s_pm_ops),
 	},
 };
 
-- 
2.43.0

