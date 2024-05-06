Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C19156227
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012033; cv=none; b=Ci49pA1A5wjnmT2ffmZAs/42xALDrk4Tl6OyE73xKoePGYKCu4CBNAnPGtxjMayhwkbE48iqcEvkTo1ZnMUofRM4L3pycxMP5UjHH4/deZJquPasmFP46wCkFrBVLRVxqXC69lL5KlAUOe89vdrSeB19KOeZHqgSub/b1ghcg4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012033; c=relaxed/simple;
	bh=PXHSpTUw8infV+NjRzYlJhgwNzlkySHgY547OxXkZB8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XkHzWzh4Id0bOK7WgufDkJXz6At5TotqriI41V30bzudQfjDyYQ5EIGFYktGki7oEsSHvQDKDtRxsnQvSYosahFfL0lFY7ytCEVg+sXwTTGaKVhtdN9tdDPeqgLnC4OVy/SlB5sgpcgS6F3gDmk46TnkCngw/RNuAKL+A5CPjYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OKkCuWp3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RVCKs7fJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OKkCuWp3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RVCKs7fJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OKkCuWp3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RVCKs7fJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OKkCuWp3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RVCKs7fJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5385A1F7A1;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cn/D8BIRRKSy5LYhC7gXWSuuc+R2c3Gp74+FKrHIF+k=;
	b=OKkCuWp3K0zYji2xyP6a64QrCLfm295r7nPVKafS3pgoAQsn2K14UPdjRv3PVIZkF9QDTJ
	sPKJHClV9LV8De2YKjP/ozEW8hejAPJbJ5qDehzdsITFzcEDkGrpm1PpwzPOvQdYgXCcoY
	hBxaeDALJOEgl7frmyYc61uzDo9I8IA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cn/D8BIRRKSy5LYhC7gXWSuuc+R2c3Gp74+FKrHIF+k=;
	b=RVCKs7fJJdHmUMY90YupxdH5Wo3qFqwJF/43T0oY8nqPxefG0Xb79cml0kxTh/cdjSYu6G
	cgSgDEXlNXxYPoCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OKkCuWp3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RVCKs7fJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cn/D8BIRRKSy5LYhC7gXWSuuc+R2c3Gp74+FKrHIF+k=;
	b=OKkCuWp3K0zYji2xyP6a64QrCLfm295r7nPVKafS3pgoAQsn2K14UPdjRv3PVIZkF9QDTJ
	sPKJHClV9LV8De2YKjP/ozEW8hejAPJbJ5qDehzdsITFzcEDkGrpm1PpwzPOvQdYgXCcoY
	hBxaeDALJOEgl7frmyYc61uzDo9I8IA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cn/D8BIRRKSy5LYhC7gXWSuuc+R2c3Gp74+FKrHIF+k=;
	b=RVCKs7fJJdHmUMY90YupxdH5Wo3qFqwJF/43T0oY8nqPxefG0Xb79cml0kxTh/cdjSYu6G
	cgSgDEXlNXxYPoCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3832A13A31;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qIlYDL4BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/12] ALSA: hda: conexant: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:50 +0200
Message-ID: <20240506161359.6960-8-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506161359.6960-1-tiwai@suse.de>
References: <20240506161359.6960-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-0.89 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.88)[85.74%];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -0.89
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 5385A1F7A1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

CONFIG_PM dependencies got reduced in HD-audio codec core driver, and
now it's time to reduce in HD-audio conexant codec driver, too.

Simply drop CONFIG_PM ifdefs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_conexant.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index e8209178d87b..17389a3801bd 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -294,13 +294,11 @@ static void cx_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	snd_hda_jack_unsol_event(codec, res);
 }
 
-#ifdef CONFIG_PM
 static int cx_auto_suspend(struct hda_codec *codec)
 {
 	cx_auto_shutdown(codec);
 	return 0;
 }
-#endif
 
 static const struct hda_codec_ops cx_auto_patch_ops = {
 	.build_controls = snd_hda_gen_build_controls,
@@ -308,10 +306,8 @@ static const struct hda_codec_ops cx_auto_patch_ops = {
 	.init = cx_auto_init,
 	.free = cx_auto_free,
 	.unsol_event = cx_jack_unsol_event,
-#ifdef CONFIG_PM
 	.suspend = cx_auto_suspend,
 	.check_power_status = snd_hda_gen_check_power_status,
-#endif
 };
 
 /*
-- 
2.43.0

