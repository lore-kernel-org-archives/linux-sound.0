Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A3D4499AA;
	Tue, 11 Aug 2026 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786465372; cv=none; b=nmja9+pscInIS/mGW8IO0kiqKZ+efdhqpjZNM+aaXp+5Kh50idcGsqzOtfzb1wXQ6qgHfN3+anmvpJUTdOZIwGLRlB5AMwFsiEF5K01xpw585HS/BV2cSJiV8uV7riSyhbbiwz4nMCUArliIlm7E928m/54ptw3YlAmEwLjwuTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786465372; c=relaxed/simple;
	bh=PKP7cVujzxM/QtMzrkWTiipn07OsFpzFm9E5dIpBsPQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mj0APwefeoWVijPVK4BzHLoG/pDhSRDTEUlovJukE1QX/7ADm5Ni4vpHqdBf9mQCM9xbxpPDz2GaWq6bdYzaJXoZg5nIV1wQG1bmzqsmK4YtjaJYXZ8K5agDk8Q8HClHm1FQ8JyNzN6HFGQlbKClNP8Mdnn+BZUGHrSrPxwdC00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hcQjvRsq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0nX4UqDo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0wwXqFpG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xm/cUW0G; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hcQjvRsq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0nX4UqDo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0wwXqFpG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xm/cUW0G"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CD6B481DE5;
	Tue, 11 Aug 2026 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786465365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wu6ecGBl+O5NQAHf9K8a5/GdWSyuXmiBqAenu6ciyBI=;
	b=hcQjvRsqNlrzekrmlcUtuBqWrr0D0+VkJ10N1UGFa7A1oQJtvHX4fSy3dKgA1xmqUWCnx1
	OPaLjsNh83KVDGJgXvGUHd9ansXo+WjAG46fH+yAkDJ/e1N0gJ3MY8qmeILpOJVdugRtju
	pvIbav0GVpzylfYX6Yk+ZYArwRTv2OE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786465365;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wu6ecGBl+O5NQAHf9K8a5/GdWSyuXmiBqAenu6ciyBI=;
	b=0nX4UqDoLbSMKLYwS9K0AXGsIn1UyV0wKoK5461wR+oqpLHhztbmb/oNIXh1ETaGmGMLm6
	VrdwyJg5wwO1BEBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0wwXqFpG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Xm/cUW0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786465360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wu6ecGBl+O5NQAHf9K8a5/GdWSyuXmiBqAenu6ciyBI=;
	b=0wwXqFpGIZX6m6SSNV3y1HkQQRuljxN35ukVBCrSkWzxiQwq/1lr+LiI16N6DzcH6+Xocg
	GCLttEGmKc/I4Xii4aFEZYozNkMKJbXSDO34jdzOFLhS3UObRnhbWBq1rZ2551GqsgE3mU
	Js3xoTUzGAyKCHaFzo35FB6Ya6yfuxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786465360;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wu6ecGBl+O5NQAHf9K8a5/GdWSyuXmiBqAenu6ciyBI=;
	b=Xm/cUW0GoG7BOU7gZUl8d5taFdZuIbAxjlqehM9zhd3AkSZMSnTcwvBbshVyvuZ8TGgkqS
	Zua14sRhEliXpdDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6F02779BC;
	Tue, 11 Aug 2026 16:22:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JzCCJ1BMe2q/EwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 11 Aug 2026 16:22:40 +0000
Date: Tue, 11 Aug 2026 18:22:40 +0200
Message-ID: <87mrusaapb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: Don't leak the extension cell pointer in the bounce payload
In-Reply-To: <20260811131835.3837024-1-sammiee5311@gmail.com>
References: <20260811131835.3837024-1-sammiee5311@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: CD6B481DE5
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.988];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, 11 Aug 2026 15:18:35 +0200,
HyeongJun An wrote:
> 
> The bounce_error_event() embeds the failed event in the bounce payload
> by pointing data.ext.ptr at it.  When that event is a queued
> variable-length event, its own data.ext.ptr holds the address of its
> first extension cell, put there by snd_seq_event_dup().  The payload
> goes out verbatim through snd_seq_expand_var_event(), so the address
> reaches userspace.
> 
> That is the same address commit 705dd6dcbc0e ("ALSA: seq: Clear
> variable event pointer on read") removed from the event header.  The
> read path still clears it there, just above the call that expands the
> payload.
> 
> Embed a sanitised copy instead, treated exactly as snd_seq_read()
> treats the header.  A stack copy is enough because delivery is
> synchronous and snd_seq_event_dup() copies before returning.
> 
> An unprivileged client reaches this by setting SNDRV_SEQ_FILTER_BOUNCE,
> queueing a variable-length event to a port that does not exist and
> reading the bounce back.  Eight bytes on 64-bit, from its own pool.
> 
> Fixes: efc86691e4d8 ("ALSA: seq: Fix kernel heap address leak in bounce_error_event()")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

Applied now to for-next branch now.

> ---
> Unrelated, and not part of the change: the payload does not match struct
> snd_seq_event_bounce in include/uapi/sound/asequencer.h - the err field is
> not sent.  Nothing regressed, since the kernel never produced the event
> before efc86691e4d8.  I can fix that separately if you want it.

Any further fix would be appreciated.


thanks,

Takashi
