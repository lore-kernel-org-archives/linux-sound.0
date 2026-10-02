Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB7B46AEFE
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931359; cv=none; b=IYAElHAzVxgZCn9qdAbtnEz4mZ9FjtuaHfPtbxIL8Cc+uR/C0o2w5BHmmfzZPa+Nn9e9FVa7MV4RSYfvNmWWs+1lQwD+/6KSb87NU9rQqUz/fsQ9YrKXHhKI7feiJ6Emw+lbOuDrEy3ZIRcRrNst9WvCjZrOA1ccvHOPpXkN8zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931359; c=relaxed/simple;
	bh=neLxhxvIBlMNHwXZRTgHi8rAL87eMGe1xsLEW3wY8O8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7pxv7/TK2SCvwl8mCUQkkOv1T4H03UFr4ZDwxo+Ow3nb0rDfMMA5ldAvmLXd37p+KLs6m0ccPHySuIedN9kkN6oN21RxWQX7TSYV/Fcb+dXk4Ns0RFR9FCBpmWIP/lBeQ3h5AKToZPguDt6PsTuotQ6QnK0b9iziwAeJlBhJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RHXZgAoi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oo+2pylY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g7hxgnh+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qcDyJCK1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RHXZgAoi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oo+2pylY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g7hxgnh+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qcDyJCK1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9009F1FE59;
	Fri,  2 Oct 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lw61k9h3bVn1NGUyKfhPo6RNJSD+nJA7M2eitgmgN5c=;
	b=RHXZgAoi1ussl7uNYXQLxTEQnCFBRBYAqB7aB2qZSCeuXdNXBJqXXQ6A3dy1k2SHbXtQNI
	wKlXyCHBw7DTb9XOugvf/df0vlZaF5rJ8QOh8p3OOWA2Z+IayPEXt0TiigEy4L4rVEOoxc
	m+rLWEWZM2CI0s8YyBUAqcafjvaxvqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lw61k9h3bVn1NGUyKfhPo6RNJSD+nJA7M2eitgmgN5c=;
	b=oo+2pylYreqLlWKzh/l131dtjnmgl+LGLekpihpvmr/ebttOXEEamieCAaWlVGUjw4G4aJ
	W+c3XlkNzBI1eGBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=g7hxgnh+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qcDyJCK1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lw61k9h3bVn1NGUyKfhPo6RNJSD+nJA7M2eitgmgN5c=;
	b=g7hxgnh+cRaP7cJn6cFJUzFXazbuYVSRPN+RwXsowwdiqELYQadNzpPhoLWsfxjPyTpU1Q
	WGSJIj9yZzSXTbDa6l1vdNv6iMl+3Ac9wYhPTC/Y7/JWJ8lXdtGYshfujCYhle1YUpa4Px
	REa0Da6IargTdHSyUGzMJdIb3x0wrd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lw61k9h3bVn1NGUyKfhPo6RNJSD+nJA7M2eitgmgN5c=;
	b=qcDyJCK1j9kr4yumcsookM3K5LhrNokHwSEJRkHBIKkM1vJlZW6fdLvEz0fRj3jBgeBgbf
	W72Ts9wpr0jhTOCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC69813C1A;
	Fri,  2 Oct 2026 08:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T32
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 31/32] ALSA: intel-hdmi-audio: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:55:09 +0200
Message-ID: <20261002085517.693510-32-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002085517.693510-1-tiwai@suse.de>
References: <20261002085517.693510-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9009F1FE59
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/x86/intel_hdmi_audio.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 91dfcf47e979..9f67244d4946 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1634,9 +1634,9 @@ static void hdmi_lpe_audio_free(struct snd_card *card)
  * This function is called when the i915 driver creates the
  * hdmi-lpe-audio platform device.
  */
-static int __hdmi_lpe_audio_probe(struct platform_device *pdev)
+static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_intelhad_card *card_ctx;
 	struct snd_intelhad *ctx;
 	struct snd_pcm *pcm;
@@ -1797,14 +1797,10 @@ static int __hdmi_lpe_audio_probe(struct platform_device *pdev)
 		schedule_work(&ctx->hdmi_audio_wq);
 	}
 
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int hdmi_lpe_audio_probe(struct platform_device *pdev)
-{
-	return snd_card_free_on_error(&pdev->dev, __hdmi_lpe_audio_probe(pdev));
-}
-
 static const struct dev_pm_ops hdmi_lpe_audio_pm = {
 	SYSTEM_SLEEP_PM_OPS(hdmi_lpe_audio_suspend, hdmi_lpe_audio_resume)
 };
-- 
2.55.0

