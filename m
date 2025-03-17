Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF722ACEF
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205485; cv=none; b=cH1T5g4Ydyoo3K5IM7zGys6otjxZ6Eg1JyLBHSGHvuUvJumgikJawUSG8oSVRKtOwpzjPP7bq96nsJ40uG3J3WNxe1OVssXnHk0+zUzn592f2XHNsEeo4FKKiBQPI6Hx8o8lKpJDDN6udQKPzPTDReZoj3qh0TrUgdIpEcJlLos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205485; c=relaxed/simple;
	bh=R+DVQYzGhnOeagk+Y5I7qAjWdI/lc++U82fnDNtOjHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NO3VjMYbawriel28Ri/WLxebsGddr9LfMv8AaNaOipFqY0VjlFN2X9hUaDsFLekC6So2DQCYLegTTF0Ki0Vw+VDoVC20ORIYHKFAkPoOIzZ94TYq/N3hlzXxx2Jl4LeiOYVVVNEbpHg14atSz4YQjNcxs66lhn8/35TmBoZGaSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cFFTnvoJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7uNV+Xt1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cFFTnvoJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7uNV+Xt1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cFFTnvoJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7uNV+Xt1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cFFTnvoJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7uNV+Xt1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 85C0D21F3E;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IS4KPgdBD3ff/FphhPhROAdb9D3gS90At2Cq6vZ7XBY=;
	b=cFFTnvoJkuJPagD79vKTvUziW5a9MzDiytAxj+ilgjgIhdeAokyk4AQ2b0EOIDKszfhZr/
	qAuzv5Ofcj8UkzuUm72MmlttolB31XcKNUBwsu96hScUAFCRwk9cfeJ5mS/n1KL85DbK9K
	P1TFh2cAp4fLUpj5Olzs2GgUhd/ho1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IS4KPgdBD3ff/FphhPhROAdb9D3gS90At2Cq6vZ7XBY=;
	b=7uNV+Xt1blxkzzT1M8FdzXULl+1rhmr2ZBsDiVFGgCTb/Rqw3gedpPl6pkeL9mImu09rFk
	IPD6loLh/HHC1LBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IS4KPgdBD3ff/FphhPhROAdb9D3gS90At2Cq6vZ7XBY=;
	b=cFFTnvoJkuJPagD79vKTvUziW5a9MzDiytAxj+ilgjgIhdeAokyk4AQ2b0EOIDKszfhZr/
	qAuzv5Ofcj8UkzuUm72MmlttolB31XcKNUBwsu96hScUAFCRwk9cfeJ5mS/n1KL85DbK9K
	P1TFh2cAp4fLUpj5Olzs2GgUhd/ho1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IS4KPgdBD3ff/FphhPhROAdb9D3gS90At2Cq6vZ7XBY=;
	b=7uNV+Xt1blxkzzT1M8FdzXULl+1rhmr2ZBsDiVFGgCTb/Rqw3gedpPl6pkeL9mImu09rFk
	IPD6loLh/HHC1LBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60C5F132CF;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ePleFsTx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 42/88] ASoC: rt722: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:04 +0100
Message-ID: <20250317095603.20073-43-tiwai@suse.de>
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
	RCPT_COUNT_THREE(0.00)[4];
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
 sound/soc/codecs/rt722-sdca-sdw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 543cb32c2463..11e2e8f68a98 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -430,7 +430,7 @@ static const struct sdw_device_id rt722_sdca_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt722_sdca_id);
 
-static int __maybe_unused rt722_sdca_dev_suspend(struct device *dev)
+static int rt722_sdca_dev_suspend(struct device *dev)
 {
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(dev);
 
@@ -445,7 +445,7 @@ static int __maybe_unused rt722_sdca_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt722_sdca_dev_system_suspend(struct device *dev)
+static int rt722_sdca_dev_system_suspend(struct device *dev)
 {
 	struct rt722_sdca_priv *rt722_sdca = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -477,7 +477,7 @@ static int __maybe_unused rt722_sdca_dev_system_suspend(struct device *dev)
 
 #define RT722_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt722_sdca_dev_resume(struct device *dev)
+static int rt722_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(dev);
@@ -514,14 +514,14 @@ static int __maybe_unused rt722_sdca_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt722_sdca_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt722_sdca_dev_system_suspend, rt722_sdca_dev_resume)
-	SET_RUNTIME_PM_OPS(rt722_sdca_dev_suspend, rt722_sdca_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt722_sdca_dev_system_suspend, rt722_sdca_dev_resume)
+	RUNTIME_PM_OPS(rt722_sdca_dev_suspend, rt722_sdca_dev_resume, NULL)
 };
 
 static struct sdw_driver rt722_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt722-sdca",
-		.pm = &rt722_sdca_pm,
+		.pm = pm_ptr(&rt722_sdca_pm),
 	},
 	.probe = rt722_sdca_sdw_probe,
 	.remove = rt722_sdca_sdw_remove,
-- 
2.43.0

