Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A465F7E775
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321129; cv=none; b=ltRpXRl3XxufoLEj3U5SmN7XGmX3l1DjIi+hHIhu9BHHnm5+wsn6xH24qMvql6UzCzyrB5s03hPFhj6kiaOYZlcKnHo3aIKceFO8Lmm3/DGm++sDtD/vGJo7b2Zq92+INVOLrS8B7ZOvkSjKaKJtACl/I3K9fLqJgNQ7zYnPKo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321129; c=relaxed/simple;
	bh=qGBgcosL773euYEsR6tg32bUlmsUAzBmyyjM9u4F47Q=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SJqxSwLtue9Ja2pb/1iEi/Zgosnm2sUlrrfs9Fh6bokBTWlzGn1QqPEI31mfgDVom41vxMKvEghpS/KVbC6e+pPtX9m68+H+nU7M6vKXmJPDBAPK8KSqOFjgaMK1OF5tyvPTIbR4dtlPlSSTbL1YCkF3Ev4Ou4vZtVrcYjxFD+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TM+PUR35; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/wKMxDqY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TM+PUR35; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/wKMxDqY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TM+PUR35";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/wKMxDqY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TM+PUR35";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/wKMxDqY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3C8281FC11;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEJOtvqlYMxSdlEpTisq40fisZwNeKl686SVSWaSjqs=;
	b=TM+PUR35SMyHVye8vjFu2eyq36Y0w4pFxggm+0hblge/tU7I+qmoao4JV1vqXnY0ptiEZc
	Q6w/uYHNkOpzYC60PHpReKYZtXc0pPlq9iv36vARCrfZemrCjo6zDAWeZ3IX5N+wJ1DKpG
	uyZR8CYT21qwlsP6k99RZopj/+bUa1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEJOtvqlYMxSdlEpTisq40fisZwNeKl686SVSWaSjqs=;
	b=/wKMxDqYN9zqiT1h5t+UQjz7yk1IwnDPNprOcr2l+PFfxFkNpjcz47L0202KdQxf6v+wuG
	rtVn0xUJB3IHg8CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEJOtvqlYMxSdlEpTisq40fisZwNeKl686SVSWaSjqs=;
	b=TM+PUR35SMyHVye8vjFu2eyq36Y0w4pFxggm+0hblge/tU7I+qmoao4JV1vqXnY0ptiEZc
	Q6w/uYHNkOpzYC60PHpReKYZtXc0pPlq9iv36vARCrfZemrCjo6zDAWeZ3IX5N+wJ1DKpG
	uyZR8CYT21qwlsP6k99RZopj/+bUa1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEJOtvqlYMxSdlEpTisq40fisZwNeKl686SVSWaSjqs=;
	b=/wKMxDqYN9zqiT1h5t+UQjz7yk1IwnDPNprOcr2l+PFfxFkNpjcz47L0202KdQxf6v+wuG
	rtVn0xUJB3IHg8CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D808139D8;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0LGWBSCnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 14/29] ALSA: at73c213: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:25 +0100
Message-Id: <20240207155140.18238-15-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240207155140.18238-1-tiwai@suse.de>
References: <20240207155140.18238-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TM+PUR35;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/wKMxDqY"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.73 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.72)[83.64%]
X-Spam-Score: -0.73
X-Rspamd-Queue-Id: 3C8281FC11
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/spi/at73c213.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/spi/at73c213.c b/sound/spi/at73c213.c
index 1e8765d75d8f..5648d744aa79 100644
--- a/sound/spi/at73c213.c
+++ b/sound/spi/at73c213.c
@@ -1076,8 +1076,6 @@ static void snd_at73c213_remove(struct spi_device *spi)
 	snd_card_free(card);
 }
 
-#ifdef CONFIG_PM_SLEEP
-
 static int snd_at73c213_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -1109,18 +1107,13 @@ static int snd_at73c213_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(at73c213_pm_ops, snd_at73c213_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(at73c213_pm_ops, snd_at73c213_suspend,
 		snd_at73c213_resume);
-#define AT73C213_PM_OPS (&at73c213_pm_ops)
-
-#else
-#define AT73C213_PM_OPS NULL
-#endif
 
 static struct spi_driver at73c213_driver = {
 	.driver		= {
 		.name	= "at73c213",
-		.pm	= AT73C213_PM_OPS,
+		.pm	= &at73c213_pm_ops,
 	},
 	.probe		= snd_at73c213_probe,
 	.remove		= snd_at73c213_remove,
-- 
2.35.3

