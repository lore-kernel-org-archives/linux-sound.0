Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC1622F17B
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205584; cv=none; b=jgmSD3zajeTc/rFH+3AIFVSPnn4ezKQUVVZV/9CwQm+tSzEhJTWI9MeZ/OJeTeAYcRS6gfV/mqugVvFWnl39VBo/xhpNTgDroxlMcowFdthDjZ510laBkqegua0Cd3fNg/HptycCQkJ+PTOMqpXZd/ySQXwBK1vAtiXFnE63jiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205584; c=relaxed/simple;
	bh=hITV6EfDIKhaEcwBeMvybUAMHUwSTeFaMPF4sM3YWwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ni/0EpC8F75kv8x3mmTcsePDNpvl5IKXRQQ6FjazKLteNUcjIrZahzY4yHd0VdDbYavL/pnx0fmTdrSWWYP9XJENDgJkp58F9koyCUx0K4oiaot7a8a+mREDutsCQYW7bxVfs3NYC2UGXQFiAYyaqOX9fOVKw4fycFrNJtp/OH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mhQtxWHG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=26gCgijA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mhQtxWHG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=26gCgijA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mhQtxWHG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="26gCgijA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mhQtxWHG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="26gCgijA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 523F21FDFF;
	Mon, 17 Mar 2025 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KjvMoe1wHFv2QKUzEtDqfZ57yO6tquEj0mJI+MFAm0=;
	b=mhQtxWHGLX1PjCmJjHLFVtVEUd9TaB0gGEWt6AYvAxoGIu0B/VJK7BhS70ec5R+V79yiHu
	1W9eXSf5klivMB2Ovt1fux92A1E17AyD+80r7W9SD2DvP1wmMmSEQ4ULL+ZdGST98BVeCb
	rjabQbE7xwClDIPtZulTGFZczd7VX4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205384;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KjvMoe1wHFv2QKUzEtDqfZ57yO6tquEj0mJI+MFAm0=;
	b=26gCgijAuQ8nVxZJdcLj0pUyUmYB+u9IVeFwrCizMz2iGmBowgzeEhiEaYqyDke8O3SWfd
	lOkRPL/b1hJyfGCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KjvMoe1wHFv2QKUzEtDqfZ57yO6tquEj0mJI+MFAm0=;
	b=mhQtxWHGLX1PjCmJjHLFVtVEUd9TaB0gGEWt6AYvAxoGIu0B/VJK7BhS70ec5R+V79yiHu
	1W9eXSf5klivMB2Ovt1fux92A1E17AyD+80r7W9SD2DvP1wmMmSEQ4ULL+ZdGST98BVeCb
	rjabQbE7xwClDIPtZulTGFZczd7VX4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205384;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KjvMoe1wHFv2QKUzEtDqfZ57yO6tquEj0mJI+MFAm0=;
	b=26gCgijAuQ8nVxZJdcLj0pUyUmYB+u9IVeFwrCizMz2iGmBowgzeEhiEaYqyDke8O3SWfd
	lOkRPL/b1hJyfGCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B05C132CF;
	Mon, 17 Mar 2025 09:56:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YAMvCcjx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 62/88] ASoC: intel: catpt: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:24 +0100
Message-ID: <20250317095603.20073-63-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/catpt/device.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 2aa637124bec..faa916f40069 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -28,7 +28,7 @@
 #define CREATE_TRACE_POINTS
 #include "trace.h"
 
-static int __maybe_unused catpt_suspend(struct device *dev)
+static int catpt_suspend(struct device *dev)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dev);
 	struct dma_chan *chan;
@@ -72,7 +72,7 @@ static int __maybe_unused catpt_suspend(struct device *dev)
 	return catpt_dsp_power_down(cdev);
 }
 
-static int __maybe_unused catpt_resume(struct device *dev)
+static int catpt_resume(struct device *dev)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dev);
 	int ret, i;
@@ -106,7 +106,7 @@ static int __maybe_unused catpt_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused catpt_runtime_suspend(struct device *dev)
+static int catpt_runtime_suspend(struct device *dev)
 {
 	if (!try_module_get(dev->driver->owner)) {
 		dev_info(dev, "module unloading, skipping suspend\n");
@@ -117,14 +117,14 @@ static int __maybe_unused catpt_runtime_suspend(struct device *dev)
 	return catpt_suspend(dev);
 }
 
-static int __maybe_unused catpt_runtime_resume(struct device *dev)
+static int catpt_runtime_resume(struct device *dev)
 {
 	return catpt_resume(dev);
 }
 
 static const struct dev_pm_ops catpt_dev_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(catpt_suspend, catpt_resume)
-	SET_RUNTIME_PM_OPS(catpt_runtime_suspend, catpt_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(catpt_suspend, catpt_resume)
+	RUNTIME_PM_OPS(catpt_runtime_suspend, catpt_runtime_resume, NULL)
 };
 
 /* machine board owned by CATPT is removed with this hook */
@@ -378,7 +378,7 @@ static struct platform_driver catpt_acpi_driver = {
 	.driver = {
 		.name = "intel_catpt",
 		.acpi_match_table = catpt_ids,
-		.pm = &catpt_dev_pm,
+		.pm = pm_ptr(&catpt_dev_pm),
 		.dev_groups = catpt_attr_groups,
 	},
 };
-- 
2.43.0

