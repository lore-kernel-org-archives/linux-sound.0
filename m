Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09721DB933
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887882; cv=none; b=EB9IMX1ifo5nnjVp0uy3a78ZjbKffboNQwmd9qmU+BCRBjWgKd+SATiUl11VfjzeH692fd9ane7hJ/f6jVb7Zy1miY4xKqw7x/am0Hnj5yaLAManWda14mCAFnMfwzWmTXNIsYCYPKNMk2O7d31OQ4CHZCH0VlyN0szX2qS+rjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887882; c=relaxed/simple;
	bh=cgH/eXQT0VMLzdspxPDzYZc+tC1g/FTv3+u/ICVgV8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHAKom39Bilu4ld1rMp+exjf0Y+8Vw1oOfVhLSJtBzzOsG6YAI978fpv0z03FB0QJzh+JnP6m6dQjghC78iMSGsZN0Bdq1URqCZHVt7XOzWUOud1rRGmzaACKHFdxafyrghGg7o5UwoXlCfmaV73kZ359Bo8DH/BdJ68br7IpCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rYDUhkM9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K08BJBQP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rYDUhkM9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K08BJBQP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rYDUhkM9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K08BJBQP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rYDUhkM9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K08BJBQP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 93A5C1F7A6;
	Thu, 13 Mar 2025 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVEmhR/KFVRzrqPQeH4C6U89d+Umb6IJ2OqQYCx+JF8=;
	b=rYDUhkM9MmlVmcNEZEH1RnQ5BxyxRinZ5SJkH126fDhsXrzpKYzS7ADm3agcaup/2hYQyi
	KgpbmzQAeO5ur8vZ9hwYUNi/4kHV5hnEI2Dmhs/kegtoF5xE4/M2H1qgWPZIFuGoqlOMK9
	HMOfEyxEhkKCMkcu4LAFiqZs9Mb1Sgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVEmhR/KFVRzrqPQeH4C6U89d+Umb6IJ2OqQYCx+JF8=;
	b=K08BJBQP2CW3KN7T7s9XDg6c/qZaUuNXlFqDIP0LP58Md6j0alHAJwVdDKXPm0gzWxldb0
	fpct4VTOtBbWPSBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVEmhR/KFVRzrqPQeH4C6U89d+Umb6IJ2OqQYCx+JF8=;
	b=rYDUhkM9MmlVmcNEZEH1RnQ5BxyxRinZ5SJkH126fDhsXrzpKYzS7ADm3agcaup/2hYQyi
	KgpbmzQAeO5ur8vZ9hwYUNi/4kHV5hnEI2Dmhs/kegtoF5xE4/M2H1qgWPZIFuGoqlOMK9
	HMOfEyxEhkKCMkcu4LAFiqZs9Mb1Sgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVEmhR/KFVRzrqPQeH4C6U89d+Umb6IJ2OqQYCx+JF8=;
	b=K08BJBQP2CW3KN7T7s9XDg6c/qZaUuNXlFqDIP0LP58Md6j0alHAJwVdDKXPm0gzWxldb0
	fpct4VTOtBbWPSBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74597139D2;
	Thu, 13 Mar 2025 17:42:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WF3QGuoY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 49/89] ASoC: wcd938x: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:54 +0100
Message-ID: <20250313174139.29942-50-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wcd938x-sdw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 4e2ae542cee3..cabddadc90ef 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1311,7 +1311,7 @@ static const struct sdw_device_id wcd9380_slave_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, wcd9380_slave_id);
 
-static int __maybe_unused wcd938x_sdw_runtime_suspend(struct device *dev)
+static int wcd938x_sdw_runtime_suspend(struct device *dev)
 {
 	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(dev);
 
@@ -1323,7 +1323,7 @@ static int __maybe_unused wcd938x_sdw_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wcd938x_sdw_runtime_resume(struct device *dev)
+static int wcd938x_sdw_runtime_resume(struct device *dev)
 {
 	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(dev);
 
@@ -1338,7 +1338,7 @@ static int __maybe_unused wcd938x_sdw_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops wcd938x_sdw_pm_ops = {
-	SET_RUNTIME_PM_OPS(wcd938x_sdw_runtime_suspend, wcd938x_sdw_runtime_resume, NULL)
+	RUNTIME_PM_OPS(wcd938x_sdw_runtime_suspend, wcd938x_sdw_runtime_resume, NULL)
 };
 
 
@@ -1349,7 +1349,7 @@ static struct sdw_driver wcd9380_codec_driver = {
 	.id_table = wcd9380_slave_id,
 	.driver = {
 		.name	= "wcd9380-codec",
-		.pm = &wcd938x_sdw_pm_ops,
+		.pm = pm_ptr(&wcd938x_sdw_pm_ops),
 	}
 };
 module_sdw_driver(wcd9380_codec_driver);
-- 
2.43.0

