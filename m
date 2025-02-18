Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2CE1AED5C
	for <linux-sound@vger.kernel.org>; Tue, 18 Feb 2025 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739878832; cv=none; b=iJC1tilJFI9nls7gMSiW2fp8TBx8lszxjKd9DP4hiX6PMprseqc54mFexWxGzs4fNSl8yV3C6nrwU89nX0WamcQbb0mKeCcnBbuGDYZuxkfpyVn4LW+kDiofREltpqJqQLV9U2yrukDE/YCVJe9mSAQVaOIQ2Maj5r6CxHngGlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739878832; c=relaxed/simple;
	bh=PxkCZshHzwrCbo22m0ISUOrZXqTMIYfw6giX84vlBok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L9hinR4+hHq0gawKOQbcq8TFB0CVMYsylLUnVj+YS2/b4FigGylg2nTqPW+Hlgy6yALwztFnyKbMRdg7cdUouH/nYhk4jLwl9ZfIlV8BpYnMqnO0g44fNclFdRRCc9aTdeGI1oAPxlJw4/Q2WC8H8SrCDXJmLsi8rl7mDJNtoiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k7M0jxN2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FojmICoh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k7M0jxN2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FojmICoh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k7M0jxN2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FojmICoh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k7M0jxN2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FojmICoh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BCF5B21164;
	Tue, 18 Feb 2025 11:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739878828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xt9FqYn+3Z8QgWQReG4EfqKtNNv73CMpP90L71MjyHI=;
	b=k7M0jxN2ttRqQojOUMdXWKLBQCVbsH6YIzWFfa2Ac+nVmUrkjui8BOXTRZDkmD+qX2b68g
	CxsMrnv2FdBNGaNzvqih3wqhQIDe3v2bP2JA5ap+PoWdnXdArBkB/XVD+zHcbGuVZjWsj5
	byOWlfDkitplV14AQdjboeNSlHg9OWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739878828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xt9FqYn+3Z8QgWQReG4EfqKtNNv73CMpP90L71MjyHI=;
	b=FojmICohTS3rOpH/Yl5UW672NHAeE/CzldGpvqNYdyiE7gqMnbCK4NYiFbpeGSpTDvO0vw
	4w+FDx8FfECdrDBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739878828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xt9FqYn+3Z8QgWQReG4EfqKtNNv73CMpP90L71MjyHI=;
	b=k7M0jxN2ttRqQojOUMdXWKLBQCVbsH6YIzWFfa2Ac+nVmUrkjui8BOXTRZDkmD+qX2b68g
	CxsMrnv2FdBNGaNzvqih3wqhQIDe3v2bP2JA5ap+PoWdnXdArBkB/XVD+zHcbGuVZjWsj5
	byOWlfDkitplV14AQdjboeNSlHg9OWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739878828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xt9FqYn+3Z8QgWQReG4EfqKtNNv73CMpP90L71MjyHI=;
	b=FojmICohTS3rOpH/Yl5UW672NHAeE/CzldGpvqNYdyiE7gqMnbCK4NYiFbpeGSpTDvO0vw
	4w+FDx8FfECdrDBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F8CE13A1D;
	Tue, 18 Feb 2025 11:40:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EYuhF6xxtGc3JAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 18 Feb 2025 11:40:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>
Subject: [PATCH] ALSA: usb-audio: Avoid dropping MIDI events at closing multiple ports
Date: Tue, 18 Feb 2025 12:40:24 +0100
Message-ID: <20250218114024.23125-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO

We fixed the UAF issue in USB MIDI code by canceling the pending work
at closing each MIDI output device in the commit below.  However, this
assumed that it's the only one that is tied with the endpoint, and it
resulted in unexpected data truncations when multiple devices are
assigned to a single endpoint and opened simultaneously.

For addressing the unexpected MIDI message drops, simply replace
cancel_work_sync() with flush_work().  The drain callback should have
been already invoked before the close callback, hence the port->active
flag must be already cleared.  So this just assures that the pending
work is finished before freeing the resources.

Fixes: 0125de38122f ("ALSA: usb-audio: Cancel pending work at closing a MIDI substream")
Reported-and-tested-by: John Keeping <jkeeping@inmusicbrands.com>
Closes: https://lore.kernel.org/20250217111647.3368132-1-jkeeping@inmusicbrands.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 737dd00e97b1..779d97d31f17 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1145,7 +1145,7 @@ static int snd_usbmidi_output_close(struct snd_rawmidi_substream *substream)
 {
 	struct usbmidi_out_port *port = substream->runtime->private_data;
 
-	cancel_work_sync(&port->ep->work);
+	flush_work(&port->ep->work);
 	return substream_open(substream, 0, 0);
 }
 
-- 
2.43.0

