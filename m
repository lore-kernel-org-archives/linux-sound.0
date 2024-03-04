Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B787125CF
	for <linux-sound@vger.kernel.org>; Mon,  4 Mar 2024 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540535; cv=none; b=Fkc0w+yfFDGH+smUD0kUSruSS+IxwIJhwRmKKTvZmYAbN8Pl512emi6imORUcTNcnrrEOX60GLjYFN0XCHxM6ms4E4Q1kmk5hvlbI1TtUH8E0NToADZEA91GDR1uYjo2dTEU5qIrmCLx7lcuNbA0ISCUg6tL1Rr7M5PWwePZkEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540535; c=relaxed/simple;
	bh=PsTePWtPSxnq0Tq5h7N6mE5fQbOSzHlEQUVchiHxCEo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=r3aq1itp+b11Ij7ytKNc33FbesmQd8NNJf7NJKFISa5umnEt2aMeUfD7ky/+iDoFGLF+0XsT/vwGPTjakTUF+xVHQcMvSDJh0GoO9f579uVHemsh/V8At7QqMxhsll15tUHjHXdMaNT0/M2p+SqvucbVjfmCEHcYWGvmUSVxPug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SGErdCw2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9HXks1zK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SGErdCw2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9HXks1zK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SGErdCw2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9HXks1zK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SGErdCw2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9HXks1zK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9488F687FE;
	Mon,  4 Mar 2024 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709540531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Jn7vK4XPEyjYtv2ZwYq9V8L1qUYG5X1aKfQCWfbQ4M=;
	b=SGErdCw27gzYMsyum8Q+/lIQYSOOexjGSndUiDwDBQUTO0uQl5qP4tOTqAIoZw8QRCj4pV
	hBcx3KsdMpa53a88D80udKsM3dLrfJkR72Ag80EnkgEGsvMagfBH2PLPc6bnMyURMvHIYa
	B5M88r/uFTiMMG+y1lgYfZBXLM9+KyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709540531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Jn7vK4XPEyjYtv2ZwYq9V8L1qUYG5X1aKfQCWfbQ4M=;
	b=9HXks1zKLEYsHyfD4QUV8EW3y/O1XZjisYuRex+bL5MKTbFHFnmvbH23VHehlV3e2fLDef
	NT/Qxp9/e5KYmyDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709540531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Jn7vK4XPEyjYtv2ZwYq9V8L1qUYG5X1aKfQCWfbQ4M=;
	b=SGErdCw27gzYMsyum8Q+/lIQYSOOexjGSndUiDwDBQUTO0uQl5qP4tOTqAIoZw8QRCj4pV
	hBcx3KsdMpa53a88D80udKsM3dLrfJkR72Ag80EnkgEGsvMagfBH2PLPc6bnMyURMvHIYa
	B5M88r/uFTiMMG+y1lgYfZBXLM9+KyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709540531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Jn7vK4XPEyjYtv2ZwYq9V8L1qUYG5X1aKfQCWfbQ4M=;
	b=9HXks1zKLEYsHyfD4QUV8EW3y/O1XZjisYuRex+bL5MKTbFHFnmvbH23VHehlV3e2fLDef
	NT/Qxp9/e5KYmyDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 765A113A5B;
	Mon,  4 Mar 2024 08:22:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gl+kG7OE5WVVawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 Mar 2024 08:22:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ac97: More cleanup with snd_ctl_find_id_mixer()
Date: Mon,  4 Mar 2024 09:21:58 +0100
Message-Id: <20240304082158.8583-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [4.78 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.12)[66.77%]
X-Spam-Level: ****
X-Spam-Score: 4.78
X-Spam-Flag: NO

There was one overlooked place to be replaced with
snd_ctl_find_id_mixer() for code simplification.

No functional change, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ac97/ac97_patch.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index 1d786bd5ce3e..cd83aa864ea3 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -41,12 +41,9 @@ static int patch_build_controls(struct snd_ac97 * ac97, const struct snd_kcontro
 static void reset_tlv(struct snd_ac97 *ac97, const char *name,
 		      const unsigned int *tlv)
 {
-	struct snd_ctl_elem_id sid;
 	struct snd_kcontrol *kctl;
-	memset(&sid, 0, sizeof(sid));
-	strcpy(sid.name, name);
-	sid.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	kctl = snd_ctl_find_id(ac97->bus->card, &sid);
+
+	kctl = snd_ctl_find_id_mixer(ac97->bus->card, name);
 	if (kctl && kctl->tlv.p)
 		kctl->tlv.p = tlv;
 }
-- 
2.35.3

