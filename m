Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B431F419A
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741162617; cv=none; b=Hv5FXxVcELWWSZlkQTtSa1pbHRauacs5IM7PHUXJ82ygmAsJK+bIHHx3zLv2mwt0nV2Wp6zcX8vo8uMcBhnRRCB53bn/J1zxkDG9+1Ha06bpwNGV8chbrH2lGelw/QTeE4iJAtN0n/maUixDymZXO5XHbEa/p7fHud0jdD7/Zb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741162617; c=relaxed/simple;
	bh=vX3vJuDrmqon7c/JqA+YRrayRjfzyMwRAR7y1iFWpG8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GjLXtOAGck9m2rm8DVeD6vIGY8rWvCdcWYmFQFlDB1UFauoXuIT5B2Ki2ZfP+ThTMPyNRMOIn55qO515q88/AOu2colREyanJWH7l+ROnk5RywspC/AUix2te/O3k8fkGOc9R7fcj1ocjP5gBwEJ+NazjlzFpafU55suDW383Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M4/73W/w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=taojFvO1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M4/73W/w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=taojFvO1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M4/73W/w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="taojFvO1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M4/73W/w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="taojFvO1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A73C42118D;
	Wed,  5 Mar 2025 08:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741162607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7wVAqcV88T1LetAygmi/3zVE/1PVMXpx1yLSG2Adqs=;
	b=M4/73W/waaNluRVAmq+4AdDmlyJ5B0t0GJU2h5wWz+I6HV81FoHiiWLySEflfqMpIlL0Tz
	MpRTBLkjalHOYH6ceEGmNxHMHogMWJI6qsVzOI62qNwYsaJuHIWrDdkJ3We3ls4ouzKAXL
	pBu/wHWBrQtT2sQnsapXdswaixHHgsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741162607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7wVAqcV88T1LetAygmi/3zVE/1PVMXpx1yLSG2Adqs=;
	b=taojFvO1DCxGkaizPfOmSwoz1Ao6fNTyCRGORpBW09OslIZAY9rL7Np3M5JRcav4ijS90q
	qgJATSqCq7AaGQCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741162607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7wVAqcV88T1LetAygmi/3zVE/1PVMXpx1yLSG2Adqs=;
	b=M4/73W/waaNluRVAmq+4AdDmlyJ5B0t0GJU2h5wWz+I6HV81FoHiiWLySEflfqMpIlL0Tz
	MpRTBLkjalHOYH6ceEGmNxHMHogMWJI6qsVzOI62qNwYsaJuHIWrDdkJ3We3ls4ouzKAXL
	pBu/wHWBrQtT2sQnsapXdswaixHHgsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741162607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7wVAqcV88T1LetAygmi/3zVE/1PVMXpx1yLSG2Adqs=;
	b=taojFvO1DCxGkaizPfOmSwoz1Ao6fNTyCRGORpBW09OslIZAY9rL7Np3M5JRcav4ijS90q
	qgJATSqCq7AaGQCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7966D1366F;
	Wed,  5 Mar 2025 08:16:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dbr9G28IyGf0VQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Mar 2025 08:16:47 +0000
Date: Wed, 05 Mar 2025 09:16:47 +0100
Message-ID: <87wmd3uc28.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: update ALC222 depop optimize
In-Reply-To: <f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
	<87zfhzud4s.wl-tiwai@suse.de>
	<f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 05 Mar 2025 08:56:41 +0100,
Kailang wrote:
> 
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Wednesday, March 5, 2025 3:54 PM
> > To: Kailang <kailang@realtek.com>
> > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> > linux-sound@vger.kernel.org
> > Subject: Re: update ALC222 depop optimize
> > 
> > 
> > External mail : This email originated from outside the organization. Do not
> > reply, click links, or open attachments unless you recognize the sender and
> > know the content is safe.
> > 
> > 
> > 
> > On Wed, 05 Mar 2025 07:32:00 +0100,
> > Kailang wrote:
> > >
> > > Hi Takashi,
> > >
> > > Update ALC222 depop optimize as attach.
> > 
> > Could you give a bit more background info why this change is needed?
> > Is it a mandatory change to fix something, or it improves something?
> > 
> This codec has two headphone design.
> The HP2 was nid 0x14.

Sorry not clear enough: do you mean the patch is to fix the depop
problems on the models with two headphone pins with ALC222?


thanks,

Takashi
