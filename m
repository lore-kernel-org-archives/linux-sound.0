Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDB346B5
	for <linux-sound@vger.kernel.org>; Fri,  3 Jan 2025 17:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735924056; cv=none; b=jy52IFEECYoHnXXLY4CQqVP2V2UysFJbd7eY7f4M7hpf5IkiqOJQS4AwUV0jaqDjDSj5a6WyyGuVdR2dV0trGQYeJydElwjwk9zkdnKcoH+FcScyMDK++8qsFWnEj67SVNubQ803QGfVQ8tmBk/Wey841CPrxGnOBmH4NJ94xC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735924056; c=relaxed/simple;
	bh=CUiMxFToKvEgdM6X/ndtk9YOho4AAA8Q02K22zTEK5w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y+WjGBZegk3eTJeRRr2AavhPQ19OZy9f7+hUxH6knIWsN2f/prBhr+tnZuo+jGDpaDiOjzff8JxBppN7CWoaslWhxYnh4m9lpaIzaHGSHkYpEVlTRoecYRzf+NBmwtFytB7mPXSKxBurz0UbyfFHgFSRTVgvUi9fBmFc4DW022Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jaDU7UVP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=328YXYHc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jaDU7UVP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=328YXYHc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jaDU7UVP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="328YXYHc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jaDU7UVP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="328YXYHc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41EFA210F5;
	Fri,  3 Jan 2025 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735924053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AKvqqpIjwYQr84mkgBA8VJwe/IH3kY29s2n6ER2eVAw=;
	b=jaDU7UVP943Lkusu6NP5/6PNk8TXGThJz1RWlN3EqFJPnxbMPSJFVMZX6LttOUUizjGQFO
	64rhVqapyxBB4Sv0kBSAGFZ7wfuf8mxSLmUEeWOT6vcTXqlUMHJNmuK9DBOVoJ7V7HJO7f
	5Ry8BIy7kiKq7ha5gBUvqy7Gcv12UEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735924053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AKvqqpIjwYQr84mkgBA8VJwe/IH3kY29s2n6ER2eVAw=;
	b=328YXYHcognyRMmaEeugwjagI2iVBnVdsJyhXnvscijXh7Y2K61VnoxfWKMxlnkzFYRweW
	Bl/aK7Anqm1VkvAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735924053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AKvqqpIjwYQr84mkgBA8VJwe/IH3kY29s2n6ER2eVAw=;
	b=jaDU7UVP943Lkusu6NP5/6PNk8TXGThJz1RWlN3EqFJPnxbMPSJFVMZX6LttOUUizjGQFO
	64rhVqapyxBB4Sv0kBSAGFZ7wfuf8mxSLmUEeWOT6vcTXqlUMHJNmuK9DBOVoJ7V7HJO7f
	5Ry8BIy7kiKq7ha5gBUvqy7Gcv12UEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735924053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AKvqqpIjwYQr84mkgBA8VJwe/IH3kY29s2n6ER2eVAw=;
	b=328YXYHcognyRMmaEeugwjagI2iVBnVdsJyhXnvscijXh7Y2K61VnoxfWKMxlnkzFYRweW
	Bl/aK7Anqm1VkvAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 145F413418;
	Fri,  3 Jan 2025 17:07:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XrbMA1UZeGeMBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Jan 2025 17:07:33 +0000
Date: Fri, 03 Jan 2025 18:07:32 +0100
Message-ID: <878qrrzuzv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
In-Reply-To: <cover.1735855597.git.g@b4.vu>
References: <cover.1735855597.git.g@b4.vu>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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

On Thu, 02 Jan 2025 23:38:07 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> Static buffers in the ioctl structs didn't seem to be the right way to
> go, so I followed the instructions in
> Documentation/drivers-api/ioctl.rst and the ioctls now work with
> 32-bit userspace on 64-bit kernels.

Actually it's rather trivial if you use a variable length array and
passes the header to the ioctl struct.  e.g.

struct fcp_cmd {
	__u16 size;
	__u16 resp_size;
	u8 data[];
};

then you can simply do copy_from_user() from the data field.  And
write back to the data field again for the response if resp_size is
non-zero, too.

The above can be used for most of your needed I/O in general, I
suppose.

> I added suspend/resume handling and all the suspend/resume cases that
> I tried now work too.

Thanks.  The code used for suspend is same for the fcp_private_free(),
and they can be factored out.


Now, considering this implementation again, a fundamental question is
whether we really should go to this direction or not.

Usually the driver implements an ioctl per certain limited task
(except for some debugging purpose).  But we open all doors fully.
This gives the most flexibility, of course.  OTOH, it has a
significant risk that every program may screw up your device easily by
sending some malicious ioctls.

So one another possible way would be to provide more tailored ioctls
that are specific to each task.  Or we may introduce some sanity
checks of the possible registers or whatever parameters instead of
accepting all as is.  Of course those would decrease the flexibility;
when some new feature is needed, you'd need to adjust the kernel side
as well.  That's the cost for safety.

I'm not sure about this design decision yet.


thanks,

Takashi
