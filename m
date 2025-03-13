Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E7718F2FC
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887766; cv=none; b=Xcz9mepx2k1hiSK7Wk2a82zcMekZRBfKoj38MXm8+Dup0VlLguPacDXS/duTW2IrQpwdQr9vS87ZiWIMooox58X1PSUQl1ntRk4G1fvFJW8tu5Pklg0pwTlt07gl43G5dRUOai1lWzPV34qRLSPYXSmtfRXNN2APBPaO4N32wEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887766; c=relaxed/simple;
	bh=LUu6Ge4VF1xrAhcZ3IpmZvJeuwdnMz3sOifOB9yOC30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgNeR6UaZlvT16G9V55o8dkSpm1xFN642bamHZJjWoEw7i8pX/+85gIWkFuTg5iFg2NSbqImIL4M/Uwaipkk2+T1BcEIjMz1aNYOgUZy0L39Dj0Gm/kuv0DfWirntQrPoFDAxFo6Vcu3SqODRCq06VGH5O20M+MKOu2du1pReAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cY06diqd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3ZSmZa8l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cY06diqd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3ZSmZa8l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cY06diqd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3ZSmZa8l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cY06diqd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3ZSmZa8l"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 711951F78E;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dynDfa+Z5gXLI6uo6t6/TdTCn0yvgYY027A/rS+6zlw=;
	b=cY06diqdcUpicsbML1mU2WvSa4u3l4ctzW/ZgJiN2Sxax4Pc6KK/oeT6glWr+qG83VuShB
	OE4MstfoSWVyyHDp1q5nXIwSLaAUfXp40XqT0oLC49FWR8boTIQzmhQCJa8p6u7/3PfMzf
	p4Ec2UOI5qIp3K3HL4A5s95j+mifI/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dynDfa+Z5gXLI6uo6t6/TdTCn0yvgYY027A/rS+6zlw=;
	b=3ZSmZa8lYOhQIITP/sbE7zFZ2QQOCGaX3k1o6cQNCPuDLEI6Vb2X+CmhRegdpBwFkBxGKQ
	rKngJMeSXP+rZgDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cY06diqd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3ZSmZa8l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dynDfa+Z5gXLI6uo6t6/TdTCn0yvgYY027A/rS+6zlw=;
	b=cY06diqdcUpicsbML1mU2WvSa4u3l4ctzW/ZgJiN2Sxax4Pc6KK/oeT6glWr+qG83VuShB
	OE4MstfoSWVyyHDp1q5nXIwSLaAUfXp40XqT0oLC49FWR8boTIQzmhQCJa8p6u7/3PfMzf
	p4Ec2UOI5qIp3K3HL4A5s95j+mifI/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dynDfa+Z5gXLI6uo6t6/TdTCn0yvgYY027A/rS+6zlw=;
	b=3ZSmZa8lYOhQIITP/sbE7zFZ2QQOCGaX3k1o6cQNCPuDLEI6Vb2X+CmhRegdpBwFkBxGKQ
	rKngJMeSXP+rZgDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46814137BA;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eGDgD+QY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 16/89] ASoC: cs53l30: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:21 +0100
Message-ID: <20250313174139.29942-17-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 711951F78E
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIE_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs53l30.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index aea4244fb275..61bf72681674 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -1031,7 +1031,6 @@ static void cs53l30_i2c_remove(struct i2c_client *client)
 			       cs53l30->supplies);
 }
 
-#ifdef CONFIG_PM
 static int cs53l30_runtime_suspend(struct device *dev)
 {
 	struct cs53l30_private *cs53l30 = dev_get_drvdata(dev);
@@ -1070,11 +1069,9 @@ static int cs53l30_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops cs53l30_runtime_pm = {
-	SET_RUNTIME_PM_OPS(cs53l30_runtime_suspend, cs53l30_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(cs53l30_runtime_suspend, cs53l30_runtime_resume, NULL)
 };
 
 static const struct of_device_id cs53l30_of_match[] = {
@@ -1095,7 +1092,7 @@ static struct i2c_driver cs53l30_i2c_driver = {
 	.driver = {
 		.name = "cs53l30",
 		.of_match_table = cs53l30_of_match,
-		.pm = &cs53l30_runtime_pm,
+		.pm = pm_ptr(&cs53l30_runtime_pm),
 	},
 	.id_table = cs53l30_id,
 	.probe = cs53l30_i2c_probe,
-- 
2.43.0

