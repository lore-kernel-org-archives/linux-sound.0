Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960211C84B6
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887768; cv=none; b=QhbdCezZdJWYflQhm64aLqtlAo7QRfUEmt1U4qdlynNjbMqsObEzkZsMKSVikE9DK1ulpcZ3p1UeKGFU4j1QN/GqzX8Ziqcujs8rGhShfZduss0/7n59NwtWRWg6dEFFJYX5HhC/RuJd4VCHeexUAiCzqpNIVSatJcG9ews21wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887768; c=relaxed/simple;
	bh=sCPBGvHSYV093T+v1wPBO5KEyZbXadnc8ibRqg0MrMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZR+joC3uvCSebwmQmjeEvw6NQFdWM6u0e8J4mWsp8Tj1nBe7CiRiL50Kz1/ExCkyA4NtqT5uMWpcAibVBjHKXRm7fEoQIp9FAcYzzDa1gG6md7uQ8QmY60fPE7Cw0RkWWdaHiuwpxGOaQs1sXFysahGr4L7y0IezOFdSWb8tOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VAY/5j3G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sg+gmV0t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VAY/5j3G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sg+gmV0t; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VAY/5j3G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sg+gmV0t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VAY/5j3G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sg+gmV0t"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9B85A211CD;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XogWZgJWVLqVKeojjAPBnMGwcdI6XgP4tbk7gS+xstQ=;
	b=VAY/5j3GW1nvvqhM8ki0a93hJ9SqAASe9mtcMorgEiuSTxUzY5IRMDXjKf+gCrYosHxU+X
	p22CeZ6eKW3lQO890k8b4HLXZMs13KJraeoI6N+2SiJ11xPoFiBsSbpXVIoFvY7MWtDNMZ
	DG/48A7ZeMRYcyIqr4FlZ1Waekj03A0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XogWZgJWVLqVKeojjAPBnMGwcdI6XgP4tbk7gS+xstQ=;
	b=Sg+gmV0tzQNZCkVstPpG/bF4V5wo+54C24jjry677CuW2DmsoEltPGKDg4PdnFyWth0EV+
	+Mc7SgGO13W6/sAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XogWZgJWVLqVKeojjAPBnMGwcdI6XgP4tbk7gS+xstQ=;
	b=VAY/5j3GW1nvvqhM8ki0a93hJ9SqAASe9mtcMorgEiuSTxUzY5IRMDXjKf+gCrYosHxU+X
	p22CeZ6eKW3lQO890k8b4HLXZMs13KJraeoI6N+2SiJ11xPoFiBsSbpXVIoFvY7MWtDNMZ
	DG/48A7ZeMRYcyIqr4FlZ1Waekj03A0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XogWZgJWVLqVKeojjAPBnMGwcdI6XgP4tbk7gS+xstQ=;
	b=Sg+gmV0tzQNZCkVstPpG/bF4V5wo+54C24jjry677CuW2DmsoEltPGKDg4PdnFyWth0EV+
	+Mc7SgGO13W6/sAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A943139D2;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0HWTHOQY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 17/89] ASoC: cx2072x: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:22 +0100
Message-ID: <20250313174139.29942-18-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIE_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros instead
of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together with
pm_ptr(), which allows us dropping ugly __maybe_unused attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cx2072x.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 8cfec8dcf839..934526f8f292 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1611,7 +1611,7 @@ static const struct regmap_config cx2072x_regmap = {
 	.reg_write = cx2072x_reg_write,
 };
 
-static int __maybe_unused cx2072x_runtime_suspend(struct device *dev)
+static int cx2072x_runtime_suspend(struct device *dev)
 {
 	struct cx2072x_priv *cx2072x = dev_get_drvdata(dev);
 
@@ -1619,7 +1619,7 @@ static int __maybe_unused cx2072x_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cx2072x_runtime_resume(struct device *dev)
+static int cx2072x_runtime_resume(struct device *dev)
 {
 	struct cx2072x_priv *cx2072x = dev_get_drvdata(dev);
 
@@ -1696,17 +1696,15 @@ MODULE_DEVICE_TABLE(acpi, cx2072x_acpi_match);
 #endif
 
 static const struct dev_pm_ops cx2072x_runtime_pm = {
-	SET_RUNTIME_PM_OPS(cx2072x_runtime_suspend, cx2072x_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(cx2072x_runtime_suspend, cx2072x_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct i2c_driver cx2072x_i2c_driver = {
 	.driver = {
 		.name = "cx2072x",
 		.acpi_match_table = ACPI_PTR(cx2072x_acpi_match),
-		.pm = &cx2072x_runtime_pm,
+		.pm = pm_ptr(&cx2072x_runtime_pm),
 	},
 	.probe = cx2072x_i2c_probe,
 	.remove = cx2072x_i2c_remove,
-- 
2.43.0

