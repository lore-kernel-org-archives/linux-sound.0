Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65101DDC2A
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887857; cv=none; b=VGIo2xRxtN/usUhQH70fwdF+MWQxklnQrLbJgN9cIW8FBB7YfQtnMOvhlQaWrYsHpArkj1yirhe7IBpSGG15ye/yckSblBRpnOnNRdNcijy0rk/352oeyP6NGSRVEOsVHSNVcYIOL/i/gSKVbKngWfhWEOapLALln2CWRteLxyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887857; c=relaxed/simple;
	bh=UFghHy2AClwzjwoWANI5ykIdw4ypHVvv6APKit31yWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TaMmRKRO2Uk+OIxhrzDSk2tOny5MG+HP6eQTMeAuigtmTz3NohWXQfPsgVOvK56rexkh+6nC9/t6/8m8QmtG70YbUmkUxeuh62x477SmZ71qoEcaPlUtWxEBmO5EmkfKn7s8uEIiygFhCM8LJWIQI2uIzO8Mv6LSjrpQNtnRFXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yZK5LfDs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RN7LXyji; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yZK5LfDs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RN7LXyji; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yZK5LfDs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RN7LXyji";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yZK5LfDs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RN7LXyji"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C5E7F211C7;
	Thu, 13 Mar 2025 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCRmmGCW/ivrFeOIU3GLuyKJc6iNw30D6Qh4IoN+PW4=;
	b=yZK5LfDsQRZ+qK/tObAKhzzhNXiyQd+YdH65B17fmCdV1OLnBcfKC5ttZXkP5zj3V/m5/0
	2hK+mYMsYAs35H8LinblsIitgjSzxpSVHn6GVkoxy/ZZrSf2rS/3Xr2Zux4Q7yq3J5zg2d
	S4bJThMLKurpvt6ZVHlp5yrdMFWcNlU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCRmmGCW/ivrFeOIU3GLuyKJc6iNw30D6Qh4IoN+PW4=;
	b=RN7LXyjiYUbRhTIlbOJ67r5plNmrJZlS//uyso1eS/srwHA9Qa3KFy0tydfLe6fvd3pepy
	DN0OJrLfN7AcSRAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCRmmGCW/ivrFeOIU3GLuyKJc6iNw30D6Qh4IoN+PW4=;
	b=yZK5LfDsQRZ+qK/tObAKhzzhNXiyQd+YdH65B17fmCdV1OLnBcfKC5ttZXkP5zj3V/m5/0
	2hK+mYMsYAs35H8LinblsIitgjSzxpSVHn6GVkoxy/ZZrSf2rS/3Xr2Zux4Q7yq3J5zg2d
	S4bJThMLKurpvt6ZVHlp5yrdMFWcNlU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCRmmGCW/ivrFeOIU3GLuyKJc6iNw30D6Qh4IoN+PW4=;
	b=RN7LXyjiYUbRhTIlbOJ67r5plNmrJZlS//uyso1eS/srwHA9Qa3KFy0tydfLe6fvd3pepy
	DN0OJrLfN7AcSRAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B18F137BA;
	Thu, 13 Mar 2025 17:42:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0JybJOoY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 50/89] ASoC: wcd939x: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:55 +0100
Message-ID: <20250313174139.29942-51-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wcd939x-sdw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 36868fad3e8b..f7a9323a9fea 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -1507,7 +1507,7 @@ static const struct sdw_device_id wcd9390_slave_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, wcd9390_slave_id);
 
-static int __maybe_unused wcd939x_sdw_runtime_suspend(struct device *dev)
+static int wcd939x_sdw_runtime_suspend(struct device *dev)
 {
 	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(dev);
 
@@ -1519,7 +1519,7 @@ static int __maybe_unused wcd939x_sdw_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wcd939x_sdw_runtime_resume(struct device *dev)
+static int wcd939x_sdw_runtime_resume(struct device *dev)
 {
 	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(dev);
 
@@ -1532,7 +1532,7 @@ static int __maybe_unused wcd939x_sdw_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops wcd939x_sdw_pm_ops = {
-	SET_RUNTIME_PM_OPS(wcd939x_sdw_runtime_suspend, wcd939x_sdw_runtime_resume, NULL)
+	RUNTIME_PM_OPS(wcd939x_sdw_runtime_suspend, wcd939x_sdw_runtime_resume, NULL)
 };
 
 static struct sdw_driver wcd9390_codec_driver = {
@@ -1542,7 +1542,7 @@ static struct sdw_driver wcd9390_codec_driver = {
 	.id_table = wcd9390_slave_id,
 	.driver = {
 		.name = "wcd9390-codec",
-		.pm = &wcd939x_sdw_pm_ops,
+		.pm = pm_ptr(&wcd939x_sdw_pm_ops),
 	}
 };
 module_sdw_driver(wcd9390_codec_driver);
-- 
2.43.0

