Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BB0155A52
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012033; cv=none; b=DuEDv4s4F23S9VfGHfSGdvMMWZIZoAZS+VfwZTJ8n3GLCJETDP5F+Z6JDGtx11O3sGpEarCFONbXm3MKBZr7S/AsriHwKnYYhJkmvcYDEqNObmHk4lY4SUtEfXC41y51NwXIsOmvqfXjgG6ITR5V5zX5T+pqhpGttpkTDb5UKL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012033; c=relaxed/simple;
	bh=Oqce4MVGd+h8s81wdwAGkjCHHfwBD+g0MGpFE3mjZyI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HdCWgIRh9S4zicuIlQqM243XIV54U+SN9sXt3dCJ6xy3D6h/xSxqtb2IcA2lMgmUY7LDzG9pC5vh/7M6UfkCAjpo0v2/tpj1tvbfB0YuZ4SuxIRrvT6LyjE3jDvFDDbdT6eJrrsPDf0zjlVJzXU6ucNvVvrImndjlTYScLm/BoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jnLYjRL+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NTVB5bZk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jnLYjRL+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NTVB5bZk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jnLYjRL+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NTVB5bZk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jnLYjRL+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NTVB5bZk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E0D441F7A2;
	Mon,  6 May 2024 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYyzocnRP5NxBuHRd65vHtzN30F0NDwxFhddvypb/FQ=;
	b=jnLYjRL+usVckM5c38jLLZwREAk3zkb64YkP5vKcM24Q4P3xmiYa368wfwO8fqr6Q3FvAW
	Jl8WhhORlMjrk0AgKwYULoz7lvI/uXecY1RBxKMZyfyAcKQeVsR4byJoA4brS/Ijpp+VNf
	1ii3NsGzRKWkCz6hNJQHgg4syYbjfFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYyzocnRP5NxBuHRd65vHtzN30F0NDwxFhddvypb/FQ=;
	b=NTVB5bZk5zClsr0l0uBPu/U9FoD2xvncDaUPU5DE5GfmKC5gr3iJTsSKhwSSJcqFtmpokD
	gbt2kjg+VAVPABBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jnLYjRL+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NTVB5bZk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYyzocnRP5NxBuHRd65vHtzN30F0NDwxFhddvypb/FQ=;
	b=jnLYjRL+usVckM5c38jLLZwREAk3zkb64YkP5vKcM24Q4P3xmiYa368wfwO8fqr6Q3FvAW
	Jl8WhhORlMjrk0AgKwYULoz7lvI/uXecY1RBxKMZyfyAcKQeVsR4byJoA4brS/Ijpp+VNf
	1ii3NsGzRKWkCz6hNJQHgg4syYbjfFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYyzocnRP5NxBuHRd65vHtzN30F0NDwxFhddvypb/FQ=;
	b=NTVB5bZk5zClsr0l0uBPu/U9FoD2xvncDaUPU5DE5GfmKC5gr3iJTsSKhwSSJcqFtmpokD
	gbt2kjg+VAVPABBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C78511386E;
	Mon,  6 May 2024 16:13:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yFdCL70BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/12] ALSA: hda: analog: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:47 +0200
Message-ID: <20240506161359.6960-5-tiwai@suse.de>
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
X-Spamd-Result: default: False [-1.58 / 50.00];
	BAYES_HAM(-1.57)[92.22%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E0D441F7A2
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -1.58

CONFIG_PM dependencies got reduced in HD-audio codec core driver, and
now it's time to reduce in HD-audio analog codec driver, too.

Simply drop CONFIG_PM ifdefs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_analog.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/pci/hda/patch_analog.c b/sound/pci/hda/patch_analog.c
index 8afe6000f7da..1e9dadcdc51b 100644
--- a/sound/pci/hda/patch_analog.c
+++ b/sound/pci/hda/patch_analog.c
@@ -72,7 +72,6 @@ static int create_beep_ctls(struct hda_codec *codec)
 #define create_beep_ctls(codec)		0
 #endif
 
-#ifdef CONFIG_PM
 static void ad198x_power_eapd_write(struct hda_codec *codec, hda_nid_t front,
 				hda_nid_t hp)
 {
@@ -118,7 +117,6 @@ static int ad198x_suspend(struct hda_codec *codec)
 	ad198x_power_eapd(codec);
 	return 0;
 }
-#endif
 
 /* follow EAPD via vmaster hook */
 static void ad_vmaster_eapd_hook(void *private_data, int enabled)
@@ -158,10 +156,8 @@ static const struct hda_codec_ops ad198x_auto_patch_ops = {
 	.init = snd_hda_gen_init,
 	.free = snd_hda_gen_free,
 	.unsol_event = snd_hda_jack_unsol_event,
-#ifdef CONFIG_PM
 	.check_power_status = snd_hda_gen_check_power_status,
 	.suspend = ad198x_suspend,
-#endif
 };
 
 
-- 
2.43.0

