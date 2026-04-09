Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98EC39D6D5
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727540; cv=none; b=pxgNzMqSr8qcGm+So6i+M4msRou9ct5OSPRzpuLr257vYrUow9tCWLynvH93x6stp24pIxVa5pSTIR6RO2VZNYjTs8qSuG/9aZX2BmoGzJQeB7kVai0+QDf1936SPmc4u/3/saZDgBoaAfVcQit5lkyQIaegcWu5SA+x6g9iCcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727540; c=relaxed/simple;
	bh=11XE9u/TTXtXl+a/nHmkMD9M3OfOI0V/xiZ+ypDkyPo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozQ3GI+/rkk2BZlAD8S32439NbK9q/F/+rLaSoZ/pTldmOiJYUbqYs3emj9cdI1Xz6hDmaOlBYwOovtyah7kqEMdxrTcnorQzn9GwbLP7+0tVsZM2Ff1e6zfka0ZQ7Bc7CuuK14ZUbBVTYUGRaN0jkFi3dhtTjy3bsfseQBVeYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cy5TZvLQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hSuTmSBU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cy5TZvLQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hSuTmSBU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cy5TZvLQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hSuTmSBU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cy5TZvLQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hSuTmSBU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 650414EE87;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWGwmdCUfnVuw5r6j1R5Vtt8Bc+FWP/RvSzAnHMD6B0=;
	b=cy5TZvLQRLZlQNgYx7OCZ4kDuT3qV82DUeuObM+6dT4RMKqPx4hIXkClo4QIIhOFGJg9t2
	Y3OaUkxrd9zo65x/BAodr006m8YNwP9AzHiW+eetfu1zaIaQKnrBOn4ZkwXPORSRAw20Ib
	20HM9JXXZyL7Pm6JebIO0nxJYf0VmAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWGwmdCUfnVuw5r6j1R5Vtt8Bc+FWP/RvSzAnHMD6B0=;
	b=hSuTmSBUYvTtwY++6KF1Q2lcTB//7r9uxxKPlnGIq4sl/WqbJoi3j5X4V9BTuexJk160OX
	xk5hPLXDWVI/1MBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cy5TZvLQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hSuTmSBU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWGwmdCUfnVuw5r6j1R5Vtt8Bc+FWP/RvSzAnHMD6B0=;
	b=cy5TZvLQRLZlQNgYx7OCZ4kDuT3qV82DUeuObM+6dT4RMKqPx4hIXkClo4QIIhOFGJg9t2
	Y3OaUkxrd9zo65x/BAodr006m8YNwP9AzHiW+eetfu1zaIaQKnrBOn4ZkwXPORSRAw20Ib
	20HM9JXXZyL7Pm6JebIO0nxJYf0VmAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWGwmdCUfnVuw5r6j1R5Vtt8Bc+FWP/RvSzAnHMD6B0=;
	b=hSuTmSBUYvTtwY++6KF1Q2lcTB//7r9uxxKPlnGIq4sl/WqbJoi3j5X4V9BTuexJk160OX
	xk5hPLXDWVI/1MBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D1394A0B5;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iNiIEZZz12mdWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 09:38:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/10] ALSA: hda/realtek: Clean up with snd_hda_codec_set_gpio()
Date: Thu,  9 Apr 2026 11:38:16 +0200
Message-ID: <20260409093826.1317626-4-tiwai@suse.de>
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
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 650414EE87
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Use a new helper function to clean up the code.

Along with it, make alc_write_gpio() static as well, which is used
only locally in realtek.c.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/realtek.c | 13 ++++---------
 sound/hda/codecs/realtek/realtek.h |  1 -
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index 39a1ead3b743..d9b2f1993eaf 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -123,22 +123,17 @@ void alc_update_gpio_data(struct hda_codec *codec, unsigned int mask,
 }
 EXPORT_SYMBOL_NS_GPL(alc_update_gpio_data, "SND_HDA_CODEC_REALTEK");
 
-void alc_write_gpio(struct hda_codec *codec)
+static void alc_write_gpio(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
 
 	if (!spec->gpio_mask)
 		return;
 
-	snd_hda_codec_write(codec, codec->core.afg, 0,
-			    AC_VERB_SET_GPIO_MASK, spec->gpio_mask);
-	snd_hda_codec_write(codec, codec->core.afg, 0,
-			    AC_VERB_SET_GPIO_DIRECTION, spec->gpio_dir);
-	if (spec->gpio_write_delay)
-		msleep(1);
-	alc_write_gpio_data(codec);
+	snd_hda_codec_set_gpio(codec, spec->gpio_mask, spec->gpio_dir,
+			       spec->gpio_data,
+			       spec->gpio_write_delay ? 1 : 0);
 }
-EXPORT_SYMBOL_NS_GPL(alc_write_gpio, "SND_HDA_CODEC_REALTEK");
 
 void alc_fixup_gpio(struct hda_codec *codec, int action, unsigned int mask)
 {
diff --git a/sound/hda/codecs/realtek/realtek.h b/sound/hda/codecs/realtek/realtek.h
index b2a919904c4c..2ca15a6c2a08 100644
--- a/sound/hda/codecs/realtek/realtek.h
+++ b/sound/hda/codecs/realtek/realtek.h
@@ -171,7 +171,6 @@ void alc_setup_gpio(struct hda_codec *codec, unsigned int mask);
 void alc_write_gpio_data(struct hda_codec *codec);
 void alc_update_gpio_data(struct hda_codec *codec, unsigned int mask,
 			  bool on);
-void alc_write_gpio(struct hda_codec *codec);
 
 /* common GPIO fixups */
 void alc_fixup_gpio(struct hda_codec *codec, int action, unsigned int mask);
-- 
2.53.0

