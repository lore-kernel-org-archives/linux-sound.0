Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A983198A2F
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887852; cv=none; b=jUBX0YeTDfD5ewuRJk9YrmCX+16ynNuYDrW9y5xhSIY+IacSr8cTWIp7szCJPDLo1p730oC++go4dy8USorljN7YYE9NS65VygdfeKn6Fn02F6eLk4WBlL24x9KzrD3eMIlrM5K+LKar2FJYXX3VT9C1bqpAJG6JvozIOmkG1xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887852; c=relaxed/simple;
	bh=YhX6FSRBwY8qpxBJI1qK6Cn7dWV7UBBJP4KQuAuVrJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kRVPsrru63m/woBUzQIjP5smjZ0bryKqsQJy0NYparDS/qhilZceODIi1zcs56Okf2H59NJqyinskMyzD3HY4x4vKcp6oaFdudx8cbr6dtwWgUIFMUXY+r0lPZqmS2/GJtR0iMfakmB2aXCmd4iF9JidMRXLDfkD4vJubiApkcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xqZ+Y3XQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/LWWe1iX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xqZ+Y3XQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/LWWe1iX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xqZ+Y3XQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/LWWe1iX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xqZ+Y3XQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/LWWe1iX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D4A31F78D;
	Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ey4wtYpPmBpYUWBiWObNd5v2CdA4TIK0VOF0M9I3g4Y=;
	b=xqZ+Y3XQkJdhY+4tsKBA46yd3tLNvvQ1sY0szJBkHqQf4eXM5leTXGoRgMJMET98udUrwi
	KaZ3pZoek54TWpWOGrNYoCqFBKwm29dJeCJvhMuICehP+5EXol8hA1gbcV97VZKw7mwJPe
	rg5DsrWN0lPngyVvO6ItVxydAydPmXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ey4wtYpPmBpYUWBiWObNd5v2CdA4TIK0VOF0M9I3g4Y=;
	b=/LWWe1iXpR6JP33Ybe3kOBvtxSQQJwOSjg9D2B2KyXPj/WTIckiaztUWhz60TD/Ffr/7tQ
	XL7jy1+2PKpWxLBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ey4wtYpPmBpYUWBiWObNd5v2CdA4TIK0VOF0M9I3g4Y=;
	b=xqZ+Y3XQkJdhY+4tsKBA46yd3tLNvvQ1sY0szJBkHqQf4eXM5leTXGoRgMJMET98udUrwi
	KaZ3pZoek54TWpWOGrNYoCqFBKwm29dJeCJvhMuICehP+5EXol8hA1gbcV97VZKw7mwJPe
	rg5DsrWN0lPngyVvO6ItVxydAydPmXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ey4wtYpPmBpYUWBiWObNd5v2CdA4TIK0VOF0M9I3g4Y=;
	b=/LWWe1iXpR6JP33Ybe3kOBvtxSQQJwOSjg9D2B2KyXPj/WTIckiaztUWhz60TD/Ffr/7tQ
	XL7jy1+2PKpWxLBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 22034139D2;
	Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wDrHBukY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 42/89] ASoC: rt721: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:47 +0100
Message-ID: <20250313174139.29942-43-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt721-sdca-sdw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index c71453da088a..582b47d69278 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -437,7 +437,7 @@ static const struct sdw_device_id rt721_sdca_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt721_sdca_id);
 
-static int __maybe_unused rt721_sdca_dev_suspend(struct device *dev)
+static int rt721_sdca_dev_suspend(struct device *dev)
 {
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(dev);
 
@@ -453,7 +453,7 @@ static int __maybe_unused rt721_sdca_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt721_sdca_dev_system_suspend(struct device *dev)
+static int rt721_sdca_dev_system_suspend(struct device *dev)
 {
 	struct rt721_sdca_priv *rt721_sdca = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -485,7 +485,7 @@ static int __maybe_unused rt721_sdca_dev_system_suspend(struct device *dev)
 
 #define RT721_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt721_sdca_dev_resume(struct device *dev)
+static int rt721_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(dev);
@@ -524,15 +524,15 @@ static int __maybe_unused rt721_sdca_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt721_sdca_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt721_sdca_dev_system_suspend, rt721_sdca_dev_resume)
-	SET_RUNTIME_PM_OPS(rt721_sdca_dev_suspend, rt721_sdca_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt721_sdca_dev_system_suspend, rt721_sdca_dev_resume)
+	RUNTIME_PM_OPS(rt721_sdca_dev_suspend, rt721_sdca_dev_resume, NULL)
 };
 
 static struct sdw_driver rt721_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt721-sdca",
 		.owner = THIS_MODULE,
-		.pm = &rt721_sdca_pm,
+		.pm = pm_ptr(&rt721_sdca_pm),
 	},
 	.probe = rt721_sdca_sdw_probe,
 	.remove = rt721_sdca_sdw_remove,
-- 
2.43.0

