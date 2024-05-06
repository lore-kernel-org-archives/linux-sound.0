Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE1B156642
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012037; cv=none; b=d8ZxEWisSqtO8lRpS4e1Vub9C1SdAXHKiy7I/Ay+tQOCso1edEalOcRlPdHJnX9GtJPTfJMx+NM9aTRfhqiMYFlMO17RZQxYBAGl9vsd7l8/If97GawN0AED84pc9s3wBN59oYfnE+bYLS3nK9zU0TZRsuUm9hBQqlHQvRmcRlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012037; c=relaxed/simple;
	bh=sqkvpVNjD83vtU0gk9MkzQyfQbmw3zKAJEOqQaVMfvE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=biLZr6tDZdBRQgvINa+pWFJAq07oHwQn2+Gp9Fn42bPWIlIh6SEDP7xFE+7+dNAHLD2Qrxp5hLUccxDFY/aRluk58RDau0VtV0BuykXApRUO69ZjDtpt+sSbIIF5xMaaHPU0jOjhgWjF0yVrga7nox9eS2yhrYSIywOpqXa7OFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u99oct3l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ky6Cxd8b; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u99oct3l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ky6Cxd8b; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u99oct3l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ky6Cxd8b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u99oct3l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ky6Cxd8b"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9A3961F7A4;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kd9zgezS9Fe0AxPd2/Wf1A4NlSKjKFIeTQ1fxfwMUNE=;
	b=u99oct3lLG+d6PpFoqin1Q1hp1029ZAxypcsgXKcOaDwELdaJMPTWmsbZJn1qgYS+aCIan
	Cf5JZTQWMmlMeHv6XeBOPjl7+iLJ6y8a+F/z9jZL/PgZKhPxhUw4CkcN1IQd2qkdODonW/
	bhIDGXQile6WSr1cgIClCeM/7pOFFbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kd9zgezS9Fe0AxPd2/Wf1A4NlSKjKFIeTQ1fxfwMUNE=;
	b=Ky6Cxd8bPW0IWd5XRuUYH1OnpOJcLZABcAQsgbSWRv59cvQQrOsQ7w2Km2o9jyuvUbwQ4R
	H4enQtRtissROGAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u99oct3l;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ky6Cxd8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kd9zgezS9Fe0AxPd2/Wf1A4NlSKjKFIeTQ1fxfwMUNE=;
	b=u99oct3lLG+d6PpFoqin1Q1hp1029ZAxypcsgXKcOaDwELdaJMPTWmsbZJn1qgYS+aCIan
	Cf5JZTQWMmlMeHv6XeBOPjl7+iLJ6y8a+F/z9jZL/PgZKhPxhUw4CkcN1IQd2qkdODonW/
	bhIDGXQile6WSr1cgIClCeM/7pOFFbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kd9zgezS9Fe0AxPd2/Wf1A4NlSKjKFIeTQ1fxfwMUNE=;
	b=Ky6Cxd8bPW0IWd5XRuUYH1OnpOJcLZABcAQsgbSWRv59cvQQrOsQ7w2Km2o9jyuvUbwQ4R
	H4enQtRtissROGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81DA313A31;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cG9hHr4BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/12] ALSA: hda: hdmi: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:52 +0200
Message-ID: <20240506161359.6960-10-tiwai@suse.de>
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
X-Spamd-Result: default: False [-0.56 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.55)[80.90%];
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
X-Spam-Score: -0.56
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 9A3961F7A4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

CONFIG_PM dependencies got reduced in HD-audio codec core driver, and
now it's time to reduce in HD-audio HDMI codec driver, too.

Simply drop CONFIG_PM ifdefs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 495d63101186..b2c42cd54351 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2513,7 +2513,6 @@ static void generic_hdmi_free(struct hda_codec *codec)
 	generic_spec_free(codec);
 }
 
-#ifdef CONFIG_PM
 static int generic_hdmi_suspend(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec = codec->spec;
@@ -2540,7 +2539,6 @@ static int generic_hdmi_resume(struct hda_codec *codec)
 	}
 	return 0;
 }
-#endif
 
 static const struct hda_codec_ops generic_hdmi_patch_ops = {
 	.init			= generic_hdmi_init,
@@ -2548,10 +2546,8 @@ static const struct hda_codec_ops generic_hdmi_patch_ops = {
 	.build_pcms		= generic_hdmi_build_pcms,
 	.build_controls		= generic_hdmi_build_controls,
 	.unsol_event		= hdmi_unsol_event,
-#ifdef CONFIG_PM
 	.suspend		= generic_hdmi_suspend,
 	.resume			= generic_hdmi_resume,
-#endif
 };
 
 static const struct hdmi_ops generic_standard_hdmi_ops = {
@@ -2952,7 +2948,6 @@ static void i915_pin_cvt_fixup(struct hda_codec *codec,
 	}
 }
 
-#ifdef CONFIG_PM
 static int i915_adlp_hdmi_suspend(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec = codec->spec;
@@ -3032,7 +3027,6 @@ static int i915_adlp_hdmi_resume(struct hda_codec *codec)
 
 	return res;
 }
-#endif
 
 /* precondition and allocation for Intel codecs */
 static int alloc_intel_hdmi(struct hda_codec *codec)
@@ -3167,10 +3161,8 @@ static int patch_i915_adlp_hdmi(struct hda_codec *codec)
 		if (spec->silent_stream_type) {
 			spec->silent_stream_type = SILENT_STREAM_KAE;
 
-#ifdef CONFIG_PM
 			codec->patch_ops.resume = i915_adlp_hdmi_resume;
 			codec->patch_ops.suspend = i915_adlp_hdmi_suspend;
-#endif
 		}
 	}
 
-- 
2.43.0

