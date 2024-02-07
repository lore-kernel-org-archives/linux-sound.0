Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46B78062C
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321127; cv=none; b=UqmtmgNlxLhSLgsX146i7T41KmFeunMoAPz4DvAERQoyQXRhFgyAByLi5fY+sPYvAqwKRiV+dTQvLT5qm/C1qGz0mC3ugFskPOEPYtdEpXKHBeO4yRzdAaHGEblTRjEF42sOypXvScDwIB9Qcbd38fDoHcHGFXqxlMXB1+5fC80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321127; c=relaxed/simple;
	bh=Gne44qrVhHXAX5RmHYmk5R64Li35Czrhbs4lYrsStHY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MdBbSfAx9UNeELtrtI/4yiyBz8J+zVNSMdp+ZMiqtAyz92qCTnAVnoHSznn7MZfXKy70KBJ55FYZevUPeWKXJ4Pu71SgEFr2+5/GLIpQf7n4AoGrvO8eJqtz5TOql6NgFw2oeNwV50r6DEETWbH5rawIY7v4Kw2Ur+8xayr8qLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gwcIqr7e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=08XkPRuk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gwcIqr7e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=08XkPRuk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gwcIqr7e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="08XkPRuk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gwcIqr7e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="08XkPRuk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DBD4D1FC0B;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oel3zzvaGFB2WiIFAvLM4ItKH2OAwN8f+65LQ3YxBMY=;
	b=gwcIqr7eMue1ZlxG+MQKk15y+XEPxaLjD4XCRPBgokhQAgUwFW1iz7S8RU369iomZIGNZX
	JBqmZpCVLyHDqn3tAHHMjKHtAJyMzK59023Wz7fKLa0OO+elHIIQW6hhmq4lwTFO6oVMIO
	zAp9vVLaSrQIQBS3OyJxeRr8PRuDsSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oel3zzvaGFB2WiIFAvLM4ItKH2OAwN8f+65LQ3YxBMY=;
	b=08XkPRuk33WF8QxUDCIrmb5cWst+rarKuPNVQyXyrt9PEcayZYBo6D+7STd5gpUo7ppXUM
	9fXbItOzTc9drpCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oel3zzvaGFB2WiIFAvLM4ItKH2OAwN8f+65LQ3YxBMY=;
	b=gwcIqr7eMue1ZlxG+MQKk15y+XEPxaLjD4XCRPBgokhQAgUwFW1iz7S8RU369iomZIGNZX
	JBqmZpCVLyHDqn3tAHHMjKHtAJyMzK59023Wz7fKLa0OO+elHIIQW6hhmq4lwTFO6oVMIO
	zAp9vVLaSrQIQBS3OyJxeRr8PRuDsSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oel3zzvaGFB2WiIFAvLM4ItKH2OAwN8f+65LQ3YxBMY=;
	b=08XkPRuk33WF8QxUDCIrmb5cWst+rarKuPNVQyXyrt9PEcayZYBo6D+7STd5gpUo7ppXUM
	9fXbItOzTc9drpCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B69A1139D8;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OFULKx+nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 12/29] ALSA: pxa2xx-ac97: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:23 +0100
Message-Id: <20240207155140.18238-13-tiwai@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gwcIqr7e;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=08XkPRuk
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.15 / 50.00];
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
	 BAYES_HAM(-0.14)[68.20%]
X-Spam-Score: -0.15
X-Rspamd-Queue-Id: DBD4D1FC0B
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/arm/pxa2xx-ac97.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index 2d83ad91f968..4c367e73b2c9 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -111,8 +111,6 @@ static int pxa2xx_ac97_pcm_prepare(struct snd_pcm_substream *substream)
 	return snd_ac97_set_rate(pxa2xx_ac97_ac97, reg, runtime->rate);
 }
 
-#ifdef CONFIG_PM_SLEEP
-
 static int pxa2xx_ac97_do_suspend(struct snd_card *card)
 {
 	pxa2xx_audio_ops_t *platform_ops = card->dev->platform_data;
@@ -164,8 +162,7 @@ static int pxa2xx_ac97_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(pxa2xx_ac97_pm_ops, pxa2xx_ac97_suspend, pxa2xx_ac97_resume);
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(pxa2xx_ac97_pm_ops, pxa2xx_ac97_suspend, pxa2xx_ac97_resume);
 
 static const struct snd_pcm_ops pxa2xx_ac97_pcm_ops = {
 	.open		= pxa2xx_ac97_pcm_open,
@@ -277,9 +274,7 @@ static struct platform_driver pxa2xx_ac97_driver = {
 	.remove_new	= pxa2xx_ac97_remove,
 	.driver		= {
 		.name	= "pxa2xx-ac97",
-#ifdef CONFIG_PM_SLEEP
 		.pm	= &pxa2xx_ac97_pm_ops,
-#endif
 	},
 };
 
-- 
2.35.3

