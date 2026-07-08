Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7445542E8FF
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 10:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507542; cv=none; b=cuhnMoMNO0Q3a4uBUvPvxPg3BktNbWGcYjmaDxAibHakV/iX71TiWT3XDH/zjJQftJU6IdH9WpJZUpACKo1VOHuIMpPhl29UFS9EQBVw12Tku1N6+jJv8hsxM1vdLezx2M1yCy67Ch2jbJwQ7i2kxb/1ALta76R5yjT2+9ftY1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507542; c=relaxed/simple;
	bh=x5FNT8utLql8fYzJatDj/iArL+AKc5++bJlHiLk7mYQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNrekPLe+6GVemtt4Pmf0Kg0LZCmac++sRseT5Kfov0xGkBAyNSAtB/UPFwTIWyjmqmOH9azEQbdCmCM9+NPosK0zywUWMJlrkq5abj4V6+/ZAI2oVZSRnm+Du8UyyUvld1rkNJ8eO1ZuMXH5AOFIcI1d//PO/Oxo+QLFe86aJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l5yKSVc7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cf+elN1X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dq92uNt7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OpFnNZVn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l5yKSVc7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cf+elN1X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dq92uNt7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OpFnNZVn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE5B675F8D;
	Wed,  8 Jul 2026 10:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783507520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kK6O2X0vb1CGCmB4fIu8u2hgEzsWMo550aATkhk9eFk=;
	b=l5yKSVc72mXp/CARGyF0wJsN9YLMyMpqgV7SB3M1V/uBoxWKEPf27Aeh1wc7miAx5A1MpP
	AeBKUNF6bZ4nNJ1FCD0bu9f1+kjhPYtbqT7TtpD/v32HEKC/lvFxebu3r/CYViEn2gEPB1
	BziSJd/xGaV0lvPTrX2lOd+kywyYYGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783507520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kK6O2X0vb1CGCmB4fIu8u2hgEzsWMo550aATkhk9eFk=;
	b=Cf+elN1XjtEeWXI8F2kyU1Pflw0NWZRD/d1D/zo6y2DICo8zVVYNwbnLfumBkwfMvE/YKR
	8jNEt83AV2J7tQAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dq92uNt7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OpFnNZVn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783507519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kK6O2X0vb1CGCmB4fIu8u2hgEzsWMo550aATkhk9eFk=;
	b=dq92uNt7KPSQ4ZJ8mwApbM4o+uW9Ypv2CvibS/WG4Zp/t2idNh9dPCcIjICLb5/FQUBRem
	YyVc2hsPtm8J3XJdbJ3wZ3Lr5KTBZ+UFGDF/2s846bPEIuwOjSUKMPPKA4obatGxuJDIBG
	kQufZEKT9BMrQk4nB0/fxWpbNYXN1uU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783507519;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kK6O2X0vb1CGCmB4fIu8u2hgEzsWMo550aATkhk9eFk=;
	b=OpFnNZVnxjCjg3A+lva4Sz8VtIgz3jv0V3eDJS5IF7gzH5XhMufHQdciB2O8EWz6NSb836
	naTNBOpmo7ijwNDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D574779AE;
	Wed,  8 Jul 2026 10:45:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WiYZHT8qTmpHIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Jul 2026 10:45:19 +0000
Date: Wed, 08 Jul 2026 12:45:19 +0200
Message-ID: <871pdd69q8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] ALSA: Return -ENODEV instead of -EFAULT on module-get failure
In-Reply-To: <20260707084506.718583-1-phucduc.bui@gmail.com>
References: <20260707084506.718583-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: DE5B675F8D
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.us];
	FREEMAIL_CC(0.00)[intel.com,perex.cz,suse.com,gmail.com,kernel.org,gmx.us,linutronix.de,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Tue, 07 Jul 2026 10:45:00 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> Several ALSA open/allocate paths call try_module_get() on the owning card
> module and return -EFAULT when it fails. However, try_module_get() fails 
> when the module is no longer live (i.e. it is going away), meaning the 
> device is no longer usable.
> This series updates only those paths, making the error code consistent
> with the existing "device unavailable" checks in the same functions.
> Other -EFAULT returns are left unchanged.
> 
> Link v1: 
> https://lore.kernel.org/all/20260706084950.49331-1-phucduc.bui@gmail.com/
> 
> Changes in v2: 
>  - Update the commit message.
>  - Remove unrelated changes from the "ALSA: control: Return -ENODEV 
>    instead of -EFAULT in snd_ctl_open()" patch. 
> 
> Best regards, 
> Phuc
> 
> bui duc phuc (6):
>   ALSA: control: Return -ENODEV instead of -EFAULT in snd_ctl_open()
>   ALSA: hwdep: Return -ENODEV instead of -EFAULT in snd_hwdep_open()
>   ALSA: info: Return -ENODEV instead of -EFAULT in alloc_info_private()
>   ALSA: mixer: oss: Return -ENODEV instead of -EFAULT in
>     snd_mixer_oss_open()
>   ALSA: pcm: oss: Return -ENODEV instead of -EFAULT in
>     snd_pcm_oss_open()
>   ALSA: pcm: Return -ENODEV instead of -EFAULT in snd_pcm_open()

Applied to for-next branch now.  Thanks.


Takashi
