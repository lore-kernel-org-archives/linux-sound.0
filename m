Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E761C479899
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030360; cv=none; b=G7WsMKq6yJlNUTAbcHDuNOBCjtIiFDPGfdJMG2D4YlbY8LfxGlu7qTinolLgGqwrLwda8VlmUMgFgfibZPQbdGWCyYqctT7DTMK4XkhwPt+Q2aBrDfPiIF2+9x0b8Pz6/mnLaQ+UV3CN0WiqQQVBVEFfQozt92OPQH7y2SFaDx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030360; c=relaxed/simple;
	bh=waKJ5Vljcb+dvUzGvt8FKbx2gDTizjUAn+eN+Ew63rs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pr54jeXtK4OtwX7A9xQ2ThbwHnYdpN/XWjuhdQNfmp3L8jv3jmG6EtgPmC+j/V3lTVSPykNRuFGXp2CA7iNVz7edisPN7n17wkGagBDlIi9Es72FXob+KFM1ZMb65UaMr3rXdgovsZPjF8BKzxUEEf2v+cYjdXplWslpXkm3x+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wpJKJvYz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jHtqEMqr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mL6OISK0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JJA0q/Hs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wpJKJvYz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jHtqEMqr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mL6OISK0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JJA0q/Hs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0437380114;
	Thu,  6 Aug 2026 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/P2QO44jKKtJrrXTc41sOSXdwZeuNNP8vW86ef9Jls=;
	b=wpJKJvYzivZBTXy/Hm7IoPFetvZEgxYVFaR3oSulDuaTqSTyZmfm4fhEFsdQLusJIgSiq9
	21QngwXy7ZzRjIFeI4vCzakkH9ZerBAUM1efYa1eHHj25bt8+j3vQY5Irdgk3XK8eMUK6s
	E4XlkJWpBDU+bA6fRJ0OZ2kx+uYO55Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/P2QO44jKKtJrrXTc41sOSXdwZeuNNP8vW86ef9Jls=;
	b=jHtqEMqrrrXom9CVr8nh7ojsducYrPP/IoR1H3RvYUvTYs4yilcFy56nEkR8m7VAW72JAH
	9IoQruf6AvTpFSCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mL6OISK0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="JJA0q/Hs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/P2QO44jKKtJrrXTc41sOSXdwZeuNNP8vW86ef9Jls=;
	b=mL6OISK0WrnG4bw7jRScwL/VKzLlWBjsSTEpFb5jx6eX+FnPvgPTASpFXefx/7ZoHqYRuR
	qDZMixU0DdZ1nJ/84hMltDCrf28iBSKsmugYmyWrHlx17oZmEs47xKI0XOrfDkpHXHMcVv
	NfuEJPdm3ukV+AoJSiT41/mkO1UAeV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/P2QO44jKKtJrrXTc41sOSXdwZeuNNP8vW86ef9Jls=;
	b=JJA0q/HsEvf+LDUiTGA65Wdp2l8sekibYuFEM2dNHcg6gD2XIFPJCrKfGETdt6YREM3U2L
	VT5Zb/EPDsF8VbDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8B98779C0;
	Thu,  6 Aug 2026 15:32:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aFCWMwypdGpaFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 15:32:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/6] ALSA: mpu401: Check card index validity at probe
Date: Thu,  6 Aug 2026 17:32:19 +0200
Message-ID: <20260806153227.1460166-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806153227.1460166-1-tiwai@suse.de>
References: <20260806153227.1460166-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 0437380114
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

mpu401 driver blindly trusts that the given devptr->id value is within
the proper card index range at probe.  It's OK for the devices the
driver itself creates at the module probe time, but if the device is
bound manually via sysfs interface, this could be -1 as "none", and
this leads to OOB access for index[] and other parameters.

Add a sanity check for the card index and warn/correct it if it's a
value out of the range.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mpu401/mpu401.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/drivers/mpu401/mpu401.c b/sound/drivers/mpu401/mpu401.c
index c217c427bf1e..b93291ad067a 100644
--- a/sound/drivers/mpu401/mpu401.c
+++ b/sound/drivers/mpu401/mpu401.c
@@ -89,6 +89,12 @@ static int snd_mpu401_probe(struct platform_device *devptr)
 	int err;
 	struct snd_card *card;
 
+	if (dev < 0 || dev >= SNDRV_CARDS) {
+		dev_warn(&devptr->dev,
+			 "Invalid card index %d, using default 0\n", dev);
+		dev = 0;
+	}
+
 	if (port[dev] == SNDRV_AUTO_PORT) {
 		dev_err(&devptr->dev, "specify port\n");
 		return -EINVAL;
-- 
2.55.0

