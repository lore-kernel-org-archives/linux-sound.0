Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5FE1F2364
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265421; cv=none; b=WlobZQuH0pYaAtsVQwDf+B80zj4/h3fF+52AGdNWa/BtWR5bUH6II4I5R5sLynf+ggzjBXemRiDfEvjBIuaKP7MvU8FNs14dSibLp38fQghUcJjBKxdBRULO/aasqnvvLB9hkn9ceN3xvEza/hxK/olavTYEyzdOfH10g3pYNsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265421; c=relaxed/simple;
	bh=QTOtapvsp32s+ErFPTdNYa3XyclWmieLrzmnzlJ/5bo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0v/awZaEs8GpzZLMkB+1mpXJSy/uGmtNT5Y1lLQ0hNhwf0Ud6cA9QVGkM5DpZMairR5ttBOXf7LdIS0AEbU76sa5+/XlnL4a9iv/oY+Vf1cpAkG2N7RGhq8d1FQaZIgDcK1X15oecuRJ1QDCjMd6QEQDJ9RteuLc5oz3Xp3XsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uAnYXOM1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JNsKTRyj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uAnYXOM1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JNsKTRyj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uAnYXOM1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JNsKTRyj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uAnYXOM1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JNsKTRyj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B716E1F450;
	Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bw6XsbKe8twXts7p6O+kQeH7v9MRfVSPAgMQRdmsFCM=;
	b=uAnYXOM1NnP3WQi9JOIeLbJHhuAnLEotErxSNNP2gEuo7raO2pXAqPZ3RxCb5emq8mC54p
	I7P9tdPC/OnaRy4gYF40nRKFmtCMyaEzZf9fboTpQk9dfD08ptRU+SjHSz2eJ7LT4mnnks
	tmgU4kCwiAauismfj9pqFpIH1ZUVhOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bw6XsbKe8twXts7p6O+kQeH7v9MRfVSPAgMQRdmsFCM=;
	b=JNsKTRyjQkYhu+5vXyE+70xhTFP4LllyeeGTCdxQ4eOpuj2r653fYR792AWIdPPwplnF+/
	PBTBHWRoEFDLKTDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bw6XsbKe8twXts7p6O+kQeH7v9MRfVSPAgMQRdmsFCM=;
	b=uAnYXOM1NnP3WQi9JOIeLbJHhuAnLEotErxSNNP2gEuo7raO2pXAqPZ3RxCb5emq8mC54p
	I7P9tdPC/OnaRy4gYF40nRKFmtCMyaEzZf9fboTpQk9dfD08ptRU+SjHSz2eJ7LT4mnnks
	tmgU4kCwiAauismfj9pqFpIH1ZUVhOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bw6XsbKe8twXts7p6O+kQeH7v9MRfVSPAgMQRdmsFCM=;
	b=JNsKTRyjQkYhu+5vXyE+70xhTFP4LllyeeGTCdxQ4eOpuj2r653fYR792AWIdPPwplnF+/
	PBTBHWRoEFDLKTDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D25913AA7;
	Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0GcMJcdOfWfNUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jan 2025 15:56:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 7/7] ALSA: hda: Simplify with str_enable_disable()
Date: Tue,  7 Jan 2025 16:56:37 +0100
Message-ID: <20250107155641.4435-8-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107155641.4435-1-tiwai@suse.de>
References: <20250107155641.4435-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the standard helper str_enable_disable() to simplify the code.
Only code refactoring, no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_component.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
index bb37e7e0bd79..9c82a2864a2f 100644
--- a/sound/hda/hdac_component.c
+++ b/sound/hda/hdac_component.c
@@ -5,6 +5,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/component.h>
+#include <linux/string_choices.h>
 #include <sound/core.h>
 #include <sound/hdaudio.h>
 #include <sound/hda_component.h>
@@ -42,8 +43,7 @@ int snd_hdac_set_codec_wakeup(struct hdac_bus *bus, bool enable)
 	if (!acomp->ops->codec_wake_override)
 		return 0;
 
-	dev_dbg(bus->dev, "%s codec wakeup\n",
-		enable ? "enable" : "disable");
+	dev_dbg(bus->dev, "%s codec wakeup\n", str_enable_disable(enable));
 
 	acomp->ops->codec_wake_override(acomp->dev, enable);
 
@@ -67,8 +67,7 @@ void snd_hdac_display_power(struct hdac_bus *bus, unsigned int idx, bool enable)
 {
 	struct drm_audio_component *acomp = bus->audio_component;
 
-	dev_dbg(bus->dev, "display power %s\n",
-		enable ? "enable" : "disable");
+	dev_dbg(bus->dev, "display power %s\n", str_enable_disable(enable));
 
 	mutex_lock(&bus->lock);
 	if (enable)
-- 
2.43.0

