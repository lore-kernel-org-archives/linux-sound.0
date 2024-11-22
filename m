Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5FB1C9DD8
	for <linux-sound@vger.kernel.org>; Fri, 22 Nov 2024 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732281246; cv=none; b=eB/1SFxNjPWbcMl/C8dCT0dpelsxB6jyDEu2HyQpCvMUjzmgcV1gQVZfCXTFnCnImGS/JPvvbMhWLgVd9KdagQGzwcH8aBES+ZikCHKmg9h365M8GIOvVnwWIZp3DgdTyQwDX9rM6L7pKMZ/kBsopHnwUvaAbMWG2bBsMgCv8Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732281246; c=relaxed/simple;
	bh=O7IWd7atdDDI8u6fnnGGl8GA7i60Bibti8g/R7G7icI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iuBHsPm6oi3uAzQNljh+JVJjDlbhp218chmXBi5Dz6UwGrwe/RsidEEbHQSzZxmNjUS2AZLYyM0YH+xdHPFsdcH3Yai6ipG4Jk0fsC3hctTkEDjG7dLswMRn0FjZBKqadrR6l9qnmdr/Gou0RoSlzwqrvWprGYz4sHn5IbzJFrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KUpbAxoJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7hlSIkiN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KUpbAxoJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7hlSIkiN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KUpbAxoJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7hlSIkiN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KUpbAxoJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7hlSIkiN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D86451F37E;
	Fri, 22 Nov 2024 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732281242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLyu/ogx5n3YwFLEOi2OHIeLInDQpfjpoSadHlF+oXA=;
	b=KUpbAxoJfU0YgHUMAnQgneZmF1+zI3TgoAjJMDYS65VtGIptzBd1+/nUPXwaqUQfP0STOM
	nIZmoUofbs0cEPlSvMXpfw8ufwMSNwF2CciG4WrDSEAeOFLhr3XLLDqWpxj0c+08wvG8+0
	8JcuV1ns4ykq5BfWlrqch2nTbO1g0+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732281242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLyu/ogx5n3YwFLEOi2OHIeLInDQpfjpoSadHlF+oXA=;
	b=7hlSIkiNgBmQAXYDaTl1vtNhFDy4Ra7rR3C+0Fg+yMP7o2wXAVUk+FKFD8pBUDSn/1LB8R
	78HyX6bq2F7Yw7Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732281242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLyu/ogx5n3YwFLEOi2OHIeLInDQpfjpoSadHlF+oXA=;
	b=KUpbAxoJfU0YgHUMAnQgneZmF1+zI3TgoAjJMDYS65VtGIptzBd1+/nUPXwaqUQfP0STOM
	nIZmoUofbs0cEPlSvMXpfw8ufwMSNwF2CciG4WrDSEAeOFLhr3XLLDqWpxj0c+08wvG8+0
	8JcuV1ns4ykq5BfWlrqch2nTbO1g0+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732281242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLyu/ogx5n3YwFLEOi2OHIeLInDQpfjpoSadHlF+oXA=;
	b=7hlSIkiNgBmQAXYDaTl1vtNhFDy4Ra7rR3C+0Fg+yMP7o2wXAVUk+FKFD8pBUDSn/1LB8R
	78HyX6bq2F7Yw7Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B57013998;
	Fri, 22 Nov 2024 13:14:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZLSqJJqDQGfOUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 22 Nov 2024 13:14:02 +0000
Date: Fri, 22 Nov 2024 14:14:02 +0100
Message-ID: <87bjy71kdh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Beno=EEt?= Sevens <bsevens@google.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix out of bounds reads when finding clock sources
In-Reply-To: <CAGCho0VHB=Zewhu2mtN8xHw2fF9LOhXjcJ5JaB0qucG-5gxGhQ@mail.gmail.com>
References: <20241121140613.3651-1-bsevens@google.com>
	<877c8w3aez.wl-tiwai@suse.de>
	<CAGCho0Ueh4cVZy+nUrzCiXZm1VoHNXRya8oU-F2Q7k0ggUEnsA@mail.gmail.com>
	<87frnj1ncx.wl-tiwai@suse.de>
	<CAGCho0VHB=Zewhu2mtN8xHw2fF9LOhXjcJ5JaB0qucG-5gxGhQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 22 Nov 2024 14:01:53 +0100,
Benoît Sevens wrote:
> 
> On Fri, 22 Nov 2024 at 13:09, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Fri, 22 Nov 2024 11:06:57 +0100,
> > Benoît Sevens wrote:
> > >
> > > Hi Takashi,
> > >
> > > Thank you for the review. Except for one question below, this patch
> > > looks good to me. Would you like me to send your patch as a revised
> > > patch to this mailing list?
> >
> > I'm going to submit the proper patch if the fix works for you.
> >
> > > On Thu, 21 Nov 2024 at 15:53, Takashi Iwai <tiwai@suse.de> wrote:
> > > > @@ -65,13 +73,23 @@ static bool validate_clock_selector(void *p, int id, int proto)
> > > >  {
> > > >         union uac23_clock_selector_desc *cs = p;
> > > >
> > > > -       return GET_VAL(cs, proto, bClockID) == id;
> > > > +       if (!DESC_LENGTH_CHECK(cs, proto))
> > > > +               return false;
> > > > +       if (GET_VAL(cs, proto, bClockID) != id)
> > > > +               return false;
> > > > +       /* additional length check for baCSourceID, bmControls and iClockSelector */
> > > > +       if (proto == UAC_VERSION_3)
> > > > +               return cs->v3.bLength >= sizeof(cs->v3.bLength) + cs->v3.bNrInPins + 6;
> > >
> > > Why can't we just do this here?
> > >
> > >  return cs->v3.bLength >= sizeof(cs->v3) + cs->v3.bNrInPins;
> >
> > Argh, it was just a wrong check.
> >
> > But the clock selector descriptor must have two more fields in
> > addition to baCSourceID array.  Those two are 6 bytes (= 4 bytes for
> > bmControls + 2 bytes for wCSelectorDescrStr) for UAC3, while...
> >
> > > > +       else
> > > > +               return cs->v2.bLength >= sizeof(cs->v2.bLength) + cs->v2.bNrInPins + 2;
> > >
> > > And same question here, why not:
> > >
> > >  return cs->v2.bLength >= sizeof(cs->v2) + cs->v2.bNrInPins;
> >
> > ... for UAC2, they are 2 bytes (= 1 byte for bmControls + 1 byte for
> > iClockSelector).  So those numbers appeared in the patch.
> >
> > Below is the revised patch.  Let me know if this works for you.
> >
> 
> Looks perfect to me. Thank you for the patch and explanations!
> 
> Can we cc stable to get it backported?

Sure, I'll add it when submitting properly.


thanks,

Takashi
