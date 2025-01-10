Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B0C5028C
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736528586; cv=none; b=W6Gv44jOKNk/5Shuig3PpvO39n2BGPFAf8n14RUHheHb0FMj+KnYO+QTZva/4Gg76QyIrWF5fKq6CbfZ+5uqf8TZe9kOhWTb8Oqch09RWWw8984Gaj6FwCLznkA6v11jU/WHiCUtCbROTr14T1VrbdK+apci3qOo8NXcM3k6VQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736528586; c=relaxed/simple;
	bh=IZ6w1efvpHvluNsC3Ijdygjf/fZUnLGQziAy7oH/2oM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OAUXIKqWsDvf3Fl1c+D0VNHe93HL/QIYRhqOZ/669AUhe4/aH8MbGMFYiztXpW5IxVTf9O5gfuyYUhVoUAVXQrgo6BddEAS+/qacYAwoSxyXhV5WOohNYJuyriELOEOv8yuJMQyBK5nuBKsHprhU5NEOb1JM4M83FuUK47w5+Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vv4LQ8fR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bhE4NCuB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vv4LQ8fR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bhE4NCuB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vv4LQ8fR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bhE4NCuB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vv4LQ8fR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bhE4NCuB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 51976210F3;
	Fri, 10 Jan 2025 17:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736528583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1EENkWzjcQeNV9437kGqH11154J3HM64H/RiohYJZZU=;
	b=vv4LQ8fR8ssLUf0oI8DocvZdl/viYVaTf+ZcPFJ0bMc0f3KF6rF9jmr/0W6WFSBoM+S4ls
	nDWUJWdc5/ZYLbMDkclwOstqC72LK3qj4c2WrhbrcBZzTZf7AYzFb52/4iz0/2qSe3Smkc
	ePBlzxnOuJbgjZd7bQndmr3JkIlDlYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736528583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1EENkWzjcQeNV9437kGqH11154J3HM64H/RiohYJZZU=;
	b=bhE4NCuBd9D2nROfGN2L2yveBa9wJ3w+lrXsmXL3p+OxL+wd3uAJiPfUCjk/klwTrn+N3K
	kmNnYj97AM5KsXDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736528583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1EENkWzjcQeNV9437kGqH11154J3HM64H/RiohYJZZU=;
	b=vv4LQ8fR8ssLUf0oI8DocvZdl/viYVaTf+ZcPFJ0bMc0f3KF6rF9jmr/0W6WFSBoM+S4ls
	nDWUJWdc5/ZYLbMDkclwOstqC72LK3qj4c2WrhbrcBZzTZf7AYzFb52/4iz0/2qSe3Smkc
	ePBlzxnOuJbgjZd7bQndmr3JkIlDlYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736528583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1EENkWzjcQeNV9437kGqH11154J3HM64H/RiohYJZZU=;
	b=bhE4NCuBd9D2nROfGN2L2yveBa9wJ3w+lrXsmXL3p+OxL+wd3uAJiPfUCjk/klwTrn+N3K
	kmNnYj97AM5KsXDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F2C613763;
	Fri, 10 Jan 2025 17:03:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nQD6BcdSgWfKJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 17:03:03 +0000
Date: Fri, 10 Jan 2025 18:03:02 +0100
Message-ID: <87tta6txdl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 1/2] ALSA: FCP: Add Focusrite Control Protocol driver
In-Reply-To: <931600fcf8a23173a474f4768ec844cebc096b5b.1736007881.git.g@b4.vu>
References: <cover.1736007881.git.g@b4.vu>
	<931600fcf8a23173a474f4768ec844cebc096b5b.1736007881.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 04 Jan 2025 18:12:54 +0100,
Geoffrey D. Bennett wrote:
> +/* Get protocol version */
> +#define FCP_IOCTL_PVERSION _IOR('S', 0x60, int)
> +
> +/* Start the protocol */
> +
> +/* Step 0 and step 2 responses are variable length and placed in
> + * resp[] one after the other.
> + */
> +struct fcp_init_v1 {
> +	__u32 version;
> +	__u16 step0_resp_size;
> +	__u16 step2_resp_size;
> +	__u32 init1_opcode;
> +	__u32 init2_opcode;
> +	__u8  resp[];
> +} __attribute__((packed));
> +
> +union fcp_init {
> +	__u32 version;
> +	struct fcp_init_v1 v1;
> +};
> +
> +#define FCP_IOCTL_INIT _IOWR('S', 0x64, union fcp_init)

I don't think this version and union are needed.
If you need a different way of initialization, you can provide simply
a new ioctl, instead of keeping the same ioctl and handles something
conditionally in a complex way.

Also, in which situation should the init ioctl be performed?
And in which situation it shouldn't (must not) be performed?
Currently the driver seems allowing to run it at any time.  e.g. what
happens if the init ioctl is called while you're playing or recording
streams?  The same question is applied to the fcp_cmd, too.

> +static int fcp_hwdep_open(struct snd_hwdep *hw, struct file *file)
> +{
> +	struct usb_mixer_interface *mixer = hw->private_data;
> +	struct fcp_data *private = mixer->private_data;
> +
> +	if (!capable(CAP_SYS_RAWIO))
> +		return -EPERM;

So now you limit the hwdep operation essentially only to root user.
Is it intended, right?  That is, the hwdep should be accessed only at
probe time for configuring the stuff (preferably some service or udev
stuff)?

Maybe it'd be helpful to give some "big picture" to indicate how
things should work.  Also, the more proper documentation should be
provided for the hwdep interface, too.  The kernel doc in comments
should be fine, too.


Last but not least, I don't think we need to split to two patches.
The second patch merely adds the setup hook, and this can be folded
into the main patch.


thanks,

Takashi
