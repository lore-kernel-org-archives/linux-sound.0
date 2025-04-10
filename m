Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE3826F47F
	for <linux-sound@vger.kernel.org>; Thu, 10 Apr 2025 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279823; cv=none; b=B2OHmND8X8+DkUZogta1mz1wKie5DJVgfA2ZmbZet7ABnUmhlTkNKFRCd0IBvApVEKNTRiEDBORwfnOjD1UIJJ/GiCJOzG/vyppwmmPeHk3kg5CKU3rMja+moDgHqrkmhBHbXc+1chELTsMO1EtKzYWHnQ9BfYeuoyeO+S1GvKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279823; c=relaxed/simple;
	bh=qeNw6+pad+pbbUeKwd9TUx4O9Zr0ZHiMO7yMWBgyma4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bp0wWwprRRdMvJIyHdoHuVprLV3Igmydrk5vqkz/dehBKUXr5Ojpe+2gT+dpi533zYEXh52E+Wak0KmbzZlV8GcbdQ+vEJE6jkmPY5/+E964EQjdmAATdNcCxHfuLA5qTxRd98igO+bxKzvv3wmCCWiA/xpmlKenox+0noCnuU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n0MKr6LK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0K7vCkZ5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n0MKr6LK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0K7vCkZ5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n0MKr6LK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0K7vCkZ5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n0MKr6LK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0K7vCkZ5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 09EE61F385;
	Thu, 10 Apr 2025 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744279820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=neW1ZPHCo768lpK3PHulQnBdyaO+4KglmfmU1Py8+n4=;
	b=n0MKr6LK94A52dy2psU760fcN5OKnD/gLrj7rZWYd9c8YUkBWFMwPLctMfeAhIRJxgGJG/
	CoUXQ3428/IacJnPgO+C+eludAD0cz2h1DP6W4/HWrJpSXaY5HIdOOLwx0CkquAJndMuuj
	t5cDmK+CG1HCwjPXhC1ipqoSMgshf64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744279820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=neW1ZPHCo768lpK3PHulQnBdyaO+4KglmfmU1Py8+n4=;
	b=0K7vCkZ5rGfrrolncDttH/J9JrsXOStKs9mJVShmNfjuvrZaPBsoG25uswqLNSEaX1Zj+8
	POxaSC+ikZApKfDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=n0MKr6LK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0K7vCkZ5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744279820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=neW1ZPHCo768lpK3PHulQnBdyaO+4KglmfmU1Py8+n4=;
	b=n0MKr6LK94A52dy2psU760fcN5OKnD/gLrj7rZWYd9c8YUkBWFMwPLctMfeAhIRJxgGJG/
	CoUXQ3428/IacJnPgO+C+eludAD0cz2h1DP6W4/HWrJpSXaY5HIdOOLwx0CkquAJndMuuj
	t5cDmK+CG1HCwjPXhC1ipqoSMgshf64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744279820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=neW1ZPHCo768lpK3PHulQnBdyaO+4KglmfmU1Py8+n4=;
	b=0K7vCkZ5rGfrrolncDttH/J9JrsXOStKs9mJVShmNfjuvrZaPBsoG25uswqLNSEaX1Zj+8
	POxaSC+ikZApKfDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFA5A132D8;
	Thu, 10 Apr 2025 10:10:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LeWDLQuZ92eZKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Apr 2025 10:10:19 +0000
Date: Thu, 10 Apr 2025 12:10:19 +0200
Message-ID: <87wmbswcms.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	<broonie@kernel.org>,
	<tiwai@suse.com>,
	<perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>,
	<linux-sound@vger.kernel.org>,
	<quic_wcheng@quicinc.com>,
	<mathias.nyman@linux.intel.com>
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
In-Reply-To: <76ac86ea-d29c-41cd-b00d-72059acbcb93@intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
	<2025040930-catalyst-calcium-a707@gregkh>
	<76ac86ea-d29c-41cd-b00d-72059acbcb93@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 09EE61F385
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 09 Apr 2025 15:06:18 +0200,
Cezary Rojewski wrote:
> 
> On 2025-04-09 2:10 PM, Greg KH wrote:
> > On Wed, Apr 09, 2025 at 01:07:15PM +0200, Cezary Rojewski wrote:
> >> Note: this series is based on Mark's broonie/for-next. The xHCI
> >> dependency is missing so it won't compile.  Goal of this RFC is
> >> discussing the direction of sound/usb changes.
> >> 
> >> Note #2: Why exclude xHCI?  Current form of xhci-sideband.c [1] does not
> >> fare well with Intel's hardware design for USB Audio Offload feature.
> >> The production shape for usb/xHCI subjects is being discussed with
> >> Mathias.  Once we're ready, I'll share the rest.
> > 
> > How is that going to work with the patches that add xhci offload that
> > have already been reviewed on the list?
> > 
> >> Note #3: this series does _NOT_ aim to block QCOM's equivalent series
> >> [2].  The team does acknowledge that we came the "table" late.  At the
> >> same time, we're prepared to help QCOM switch to the presented sound/usb
> >> approach if that would benefit the framework and its users as a whole.
> >> Make it part of this very series if need be.
> > 
> > I don't understand, I'm just about to take the QCOM patches now.  They
> > have been on the list and reviewed for years now, why hasn't this work
> > happened before now?  Please work to make your changes on top of that
> > patch series.
> > 
> > So what do you expect me to do here?
> > 
> > confused,
> 
> Hi Greg,
> 
> I wanted the effort to be transparent, that's it.  Given the size of
> the task, I've decided to get the feedback earlier.  I believe asking
> sound-maintainers now for their take on sound/usb is better than
> coming here much later and shooting everything at once.  If the
> proposed approach to sound/usb is not welcomed by the sound
> maintainers, obviously xhci-sideband additions that will arrive here
> later will be impacted two.  In regard to the sound changes alone,
> there is no intention to blow up the parallel solution.
> 
> TLDR:
> Work present here will be placed on top of the QCOM patches, no
> question about it.  xhci-sideband.c will receive a number of changes
> to cope with Intel's design but nothing the list haven't seen before.

Thanks for the patches, but they appeared obviously too late to the
game.  Qcom patches are close to the merge, and I'd love to make
things proceeded finally after many years struggle at first.

The basic question, though again, is how the offloading is managed --
to which card or device is applied.  The same question was applied to
qcom implementation and their solution was to manage via the control
API.  The rest are rather opaque to users, and it allows us to even
switch the complete implementation later to a different way like what
you suggested, too.  But it's only when the user-space will keep
working as is.


Takashi
