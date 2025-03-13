Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3A918D65F
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887966; cv=none; b=lP8NpHXd6ZWOwvdtfdjSx15662U29WnFtCX5ihb+BlMQRW+DuZlWEchzXkKSW0ryBDZehc0uOL1Za4mmA81+veT39Dzg05nAgk/jgbIaH37i1fF7npDSOBRXWyCjnGWdPAhAF8qfSqXqrke/IFwId1tGFrZLXwUzCFl3BlvDZbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887966; c=relaxed/simple;
	bh=HyzmEeEh1ys6+SDpv387Ql3zEPEQ7MbpDh9ZxbXmwkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OACSw0/9pTHpuT5spuc9Xb6EIAo8j1Tt7XLm8x7JcdTw7ICrDDORJYi3Ipw1E5sj55sZeAD3YdObl1RYQAmDHr03f7vWqXTdugTzryz2TTBShjxF8FAdutSqaPbHx7lJ9kDytofxgRCL9YbQTK2+7s+ctgyVGSX7WyDL53R1LxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bDjtabfE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HIVuCwlo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bDjtabfE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HIVuCwlo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bDjtabfE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HIVuCwlo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bDjtabfE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HIVuCwlo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BDDB2211F3;
	Thu, 13 Mar 2025 17:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YYCvBfzJuMCdKs+b5AcoCMaHoZY/XwQCOHPxmc3uNg=;
	b=bDjtabfErwUIVgD78cOt5u0Z8Pz9HC1Mk4BnsEQneFycVe5lGKHMTdhjhRJgIiuAotK+af
	PZWyyst1Z/G7h7yk9uuMcEuySQ+yPkJ3uxeDo+thSqfe0VrDKOG2kaDrnEfjeON0XWIrbB
	evDT53q1JFMQYk9wUqZAle9oB4+HLw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YYCvBfzJuMCdKs+b5AcoCMaHoZY/XwQCOHPxmc3uNg=;
	b=HIVuCwlodrnRm4nzNxXb1odhDCGao3C4LVlNs8tzxmRvM8EBYB3Uqx+lIh6IJsTgsWH4dE
	cZWLiCOf5bQePbDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bDjtabfE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HIVuCwlo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YYCvBfzJuMCdKs+b5AcoCMaHoZY/XwQCOHPxmc3uNg=;
	b=bDjtabfErwUIVgD78cOt5u0Z8Pz9HC1Mk4BnsEQneFycVe5lGKHMTdhjhRJgIiuAotK+af
	PZWyyst1Z/G7h7yk9uuMcEuySQ+yPkJ3uxeDo+thSqfe0VrDKOG2kaDrnEfjeON0XWIrbB
	evDT53q1JFMQYk9wUqZAle9oB4+HLw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YYCvBfzJuMCdKs+b5AcoCMaHoZY/XwQCOHPxmc3uNg=;
	b=HIVuCwlodrnRm4nzNxXb1odhDCGao3C4LVlNs8tzxmRvM8EBYB3Uqx+lIh6IJsTgsWH4dE
	cZWLiCOf5bQePbDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97683137BA;
	Thu, 13 Mar 2025 17:42:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qDGtI+8Y02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH 78/89] ASoC: SOF: acpi: Convert to EXPORT_NS_DEV_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:23 +0100
Message-ID: <20250313174139.29942-79-tiwai@suse.de>
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
X-Rspamd-Queue-Id: BDDB2211F3
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer EXPORT_NS_DEV_PM_OPS() macro together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: sound-open-firmware@alsa-project.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/intel/bdw.c    | 2 +-
 sound/soc/sof/intel/byt.c    | 2 +-
 sound/soc/sof/sof-acpi-dev.c | 9 ++++-----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 79374dcde89f..f1287d509835 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -686,7 +686,7 @@ static struct platform_driver snd_sof_acpi_intel_bdw_driver = {
 	.remove = sof_acpi_remove,
 	.driver = {
 		.name = "sof-audio-acpi-intel-bdw",
-		.pm = &sof_acpi_pm,
+		.pm = pm_ptr(&sof_acpi_pm),
 		.acpi_match_table = sof_broadwell_match,
 	},
 };
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 900cc10a3b7f..18208f77b84d 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -467,7 +467,7 @@ static struct platform_driver snd_sof_acpi_intel_byt_driver = {
 	.remove = sof_acpi_remove,
 	.driver = {
 		.name = "sof-audio-acpi-intel-byt",
-		.pm = &sof_acpi_pm,
+		.pm = pm_ptr(&sof_acpi_pm),
 		.acpi_match_table = sof_baytrail_match,
 	},
 };
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 58fd5f7c7905..cd5bcd2e1475 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -36,12 +36,11 @@ MODULE_PARM_DESC(sof_acpi_debug, "SOF ACPI debug options (0x0 all off)");
 
 #define SOF_ACPI_DISABLE_PM_RUNTIME BIT(0)
 
-const struct dev_pm_ops sof_acpi_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
-	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
-			   snd_sof_runtime_idle)
+EXPORT_NS_DEV_PM_OPS(sof_acpi_pm, "SND_SOC_SOF_ACPI_DEV") = {
+	SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
+	RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
+		       snd_sof_runtime_idle)
 };
-EXPORT_SYMBOL_NS(sof_acpi_pm, "SND_SOC_SOF_ACPI_DEV");
 
 static void sof_acpi_probe_complete(struct device *dev)
 {
-- 
2.43.0

