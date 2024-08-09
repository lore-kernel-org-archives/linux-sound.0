Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD31E175D42
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723189340; cv=none; b=olNY2b7WPfaAdMMYR/jLXECuOfm8qfbqx1xRM0N01VPJXaIOY8NeeU7QK23nVy1xdBZcTWp0nebPpgKSKgkvNUq1d9fV+pYEuYvUtHosR+8WEmk8YCX8gNQsZ+oYi46JRHviYzj1FLf01aHHvWAUfnLJ96kPUfoGirKesY8CZ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723189340; c=relaxed/simple;
	bh=17Nw9vVKrE+NpDdvIu5HH0S9HWzVpTJs/z+JXGdOvDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k2ZTO60EI16zOB0ulpXwkCwaJzd+TXSTi9saiirJPvtKhuWq0YnlCkni/LgcUitstrBTLjV7mPhMeWyA/uFjFJQxPVQcxdDT+MsD5qqg8z5kDalRf9CzkogXfM36cjSViYqGdK5F91HaU07mYBJ59kPYuebMh5ONahhDluv3+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=023VZRnm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PLt+PXFK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dqQgNrfM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SjNxsey3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="023VZRnm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PLt+PXFK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dqQgNrfM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SjNxsey3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D48251FF1C;
	Fri,  9 Aug 2024 07:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723189337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E/Tj2QBMSQdrV9Dl1pfXiiu+/Y2z2Hb20GsLdgJDTDI=;
	b=023VZRnmB4OW1adtR2xt7TRH/yYNe4wNE6osJgtth5cYZmwxDNoSourv5/W5mi2hnFIOtb
	PpNzcy+nKUlqgarHx8Ws73Skv6WZv/OcB9pBp9PXAr9M1dVsdYjor050mihH9En7D0gmnL
	WY9fBkCvQHrAZgQrqJBjKiCzrG932/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723189337;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E/Tj2QBMSQdrV9Dl1pfXiiu+/Y2z2Hb20GsLdgJDTDI=;
	b=PLt+PXFK8ePXHZu6gSeR7/paU3gqRIs5RckpIa5VCsyUEDs6x+zQ7PnbYc6QBB+L0sC+oV
	2u5kGyv2nT9R9MCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723189336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E/Tj2QBMSQdrV9Dl1pfXiiu+/Y2z2Hb20GsLdgJDTDI=;
	b=dqQgNrfM3qgZQVg9j3h9O8u9RUQYgjedHOZAeq8Pw4IfvHDubU8oNJFMWXs0Ii8j/zecT0
	ZP+az5q7AKW8suiP2emY1OhH+X1/YofrJvP1Ecia6ENwnwWI6G68VVV5wc+JupA4sVHx85
	iv9UHCDWhzTe0K+Ijv0YnOjm037y89k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723189336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E/Tj2QBMSQdrV9Dl1pfXiiu+/Y2z2Hb20GsLdgJDTDI=;
	b=SjNxsey3FC6q+UXL6y5ROSIrcWmn/NNIUolmvHI6cfg3mjrw4wGlzm3yVNcJANK9ktuRmG
	KIlP6jVexPDrweCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B38371379A;
	Fri,  9 Aug 2024 07:42:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y3eKKljItWZ2FgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Aug 2024 07:42:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] ALSA: caiaq: Fix unused variable warning
Date: Fri,  9 Aug 2024 09:42:51 +0200
Message-ID: <20240809074254.5290-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.20

The recent cleanup of caiaq driver forgot to remove the unused loop
variable:
sound/usb/caiaq/audio.c: In function 'snd_usb_caiaq_pcm_prepare':
sound/usb/caiaq/audio.c:179:41: error: unused variable 'i' [-Werror=unused-variable]

Fixes: e95b9f7f2ee0 ("ALSA: snd-usb-caiaq: use snd_pcm_rate_to_rate_bit")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/20240809112252.5af8025f@canb.auug.org.au
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/caiaq/audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index e62a4ea1d19c..772c0ecb7077 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -176,7 +176,7 @@ static int snd_usb_caiaq_pcm_hw_free(struct snd_pcm_substream *sub)
 
 static int snd_usb_caiaq_pcm_prepare(struct snd_pcm_substream *substream)
 {
-	int bytes_per_sample, bpp, ret, i;
+	int bytes_per_sample, bpp, ret;
 	int index = substream->number;
 	struct snd_usb_caiaqdev *cdev = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-- 
2.43.0

