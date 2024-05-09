Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E221474CE
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715260097; cv=none; b=FSaUG/ZD2a0c5PdyeT01uFt9xz8C0goprABaPlT1zu+C5Au5TBt+6h02P/9zKd376CXuuuEDBtGbQZe4hPSffntIupJWsYNS/8KHnrfIu8zbRzo/jPXyDLmVcZscZubvd/tPyNTKdVZp70CgUUQrdsa8yNc5rvpJjLDfvA7cqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715260097; c=relaxed/simple;
	bh=GbED1ASAvUu9cR9cP/ZIvyIeUMu9E2KtmKHRWYzD8IU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tql5OIvZaw2tJNdLW4o3OjN0HcREB3KRUONXY+Wr6KFrn283xmoTqY9wB3e1+Azjmsb8zPkQRDNbuc565gKpxY3nOgpCXZJ1/CfSvSfFJJQ2lJmP1zUCw66NvTwLpkU9awfigLsr/DbzgA7xB59YxTRy9T3BMg0hLeOa0NJpXvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sBpwW0mG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=14iwO4pD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sBpwW0mG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=14iwO4pD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sBpwW0mG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="14iwO4pD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sBpwW0mG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="14iwO4pD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9BD065FFEC;
	Thu,  9 May 2024 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715260093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaznJ7A0eJe7cZnKz2+6GvxYOVW8UckEyNMM7FdU89Q=;
	b=sBpwW0mGLtNvA/9DvjcA7aUpq0u+foiYUjxRHy0zjFsK+lVEGSkIa7YzQhdIviPc1GiQUU
	eDc8l7i7ENMy3eP8QiFw0v4JGx8uMBLsF3ofxXHjwC7GxkAW29lBcHFT+SA7fmCzZ46h4U
	GxMSl2X6A7FL4R/QqST1E3TUTC2KKa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715260093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaznJ7A0eJe7cZnKz2+6GvxYOVW8UckEyNMM7FdU89Q=;
	b=14iwO4pDtCHQB908XwsBA3xvGyYBg9qSz5+8/HBGePpAT8CXdbqqzu9dDrpzFQPYB7RGbW
	Df/pIUiznSw4QMAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sBpwW0mG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=14iwO4pD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715260093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaznJ7A0eJe7cZnKz2+6GvxYOVW8UckEyNMM7FdU89Q=;
	b=sBpwW0mGLtNvA/9DvjcA7aUpq0u+foiYUjxRHy0zjFsK+lVEGSkIa7YzQhdIviPc1GiQUU
	eDc8l7i7ENMy3eP8QiFw0v4JGx8uMBLsF3ofxXHjwC7GxkAW29lBcHFT+SA7fmCzZ46h4U
	GxMSl2X6A7FL4R/QqST1E3TUTC2KKa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715260093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaznJ7A0eJe7cZnKz2+6GvxYOVW8UckEyNMM7FdU89Q=;
	b=14iwO4pDtCHQB908XwsBA3xvGyYBg9qSz5+8/HBGePpAT8CXdbqqzu9dDrpzFQPYB7RGbW
	Df/pIUiznSw4QMAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A26013A24;
	Thu,  9 May 2024 13:08:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mZ7FFL3KPGbAawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 May 2024 13:08:13 +0000
Date: Thu, 09 May 2024 15:08:28 +0200
Message-ID: <87v83n9lpv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<hdegoede@redhat.com>,
	<rafael@kernel.org>
Subject: Re: [PATCH 1/2] ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
In-Reply-To: <87zfsz9n8d.wl-tiwai@suse.de>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
	<20240419084307.2718881-2-cezary.rojewski@intel.com>
	<892ad456-cfe5-4ff1-ab67-7709677608cd@intel.com>
	<87zfsz9n8d.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9BD065FFEC
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,intel.com:email];
	DKIM_TRACE(0.00)[suse.de:+]

On Thu, 09 May 2024 14:35:46 +0200,
Takashi Iwai wrote:
> 
> On Thu, 09 May 2024 13:15:15 +0200,
> Cezary Rojewski wrote:
> > 
> > On 2024-04-19 10:43 AM, Cezary Rojewski wrote:
> > > From: Amadeusz S³awiñski <amadeuszx.slawinski@linux.intel.com>
> > > 
> > > Now that NHLT support in ACPI framework was introduced, migrate
> > > intel-dsp-config driver to new API.
> > 
> > Hello,
> > 
> > I see that this patch has not landed in Mark's for-next. Takashi,
> > what's the verdict here? Should this go entirely (entire patchset)
> > through Mark or should the NHLT changes [1] plus this patch alone be
> > incorporated into for-next of yours separately?
> 
> OK, I took the patch now to my tree.

... and it turned out that this doesn't work easily because
include/linux/acpi/nhlt.h isn't a part of Linus tree yet.  I'd need to
pull the change via an immutable branch or such at first.

I don't know how Mark applied the ASoC patch, but if that actually
worked, it's better to take from his tree.  Or, in such a case, at
best to be merged through the tree where the new API got introduced
(i.e. ACPI tree).

In anyway, feel free to take my ack for the patch

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

> 
> 
> thanks,
> 
> Takashi
> 
> 
> > 
> > 
> > [1]:
> > https://lore.kernel.org/linux-acpi/20240319083018.3159716-1-cezary.rojewski@intel.com/
> > 
> > 
> > Kind regards,
> > Czarek
