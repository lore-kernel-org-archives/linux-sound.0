Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370321A7264
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179544; cv=none; b=bwwFlohOJlOb3yFNUSuiH/evKqKocvrt+Hmb1R66ifwdKe+0w0QRaBvxmRa4HKfpNdo/k0EmUX11fi/zTOslhAjjhgfyK/UgO9SmlJ6jKkT6JlSYJgQr5/yBqem/JCLMbSqeKcNFjK3IE0YchqS6CzFjbkllYomhNZ2n1My37XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179544; c=relaxed/simple;
	bh=SScq1jv0MJWJmm1IG/MQ3KCptkNK0eZJRd7ieUPAAs8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dAgwa4U+fE4isyLrAFH8n1C32q/lxHh2OdFFjD7IGcO+5ZKZw4fWzODmMbWpMdyR15uqePv2944cHbvvzXXUBy6m6/sXU9enh1BSZVqRFD6B56rUyHuvvyv7bVh95i6EUCAXQdRk7Laa3ZoumhiUxOQunWjQqQxCBXZmzSKF7K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ePet03Da; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fP35sMsA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ePet03Da; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fP35sMsA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ePet03Da";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fP35sMsA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ePet03Da";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fP35sMsA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 682FE33847;
	Fri, 23 Jan 2026 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769179541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JALOI8VaIM5VKB5gJuL52ccSJ9g9FPtegga2kEYdmCM=;
	b=ePet03DazmhOuVuNtN+BTtVvqN4Ohl+KJuwOLhoWDTKDTcE+G2Rg5/8ctUFlx3aaKnmIwl
	jzBJf6qbNlzt0cDbUC+2GNVENkOvYPwftMqVVxVIEBtITak5LZq8AyVEzWScrk+5Z05m0y
	U3Cd0j6eS3ZokHqp2sO3+62mFipce6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769179541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JALOI8VaIM5VKB5gJuL52ccSJ9g9FPtegga2kEYdmCM=;
	b=fP35sMsAXctX4XmH2AqYkgBP8t2bnHC6zQ0A5s7EvLUJDF/LqWCn82KrpipiW0mrp0qf+K
	2iZAhv2+ajJPgICQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ePet03Da;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fP35sMsA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769179541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JALOI8VaIM5VKB5gJuL52ccSJ9g9FPtegga2kEYdmCM=;
	b=ePet03DazmhOuVuNtN+BTtVvqN4Ohl+KJuwOLhoWDTKDTcE+G2Rg5/8ctUFlx3aaKnmIwl
	jzBJf6qbNlzt0cDbUC+2GNVENkOvYPwftMqVVxVIEBtITak5LZq8AyVEzWScrk+5Z05m0y
	U3Cd0j6eS3ZokHqp2sO3+62mFipce6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769179541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JALOI8VaIM5VKB5gJuL52ccSJ9g9FPtegga2kEYdmCM=;
	b=fP35sMsAXctX4XmH2AqYkgBP8t2bnHC6zQ0A5s7EvLUJDF/LqWCn82KrpipiW0mrp0qf+K
	2iZAhv2+ajJPgICQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 210B1136AA;
	Fri, 23 Jan 2026 14:45:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yLGkBpWJc2nhOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Jan 2026 14:45:41 +0000
Date: Fri, 23 Jan 2026 15:45:40 +0100
Message-ID: <87ikcse6az.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] ALSA: control: add ioctl to retrieve full card components
In-Reply-To: <cf52537811c2958dda4510b50792278d04fe9f39.camel@opensource.cirrus.com>
References: <20260122111249.67319-1-mstrozek@opensource.cirrus.com>
	<fce36281-1aa4-4a83-afa1-2470df4453a0@perex.cz>
	<871pjgfrto.wl-tiwai@suse.de>
	<cf52537811c2958dda4510b50792278d04fe9f39.camel@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 682FE33847
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 23 Jan 2026 15:42:13 +0100,
Maciej Strozek wrote:
> 
> W dniu pią, 23.01.2026 o godzinie 13∶15 +0100, użytkownik Takashi Iwai
> napisał:
> > On Thu, 22 Jan 2026 14:30:04 +0100,
> > Jaroslav Kysela wrote:
> > > 
> > > On 1/22/26 12:12, Maciej Strozek wrote:
> > > > The fixed-size components field in SNDRV_CTL_IOCTL_CARD_INFO can
> > > > be too
> > > > small on systems with many audio devices.
> > > > 
> > > > Keep the existing struct snd_ctl_card_info ABI intact and add a
> > > > new ioctl
> > > > to retrieve the full components string.
> > > > 
> > > > When the legacy components field is truncated, append '>' to
> > > > indicate
> > > > that the full string is available via the new ioctl.
> > > 
> > > Thanks for the patch. Comments bellow.
> > > 
> > > > @@ -88,7 +89,8 @@ struct snd_card {
> > > >    char irq_descr[32]; /* Interrupt description */
> > > >    char mixername[80]; /* mixer name */
> > > >    char components[128]; /* card components delimited with
> > > > - space */
> > > > + space, truncated to 127 chars */
> > > > + char components_extended[SNDRV_CTL_COMPONENTS_LEN]; /* full
> > > > card components string */
> > > 
> > > I would remove the original components[128] string and replace it
> > > with dynamically allocated 'char *components_ptr' with 'unsigned
> > > int
> > > components_ptr_alloc' to store allocated size. Then the
> > > snd_component_add() function may allocate (and resize) dynamically
> > > the
> > > components_ptr on demand (using e.g. 32 byte step). This will also
> > > catch all drivers using the original struct member when compiled
> > > and
> > > make the memory usage a little bit happier.
> > 
> > Agreed that it'd be better to point to the dynamic allocated array.
> > 
> > And, we can basically drop the limit, too.
> > For example, the ioctl can store the size of the string in return
> > while filling up to the given length.  So, when user-space gives
> > snd_ctl_card_components.length = 0, it just stores the actual string
> > size to this length field.  Then user-space can allocate the needed
> > buffer and get the actual string.
> > 
> > Or, user-space allocates a large-enough size buffer, set to length,
> > and check the actually returned length, too.
> > 
> > Of course, we may (should) have some upper-limit internally for a
> > sanity check, but it doesn't have to be exposed as a part of ABI.
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> Thank you for your reviews, will prepare a v3 with dynamically
> allocated array soon.
> Do you suggest to simply error out if the internal upper-limit is
> exceeded?

I guess yes, but note that the upper limit check would be rather for
adding component strings, not for the ioctl.
Basically we don't need a temporary kmalloc for ioctl, but we can just
copy the contents since the buffer length is given.


thanks,

Takashi
