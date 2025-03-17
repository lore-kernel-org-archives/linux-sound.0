Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEB022DF94
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205547; cv=none; b=JDLQia59i+/VaO4g1tR2lXMe8wdmwsdgbF4eoSY5RdjxuH9itikzsexV4wMN0WU4zWYkNn814WCTd/giW3xo8pxp+fkrHkVmnQqLtdseaRJlyU6aDkRQp8g1D37S8NUYuslsbHhyxOgeBiyTsC0BzeRdv4J1DM1CKibSjHWHmZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205547; c=relaxed/simple;
	bh=UFghHy2AClwzjwoWANI5ykIdw4ypHVvv6APKit31yWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/DAjtRO8ZZufYdESbcbvcqrv9OePJZbR9ic5WAPHcvridrJNuXcWNsKLT4wlhVrExjNjm2KWi/JF4ln4DIjsOeOk/ofCejIe/7zfbXUIni8y3P+DGr6TkYtbwIUhyS0R7zJpjDbnPkhBHMevaxda1i+g9EvrMMBPZca30/rMp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BlsDgz7I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y025USmN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BlsDgz7I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y025USmN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BlsDgz7I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y025USmN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BlsDgz7I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y025USmN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B051B20236;
	Mon, 17 Mar 2025 09:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCRmmGCW/ivrFeOIU3GLuyKJc6iNw30D6Qh4IoN+PW4=;
	b=BlsDgz7I99MxqWOmAOi5b4IIbAFWoqjhxkLYWK1i+9WbwPtK30qYqzgby3+9ITXI9ZOo1B
	/EWUBBiVDzhgQC9nPx32j9vRDjTSHzn471FkM6cyxRM2tTrHzx5Kt2qxiww0JekZ8SS4R9
	nGEXq/gGF/aGxX5KtW69ZnWu1T7TG/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCRmmGCW/ivrFeOIU3GLuyKJc6iNw30D6Qh4IoN+PW4=;
	b=y025USmNlkSP63LOMPu9NnO8sUMXmLJw9N7G9ZAnTBoA6sfEh3tv/z40aQ7NVQa8oZ1kVr
	QVTRFp5vji1IHCCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCRmmGCW/ivrFeOIU3GLuyKJc6iNw30D6Qh4IoN+PW4=;
	b=BlsDgz7I99MxqWOmAOi5b4IIbAFWoqjhxkLYWK1i+9WbwPtK30qYqzgby3+9ITXI9ZOo1B
	/EWUBBiVDzhgQC9nPx32j9vRDjTSHzn471FkM6cyxRM2tTrHzx5Kt2qxiww0JekZ8SS4R9
	nGEXq/gGF/aGxX5KtW69ZnWu1T7TG/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCRmmGCW/ivrFeOIU3GLuyKJc6iNw30D6Qh4IoN+PW4=;
	b=y025USmNlkSP63LOMPu9NnO8sUMXmLJw9N7G9ZAnTBoA6sfEh3tv/z40aQ7NVQa8oZ1kVr
	QVTRFp5vji1IHCCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91C16132CF;
	Mon, 17 Mar 2025 09:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kKphIsXx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 49/88] ASoC: wcd939x: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:11 +0100
Message-ID: <20250317095603.20073-50-tiwai@suse.de>
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
X-Spam-Score: -6.80
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

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

