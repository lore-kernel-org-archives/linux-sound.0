Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E877155326
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885675; cv=none; b=Oa31Cf27dHIk1MLbT9Bq2kwr+zVMR98hn05RHwib+UYjajVYkd5P1RQDg3QYAtIs93PVIZW4mjCElDPDjWSXtPirrS8ztPza9ryIKcCQ+jU0n09hZVpGe+LU1sZ9dqE8FFMkv7n6FPmvidyYq5lIhWwMJAAHpzpLqTcAZSnqNaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885675; c=relaxed/simple;
	bh=a3iLUE40JqOvMXTreaoujDf0sLjJw0v+yjQvNOgQILc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aC+kSzTdEHkHmxXG9GqYrk3tWjn+2gh24KLNFCK97LRkkBayBQlfbDRj22mwLYuwsr6CVflsbScJbcbMfjkZtsY17k9GnKEYZZRFQGNKULXohHq+cK/wdZC4HwZzjCuNKBjVRuRR822IxtUmr9NeLCuTtkdoU0wIwVrTEGGaLpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D/Mp3618; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8EZyi3cQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D/Mp3618; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8EZyi3cQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D/Mp3618";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8EZyi3cQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D/Mp3618";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8EZyi3cQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E59B1F76C;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WRl/zIqOdycq7yxDxjiicOF7k0Z/chtS5wTHE/udvM=;
	b=D/Mp3618etcxe3MO5xs2Ww9X1kUR5jnkBfnYXrl0Uo1fNmZO1nKunUSEuJjNlCyXTx0dGH
	yJ3HjFKydSTCS05H3NaKSG3P4XWLed1qwWXwXhIXcvxRd+XBIedTbDHZDhwZh23brEAAPB
	0adiEy7lvWSHisZhZj8VZxr1IZHA8aY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WRl/zIqOdycq7yxDxjiicOF7k0Z/chtS5wTHE/udvM=;
	b=8EZyi3cQ7LUekqHMVZ+2GXkPaquZYezLOAAkI5Y4t7KeSL1/lfijce7MKzgcTq/quvmCLD
	odMNSN/K6sgDloDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WRl/zIqOdycq7yxDxjiicOF7k0Z/chtS5wTHE/udvM=;
	b=D/Mp3618etcxe3MO5xs2Ww9X1kUR5jnkBfnYXrl0Uo1fNmZO1nKunUSEuJjNlCyXTx0dGH
	yJ3HjFKydSTCS05H3NaKSG3P4XWLed1qwWXwXhIXcvxRd+XBIedTbDHZDhwZh23brEAAPB
	0adiEy7lvWSHisZhZj8VZxr1IZHA8aY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WRl/zIqOdycq7yxDxjiicOF7k0Z/chtS5wTHE/udvM=;
	b=8EZyi3cQ7LUekqHMVZ+2GXkPaquZYezLOAAkI5Y4t7KeSL1/lfijce7MKzgcTq/quvmCLD
	odMNSN/K6sgDloDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74529139D2;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iOs0G9gQ02ciOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:07:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/9] ALSA: hda: Use RUNTIME_PM_OPS() and pm_ptr()
Date: Thu, 13 Mar 2025 18:07:22 +0100
Message-ID: <20250313170731.26943-5-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Clean up the code with the helper macros, and also assure that no PM
ops is assigned without CONFIG_PM via pm_ptr().

Merely a cleanup, there should be no actual code change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_bind.c  | 2 +-
 sound/pci/hda/hda_codec.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index b7ca2a83fbb0..9521e5e0e6e6 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -185,7 +185,7 @@ int __hda_codec_driver_register(struct hda_codec_driver *drv, const char *name,
 	drv->core.driver.probe = hda_codec_driver_probe;
 	drv->core.driver.remove = hda_codec_driver_remove;
 	drv->core.driver.shutdown = hda_codec_driver_shutdown;
-	drv->core.driver.pm = &hda_codec_driver_pm;
+	drv->core.driver.pm = pm_ptr(&hda_codec_driver_pm);
 	drv->core.type = HDA_DEV_LEGACY;
 	drv->core.match = hda_codec_match;
 	drv->core.unsol_event = hda_codec_unsol_event;
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 14763c0f31ad..b9bce583476e 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3037,8 +3037,7 @@ const struct dev_pm_ops hda_codec_driver_pm = {
 	.thaw = pm_sleep_ptr(hda_codec_pm_thaw),
 	.poweroff = pm_sleep_ptr(hda_codec_pm_suspend),
 	.restore = pm_sleep_ptr(hda_codec_pm_restore),
-	.runtime_suspend = pm_ptr(hda_codec_runtime_suspend),
-	.runtime_resume = pm_ptr(hda_codec_runtime_resume),
+	RUNTIME_PM_OPS(hda_codec_runtime_suspend, hda_codec_runtime_resume, NULL)
 };
 
 /* suspend the codec at shutdown; called from driver's shutdown callback */
-- 
2.43.0

