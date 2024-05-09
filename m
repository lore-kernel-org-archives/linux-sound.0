Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4601413C801
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 08:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715242424; cv=none; b=XC7h7JFStHhYWY4/uaBI+FDNKB5zbFNjN4DjclSYMPJNl6iDCsPz6oczzvJCXcN+cyhJrRCzMIDRkPr6hqyYQ1wF9nmRIMImC3CqiDfX1cXjVtB3fPJxcoVKsSlObwAN3lfD35DYD5HaryAUonjG1t9+ok0jskyLlPBRL0tmMbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715242424; c=relaxed/simple;
	bh=p2JtkzkJ5MvolA/4Euo4u0E0tJXZdM3nc8Hfgx+cBRY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8caqDUGLDHVBvWjRnS9DhotjUVNBIrPHGk+TwJB3RFX/2CSSI1Srawb4A8tjT+AlTRPF/lk9mqlMFhfZxJ/UeQosRZhE6T0g0LUTvq/DGjpI5cslng0n99C+Oqq93liDbwuRDG9JzIdptAThsmjw97ZAkvZgMKxzIdLgAQSL+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c2Wl/P/j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mp591u7l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c2Wl/P/j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mp591u7l; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c2Wl/P/j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mp591u7l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c2Wl/P/j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mp591u7l"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0B28A38076;
	Thu,  9 May 2024 08:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715242421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AvUJAhV3+/7urRC4vC/5j2iLdS3fxBrLyBirRIWZ0ng=;
	b=c2Wl/P/jjPx8gp5Uiq2glOOvajHvT1m1AAAJlLigcAEoAqVyqC/87TeGSkTR3uA8pZPj+i
	kHWsycUdyGNNmz3/Qz/gGSCMn1w/yQ4171S7i7aJdI9ZBKuvGtdDrj2pPdGWVUczUaeF4g
	bwm9KcRA9dJSc/LwVymqxfHoAckbOio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715242421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AvUJAhV3+/7urRC4vC/5j2iLdS3fxBrLyBirRIWZ0ng=;
	b=Mp591u7lKHtr/CpkzvfhsE8r35xJCd+xygsY+oKMaPKjPLWvN7pKTuZrYnwgTFBC4DfH4Y
	qBSi3ikFtJQ1jkCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="c2Wl/P/j";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Mp591u7l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715242421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AvUJAhV3+/7urRC4vC/5j2iLdS3fxBrLyBirRIWZ0ng=;
	b=c2Wl/P/jjPx8gp5Uiq2glOOvajHvT1m1AAAJlLigcAEoAqVyqC/87TeGSkTR3uA8pZPj+i
	kHWsycUdyGNNmz3/Qz/gGSCMn1w/yQ4171S7i7aJdI9ZBKuvGtdDrj2pPdGWVUczUaeF4g
	bwm9KcRA9dJSc/LwVymqxfHoAckbOio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715242421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AvUJAhV3+/7urRC4vC/5j2iLdS3fxBrLyBirRIWZ0ng=;
	b=Mp591u7lKHtr/CpkzvfhsE8r35xJCd+xygsY+oKMaPKjPLWvN7pKTuZrYnwgTFBC4DfH4Y
	qBSi3ikFtJQ1jkCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFB8613941;
	Thu,  9 May 2024 08:13:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id W15eNbSFPGYZGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 May 2024 08:13:40 +0000
Date: Thu, 09 May 2024 10:13:56 +0200
Message-ID: <878r0jbdx7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/7] ALSA: Add missing module description
In-Reply-To: <ZjtJ1WOOmkSpEiLi@smile.fi.intel.com>
References: <20240508091128.25274-1-tiwai@suse.de>
	<ZjtHiq52po1kfZp2@smile.fi.intel.com>
	<ZjtJ1WOOmkSpEiLi@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0B28A38076
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]

On Wed, 08 May 2024 11:45:57 +0200,
Andy Shevchenko wrote:
> 
> On Wed, May 08, 2024 at 12:36:10PM +0300, Andy Shevchenko wrote:
> > On Wed, May 08, 2024 at 11:11:19AM +0200, Takashi Iwai wrote:
> > > Hi,
> > > 
> > > here is a trivial patch series for adding the missing
> > > MODULE_DESCRIPTION() to the code that can be built as modules
> > > where make W=1 starts complaining the lack of MODULE_DESCRIPTION()
> > > since recently.
> > > 
> > > Fixes for ASoC follow later.
> > 
> > Probably Reported-by: fits better, but I'm fine with either.
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> In case you decide to switch to Reported-by, replace also Link by Closes tag.

OK, I updated in that way and applied now.


thanks,

Takashi
