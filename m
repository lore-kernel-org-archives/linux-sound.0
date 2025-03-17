Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99072E3373
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205602; cv=none; b=ldBsIibCepKciy0oh1WBqOEYr2SQapUDkMCIldH+SGsLtXMk7MXEM7YNqTQkS345LrVR09B6WF4TBlLp4Ib7s8wASK+wHyVO7Ge1kQSZnBm8XhVvlrwJ4FH2QXzdK2CBLJpBDVVVZMPtUkPEwaG4gTMtRqW5Y+TECN1GjwWthmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205602; c=relaxed/simple;
	bh=eHIKEA2KHugNpYbSKyn3zrrERi3WaeAq9hxNzllb+6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gE7gw/3NTwUn5Vs4pmjko5QBEH2zowgBpmnJ/rvOO22bKUP8J0PTE5e4og8tK/wIGDe83MD1a0L1ZTPNi2k0qJKjNeKGyiSegJW9g3o8V7qxNWF++JC+qvRn+NXb6eZsuqNVsIjK0y/XDy6Wbt9dD7skFRzB9XsOQQLt6xSORCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r2oVG56S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ELfAxFrr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r2oVG56S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ELfAxFrr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r2oVG56S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ELfAxFrr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r2oVG56S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ELfAxFrr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A5D2D2023F;
	Mon, 17 Mar 2025 09:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0DRj73yVF7KH3GCPmJnNH+WIAZISmd7AuVsvp30Rn8=;
	b=r2oVG56Sq7GUWoccLf0pQL/6Z99+Q4tifafolC/gIrk+8c7IFz+Slx6vve8UKx8MertJ31
	cO6nQaT0uY4T9Yl2MgmFHuUpFd0wX1jZkEacZ1Eg6wQgIrUr47fz17Y8UxzRyl/4eejigr
	RzNxftBtD8tTPfSzVhsPepS9E982WnQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0DRj73yVF7KH3GCPmJnNH+WIAZISmd7AuVsvp30Rn8=;
	b=ELfAxFrrQ0rDazkEcSIWDt94HaDE6Krz0V6pbwk8zUw+mBLoKf888mYs5xJ5dAgZzCJip+
	nqqg//PWN635D4BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0DRj73yVF7KH3GCPmJnNH+WIAZISmd7AuVsvp30Rn8=;
	b=r2oVG56Sq7GUWoccLf0pQL/6Z99+Q4tifafolC/gIrk+8c7IFz+Slx6vve8UKx8MertJ31
	cO6nQaT0uY4T9Yl2MgmFHuUpFd0wX1jZkEacZ1Eg6wQgIrUr47fz17Y8UxzRyl/4eejigr
	RzNxftBtD8tTPfSzVhsPepS9E982WnQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0DRj73yVF7KH3GCPmJnNH+WIAZISmd7AuVsvp30Rn8=;
	b=ELfAxFrrQ0rDazkEcSIWDt94HaDE6Krz0V6pbwk8zUw+mBLoKf888mYs5xJ5dAgZzCJip+
	nqqg//PWN635D4BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8540213A2C;
	Mon, 17 Mar 2025 09:56:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YIAoH8nx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 70/88] ASoC: mediatek: mt8192: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:32 +0100
Message-ID: <20250317095603.20073-71-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
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

