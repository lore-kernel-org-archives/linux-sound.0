Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C18B6EB56
	for <linux-sound@vger.kernel.org>; Thu, 25 Apr 2024 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714034733; cv=none; b=ALuYEFFdWxaQZV5Xm42cBlQqNe3TyLFq4F/gXPK0C3VmzU9GSl0W4Nik89pYp8KGWHC/4aaurgJ/fK5thClnOTzUtjMQ8UAPE4dq2lp/iH9YSujd6nh+xppJ9/kt+J2C6SzX2u8/sNPefZGGOV3MFbsmVWnU7UiOKZ72ehRNItQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714034733; c=relaxed/simple;
	bh=4ZwS23tJmBQ7rn5u9jMGRugfkV8QmnG5WYrW71x+JmU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SWGOYcUjMEYxGDWnZRrSuBH98upmw9HOMNz1Qu57w6Xun8vkTPQmAgD9HeKpmKyXBZ/USK8dynCv0ZCDEZABcb9G/HiQLghdhVEu0s6H2txFwgNzzvWdU/LkF+5RyFCTwzlcfYIqeS+QB6jIxNIs/87qw9/2bZI6r6BY+xGQJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NgQTp7Sv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iq3h0us4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NgQTp7Sv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iq3h0us4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NgQTp7Sv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iq3h0us4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NgQTp7Sv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iq3h0us4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B9AC121A3E;
	Thu, 25 Apr 2024 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714034729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dNDJ4DzALde89Y14WJrBYkitz3hfwwSaY+lFmcZW88w=;
	b=NgQTp7SvCnpMAUopn8g0eiemr/FLaHi8KziKh3QbLZMl7WficSwoQZTLZkvshxyelMr96/
	L2fiYuDJYdNlxXIWv6TlyN+YlMRPw2ewa5IBDzFcB9S33H7vkxLCNgHdNBRkNN//I97kqn
	ALJH9WYLCIPj1Ps1tuOVX27ru9FUJb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714034729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dNDJ4DzALde89Y14WJrBYkitz3hfwwSaY+lFmcZW88w=;
	b=iq3h0us4TJqrYSxk6yo5Wl3Sv9nradCa/JqirV2fjznHwhm8GpKl/N9+9lPFzWgZaMijl4
	ygvRKXeqAmndHZBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NgQTp7Sv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iq3h0us4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714034729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dNDJ4DzALde89Y14WJrBYkitz3hfwwSaY+lFmcZW88w=;
	b=NgQTp7SvCnpMAUopn8g0eiemr/FLaHi8KziKh3QbLZMl7WficSwoQZTLZkvshxyelMr96/
	L2fiYuDJYdNlxXIWv6TlyN+YlMRPw2ewa5IBDzFcB9S33H7vkxLCNgHdNBRkNN//I97kqn
	ALJH9WYLCIPj1Ps1tuOVX27ru9FUJb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714034729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dNDJ4DzALde89Y14WJrBYkitz3hfwwSaY+lFmcZW88w=;
	b=iq3h0us4TJqrYSxk6yo5Wl3Sv9nradCa/JqirV2fjznHwhm8GpKl/N9+9lPFzWgZaMijl4
	ygvRKXeqAmndHZBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 865D513991;
	Thu, 25 Apr 2024 08:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q8MkICkYKmYGIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Apr 2024 08:45:29 +0000
Date: Thu, 25 Apr 2024 10:45:36 +0200
Message-ID: <87a5lhbzkf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aaron Ma <aaron.ma@canonical.com>
Cc: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/ASOC tas2781: align the path of firmware
In-Reply-To: <11d5d3db-d5ba-4a02-9c58-400075f2918e@canonical.com>
References: <20240425072000.22284-1-aaron.ma@canonical.com>
	<87h6fpc21p.wl-tiwai@suse.de>
	<3ba54d1d-7b09-4257-9f05-9a1182bf03dc@canonical.com>
	<87edatc001.wl-tiwai@suse.de>
	<11d5d3db-d5ba-4a02-9c58-400075f2918e@canonical.com>
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
X-Rspamd-Queue-Id: B9AC121A3E
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
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]

On Thu, 25 Apr 2024 10:40:50 +0200,
Aaron Ma wrote:
> 
> 
> On 4/25/24 16:36, Takashi Iwai wrote:
> > On Thu, 25 Apr 2024 09:54:17 +0200,
> > Aaron Ma wrote:
> >> 
> >> 
> >> On 4/25/24 15:52, Takashi Iwai wrote:
> >> 
> >>      On Thu, 25 Apr 2024 09:20:00 +0200,
> >>      Aaron Ma wrote:
> >>               TI upstream the files in ti/tas2781 for
> >> linux-firmware.
> >>          Make the driver find the correct files.
> >>               Note that the upstream linux-firmware provides
> >> symlinks to
> >>      ti/tas2781/* files, so it's not "incorrect", so far :)
> >> 
> >> $ find . -iname TIAS2781RCA2.bin
> >> ./ti/tas2781/TIAS2781RCA2.bin
> >> 
> >> Only one bin file found.
> >> Could you point it out clearly?
> > 
> > See WHENCE file.  It has "Link:" entries, and copy-firmware.sh creates
> > corresponding symlinks.
> 
> Oh, missed it.
> Retrieve the patch.

OK.  I guess ti/*/* is a better place for newer firmware files
(and likely intended by TI), but it's up to TI whether we should
update or not for newer chips.  Let's see.


thanks,

Takashi
