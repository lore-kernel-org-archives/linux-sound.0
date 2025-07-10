Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC3293B55
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752146458; cv=none; b=FW+dhK/FdMBpr0T3wHaEkBUP6ucOzndQ3h1GOkzHVB6WB8aj7txfpra7t1Tlsk0DpoWRhFmJkG+5tsKmIki/KPBeLZdPgI9gOvJgRjjlTpYqCL71ESjEAburSehW6RKRPgc/S/lh3lDJnCuHpOLOPZaCjQqOmWwOCMkDuOZyjAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752146458; c=relaxed/simple;
	bh=TXLRr7mVNBAsInZJbdCEYmIjDXuxpFPHfv85uspOg6k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uldbykjerHZskLbaDePvNCr5i1s7SMW6B2q5NOpo7nlrYxRBvFs3cw4QS/W0oTmIRx6UpvB3uw8M/ITM834O9yd2/JCI6b/g9IzOX3h3dLuMA4PndB++MPflom+ZhJOBrykWRzsuYcT8mEllLBWqGQ/28AOAiG2ZOvZ1OxDNTc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iDLFuA3b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lkisv87h; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iDLFuA3b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lkisv87h; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iDLFuA3b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lkisv87h";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iDLFuA3b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lkisv87h"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6702F1F385;
	Thu, 10 Jul 2025 11:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752146454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yCGrkCAiMkkB2RcOoxtxHJn88Kk+BZAZcr7+Mnl8plI=;
	b=iDLFuA3bvFASGzvYQ7F6YsxC5N9oaq4rCjrfVcOZblKbRMW8XJC9QTlJRhzBCpiQqJTZVf
	cLGbmCCRKh1ewxi50otKkVElRSuglvPZqwQ9zhuF5mnpDhny3ql5/o1tYedP6qxAT/plwf
	hhV0uj64H+z8oyxZI9tf8oYgmZzzomw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752146454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yCGrkCAiMkkB2RcOoxtxHJn88Kk+BZAZcr7+Mnl8plI=;
	b=lkisv87hZ42ChT9dObTvV2Y0TjaRb2xd6+9z1nXAGPZQojVeJizEBv1VZdYnfWncJi8JQu
	DdSLJV55vnNTd7BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752146454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yCGrkCAiMkkB2RcOoxtxHJn88Kk+BZAZcr7+Mnl8plI=;
	b=iDLFuA3bvFASGzvYQ7F6YsxC5N9oaq4rCjrfVcOZblKbRMW8XJC9QTlJRhzBCpiQqJTZVf
	cLGbmCCRKh1ewxi50otKkVElRSuglvPZqwQ9zhuF5mnpDhny3ql5/o1tYedP6qxAT/plwf
	hhV0uj64H+z8oyxZI9tf8oYgmZzzomw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752146454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yCGrkCAiMkkB2RcOoxtxHJn88Kk+BZAZcr7+Mnl8plI=;
	b=lkisv87hZ42ChT9dObTvV2Y0TjaRb2xd6+9z1nXAGPZQojVeJizEBv1VZdYnfWncJi8JQu
	DdSLJV55vnNTd7BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 439FD136CB;
	Thu, 10 Jul 2025 11:20:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /SfODhaib2gecgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 11:20:54 +0000
Date: Thu, 10 Jul 2025 13:20:53 +0200
Message-ID: <8734b4xpey.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 083/103] ALSA: Use safer strscpy() instead of strcpy()
In-Reply-To: <aG-d4bys9tt1jfIl@geday>
References: <20250710100727.22653-1-tiwai@suse.de>
	<20250710100727.22653-84-tiwai@suse.de>
	<aG-d4bys9tt1jfIl@geday>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 10 Jul 2025 13:02:57 +0200,
Geraldo Nascimento wrote:
> 
> On Thu, Jul 10, 2025 at 12:07:05PM +0200, Takashi Iwai wrote:
> > Use a safer function strscpy() instead of strcpy() for copying to
> > arrays.
> > 
> > Only idiomatic code replacement, and no functional changes.
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/pci/sis7019.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
> 
> Hi Takashi,
> 
> I think you've missed the "sis7019: " after "ALSA: " on the subject line
> for this one.

Right, I'll correct at applying.


thanks,

Takashi
