Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79131335BA
	for <linux-sound@vger.kernel.org>; Sun, 25 Jan 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769332051; cv=none; b=gyjV+LubFvF8MVlmfGs+AwW6v9IUaOJFKfMKCr8YIbVDO+Zjn7GptyYyiViyGcfYhSlsCTW8Qc+1fFuQ48Im1MC5+63K0kY7SnsGvxMRYmZubMyRkFsD1651c6bMwi3oNjMhmuN0g/cxdTLtE2vmkF0zyLyyM2FcyUyY1lnXSsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769332051; c=relaxed/simple;
	bh=4hSpFci6DO9vU44rsvc/o8K4QMTSn0KGKiScR52thcU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HI9b3B2W/5mdHoRwYEMLUoGE9nyhPASN/6ax/R6kdx/IrGLYn3Yy8XhU2JaSJtKHGpjX4gIBA71ar1WoiPCEpNnNaYccVX4pXqmJlDlpJjpAPyddN0HupS0sEXEnuMBtVwELVlTs9fh6uQusmoF37PXcY5uiM3EeUMmI52lBD4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0oy4VPW5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0sQqF54f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0oy4VPW5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0sQqF54f; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0oy4VPW5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0sQqF54f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0oy4VPW5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0sQqF54f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9AFF15BDB2;
	Sun, 25 Jan 2026 09:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769332042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJUz6hmG+tMOZfCoTA85pN11CbDBWalSJ/CjOwvImyw=;
	b=0oy4VPW5FqjJ6iAwRSFtpblty75c5RZmBlMpdm1ROoVouTCqbouzY6WvgkZ1vlevp/6oqN
	LgH/HBJPeFtCmjo3ovB5BD9+KBId3B71xkwN7E8ZraDgmnRaKlrCzAoxqYWw1xXBRnuTLY
	GNKAdOi4amxIRVz3ci7wS3er8nDcuWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769332042;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJUz6hmG+tMOZfCoTA85pN11CbDBWalSJ/CjOwvImyw=;
	b=0sQqF54f4DM3CkqMU3p0uE+4KiSO/BxJeqCO6yi+yVtYDox0sc/8mwXyCCHK8lvvtK1OVk
	XTuBcuzLy0iaAuAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769332042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJUz6hmG+tMOZfCoTA85pN11CbDBWalSJ/CjOwvImyw=;
	b=0oy4VPW5FqjJ6iAwRSFtpblty75c5RZmBlMpdm1ROoVouTCqbouzY6WvgkZ1vlevp/6oqN
	LgH/HBJPeFtCmjo3ovB5BD9+KBId3B71xkwN7E8ZraDgmnRaKlrCzAoxqYWw1xXBRnuTLY
	GNKAdOi4amxIRVz3ci7wS3er8nDcuWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769332042;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJUz6hmG+tMOZfCoTA85pN11CbDBWalSJ/CjOwvImyw=;
	b=0sQqF54f4DM3CkqMU3p0uE+4KiSO/BxJeqCO6yi+yVtYDox0sc/8mwXyCCHK8lvvtK1OVk
	XTuBcuzLy0iaAuAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 613A0139E9;
	Sun, 25 Jan 2026 09:07:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AUhTFkrddWkZZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 25 Jan 2026 09:07:22 +0000
Date: Sun, 25 Jan 2026 10:07:21 +0100
Message-ID: <877bt6cb7a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ruslan Garynin <ufurifkf@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: Scarlett 16i16 4th Gen: I/O error on kernel 6.19-rc6 (works on 6.18)
In-Reply-To: <CAF7epbs1+q9YVtW9TorTTNj-hWc4EDrrHss09q1Y5jhP4ifqZA@mail.gmail.com>
References: <CAF7epbtx7YDwa2NBDZY+9NuxCEirY90jNonY58KgWfx8pq6QyQ@mail.gmail.com>
	<aXTyJ10uiFoKJ5Tr@m.b4.vu>
	<87a4y2cc90.wl-tiwai@suse.de>
	<CAF7epbs1+q9YVtW9TorTTNj-hWc4EDrrHss09q1Y5jhP4ifqZA@mail.gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 25 Jan 2026 09:59:00 +0100,
Ruslan Garynin wrote:
> 
> 
> Hi Takashi,
> 
> I checked my pacman logs and found that:
> 
> - Working version: 6.19-rc3
> - Broken version: 6.19-rc6
> 
> The upgrade from rc3 to rc6 happened on 2026-01-23.
> 
> I will try to rebuild and test rc4 and rc5 to narrow down
> exactly which version introduced the regression.
> 
> Will report back with the results.

If it worked, it might be the recent fix that landed in rc6, and this
was corrected in Linus tree for the upcoming rc7 via commit
70b4db7d258118a7464f039112a74ddb49a95b06
    ALSA: usb-audio: Use the right limit for PCM OOB check

So please check the Linus tree or cherry-pick the commit above.


thanks,

Takashi

> 
> Regards,
> Ruslan Garynin
> 
> On Sun, Jan 25, 2026 at 1:44 PM Takashi Iwai <tiwai@suse.de> wrote:
> 
>     On Sat, 24 Jan 2026 17:24:07 +0100,
>     Geoffrey D. Bennett wrote:
>     >
>     > Hi Ruslan,
>     >
>     > Audio playback for Focusrite USB interfaces is handled by the generic
>     > USB audio driver (snd-usb-audio); the FCP driver I maintain only
>     > handles the control protocol (mixer, routing, etc.) over a separate
>     > USB endpoint — it's not involved in the actual audio data transfer.
>     >
>     > I've CC'd the ALSA maintainers and linux-sound list to continue the
>     > discussion there.
>     >
>     > Regards,
>     > Geoffrey.
>     >
>     > On Sat, Jan 24, 2026 at 08:56:38PM +0500, Ruslan Garynin wrote:
>     > >    Hi Geoffrey,
>     > >
>     > >    I found a regression affecting Scarlett 16i16 4th Gen playback on
>     kernel
>     > >    6.19-rc6.
>     > >
>     > >    Summary:
>     > >    - Working: 6.18.6-zen1-1-zen
>     > >    - Broken: 6.19.0-rc6-1-mainline
>     > >    - Issue: I/O error on USB audio playback
>     > >    - HDA/HDMI audio works fine on 6.19-rc6, so it's USB audio specific
>     > >
>     > >    Test:
>     > >      systemctl --user stop pipewire pipewire-pulse wireplumber
>     > >      speaker-test -D hw:3 -c 18 -t sine -F S32_LE
>     > >
>     > >    On 6.18 (works):
>     > >      0 - Front Left
>     > >      1 - Front Right
>     > >      ...
>     > >      15 - Channel 16
>     > >      (sound plays)
>     > >
>     > >    On 6.19-rc6 (fails):
>     > >      0 - Front Left
>     > >      Write error: -5,Input/output error
>     > >
>     > >    Device info:
>     > >      USB ID: 1235:821b
>     > >      FCP driver loads OK: "Focusrite Control Protocol Driver ready"
>     > >      Implicit Feedback Mode: Yes
>     > >      No errors in dmesg
>     > >
>     > >    /proc/asound/card3/stream0:
>     > >      Format: S32_LE
>     > >      Channels: 18
>     > >      Endpoint: 0x01 (1 OUT) (ASYNC)
>     > >      Rates: 44100, 48000
>     > >      Sync Endpoint: 0x81 (1 IN)
>     > >      Implicit Feedback Mode: Yes
>     > >
>     > >    Note: This might get fixed on its own when mainline is updated
>     further
>     > >    before
>     > >    the stable 6.19 release. I'm just reporting this in case it
>     doesn't, so
>     > >    you're
>     > >    aware of a potential issue that could affect users when 6.19
>     changes
>     > >    eventually
>     > >    land in stable kernels.
>     > >
>     > >    Let me know if you need any additional info or testing.
>     > >
>     > >    Thanks for maintaining the Scarlett driver!
>     > >
>     > >    Best regards,
>     > >    Ruslan Garynin
>    
>     Could you check whether the earlier 6.19-rc shows the same problem?
>     Also check the very latest Linus tree, too.
> 
>     Takashi
> 
