Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987BD39D6D5
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727545; cv=none; b=blQjntztgD/a8aQgW241zk3As9JJiJ2POjr7iNgxAPp5UOkJnzYQ4PoKZZD8XibcftG1QxB6aPuVcIJi/gKfOruLoGaCE+nnOINg50e7i6xrEgoP7uqArVAH4Vt4Ox7navy7oenIKwJ/RwbQ8onHlrtwuzahafAH39Glx3hf2/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727545; c=relaxed/simple;
	bh=aHfEGgo7IwKtpKtQeVm5n2aZF7gSvhT7zN5Vp0sCOww=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scY/Ll+4EGP4+WKFHl9xuG9nzdVIdNDbIfwPKyEQTryveTAZoFoSCA7tDPnehUGA1DDnf4THa4WkbaN/wLST8t84H5k8Ndlgmi2EMkBQnn0BWGQtkh1RJhG2QmNazubeiqEYwq82DNxGaxcS2oLplS62hzqCl92Zvs2hxCiNH88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v2m1ZzJM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1D7yj+Vu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v2m1ZzJM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1D7yj+Vu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v2m1ZzJM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1D7yj+Vu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v2m1ZzJM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1D7yj+Vu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF5254EE88;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUAMgtOzZxeMrH6s5B6jb7HgZwMABptXpou5EuNHLMU=;
	b=v2m1ZzJMClrHiiEHCk1pmwobjKcRD34NLU+q1XBgLImw66Mf8rpcjduNJEqX2AxkDH+Kn0
	qZxXKKRlMq4LkpyhVkDsZii4ek8Nz3UfEBnaXoIRbMn/vdOfPODoT5Cy/iX1MN5Pt5sehn
	YbnPuWPVXRCp2C+OcGgUqWToGMBMfrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUAMgtOzZxeMrH6s5B6jb7HgZwMABptXpou5EuNHLMU=;
	b=1D7yj+VuehpldLnWjjP9/SqgUSMbpzxNHXGmLpeXaQN9vOs2rzKzJCdIxR+IreLfqb8A1/
	Wraxa8bW9VXYl0BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v2m1ZzJM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1D7yj+Vu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUAMgtOzZxeMrH6s5B6jb7HgZwMABptXpou5EuNHLMU=;
	b=v2m1ZzJMClrHiiEHCk1pmwobjKcRD34NLU+q1XBgLImw66Mf8rpcjduNJEqX2AxkDH+Kn0
	qZxXKKRlMq4LkpyhVkDsZii4ek8Nz3UfEBnaXoIRbMn/vdOfPODoT5Cy/iX1MN5Pt5sehn
	YbnPuWPVXRCp2C+OcGgUqWToGMBMfrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUAMgtOzZxeMrH6s5B6jb7HgZwMABptXpou5EuNHLMU=;
	b=1D7yj+VuehpldLnWjjP9/SqgUSMbpzxNHXGmLpeXaQN9vOs2rzKzJCdIxR+IreLfqb8A1/
	Wraxa8bW9VXYl0BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7F564A0B5;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yC7hJ5Zz12mdWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 09:38:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 06/10] ALSA: hda/sigmatel: Clean up with the new GPIO helper
Date: Thu,  9 Apr 2026 11:38:19 +0200
Message-ID: <20260409093826.1317626-7-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409093826.1317626-1-tiwai@suse.de>
References: <20260409093826.1317626-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CF5254EE88

Use the new GPIO helper function to clean up the open code.

Merely a code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/sigmatel.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/hda/codecs/sigmatel.c b/sound/hda/codecs/sigmatel.c
index 4ff80a65168f..ee3bd21adc36 100644
--- a/sound/hda/codecs/sigmatel.c
+++ b/sound/hda/codecs/sigmatel.c
@@ -309,15 +309,7 @@ static void stac_gpio_set(struct hda_codec *codec, unsigned int mask,
 	/* Configure GPIOx as CMOS */
 	snd_hda_codec_write(codec, fg, 0, 0x7e7, 0);
 
-	snd_hda_codec_write(codec, fg, 0,
-			    AC_VERB_SET_GPIO_MASK, gpiomask);
-	snd_hda_codec_write_sync(codec, fg, 0,
-			   AC_VERB_SET_GPIO_DIRECTION, gpiodir); /* sync */
-
-	msleep(1);
-
-	snd_hda_codec_write_sync(codec, fg, 0,
-			   AC_VERB_SET_GPIO_DATA, gpiostate); /* sync */
+	snd_hda_codec_set_gpio(codec, gpiomask, gpiodir, gpiostate, 1);
 }
 
 /* hook for controlling mic-mute LED GPIO */
-- 
2.53.0

