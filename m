Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F433F0AA7
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832079; cv=none; b=FUbHzoJaT5m/d5vMfqjclqjS9QWWcKJhAioc+iE20xd4C9YRh57C3w+0h21qu/9iy1ifx+CY1qgMddC03fbkNES+iczxtxHn9VBli5ubW4tk+2T4DLuPHVj4ohmbpkyoKz79HI0UN6a9XO7FsOu2uzJ2C/InSCNAiiijm2UN9TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832079; c=relaxed/simple;
	bh=4YqKPZB36GRjtgQ/J+idZN71Uu7BJa5RnVwq5I8Rh28=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SdR0FDMrQg+D2DVIoOvpQGZJyJOzNi10zupHdGRBFsNzUxocfydT/y1i4AAGndomFCEy2tikxjkaGYvAHFlsBP84+0st5pf7ol3j2cFDOsYSxrCMHEBgBnHKbSiY4uq59aaxLiZ9kMq6YlUAjbFcbM+h1j6Mn/Ej1bK/gYLJWbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y7xI2UGL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=okyd9f+d; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hWJu0BM7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZgQk0k78; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y7xI2UGL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="okyd9f+d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hWJu0BM7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZgQk0k78"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47D725E89F;
	Fri, 15 May 2026 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778832075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yn1lhGyXSfgmdtTu3D1GjqLfnhkwMJNsJlKnGPsmWNg=;
	b=y7xI2UGLDAqef+mTB4A8F5zcuTDrJp/dlSGUnDRN1ZI+kehiCxI3WXVGbWuAvgXErUUJ8J
	wKwdEhpj2So0GcEzXHTcfxjRvksytj6RtPWdN200PmdueREa2A2570WnIhOWrmnIIdcAYT
	psQNG+E9r2v+UDbGrMsiReMuW3bwOTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778832075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yn1lhGyXSfgmdtTu3D1GjqLfnhkwMJNsJlKnGPsmWNg=;
	b=okyd9f+dnIkGY+EEeY13BU9fmavQRkBQp3RyZ5bmhgc5Krb6dk2kDjCrtwrCww7qEvou5o
	qV/dptMLCeMMAzDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hWJu0BM7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZgQk0k78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778832073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yn1lhGyXSfgmdtTu3D1GjqLfnhkwMJNsJlKnGPsmWNg=;
	b=hWJu0BM7ImJFgcrfElMVVeMvt0zNToP6puLK9dcXZtC4WSwjyflzYP+j2rh0cSy56/cdbT
	usjIwQfB7tylJNJHw1c7iM2aR4w1hiOo305S7Ldq4ph4F9Ypd+gi1WmpYWQodl2tftv6nP
	g2xqUwoJmdsMEcGSXTsqB5Z0Sk8Yhh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778832073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yn1lhGyXSfgmdtTu3D1GjqLfnhkwMJNsJlKnGPsmWNg=;
	b=ZgQk0k786TPZfJRF3IAUmErRl7EqOyRcFLxhS+Ku0+Yl716ofPJfi7+HnTdpcC4uuFjsSb
	BUPXpPDazmxYiwCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C610593AA;
	Fri, 15 May 2026 08:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qhW8AcjSBmq5FQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 08:01:12 +0000
Date: Fri, 15 May 2026 10:01:11 +0200
Message-ID: <87tss9t83c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Cen Zhang <zzzccc427@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kees Cook <kees@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [PATCH] ALSA: pcm: oss: Use snd_pcm_kernel_write() in snd_pcm_oss_sync()
In-Reply-To: <20260515051516.3103036-1-xujiakai24@mails.ucas.ac.cn>
References: <20260515051516.3103036-1-xujiakai24@mails.ucas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,perex.cz,kernel.org,suse.com,sakamocchi.jp];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 47D725E89F
X-Spam-Level: 

On Fri, 15 May 2026 07:15:16 +0200,
Jiakai Xu wrote:
> 
> During a process exit, do_exit() calls exit_mm() before exit_files(),
> so current->mm is already NULL when __fput() triggers
> snd_pcm_oss_release() -> snd_pcm_oss_sync(). The latter calls
> snd_pcm_lib_write() with a NULL buffer to fill the remaining ALSA
> period with silence. snd_pcm_lib_write() passes in_kernel=false to
> __snd_pcm_lib_xfer(), causing do_transfer() to call
> import_ubuf(ITER_SOURCE, NULL, ...) which invokes access_ok(NULL, ...).
> On RISC-V, untagged_addr() in access_ok() dereferences
> current->mm->context.pmlen, crashing with a NULL pointer dereference.
> 
> Fix by using snd_pcm_kernel_write() and snd_pcm_kernel_writev() instead,
> which pass in_kernel=true and use iov_iter_kvec() to bypass user-space
> address validation entirely. Since the buffer is NULL and the transfer
> function fill_silence() ignores the iterator and writes directly to the
> DMA buffer, this is safe.
> 
> Fixes: 13f72c8c28fc ("ALSA: pcm: Kill set_fs() in PCM OSS layer")
> Signed-off-by: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>

Thanks for the patch.  I believe the problem is rather in
do_transfer() setting up a bogus iter for silencing unnecessarily.
So it's a bug introduced in the commit cf393babb37a ("ALSA: pcm: Add
copy ops with iov_iter").

Could you verify whether the change below works instead?
noninterleaved_copy() has already the handling of NULL data.


Takashi

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
