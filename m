Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E307C8002F
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321131; cv=none; b=XvjaLq6cKQS/9QTYpKZ887h+bXQBGSLcr8KgqhehcpW0/x7v9o1QQA/sVcxiSCfGq2+bzo1+n95JwM2Dcdn8tHWSzeBrdnm5bso22K72wyFGt+VcXEJXfyXemJAtsaEpp6eWuRV5oEPc5vDKyXuzbWmudQEq0mLxUjC0qnjNrwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321131; c=relaxed/simple;
	bh=Vionlu6dAbbcYlhqj+ppe1J8Dzt40/HJk39ntXo8cLs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WPviavrpzS0K2lwH/0QErOriBN6husFwFd5xrtvRslhBxEXobZ7xGfGLo8XpwVaXwhxJHBweWaMboplR1qF/7VZOViOd4lRHeDZJBxgKe5DfvYrqoax2rV9Z7Llxo7bwg/RT1J+taaK3m91ShuTNi93BGc2QSs1Vl1IiXznvhAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OmHfKq9F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D/CEfvQT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OmHfKq9F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D/CEfvQT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OmHfKq9F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D/CEfvQT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OmHfKq9F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D/CEfvQT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 071041F78B;
	Wed,  7 Feb 2024 15:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y7mEYEZ5ydHj6fVsvL4FUFJ6L7smA/bJbU7Tjxq2EuY=;
	b=OmHfKq9FizsR5lr+eCdFAJ85MMmKXsadXWfHDmkuKbIaPP1BZ9igoafHq3bbU9HHq1vSBa
	EnjVQ/FkCEJPGuh26cAu7JbUYlJeyVYbLnT0lhkLLmG8ogLsrFkRls/wZFZuP8NvjxDXl8
	8tWyGQoajdZyqq79Cteo1y0rw1Uz/0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y7mEYEZ5ydHj6fVsvL4FUFJ6L7smA/bJbU7Tjxq2EuY=;
	b=D/CEfvQTOhy1rbOwN06qR0Pc7VqLRTU8JaA6c1QL8lOINVAgOPkHuwPrrGHINjkB/cyJWj
	JX8AVaJnShzgH6Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y7mEYEZ5ydHj6fVsvL4FUFJ6L7smA/bJbU7Tjxq2EuY=;
	b=OmHfKq9FizsR5lr+eCdFAJ85MMmKXsadXWfHDmkuKbIaPP1BZ9igoafHq3bbU9HHq1vSBa
	EnjVQ/FkCEJPGuh26cAu7JbUYlJeyVYbLnT0lhkLLmG8ogLsrFkRls/wZFZuP8NvjxDXl8
	8tWyGQoajdZyqq79Cteo1y0rw1Uz/0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y7mEYEZ5ydHj6fVsvL4FUFJ6L7smA/bJbU7Tjxq2EuY=;
	b=D/CEfvQTOhy1rbOwN06qR0Pc7VqLRTU8JaA6c1QL8lOINVAgOPkHuwPrrGHINjkB/cyJWj
	JX8AVaJnShzgH6Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D305B13A41;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8NogMiGnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 25/29] ALSA: riptide: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:36 +0100
Message-Id: <20240207155140.18238-26-tiwai@suse.de>
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
X-Spam-Level: ***
X-Spam-Score: 3.63
X-Spamd-Result: default: False [3.63 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.07)[62.59%]
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

This ends up with an additional allocation of a flag without
CONFIG_PM, but the code simplification should justify the cost.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/riptide/riptide.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 9dee0345f22c..7e80686fb41a 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -448,9 +448,7 @@ struct snd_riptide {
 
 	unsigned long received_irqs;
 	unsigned long handled_irqs;
-#ifdef CONFIG_PM_SLEEP
 	int in_suspend;
-#endif
 };
 
 struct sgd {			/* scatter gather desriptor */
@@ -1142,7 +1140,6 @@ static irqreturn_t riptide_handleirq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int riptide_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -1166,11 +1163,7 @@ static int riptide_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(riptide_pm, riptide_suspend, riptide_resume);
-#define RIPTIDE_PM_OPS	&riptide_pm
-#else
-#define RIPTIDE_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(riptide_pm, riptide_suspend, riptide_resume);
 
 static int try_to_load_firmware(struct cmdif *cif, struct snd_riptide *chip)
 {
@@ -2135,7 +2128,7 @@ static struct pci_driver driver = {
 	.id_table = snd_riptide_ids,
 	.probe = snd_card_riptide_probe,
 	.driver = {
-		.pm = RIPTIDE_PM_OPS,
+		.pm = &riptide_pm,
 	},
 };
 
-- 
2.35.3

