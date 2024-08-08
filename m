Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15525189BA4
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723108487; cv=none; b=fIfc8YEDFmd15c4cgNy2v9zyuNiihkc7rt/y0c8FD7GXvbzG9ecM2btOsns5WBMvu2BxYBucPdBhED0GNQUEnGeEYmTuIJL69G2Q9VvSIoaXcIysS4kO8lC5kWgApgSAEdpj3jZYAOxpz88Wsxke2kErVLdKlm+u18OEs70IZ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723108487; c=relaxed/simple;
	bh=rM7shvxFm3efmEKEJURWpl47fzFAgbrCX43b9Lfoncs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pgxFzCdoQHqfVvNsTPJCb9WoqpMCU5Z1qWaIEj0jQCHcqVjoF3D36TbE8cY3RX8hP1pnadaQf9yJA9zJPt2904S/MnvZUVV/VUsOFQ8mEtzGS8VvINM2i6H5ARcXCHol3GM00nrf24ulIZoRT7WmQe5sqJLxdpyutRySyJTLRjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YGdQ8fjK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=udb7/l3E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YGdQ8fjK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=udb7/l3E; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YGdQ8fjK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="udb7/l3E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YGdQ8fjK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="udb7/l3E"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 56BA21F388;
	Thu,  8 Aug 2024 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723108484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0bmDfcOgXhBXrnJwc7Ej5fy1W7TNoLpGjjitANT4uCE=;
	b=YGdQ8fjKeOAl35bHfUCApLu+1pkNztJ+orGwnfkr8i+23HiLbGMhCcMqHOB0/8UWgTAwXT
	pi0k8AwBxzv5QAvCuSLw6CXVb3Okg7n/cYuddF0XU4NKIhg4h4vPP70eOiXPEpL4oVIzrf
	7HKEpp+l8jsg3xT+ANWQTbLI04V9rWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723108484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0bmDfcOgXhBXrnJwc7Ej5fy1W7TNoLpGjjitANT4uCE=;
	b=udb7/l3EgfyCSbbMs2uBonM/447IZhRDJbUZNesuHIUFLl7oRLrL2H7AwWSu8RU9IM2aMz
	2Ptc+AIuoR3eX9DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723108484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0bmDfcOgXhBXrnJwc7Ej5fy1W7TNoLpGjjitANT4uCE=;
	b=YGdQ8fjKeOAl35bHfUCApLu+1pkNztJ+orGwnfkr8i+23HiLbGMhCcMqHOB0/8UWgTAwXT
	pi0k8AwBxzv5QAvCuSLw6CXVb3Okg7n/cYuddF0XU4NKIhg4h4vPP70eOiXPEpL4oVIzrf
	7HKEpp+l8jsg3xT+ANWQTbLI04V9rWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723108484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0bmDfcOgXhBXrnJwc7Ej5fy1W7TNoLpGjjitANT4uCE=;
	b=udb7/l3EgfyCSbbMs2uBonM/447IZhRDJbUZNesuHIUFLl7oRLrL2H7AwWSu8RU9IM2aMz
	2Ptc+AIuoR3eX9DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3291013876;
	Thu,  8 Aug 2024 09:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8EkXC4SMtGahHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Aug 2024 09:14:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Check shutdown at endpoint_set_interface()
Date: Thu,  8 Aug 2024 11:15:21 +0200
Message-ID: <20240808091522.31415-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spam-Level: 

The call of usb_set_interface() and a delay are superfluous when the
device has been already disconnected.  Add a disconnection check
before doing it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8f65349a06d3..568099467dbb 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -921,6 +921,9 @@ static int endpoint_set_interface(struct snd_usb_audio *chip,
 
 	if (ep->iface_ref->altset == altset)
 		return 0;
+	/* already disconnected? */
+	if (unlikely(atomic_read(&chip->shutdown)))
+		return -ENODEV;
 
 	usb_audio_dbg(chip, "Setting usb interface %d:%d for EP 0x%x\n",
 		      ep->iface, altset, ep->ep_num);
-- 
2.43.0

