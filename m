Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43049354AD6
	for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086344; cv=none; b=K+x2oBI4FCsB6DsMieZdVsY/isJQVmnbC8b7/i1BE9lQFi4GYiJGFL7sSPCRWWURitLbQLGzaudG0Bhv7v38UZtX2XbXS5M1N4iFhMQrD2pb/J01tItxuygCjIsyVRSAmCMO1Gf9P1LTDLo44tyuvpbOUj7uvnF69/3OTLxy5ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086344; c=relaxed/simple;
	bh=G8EIlefG565Dwt/txoyBt1CZ6ARA9TktN7aFPS1+0gI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSfRVEAAXArvIgxrVp4/BM7dbu5YBCgkMztqK4+MKgWTXBE+Dq9Rh9+kZ8R5hQDhyBlcHo27Rbb3IKliriKk7kbMCx/zmXfhAF7gOTBTsMXYkh7VxC0nsWL+W/nMwbtr7TAD+iz1BsnMLrEZFhHGGaRO2ZLG1M+HhcaFoaWRuds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pv/vBMAF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kJfnQA6Y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pv/vBMAF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kJfnQA6Y; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pv/vBMAF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kJfnQA6Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pv/vBMAF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kJfnQA6Y"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 826425BCCD;
	Thu, 22 Jan 2026 12:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769086340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUN5ZpH00HGHq26KJLiLJBjN8Ly5qNDG4M8gYVJ8y0g=;
	b=pv/vBMAF4rZUWctB1WzQRhD622g8fTb7TH93K3kSl4eK1ME5UA4YRzos/zWQ01DMYAK3cu
	XRvdco++BR2x85m9mVQwNAGp3F17F8azN/IzbcA9ZKH3p9UiQV916FSn0YWJVh8Pr1PEUb
	qxYtxB8LU8oP+IEGyo1fyhYq8OD8wxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769086340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUN5ZpH00HGHq26KJLiLJBjN8Ly5qNDG4M8gYVJ8y0g=;
	b=kJfnQA6YSTZHqKsipYDpeAhevyUQLtIDRaCUodLhJb3tAv1nQB2msfJUt9VOkRf+qudTiC
	8SsKQzVa0RIvkFDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769086340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUN5ZpH00HGHq26KJLiLJBjN8Ly5qNDG4M8gYVJ8y0g=;
	b=pv/vBMAF4rZUWctB1WzQRhD622g8fTb7TH93K3kSl4eK1ME5UA4YRzos/zWQ01DMYAK3cu
	XRvdco++BR2x85m9mVQwNAGp3F17F8azN/IzbcA9ZKH3p9UiQV916FSn0YWJVh8Pr1PEUb
	qxYtxB8LU8oP+IEGyo1fyhYq8OD8wxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769086340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUN5ZpH00HGHq26KJLiLJBjN8Ly5qNDG4M8gYVJ8y0g=;
	b=kJfnQA6YSTZHqKsipYDpeAhevyUQLtIDRaCUodLhJb3tAv1nQB2msfJUt9VOkRf+qudTiC
	8SsKQzVa0RIvkFDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40B8113533;
	Thu, 22 Jan 2026 12:52:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c4qSDoQdcmkpHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Jan 2026 12:52:20 +0000
Date: Thu, 22 Jan 2026 13:52:19 +0100
Message-ID: <87tswdhksc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: gongqi <550230171hxy@gmail.com>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gongqi <550230171@qq.com>
Subject: Re: [PATCH 4/4] ALSA: hda/conexant: Add headset mic fix for MECHREVO Wujie 15X Pro
In-Reply-To: <87wm19hliw.wl-tiwai@suse.de>
References: <20260122120652.3471910-1-550230171hxy@gmail.com>
	<87wm19hliw.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -7.30
X-Spamd-Result: default: False [-7.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,qq.com];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,perex.cz,vger.kernel.org,qq.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 22 Jan 2026 13:36:23 +0100,
Takashi Iwai wrote:
> 
> On Thu, 22 Jan 2026 13:06:52 +0100,
> gongqi wrote:
> > 
> > From: gongqi <550230171@qq.com>
> > 
> > The headset microphone on the MECHREVO Wujie 15X Pro requires the CXT_FIXUP_HEADSET_MIC quirk to function properly. Add the PCI SSID (0x1d05:0x3012) to the quirk table.
> 
> Please put line breaks appropriately in the patch description texts.
> 
> And, above all, could you give a Signed-off-by line?  It's legal
> requirement.  Please resubmit with those corrections.

Also the patch shows 4/4: I suppose this patch can be still applied to
sound git tree individually although it's a part of series...?


Takashi
