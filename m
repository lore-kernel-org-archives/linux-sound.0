Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D393D4127
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495588; cv=none; b=ZAPOnE0SrjWzcM4URrR0ImPDnT76FSW0MjnJ6naj4GCb+XslDgOvBr4ZCXI/g6NlYyBgw7yqIF8zkt9NoHpkSD8KxsZ6o1wNLQCP/lNfRjZ4uPQw0a/7wcnRDmaE03FhF6mKjHeiaE1GjszrGQkuddWohgPf1NvFshEi9PQgvbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495588; c=relaxed/simple;
	bh=xvcpNlZfiA31AH+83n7PjV2c3uaLDESLk+tZXiEwaLU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nEki4JAA1Gk6ccD3VRBw6+IbeZ6Ln7+qcqeVoGl3lgHRKRXnPVPvNKUrHD/9Rbu1voqrstNbwD95sBa2uY4l84fWUxDRzOSAF3kGsEqEbBRYgLNkOMJBo8UOYifgNXGube9/9WbbJSwwcHzUyEuBEBbRHitm78wZ/v8islSg4bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N41LM9/d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cV3ozgfz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q8VqpOv3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D476WptX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N41LM9/d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cV3ozgfz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q8VqpOv3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D476WptX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C36037DEED;
	Fri, 31 Jul 2026 10:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785495577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hirhrGmdlEJvABpZnSJAK0qeaAxf978Wzpcy/NjEBbI=;
	b=N41LM9/dCZ3aL7EuK+Fd4OvzPdaIIlZqoxD+7ZixNgCn0p0axTUGEK3TQNuxS4JS2vKqXk
	7ImEIjVTQUN0bwyTX+mKA3IL0tcjSKZwUqT3B/CmH4ut2dxO1z6zIkdMjdYPkDbGGCnqHO
	p0mX+Lym6XehhjSCoJAGnIAc+I5a/Jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785495577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hirhrGmdlEJvABpZnSJAK0qeaAxf978Wzpcy/NjEBbI=;
	b=cV3ozgfz69TBOjZVc5105P3QFmYWDTzmrTRAQgSZ5F3/dbUGEQ8I7M/M7oQ2T8d3D1CPfB
	3upjx3FaT89anyDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=q8VqpOv3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=D476WptX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785495573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hirhrGmdlEJvABpZnSJAK0qeaAxf978Wzpcy/NjEBbI=;
	b=q8VqpOv3JAQKF2X4iKZyAZR99z3HifzHNnJDK40jk1puuhj10e4LeaYTZAXOnIH5w4ZTQ9
	CBsgkrU4nhgoTxfYuuuMxEC+WSo36OdTNN3JqD62z0s6Jm+cjOUPnb+sHbtnjpfS1gqcmY
	x7OJhi+/ZeUDk35VBnNpY+6w3WMBtwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785495573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hirhrGmdlEJvABpZnSJAK0qeaAxf978Wzpcy/NjEBbI=;
	b=D476WptXuFW4I0O8/WOldGieDqczMXSrj99jt+DTxdNfC91NkygYE5clwGLf5gTnE0V3d6
	qVsPB+D3iVBb6/AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EA3C779B0;
	Fri, 31 Jul 2026 10:59:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8ctiHRWAbGqRLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 31 Jul 2026 10:59:33 +0000
Date: Fri, 31 Jul 2026 12:59:32 +0200
Message-ID: <87y0erzap7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v6 2/2] ALSA: control: add ioctl to retrieve full card components
In-Reply-To: <20260720103505.1860399-2-mstrozek@opensource.cirrus.com>
References: <20260720103505.1860399-1-mstrozek@opensource.cirrus.com>
	<20260720103505.1860399-2-mstrozek@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,perex.cz:email,suse.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: C36037DEED
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Mon, 20 Jul 2026 12:35:05 +0200,
Maciej Strozek wrote:
> 
> The fixed-size components field in SNDRV_CTL_IOCTL_CARD_INFO can be too
> small on systems with many audio devices.
> 
> Keep the existing struct snd_ctl_card_info ABI intact and add a new
> ioctl SNDRV_CTL_IOCTL_CARD_BYTES that carries a variable-length payload
> selected by a type discriminator. The first defined type
> SND_CTL_CARD_BTYPE_COMPONENTS returns the full components string. The
> ioctl is designed to be reused for other variable-length card payloads
> in the future.
> 
> The user-space caller may set data_allocated == 0 (or data == NULL) to
> query the required length; otherwise the kernel copies the payload into
> the user buffer and writes back the actual length in data_len.
> 
> When the legacy components field in struct snd_ctl_card_info is
> truncated, '>' is written just before the NUL terminator to signal to
> user-space that the full string is available via the new ioctl.
> 
> card->components is now dynamically allocated and grown in 32 byte
> increments via krealloc(), capped at 512 bytes.
> 
> Link: https://github.com/alsa-project/alsa-lib/pull/494
> Suggested-by: Jaroslav Kysela <perex@perex.cz>
> Suggested-by: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
> Changes for v6:
>  - take the snd_ioctl_rwsem write lock in snd_component_add()
> Changes for v5:
>  - use __u64 and u64_to_user_ptr() instead of 32bit compat layer
>  - handle a NULL card->components
> Changes for v4:
>  - replaced snd_ctl_card_components with snd_ctl_card_bytes for possible
>    future extensions
>  - support query mode (data_allocated == 0 or data == NULL)
>  - added compat 32-bit
>  - renamed card->components_ptr / components_ptr_alloc_size to
>    card->components / components_alloc_size
> Changes for v3:
>  - change components field to a dynamic array resizable in 32 byte
>    increments
>  - removed SNDRV_CTL_COMPONENTS_LEN define
>  - sanity check if 'components' requests more than 512 bytes
>  - added a commit to clean up trailing whitespaces
>  - alsa-utils link no longer needed
> Changes for v2:
>  - do not modify existing card->components field
>  - add a new ioctl and struct to keep the full components string
>  - handle the split/trim in snd_ctl_card_info()

Looks OK for me.  Jaroslav, could you review, too?
If nothing obvious is found, I'm going to take for 7.3.


thanks,

Takashi
