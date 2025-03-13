Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D3D155326
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885681; cv=none; b=LpI8k7qVc5672Tl552Jwl6eKY8Yxf4g+ZQPAY9llyHh3ovgpc4zW8QhsnV8nmxzo5l4pTpfzJx8US3ZnugHh2M7g1WkQt127B4fiukUPNu3WoBHFK6hNhE8s2dHCoEb80V5MizoP0VtbAXwSpue/H8qOat9KhuMUusFBjz3TnM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885681; c=relaxed/simple;
	bh=XH79BDLmIeEqxXmYdk6HTL/u7NVxYAoQARfVxoQWm2U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bHSdTtnGFZpXswmmhbfc+LtCNvHOAPib5/7+Hi5j5RqBuACj4UtlLC5lyGe3dMkQhJYc2LR9hht6Grzxqpmtg3PUlpLZ8PFV3j5XHQ1yMLS00YKNgd4Gg3sDFjhb7bCBRcwZgrye+xFrR+o5uUGwj7XNuKRMlHPHVuoAzExz4VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UZ9TrXlb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w12K0oKN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UZ9TrXlb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w12K0oKN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UZ9TrXlb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w12K0oKN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UZ9TrXlb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w12K0oKN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0BCB71F770;
	Thu, 13 Mar 2025 17:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSyOyjszspfEgzpa0YroeyzqkOC53RjWpc/xORUX+IQ=;
	b=UZ9TrXlby4yI6zzGX1qJ922WV7h99oZXBtsciFr/ZWwFQwfjlLJwNaYCTCRDlUsLEmu0gt
	VmgqavwlZ4pp8rF07jEPf0dPqagZ9nWTxr7LdIyQ0tjW66VzvU7qg+4K8LHlYjWQjALKnt
	WtwANyS6On329CSofCQ1MdWGniGghdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSyOyjszspfEgzpa0YroeyzqkOC53RjWpc/xORUX+IQ=;
	b=w12K0oKN3cPCu5Tlk3ZWxluJyn7fHOZCzlO5Fdne3y12E6/GZcu717jf34zOSLji6UxXRf
	/CufzgYEn5Rm/vBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UZ9TrXlb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=w12K0oKN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSyOyjszspfEgzpa0YroeyzqkOC53RjWpc/xORUX+IQ=;
	b=UZ9TrXlby4yI6zzGX1qJ922WV7h99oZXBtsciFr/ZWwFQwfjlLJwNaYCTCRDlUsLEmu0gt
	VmgqavwlZ4pp8rF07jEPf0dPqagZ9nWTxr7LdIyQ0tjW66VzvU7qg+4K8LHlYjWQjALKnt
	WtwANyS6On329CSofCQ1MdWGniGghdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSyOyjszspfEgzpa0YroeyzqkOC53RjWpc/xORUX+IQ=;
	b=w12K0oKN3cPCu5Tlk3ZWxluJyn7fHOZCzlO5Fdne3y12E6/GZcu717jf34zOSLji6UxXRf
	/CufzgYEn5Rm/vBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E23CE13797;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IK8ONtgQ02ciOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:07:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 7/9] ALSA: oxygen: Convert to EXPORT_SIMPLE_DEV_PM_OPS()
Date: Thu, 13 Mar 2025 18:07:25 +0100
Message-ID: <20250313170731.26943-8-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313170731.26943-1-tiwai@suse.de>
References: <20250313170731.26943-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0BCB71F770
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
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer EXPORT_SIMPLE_DEV_PM_OPS() macro instead of
SIPLE_DEV_PM_OPS() and manual export, together with pm_ptr() macro,
which makes CONFIG_PM_SLEEP ifdefs superfluous.

Merely a cleanup, there should be no actual code change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/oxygen/oxygen.c     | 4 +---
 sound/pci/oxygen/oxygen.h     | 2 --
 sound/pci/oxygen/oxygen_lib.c | 5 +----
 sound/pci/oxygen/se6x.c       | 4 +---
 sound/pci/oxygen/virtuoso.c   | 4 +---
 5 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/sound/pci/oxygen/oxygen.c b/sound/pci/oxygen/oxygen.c
index c346f42befc2..6d0deea47ee6 100644
--- a/sound/pci/oxygen/oxygen.c
+++ b/sound/pci/oxygen/oxygen.c
@@ -854,11 +854,9 @@ static struct pci_driver oxygen_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = oxygen_ids,
 	.probe = generic_oxygen_probe,
-#ifdef CONFIG_PM_SLEEP
 	.driver = {
-		.pm = &oxygen_pci_pm,
+		.pm = pm_ptr(&oxygen_pci_pm),
 	},
-#endif
 };
 
 module_pci_driver(oxygen_driver);
diff --git a/sound/pci/oxygen/oxygen.h b/sound/pci/oxygen/oxygen.h
index 0cae640708f3..820026daf838 100644
--- a/sound/pci/oxygen/oxygen.h
+++ b/sound/pci/oxygen/oxygen.h
@@ -161,9 +161,7 @@ int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 				      const struct pci_device_id *id
 				     )
 		    );
-#ifdef CONFIG_PM_SLEEP
 extern const struct dev_pm_ops oxygen_pci_pm;
-#endif
 void oxygen_pci_shutdown(struct pci_dev *pci);
 
 /* oxygen_mixer.c */
diff --git a/sound/pci/oxygen/oxygen_lib.c b/sound/pci/oxygen/oxygen_lib.c
index 92ffe9dc20c5..9340d3c9ffd6 100644
--- a/sound/pci/oxygen/oxygen_lib.c
+++ b/sound/pci/oxygen/oxygen_lib.c
@@ -713,7 +713,6 @@ int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 }
 EXPORT_SYMBOL(oxygen_pci_probe);
 
-#ifdef CONFIG_PM_SLEEP
 static int oxygen_pci_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -789,9 +788,7 @@ static int oxygen_pci_resume(struct device *dev)
 	return 0;
 }
 
-SIMPLE_DEV_PM_OPS(oxygen_pci_pm, oxygen_pci_suspend, oxygen_pci_resume);
-EXPORT_SYMBOL(oxygen_pci_pm);
-#endif /* CONFIG_PM_SLEEP */
+EXPORT_SIMPLE_DEV_PM_OPS(oxygen_pci_pm, oxygen_pci_suspend, oxygen_pci_resume);
 
 void oxygen_pci_shutdown(struct pci_dev *pci)
 {
diff --git a/sound/pci/oxygen/se6x.c b/sound/pci/oxygen/se6x.c
index 17650a5b1bfa..c1bb9dd1cd54 100644
--- a/sound/pci/oxygen/se6x.c
+++ b/sound/pci/oxygen/se6x.c
@@ -137,11 +137,9 @@ static struct pci_driver se6x_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = se6x_ids,
 	.probe = se6x_probe,
-#ifdef CONFIG_PM_SLEEP
 	.driver = {
-		.pm = &oxygen_pci_pm,
+		.pm = pm_ptr(&oxygen_pci_pm),
 	},
-#endif
 	.shutdown = oxygen_pci_shutdown,
 };
 
diff --git a/sound/pci/oxygen/virtuoso.c b/sound/pci/oxygen/virtuoso.c
index 2e405133371f..0bfe6d8dde3e 100644
--- a/sound/pci/oxygen/virtuoso.c
+++ b/sound/pci/oxygen/virtuoso.c
@@ -82,11 +82,9 @@ static struct pci_driver xonar_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = xonar_ids,
 	.probe = xonar_probe,
-#ifdef CONFIG_PM_SLEEP
 	.driver = {
-		.pm = &oxygen_pci_pm,
+		.pm = pm_ptr(&oxygen_pci_pm),
 	},
-#endif
 	.shutdown = oxygen_pci_shutdown,
 };
 
-- 
2.43.0

