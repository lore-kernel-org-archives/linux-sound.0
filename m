Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541D4236A8B
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858627; cv=none; b=BGhovpLlOTGGXX9tgic1z4F6ubBgha26jmlkDxB5ceblyXmqjtkz/iNvGQmfm1txjJDa8oYa0SnKhsbXTtbbcjfaCYmQOAKiUel40woYYJFVKC8mh7OE16lMQlJgKRFBhUFXGRLsr1JgDtnL3prghYFUehCbkk9fzCwA2kqlEuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858627; c=relaxed/simple;
	bh=qgBDvQdjuboaO2w6ZnQJZtj0xEJGbWA0kFJuwozRkmY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NS8LuwT0vhbB1iCi5oNiV5IJ1R8rDn+8O1zrj6N8aYcj4+RO69G1XTIlxQUN87wkGpvVTFEoo5cANJg0eMR+0husvLjjzN5/24WRiemuOnudFogbsl02YyYlmmHcbPJILu2sWELXJp3UMGZ7EII3iHSjFdOcs2aS4QzHSqWnL/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Mdx8/sG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o3HYMPaE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Mdx8/sG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o3HYMPaE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Mdx8/sG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o3HYMPaE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Mdx8/sG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o3HYMPaE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 890411F37C;
	Tue, 14 Jan 2025 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736858623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Erdsh+BhVrp+7RRFiZk8lttgEAaz/HXvRcLSX88sYj8=;
	b=1Mdx8/sGbpECW2EjVZv763fpOGWGNA9E4GMyYIdjUBhCezJ+sVmk9DwsWKgrSl1mudkfg3
	5i9CSvmcXlQ7lNH6mCzSV3vyftz2+FlYXQpfaPdyYNa+gxRsSvYOseK/FJj4yQ/4NaFF18
	RBUjd8JsvCcFVir43mfmXARBKJebh8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736858623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Erdsh+BhVrp+7RRFiZk8lttgEAaz/HXvRcLSX88sYj8=;
	b=o3HYMPaEJR/ZmBO5ZRXRCShHCH/aJ9yWWzbQHnEU3G+FaOvs3N65LhVW/s2xncNhvkyJTz
	J8whaOdNkBxpbBCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736858623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Erdsh+BhVrp+7RRFiZk8lttgEAaz/HXvRcLSX88sYj8=;
	b=1Mdx8/sGbpECW2EjVZv763fpOGWGNA9E4GMyYIdjUBhCezJ+sVmk9DwsWKgrSl1mudkfg3
	5i9CSvmcXlQ7lNH6mCzSV3vyftz2+FlYXQpfaPdyYNa+gxRsSvYOseK/FJj4yQ/4NaFF18
	RBUjd8JsvCcFVir43mfmXARBKJebh8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736858623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Erdsh+BhVrp+7RRFiZk8lttgEAaz/HXvRcLSX88sYj8=;
	b=o3HYMPaEJR/ZmBO5ZRXRCShHCH/aJ9yWWzbQHnEU3G+FaOvs3N65LhVW/s2xncNhvkyJTz
	J8whaOdNkBxpbBCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73AE11384C;
	Tue, 14 Jan 2025 12:43:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BVaPG/9bhmeYNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 12:43:43 +0000
Date: Tue, 14 Jan 2025 13:43:43 +0100
Message-ID: <87ikqhzhts.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v6 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
In-Reply-To: <cover.1736792486.git.g@b4.vu>
References: <cover.1736792486.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 13 Jan 2025 20:41:02 +0100,
Geoffrey D. Bennett wrote:
> 
> > Hmm, this special is a special use of TLV in non-standard way, which
> > needs definitely documentation.  The use is no longer TLV, just some
> > raw read/write of a bulk data for the kcontrol , after all.
> >-
> > Also, I couldn't figure out what exactly this "meter_labels" stuff
> > serves for.  It's not referred from anywhere else than TLV read?
> 
> The user-space driver stores meter labels in the Level Meter control's
> TLV data so users can determine what each channel of the control
> corresponds to.
> 
> As the kernel doesn't need to interpret what's stored there, I've
> renamed it from meter_labels to the more generic "meter_metadata" in
> case future uses are discovered.
(snip)
> On Mon, Jan 13, 2025 at 06:14:03PM +0100, Jaroslav Kysela wrote:
> > The data format _must_ be in TLV encapsulation also for such R/W operations.
> 
> The user-space driver stores the data in the correct type-length-data
> format (with the length a multiple of sizeof(unsigned int)). This is
> similar to how sound/control.c read_user_tlv() and replace_user_tlv()
> operate.
> 
> > So, a new type should be defined. Perhaps, we can define a driver specific
> > data type, because the meter levels (and the whole extensions) seem as
> > device specific.
> 
> Are you thinking like this?
> 
> diff --git a/include/uapi/sound/tlv.h b/include/uapi/sound/tlv.h
> index b99a2414b53d..965c64796b6a 100644
> --- a/include/uapi/sound/tlv.h
> +++ b/include/uapi/sound/tlv.h
> @@ -18,6 +18,8 @@
>  #define SNDRV_CTL_TLVT_CHMAP_VAR       0x102   /* channels freely swappable */
>  #define SNDRV_CTL_TLVT_CHMAP_PAIRED    0x103   /* pair-wise swappable */
> 
> +#define SNDRV_CTL_TLVT_FCP_METER_METADATA 0x110 /* FCP driver meter metadata */
> +
> [...]
> 
> I was thinking it wouldn't be needed as the kernel doesn't need to
> interpret the data I'm storing, and user-created ALSA controls (which
> this is very similar to) are free to store whatever they like in the
> TLV data anyway?

I suppose this data is set by the configuration program just like
other fcp register writes at the probe time, and the applications are
supposed just to read them, instead, right?

If so, it's safer to set this via ioctl instead of TLV write.
Every application is permitted to write TLV, hence everyone can write
a malformed data there, too.

Judging from your comment, it's a single TLV entry?  Then passing the
data via ioctl should be straightforward and you can verify the data
length there, too.

The TLV read can return the value set by the ioctl only after it's set
up.


thanks,

Takashi
