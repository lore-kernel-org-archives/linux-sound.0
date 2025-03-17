Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954EE22D4C8
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205507; cv=none; b=cO0uwALBUWoR8oZc36tlE1156BskzBTTmJbz2ZRe1sxcz8WjrbxVjvzYJhSwqTDaYrZPKAHf/yompan8jLJNt7hgkFV0IcpR5fHkhHTtqjqSH2Z1LJ1o5psRQ5pNGQVAS2CeTaOtujdm8k3PX+XibOEdnxLWsY+cYOLzUk72lZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205507; c=relaxed/simple;
	bh=5b/My2GtOW6VFpy409tBQFwiDX0OlfZN5gEE8Q/oGV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovXlcHX1W8OT6JokD0uq1OvlRSSwjr2kP0ZZjyFJkkCgzQArxWubyfjrAHnz0ZlPJ1kn0BJhZxcKQnKFM7+u7jGlfvwVXPfzq7XkVEimIz9fba3CDVmFfHT+LAVjp5HJ1yjB6ElvEgMlMjmikYWLoFIzDmEBg5v5VcGBvo3bLWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iBZsIYkY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3p0Z+a6/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iBZsIYkY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3p0Z+a6/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iBZsIYkY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3p0Z+a6/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iBZsIYkY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3p0Z+a6/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 99B252022F;
	Mon, 17 Mar 2025 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzTFrHQ7Ify4rz+VRrkwhGnLnzLf5M1RU5kY1JIxY4g=;
	b=iBZsIYkYkc01H4UZ+QrqxkPUDO1+7j06FFQqrJtl9QCvVdGerzXSJsqs5UXjXCI59iKQQf
	RXBXUkI0dnYAgpyy9GZrgCeS1AMj4y2+i4c34HgvpMtJakpKThOS2GCLHxNLcflUz154U3
	f7b/wmvI2yl9SHKFNcMD2xRboWrLXw4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzTFrHQ7Ify4rz+VRrkwhGnLnzLf5M1RU5kY1JIxY4g=;
	b=3p0Z+a6/POBNqDWEGJHNJRr7OIcvL7I+/OxIA3ab9tXGsbcWazVZlau3oi5EATEKNWJkFH
	Oo1Si2n8OjI5pGDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzTFrHQ7Ify4rz+VRrkwhGnLnzLf5M1RU5kY1JIxY4g=;
	b=iBZsIYkYkc01H4UZ+QrqxkPUDO1+7j06FFQqrJtl9QCvVdGerzXSJsqs5UXjXCI59iKQQf
	RXBXUkI0dnYAgpyy9GZrgCeS1AMj4y2+i4c34HgvpMtJakpKThOS2GCLHxNLcflUz154U3
	f7b/wmvI2yl9SHKFNcMD2xRboWrLXw4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzTFrHQ7Ify4rz+VRrkwhGnLnzLf5M1RU5kY1JIxY4g=;
	b=3p0Z+a6/POBNqDWEGJHNJRr7OIcvL7I+/OxIA3ab9tXGsbcWazVZlau3oi5EATEKNWJkFH
	Oo1Si2n8OjI5pGDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 745C3132CF;
	Mon, 17 Mar 2025 09:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wBImG8Px12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 37/88] ASoC: rt700-sdw: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:59 +0100
Message-ID: <20250317095603.20073-38-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt700-sdw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 24cb895b759f..44543c0da177 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -475,7 +475,7 @@ static const struct sdw_device_id rt700_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt700_id);
 
-static int __maybe_unused rt700_dev_suspend(struct device *dev)
+static int rt700_dev_suspend(struct device *dev)
 {
 	struct rt700_priv *rt700 = dev_get_drvdata(dev);
 
@@ -490,7 +490,7 @@ static int __maybe_unused rt700_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt700_dev_system_suspend(struct device *dev)
+static int rt700_dev_system_suspend(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt700_priv *rt700 = dev_get_drvdata(dev);
@@ -520,7 +520,7 @@ static int __maybe_unused rt700_dev_system_suspend(struct device *dev)
 
 #define RT700_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt700_dev_resume(struct device *dev)
+static int rt700_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt700_priv *rt700 = dev_get_drvdata(dev);
@@ -551,14 +551,14 @@ static int __maybe_unused rt700_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt700_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt700_dev_system_suspend, rt700_dev_resume)
-	SET_RUNTIME_PM_OPS(rt700_dev_suspend, rt700_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt700_dev_system_suspend, rt700_dev_resume)
+	RUNTIME_PM_OPS(rt700_dev_suspend, rt700_dev_resume, NULL)
 };
 
 static struct sdw_driver rt700_sdw_driver = {
 	.driver = {
 		.name = "rt700",
-		.pm = &rt700_pm,
+		.pm = pm_ptr(&rt700_pm),
 	},
 	.probe = rt700_sdw_probe,
 	.remove = rt700_sdw_remove,
-- 
2.43.0

