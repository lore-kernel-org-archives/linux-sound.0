Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB01B1C862F
	for <linux-sound@vger.kernel.org>; Sun, 25 Jan 2026 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769330687; cv=none; b=rcXnH5YVE8tCfV05blZx6/smwyGPAHxHSgNYWYRQvLnN261B3AzHqXvKJRaxrUAX75dGI2rcYXXS9M8aVTqNa1bDnEyN7h/Yz8AEqZUKJdgvq1XtYNrnxm+UPfcvkTsh01LbLViK2dZqw5imbmCt8M0L3gsPnjufv+NfdjSktdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769330687; c=relaxed/simple;
	bh=Pw/crPJGyI9WIcogSEzWlQJUyieZtYdehZ9BQdpXwa4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GcxSb/JdyBoy7U9RgCg5+0o+JeYruh/iD0GdLy4zw4Zoyao4VCig5UTyVVjWH7LpgefYJIsVFk3r9AmeTenTOsme/gy6dR6qxjsO8t5alXIlGWPhvRZFGHgHbnI74twdt9sJivl5X0b3qPPCAysN4I2YOxjmCZohmvOFdAQany8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lFMCXCy4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8kPY+7rL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lFMCXCy4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8kPY+7rL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lFMCXCy4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8kPY+7rL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lFMCXCy4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8kPY+7rL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D770D336BD;
	Sun, 25 Jan 2026 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769330683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeVVAWf3qaqbPTTsb92y1Yfeunl2oWDaB/rm1EFOJ8k=;
	b=lFMCXCy41K3HweoPIo23wvpdQvsuEIbguRMmldebm1kOiHorcNkj2nlENjG4g/JLiWjkb4
	bEvzR7+HJT0pu6mzyhyd6F0k2evSGTmTzUPMVZyuhtf7+DClmnM+K5xBiDorHTU/CLjTB7
	RSpdRNyKtrAB+FZpcwlimlXVZ5r8gA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769330683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeVVAWf3qaqbPTTsb92y1Yfeunl2oWDaB/rm1EFOJ8k=;
	b=8kPY+7rLojk/XhhaLkophdl+tEnEU1djeIJ3gB6mO6tq6RZfEhcI43GF/babY4k5iJtEs5
	2z6LjsyKRRCbX6CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769330683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeVVAWf3qaqbPTTsb92y1Yfeunl2oWDaB/rm1EFOJ8k=;
	b=lFMCXCy41K3HweoPIo23wvpdQvsuEIbguRMmldebm1kOiHorcNkj2nlENjG4g/JLiWjkb4
	bEvzR7+HJT0pu6mzyhyd6F0k2evSGTmTzUPMVZyuhtf7+DClmnM+K5xBiDorHTU/CLjTB7
	RSpdRNyKtrAB+FZpcwlimlXVZ5r8gA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769330683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeVVAWf3qaqbPTTsb92y1Yfeunl2oWDaB/rm1EFOJ8k=;
	b=8kPY+7rLojk/XhhaLkophdl+tEnEU1djeIJ3gB6mO6tq6RZfEhcI43GF/babY4k5iJtEs5
	2z6LjsyKRRCbX6CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DC76139E9;
	Sun, 25 Jan 2026 08:44:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jCiuJPvXdWn7UAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 25 Jan 2026 08:44:43 +0000
Date: Sun, 25 Jan 2026 09:44:43 +0100
Message-ID: <87a4y2cc90.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ruslan Garynin <ufurifkf@gmail.com>
Cc: "Geoffrey D. Bennett" <g@b4.vu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: Scarlett 16i16 4th Gen: I/O error on kernel 6.19-rc6 (works on 6.18)
In-Reply-To: <aXTyJ10uiFoKJ5Tr@m.b4.vu>
References: <CAF7epbtx7YDwa2NBDZY+9NuxCEirY90jNonY58KgWfx8pq6QyQ@mail.gmail.com>
	<aXTyJ10uiFoKJ5Tr@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 24 Jan 2026 17:24:07 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi Ruslan,
> 
> Audio playback for Focusrite USB interfaces is handled by the generic
> USB audio driver (snd-usb-audio); the FCP driver I maintain only
> handles the control protocol (mixer, routing, etc.) over a separate
> USB endpoint — it's not involved in the actual audio data transfer.
> 
> I've CC'd the ALSA maintainers and linux-sound list to continue the
> discussion there.
> 
> Regards,
> Geoffrey.
> 
> On Sat, Jan 24, 2026 at 08:56:38PM +0500, Ruslan Garynin wrote:
> >    Hi Geoffrey,
> > 
> >    I found a regression affecting Scarlett 16i16 4th Gen playback on kernel
> >    6.19-rc6.
> > 
> >    Summary:
> >    - Working: 6.18.6-zen1-1-zen
> >    - Broken: 6.19.0-rc6-1-mainline
> >    - Issue: I/O error on USB audio playback
> >    - HDA/HDMI audio works fine on 6.19-rc6, so it's USB audio specific
> > 
> >    Test:
> >      systemctl --user stop pipewire pipewire-pulse wireplumber
> >      speaker-test -D hw:3 -c 18 -t sine -F S32_LE
> > 
> >    On 6.18 (works):
> >      0 - Front Left
> >      1 - Front Right
> >      ...
> >      15 - Channel 16
> >      (sound plays)
> > 
> >    On 6.19-rc6 (fails):
> >      0 - Front Left
> >      Write error: -5,Input/output error
> > 
> >    Device info:
> >      USB ID: 1235:821b
> >      FCP driver loads OK: "Focusrite Control Protocol Driver ready"
> >      Implicit Feedback Mode: Yes
> >      No errors in dmesg
> > 
> >    /proc/asound/card3/stream0:
> >      Format: S32_LE
> >      Channels: 18
> >      Endpoint: 0x01 (1 OUT) (ASYNC)
> >      Rates: 44100, 48000
> >      Sync Endpoint: 0x81 (1 IN)
> >      Implicit Feedback Mode: Yes
> > 
> >    Note: This might get fixed on its own when mainline is updated further
> >    before
> >    the stable 6.19 release. I'm just reporting this in case it doesn't, so
> >    you're
> >    aware of a potential issue that could affect users when 6.19 changes
> >    eventually
> >    land in stable kernels.
> > 
> >    Let me know if you need any additional info or testing.
> > 
> >    Thanks for maintaining the Scarlett driver!
> > 
> >    Best regards,
> >    Ruslan Garynin

Could you check whether the earlier 6.19-rc shows the same problem?
Also check the very latest Linus tree, too.


Takashi
