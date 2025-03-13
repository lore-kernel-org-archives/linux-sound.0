Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6867618F2FC
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887812; cv=none; b=o+q50WlEUqH0/t3vrWjGclPhtUixdf0KY1vDKDCet/YS/opwdA+KrAx0AbASPPa69I5NNwHZhtXYhkk8CV2BVnFDbMNU6miQwcNNJJtxyq+NuH7uyLlLZ5rEJufSbhXDGvhXkAqHui3BBNcGdHt1OWrQCfMwHL4iAx0yFdWdIQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887812; c=relaxed/simple;
	bh=elcF+nURC9j7Q0fZ035ohcS9x+had2Q7V54y4Xgz214=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T90iaxhMmy31WKl7KqiU2h6F0g3NcDDUvkt5Zg1lbldozeJixwdlIz7W/lwGB74hbw+JLFn/tdt4JBWsnUE+hEIyBOf05ONqp/P8sHtB2bKP15f6kx76O0YeqlABlt0E6h4TFpJ1Cd2Y0BUpQ1bZZsGMrz+d6eMq6JratHR7W5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V0wr/1BQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A4nTPKVA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V0wr/1BQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A4nTPKVA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V0wr/1BQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A4nTPKVA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V0wr/1BQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A4nTPKVA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 36C09211D7;
	Thu, 13 Mar 2025 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TnExaFcOEzbKE6DLesubzpyFty/ljnMK/cVKeSMJRoA=;
	b=V0wr/1BQOkBBb31QKpsLRDANrfEZ6sfah9nQamDt0+4iWKmThua8UjAyZ3Eawi43i/mmek
	avUv+87cwsX31DWAI4VyZqyuFy0qfBA+VpkcF8RPQjNkR9GrV3aXELd0Yf8t/Vk21Yr4lb
	eQkykJP/9GW89+e28UvagK1YYruSs6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TnExaFcOEzbKE6DLesubzpyFty/ljnMK/cVKeSMJRoA=;
	b=A4nTPKVA+ONiFPLNjt/eRZ1E5ECgIuLMXf0KaipCDPvwDK4EM8j6+/rJ1mX7wxIsM86SN/
	0jbJ09UFFQqG7QAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TnExaFcOEzbKE6DLesubzpyFty/ljnMK/cVKeSMJRoA=;
	b=V0wr/1BQOkBBb31QKpsLRDANrfEZ6sfah9nQamDt0+4iWKmThua8UjAyZ3Eawi43i/mmek
	avUv+87cwsX31DWAI4VyZqyuFy0qfBA+VpkcF8RPQjNkR9GrV3aXELd0Yf8t/Vk21Yr4lb
	eQkykJP/9GW89+e28UvagK1YYruSs6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TnExaFcOEzbKE6DLesubzpyFty/ljnMK/cVKeSMJRoA=;
	b=A4nTPKVA+ONiFPLNjt/eRZ1E5ECgIuLMXf0KaipCDPvwDK4EM8j6+/rJ1mX7wxIsM86SN/
	0jbJ09UFFQqG7QAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E3F6137BA;
	Thu, 13 Mar 2025 17:41:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6O8gAucY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 31/89] ASoC: rt1308-sdw: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:36 +0100
Message-ID: <20250313174139.29942-32-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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
 sound/soc/codecs/rt1308-sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 563df483a466..ea708068f0e8 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -753,7 +753,7 @@ static const struct sdw_device_id rt1308_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt1308_id);
 
-static int __maybe_unused rt1308_dev_suspend(struct device *dev)
+static int rt1308_dev_suspend(struct device *dev)
 {
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
 
@@ -767,7 +767,7 @@ static int __maybe_unused rt1308_dev_suspend(struct device *dev)
 
 #define RT1308_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt1308_dev_resume(struct device *dev)
+static int rt1308_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
@@ -797,14 +797,14 @@ static int __maybe_unused rt1308_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt1308_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt1308_dev_suspend, rt1308_dev_resume)
-	SET_RUNTIME_PM_OPS(rt1308_dev_suspend, rt1308_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt1308_dev_suspend, rt1308_dev_resume)
+	RUNTIME_PM_OPS(rt1308_dev_suspend, rt1308_dev_resume, NULL)
 };
 
 static struct sdw_driver rt1308_sdw_driver = {
 	.driver = {
 		.name = "rt1308",
-		.pm = &rt1308_pm,
+		.pm = pm_ptr(&rt1308_pm),
 	},
 	.probe = rt1308_sdw_probe,
 	.remove = rt1308_sdw_remove,
-- 
2.43.0

