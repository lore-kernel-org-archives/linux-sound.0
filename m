Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FF118A6C1
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887948; cv=none; b=LZC9+uxErg85gEJONJZEdyN2UcOYdLaWmX0E2m7Qy1l2vzIad1TLK+HKR00lGTSCZBPvxxaI3H23Wpo9tIo+zNfui4OuHlTeSTsHW7hDl02cub18WAd/Ww8OrznSqj6zselP5YiOpcl6Q6UohgOpFNtnmab1vJy3QgMoWxnLSIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887948; c=relaxed/simple;
	bh=eHIKEA2KHugNpYbSKyn3zrrERi3WaeAq9hxNzllb+6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/VRJS7fB5M6ON8E8Im86iRW1dkFnXv0st6lq56bEH4gqpAV4qx+mLTkr2bzNrh7jjFQKBhH4fMH7BqKfgPQ6H2KVyQ9udv7PYWxRHmwqMlBLdi3abC72ZPqMszT8EweEec7TL0LnYs5+gP6Ck8YduFJsH7rRMasFPq0cHiCpvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TFed7rzN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E6tnG7Is; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TFed7rzN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E6tnG7Is; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TFed7rzN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6tnG7Is";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TFed7rzN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6tnG7Is"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 84332211F8;
	Thu, 13 Mar 2025 17:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0DRj73yVF7KH3GCPmJnNH+WIAZISmd7AuVsvp30Rn8=;
	b=TFed7rzNmNi/muSPFC0f3KY3WLTrqWolBw1LJUx4rUVOSrV2kZ2iebDwb5ynxVC4WuiQIL
	1A7hQniV2id6+aSIDcwe3cAZ0RJgnV6ZMZ2DqYNXdh32fxuLaNEpl5TgIO2stTOzLhjC8g
	GYOJb6+ygctMaSof4j8CzcdIsyTfQv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0DRj73yVF7KH3GCPmJnNH+WIAZISmd7AuVsvp30Rn8=;
	b=E6tnG7IsPvMV06FVPndm3mceY6YlWaPqqiww95ZirfdEmnFtYAoi1G6+kTdzIZhFNYrLxB
	gqhCRMW3MfctOXAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TFed7rzN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=E6tnG7Is
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0DRj73yVF7KH3GCPmJnNH+WIAZISmd7AuVsvp30Rn8=;
	b=TFed7rzNmNi/muSPFC0f3KY3WLTrqWolBw1LJUx4rUVOSrV2kZ2iebDwb5ynxVC4WuiQIL
	1A7hQniV2id6+aSIDcwe3cAZ0RJgnV6ZMZ2DqYNXdh32fxuLaNEpl5TgIO2stTOzLhjC8g
	GYOJb6+ygctMaSof4j8CzcdIsyTfQv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0DRj73yVF7KH3GCPmJnNH+WIAZISmd7AuVsvp30Rn8=;
	b=E6tnG7IsPvMV06FVPndm3mceY6YlWaPqqiww95ZirfdEmnFtYAoi1G6+kTdzIZhFNYrLxB
	gqhCRMW3MfctOXAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 624B1139D2;
	Thu, 13 Mar 2025 17:42:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6L6/Fu4Y02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 71/89] ASoC: mediatek: mt8192: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:16 +0100
Message-ID: <20250313174139.29942-72-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 84332211F8
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 80cda7bf5ccc..fd6af74d7995 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2313,15 +2313,15 @@ static const struct of_device_id mt8192_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt8192_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt8192_afe_pm_ops = {
-	SET_RUNTIME_PM_OPS(mt8192_afe_runtime_suspend,
-			   mt8192_afe_runtime_resume, NULL)
+	RUNTIME_PM_OPS(mt8192_afe_runtime_suspend,
+		       mt8192_afe_runtime_resume, NULL)
 };
 
 static struct platform_driver mt8192_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt8192-audio",
 		   .of_match_table = mt8192_afe_pcm_dt_match,
-		   .pm = &mt8192_afe_pm_ops,
+		   .pm = pm_ptr(&mt8192_afe_pm_ops),
 	},
 	.probe = mt8192_afe_pcm_dev_probe,
 	.remove = mt8192_afe_pcm_dev_remove,
-- 
2.43.0

