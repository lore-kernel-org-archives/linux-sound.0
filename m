Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545663093D8
	for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779036693; cv=none; b=PTmo0DrV3XBdzMB4TtR7NVqt/wjj9fNwB3eKQiBjGZD7uRwdgSWnfc5SG7ipJ6IJYWkmc0EW4QEZSAgw5uYwNGbIHcOQEkp3P7gO+PIetHgNh31ZKqUryCBFP6TM06hNedsAYJh9t+6C4Pa6DP9MckYKas5OxdNuUxtMezvwC4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779036693; c=relaxed/simple;
	bh=VXo935z0TzNF632ac8dKHkoJZFVuLxPQqBb1lS17fAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jEyPG5TqwSgxcoi0CQoOdjw8MkqDQ9YrRg2RawEAj5RfOktDFYFj1Z8PnrBYKCrax4PrcAxROjEJZ1jAc6bWy6w7WiI6YX+ULXtddfFTK+pZQPuvUEB+qXBBZVsP/+GwQ6Xtrq+aJQXjsOASsp7SNAJboZTuo1QtEi4JFnKplFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xa4m26yb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zjve8jWv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sr9/pMDb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bf1SkvkV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xa4m26yb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zjve8jWv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sr9/pMDb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bf1SkvkV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 534716C0E1;
	Sun, 17 May 2026 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779036689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lQ/0/z0ZOJZqXcnU+coEiXHSLMvONYgOszegmIiR/RA=;
	b=Xa4m26ybVxmX9gEowUHfyfoVw4Jjzf2XX39Sr81bSkh2vtVYxsBNqOSo5UH1t00zxO8cAQ
	MRjKTMwkhxlxZg+Y+BTAUEl0rAXj31T1zdHorI3GpKSxSFcP2RanauWmgREFZ0Hi1k7MY5
	+PnH6dKoR5i5bD5FaS5EEAwsu9VkzDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779036689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lQ/0/z0ZOJZqXcnU+coEiXHSLMvONYgOszegmIiR/RA=;
	b=zjve8jWvAjX1VBvlhaK9TsbW+bv9OoN5BNP9wkVqlSiRH9v0UE7gmgktQOPi/F0Jvd5fI8
	sPcwm02SHnSHzjBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="sr9/pMDb";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bf1SkvkV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779036688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lQ/0/z0ZOJZqXcnU+coEiXHSLMvONYgOszegmIiR/RA=;
	b=sr9/pMDb1ubKmaXLcg+3vmZbxxuaO25S2dbdMTkkS+I/bCei0bL6X31mfrSN5cACa4nYoW
	dYN69Ht7iicOAd6jj3ONMwhFjkTdqBi6dthbIpgwSXarwtlNp2ZB8ITMKCIm5UpAH/xb/v
	MzsaW8KbOTliwa6f6f65W78IWhAOmvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779036688;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lQ/0/z0ZOJZqXcnU+coEiXHSLMvONYgOszegmIiR/RA=;
	b=bf1SkvkV6d/Em4pLhh/j2LFcXY2R1txRIt+XObsC4bU8bqLAC8NIK7WXNd+3qmF/ouzXrE
	FV3y3C+viOPykKDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CA69593AB;
	Sun, 17 May 2026 16:51:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b98cDhDyCWo9PwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 17 May 2026 16:51:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Subject: [PATCH] ALSA: pcm: Don't setup bogus iov_iter for silencing
Date: Sun, 17 May 2026 18:51:20 +0200
Message-ID: <20260517165121.31399-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ucas.ac.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 534716C0E1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.01

At transition to the iov_iter for PCM data transfer, we blindly
applied the iov_iter setup also for silencing (i.e. data = NULL), and
it leads to a calculation of bogus iov_iter.  Fortunately this didn't
cause troubles on most of architectures but it goes wrong on RISC-V
now, causing a NULL dereference.

Handle the NULL data case to treat the silencing in interleaved_copy()
for addressing the bug above.  noninterleaved_copy() has already the
NULL data handling, so it doesn't need changes.

Reported-by: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Closes: https://lore.kernel.org/20260515051516.3103036-1-xujiakai24@mails.ucas.ac.cn
Fixes: cf393babb37a ("ALSA: pcm: Add copy ops with iov_iter")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_lib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 09c421cd9319..fe597f7d522d 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2138,6 +2138,9 @@ static int interleaved_copy(struct snd_pcm_substream *substream,
 	off = frames_to_bytes(runtime, off);
 	frames = frames_to_bytes(runtime, frames);
 
+	if (!data)
+		return fill_silence(substream, 0, hwoff, NULL, frames);
+
 	return do_transfer(substream, 0, hwoff, data + off, frames, transfer,
 			   in_kernel);
 }
-- 
2.54.0

