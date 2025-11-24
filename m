Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DDE27472
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763973231; cv=none; b=AXI019VS8Z7Wr+szmXb95Qg9e0uZXSAUCklx1c9IZOAy3Rg7M2E2NTBL9uER6rC2WTfe19UA+VmCfjm/4cmmhpE3vL8p226ZGRh5bictgbepMjG83XVgzUeOcmuaEzLAFrNduhE58FSZj91wuX0DFUN5uRoMiDCYYANGOE9MdSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763973231; c=relaxed/simple;
	bh=8m+qH85NlnJoO5ZaeXli3cgD2vt3CwxZ3lvvE6b0txw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZdJ4Dzn3+pUfDKAc411MHER+abvVybPZeEqO4xyScixZOrGr/eooVd05jnnCiCzQcFXtJiMBZ1LfUAxawe4XDVO6ClqTj3z+Rt3KBIEdT0gV7GRk1/VS0xmTRpPGjAz5611M/Tjj88Pw5TsdrbsvFUPeeTWYbv5kQByfkL8LBVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=05qjr+1z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YprF1vdS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=05qjr+1z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YprF1vdS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="05qjr+1z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YprF1vdS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="05qjr+1z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YprF1vdS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 75A1222063;
	Mon, 24 Nov 2025 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763973227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3rcgU0O+ObiykvK2lZUdfsd51GnaBfMqFNpu3h0L7M=;
	b=05qjr+1zwvW8Go6gj/ZpKhrhH380NjjxUGu63tMw9TNZA7mvsu15hXZPOfD0FA7LhZpJd9
	CIm73HWmvMk5DrqzOicuPFBWRsv9MYK2TuzNqJQEA0N41i1f1GVykFjXP6TJ0R+vzAnzMI
	jgDnPMeJHJJeM72rhkclrMIPuYx+V6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763973227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3rcgU0O+ObiykvK2lZUdfsd51GnaBfMqFNpu3h0L7M=;
	b=YprF1vdSnshYwNw2tgMT8BHssrE/sW072Iv8lGUVGamEo6i03LPJvtQRjLFCVSvb+MYgVK
	IdHymqTXk1cSwkCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763973227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3rcgU0O+ObiykvK2lZUdfsd51GnaBfMqFNpu3h0L7M=;
	b=05qjr+1zwvW8Go6gj/ZpKhrhH380NjjxUGu63tMw9TNZA7mvsu15hXZPOfD0FA7LhZpJd9
	CIm73HWmvMk5DrqzOicuPFBWRsv9MYK2TuzNqJQEA0N41i1f1GVykFjXP6TJ0R+vzAnzMI
	jgDnPMeJHJJeM72rhkclrMIPuYx+V6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763973227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3rcgU0O+ObiykvK2lZUdfsd51GnaBfMqFNpu3h0L7M=;
	b=YprF1vdSnshYwNw2tgMT8BHssrE/sW072Iv8lGUVGamEo6i03LPJvtQRjLFCVSvb+MYgVK
	IdHymqTXk1cSwkCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D8723EA61;
	Mon, 24 Nov 2025 08:33:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6TxgDWsYJGmwNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Nov 2025 08:33:47 +0000
Date: Mon, 24 Nov 2025 09:33:46 +0100
Message-ID: <87fra3hlsl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	broonie@kernel.org,
	alsa-devel@alsa-project.org,
	shenghao-ding@ti.com,
	13916275206@139.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Ignore irq for I2C device
In-Reply-To: <aSQLEZCLM0t3BbHl@smile.fi.intel.com>
References: <20251122095903.2239-1-baojun.xu@ti.com>
	<aSQLEZCLM0t3BbHl@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,alsa-project.org,ti.com,139.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 24 Nov 2025 08:36:49 +0100,
Andy Shevchenko wrote:
> 
> On Sat, Nov 22, 2025 at 05:59:03PM +0800, Baojun Xu wrote:
> > In some projects (HP Lampass), no GPIO was assigned for irq,
> > it would be better to ignore it.
> 
> I don't think this is correct approach, but Hans probably knows better
> the code.
> 
> Also when touching this kind of drivers, please provide ACPI DSDT excerpt
> to show the Device object description in question.

Yes, and the patch was submitted rather to the wrong target.
It's no sound driver but x86 platform driver.
Please resubmit to the right target.


thanks,

Takashi
