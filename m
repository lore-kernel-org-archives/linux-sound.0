Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8E81ACEDE
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170535; cv=none; b=JsgYHVdUTYEFfgusIkfEIiAEd26sSPkPABV47RRk3gkMZ/rha4Z2w0WrSlGx9vCTUtApmhO1/vhHIrwH0gwxtzn60eOE8jnKH/4lFzFo7GBwTOkrKssVd+e7qrzxtD7HYuRf2gbrvm+8F4981QbSwDTW4YGKSXo2gcO+cSWkQJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170535; c=relaxed/simple;
	bh=5kh4ntvIKkziieDqqj/21zAjUBmUKEKAis4C6EpdXA0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WRh0qxiK57100DvFI/zUT7pWSnIjWat3gtbDidL0bypuuSfUEn5FK/14T/dAfWTaOB1Rt6gpMxHe5Xxh3wyzCRKH3nhKYnnCeMoCSwG+CPNRvnBc6/eHe7rBfHQfq1G2/H4YEdxa/DlO7lWrLWGuh1oi6ldQ+SQoIDI4ArEqvGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WfkIMrIy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R7Z58yJX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WfkIMrIy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R7Z58yJX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WfkIMrIy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R7Z58yJX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WfkIMrIy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R7Z58yJX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 121DE337C9;
	Fri, 23 Jan 2026 12:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769170532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MaKKNQZd8waLDwpMvc+iWirObdEqhfgaUAQq6kVJTio=;
	b=WfkIMrIyd1nSSmQ+3Qh9IeKChg74PalOUudyqaLIbk4WJQoTE/AcU++oV1Iu37hF6V5v6O
	MAq3TtsbUhbqOzj9/BgGvK+sFR2M6swhO4i+lJbgoy62WiT/SkQAcFXwuofWC5/gesUcbJ
	MqFq8v4z74V5J/ZBgZwvtR/bbD1oXG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769170532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MaKKNQZd8waLDwpMvc+iWirObdEqhfgaUAQq6kVJTio=;
	b=R7Z58yJXwadXF0E6D95MyQQWUVVlXehIh5udWzX7mSAp3wtIARr4B4M/iGUs/EC90AZexp
	L//PqYkJcXkVNmDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769170532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MaKKNQZd8waLDwpMvc+iWirObdEqhfgaUAQq6kVJTio=;
	b=WfkIMrIyd1nSSmQ+3Qh9IeKChg74PalOUudyqaLIbk4WJQoTE/AcU++oV1Iu37hF6V5v6O
	MAq3TtsbUhbqOzj9/BgGvK+sFR2M6swhO4i+lJbgoy62WiT/SkQAcFXwuofWC5/gesUcbJ
	MqFq8v4z74V5J/ZBgZwvtR/bbD1oXG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769170532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MaKKNQZd8waLDwpMvc+iWirObdEqhfgaUAQq6kVJTio=;
	b=R7Z58yJXwadXF0E6D95MyQQWUVVlXehIh5udWzX7mSAp3wtIARr4B4M/iGUs/EC90AZexp
	L//PqYkJcXkVNmDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C739C136AA;
	Fri, 23 Jan 2026 12:15:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jxBfL2Nmc2lkIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Jan 2026 12:15:31 +0000
Date: Fri, 23 Jan 2026 13:15:31 +0100
Message-ID: <871pjgfrto.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] ALSA: control: add ioctl to retrieve full card components
In-Reply-To: <fce36281-1aa4-4a83-afa1-2470df4453a0@perex.cz>
References: <20260122111249.67319-1-mstrozek@opensource.cirrus.com>
	<fce36281-1aa4-4a83-afa1-2470df4453a0@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 22 Jan 2026 14:30:04 +0100,
Jaroslav Kysela wrote:
> 
> On 1/22/26 12:12, Maciej Strozek wrote:
> > The fixed-size components field in SNDRV_CTL_IOCTL_CARD_INFO can be too
> > small on systems with many audio devices.
> > 
> > Keep the existing struct snd_ctl_card_info ABI intact and add a new ioctl
> > to retrieve the full components string.
> > 
> > When the legacy components field is truncated, append '>' to indicate
> > that the full string is available via the new ioctl.
> 
> Thanks for the patch. Comments bellow.
> 
> > @@ -88,7 +89,8 @@ struct snd_card {
> >   	char irq_descr[32];		/* Interrupt description */
> >   	char mixername[80];		/* mixer name */
> >   	char components[128];		/* card components delimited with
> > -								space */
> > +								space, truncated to 127 chars */
> > +	char components_extended[SNDRV_CTL_COMPONENTS_LEN];	/* full card components string */
> 
> I would remove the original components[128] string and replace it
> with dynamically allocated 'char *components_ptr' with 'unsigned int
> components_ptr_alloc' to store allocated size. Then the
> snd_component_add() function may allocate (and resize) dynamically the
> components_ptr on demand (using e.g. 32 byte step). This will also
> catch all drivers using the original struct member when compiled and
> make the memory usage a little bit happier.

Agreed that it'd be better to point to the dynamic allocated array.

And, we can basically drop the limit, too.
For example, the ioctl can store the size of the string in return
while filling up to the given length.  So, when user-space gives
snd_ctl_card_components.length = 0, it just stores the actual string
size to this length field.  Then user-space can allocate the needed
buffer and get the actual string.

Or, user-space allocates a large-enough size buffer, set to length,
and check the actually returned length, too.

Of course, we may (should) have some upper-limit internally for a
sanity check, but it doesn't have to be exposed as a part of ABI.


thanks,

Takashi
