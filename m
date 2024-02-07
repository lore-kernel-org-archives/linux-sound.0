Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3406C8063F
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321131; cv=none; b=ScALfru7mhVabFiijdjWj54VFY2H4Ottt2e1bdc0u0yigDBsQqPmrWGXHQfyc9MN3v6mo9VdUoXL3C1E/NuFTFT6MqXbNCWDoFguT6i+jODlRjR+Kz1HnGtVxlvESVBqykccA14dMshac27cj4IFYqlOmWO09DwROcIiT+yoUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321131; c=relaxed/simple;
	bh=EvRpMeQXqdrF9GHztUSN17/XpnSRBnq9+4Ikf+zduoc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IrqHvs7GOB5TeZ5FH2QuUpyhnOpRSVYLSVtZaoMlP/DIypCyU+6bV5qt8PJQy4T+F03Wye3XjhD0rB7ZAGe9y7Xif2t/WtjtYdTPlZZ9qftt1G5Io+i70yAIFNNn4WjHOIyKJvMa53nfEbtKxPyqxettCoONgvIHSTnV79iw768=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n3xK1Otl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pLy2wCJI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n3xK1Otl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pLy2wCJI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n3xK1Otl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pLy2wCJI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n3xK1Otl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pLy2wCJI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 151361FC0D;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0zZ028hNzQmD1UXgkzgkxivVsFb7KPn9mZ4FtigkCA=;
	b=n3xK1OtlN+fUzHArFkk56RgReZV9hlp1eihaVfOu4ymGYfHVeSlJquX9V3iqbc8UPdicpc
	+OQTiKAEpmLz7q5QB3YHsCNUl28/UHFsJzVx7kFgJqkovU2Z58So7VJsT2NLS9ZAyFB5Ho
	9xw0UPN+43W/mC+hYCNZfvlWuOEyPB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0zZ028hNzQmD1UXgkzgkxivVsFb7KPn9mZ4FtigkCA=;
	b=pLy2wCJItZ5F+xMSKv6vUw49v6Rti+c+XTMoA+twrbuU1s6PHTvj6Y1bX68iMYUu0HgLiu
	IgTH+EBeP/n7lzAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0zZ028hNzQmD1UXgkzgkxivVsFb7KPn9mZ4FtigkCA=;
	b=n3xK1OtlN+fUzHArFkk56RgReZV9hlp1eihaVfOu4ymGYfHVeSlJquX9V3iqbc8UPdicpc
	+OQTiKAEpmLz7q5QB3YHsCNUl28/UHFsJzVx7kFgJqkovU2Z58So7VJsT2NLS9ZAyFB5Ho
	9xw0UPN+43W/mC+hYCNZfvlWuOEyPB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0zZ028hNzQmD1UXgkzgkxivVsFb7KPn9mZ4FtigkCA=;
	b=pLy2wCJItZ5F+xMSKv6vUw49v6Rti+c+XTMoA+twrbuU1s6PHTvj6Y1bX68iMYUu0HgLiu
	IgTH+EBeP/n7lzAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E69F0139B9;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yGzWNR+nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 13/29] ASoC: pxa2xx-ac97: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:24 +0100
Message-Id: <20240207155140.18238-14-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240207155140.18238-1-tiwai@suse.de>
References: <20240207155140.18238-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[26.70%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/pxa/pxa2xx-ac97.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index e73bd62c033c..80e0ea0ec9fb 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -271,7 +271,6 @@ static void pxa2xx_ac97_dev_remove(struct platform_device *pdev)
 	pxa2xx_ac97_hw_remove(pdev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int pxa2xx_ac97_dev_suspend(struct device *dev)
 {
 	return pxa2xx_ac97_hw_suspend();
@@ -282,18 +281,15 @@ static int pxa2xx_ac97_dev_resume(struct device *dev)
 	return pxa2xx_ac97_hw_resume();
 }
 
-static SIMPLE_DEV_PM_OPS(pxa2xx_ac97_pm_ops,
+static DEFINE_SIMPLE_DEV_PM_OPS(pxa2xx_ac97_pm_ops,
 		pxa2xx_ac97_dev_suspend, pxa2xx_ac97_dev_resume);
-#endif
 
 static struct platform_driver pxa2xx_ac97_driver = {
 	.probe		= pxa2xx_ac97_dev_probe,
 	.remove_new	= pxa2xx_ac97_dev_remove,
 	.driver		= {
 		.name	= "pxa2xx-ac97",
-#ifdef CONFIG_PM_SLEEP
 		.pm	= &pxa2xx_ac97_pm_ops,
-#endif
 		.of_match_table = of_match_ptr(pxa2xx_ac97_dt_ids),
 	},
 };
-- 
2.35.3

