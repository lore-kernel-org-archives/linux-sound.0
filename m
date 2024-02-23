Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43011A731
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 08:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708678463; cv=none; b=Iny90HpkQTQzQPMVrB6KhkBxY238iWq54UkGyO6NZFYlaGNDLYkRXGl//yzW+eMbkqyyEn8Nx6VuZuGvW6LrHg7zR6519iSZT4NvJL28P1z4lGY+ni3afSXON+MhhKJpR4zL3ApFE3+YmDfAZ+K7Frhn+Ic3agJZawg2tnOORGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708678463; c=relaxed/simple;
	bh=MTclQIIkUSC5dmzpiqK5RRc9WIVo85N8oUpEL4Q3Kuc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pkEfSHHEqmr7mVvV8TlX8xSxuwysthR+WoETck1G5bGoveYYPHpoOxdasnvEH3AhlBQWYCw7TVPJKeWn8ARikz9ltrrTLMmCPwQB+cVd/BhvgViKBwzJnE+a2rx0eTWOM5iwYtqYkb5RbzscUObnldmRix9QlMH1Kqx8wn18dMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q5/B2J6e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6S3t1Sfr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q5/B2J6e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6S3t1Sfr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q5/B2J6e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6S3t1Sfr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q5/B2J6e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6S3t1Sfr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C4A5621120;
	Fri, 23 Feb 2024 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708678459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TG4GBlfrmG1xduES5cXlah4Cw/eswAroAExsj2YzLmM=;
	b=q5/B2J6e/uhXpNcVY+aDao/dDHw7+6cEmwcoJMoSqj3zAYWHizEjT6x27r5ncCJw+XRYEu
	HEtq3QggXFXOyE+ILmlBkEeG/jfR05JBsSJVEvUI5C+wgGfAVmTNWREXcLbwPoAL+9nDMe
	+wIAkRRvVQVYBbloiBKzn+W3OZDVwyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708678459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TG4GBlfrmG1xduES5cXlah4Cw/eswAroAExsj2YzLmM=;
	b=6S3t1SfrDNsH0rRVvMRiAr/gQEkMn5Ifu8P0dTBvy/mEQ40VJmQou6G/aSuFyM65VGjPHb
	2+MsuI2V1HeA83Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708678459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TG4GBlfrmG1xduES5cXlah4Cw/eswAroAExsj2YzLmM=;
	b=q5/B2J6e/uhXpNcVY+aDao/dDHw7+6cEmwcoJMoSqj3zAYWHizEjT6x27r5ncCJw+XRYEu
	HEtq3QggXFXOyE+ILmlBkEeG/jfR05JBsSJVEvUI5C+wgGfAVmTNWREXcLbwPoAL+9nDMe
	+wIAkRRvVQVYBbloiBKzn+W3OZDVwyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708678459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TG4GBlfrmG1xduES5cXlah4Cw/eswAroAExsj2YzLmM=;
	b=6S3t1SfrDNsH0rRVvMRiAr/gQEkMn5Ifu8P0dTBvy/mEQ40VJmQou6G/aSuFyM65VGjPHb
	2+MsuI2V1HeA83Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A4BAF133DC;
	Fri, 23 Feb 2024 08:54:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5VdBJjtd2GXbPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 08:54:19 +0000
Date: Fri, 23 Feb 2024 09:54:19 +0100
Message-ID: <875xyf4l38.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: clarify and fix default msbits value for all formats
In-Reply-To: <87a5nr4lhn.wl-tiwai@suse.de>
References: <20240222173649.1447549-1-perex@perex.cz>
	<87jzmw4acv.wl-tiwai@suse.de>
	<f70b524e-d7fe-495b-9823-c52000d4853e@perex.cz>
	<87a5nr4lhn.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_TWO(0.00)[2];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

On Fri, 23 Feb 2024 09:45:40 +0100,
Takashi Iwai wrote:
> 
> On Thu, 22 Feb 2024 19:59:14 +0100,
> Jaroslav Kysela wrote:
> > 
> > On 22. 02. 24 19:33, Takashi Iwai wrote:
> > > On Thu, 22 Feb 2024 18:36:49 +0100,
> > > Jaroslav Kysela wrote:
> > >> 
> > >> Return used most significant bits from sample bit-width rather than the whole
> > >> physical sample word size. The starting bit offset is defined in the format
> > >> itself.
> > >> 
> > >> The behaviour is not changed for 32-bit formats like S32_LE. But with this
> > >> change - msbits value 24 instead 32 is returned for 24-bit formats like S24_LE
> > >> etc.
> > >> 
> > >> Also, commit 2112aa034907 ("ALSA: pcm: Introduce MSBITS subformat interface")
> > >> compares sample bit-width not physical sample bit-width to reset MSBITS_MAX bit
> > >> from the subformat bitmask.
> > >> 
> > >> Probably no applications are using msbits value for other than S32_LE/U32_LE
> > >> formats, because no drivers are reducing msbits value for other formats (with
> > >> the msb offset) at the moment.
> > >> 
> > >> For sanity, increase PCM protocol version, letting the user space to detect
> > >> the changed behaviour.
> > >> 
> > >> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> > > 
> > > Hmm, the idea is nice, but I hesitate to take this as is.
> > > 
> > > Basically the kernel should keep the backward compatibility, and this
> > > won't (although the feature is very minor).
> > > 
> > > IMO, it'd be safer to check user_pversion and applies the new behavior
> > > only with it being >= 2.0.17, for example.
> > 
> > It's not so easy. The user_pversion is detached from substream
> > (pcm_file structure) and propagating this value to all related
> > functions creates really ugly code.
> > 
> > If you won't accept this ASIS, I propose to add new flags to the
> > hw_params structure to alter the msbits behaviour. But I can hardly
> > see any impact to the user space. The affected format/msbits
> > combination was never used in the kernel drivers. It's more like a
> > clarification than a fix.
> 
> OK, then let's take this.  I checked the major sound backend apps, and
> they don't care about msbits, so the influence must be pretty low.

To be more exact, both PA and PW have the same code to check the
msbits but they merely set "alsa.resolution_bits" property, and it's
not referred in the standard configs.


Takashi
