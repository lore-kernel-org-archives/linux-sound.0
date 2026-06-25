Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210E93DDDD1
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 11:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388456; cv=none; b=GfseoEA8zuaHb7jnErlxajo7eQj0F36nr00Ifr+m+xBwx9BKhYomXoRJjZeM5fEgWRbulmblbIjsCQj6x3hBiDwkTf12MgL9B645+1EiUhmhrWHEJ2WHtabs3jam+lkazgw66ZFLY0HrIh0z8ygMRG2nWAf7cBvoXDIHatgy1iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388456; c=relaxed/simple;
	bh=t7B52A54OmUCRxj7vy0PgUme+a6Lh644biVW1Kk/dYA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pi39FdNHeUXrGXhqb+rE2DqSU4O2VLUaPRzgYe7IJ/mlaBfJIZly4fI03RgafF9jEru0aLhPlHw5NafulLzfF4Sb9srDfte8xIN6V6kLIbVjAl0nCuX46EwVsAZiCQB9NurKbRzTw3taf96BYd4CkhuypVD1+oF16gThiROg2cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UUOwRjrt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hI0L9869; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p+u5FFXN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gyFNBj4k; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UUOwRjrt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hI0L9869";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p+u5FFXN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gyFNBj4k"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 05ABC71AF6;
	Thu, 25 Jun 2026 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782388452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NkV2st0sLMsTbHFwiwvk5kn+uVSdhk0NXZ1YYtwowg0=;
	b=UUOwRjrts5PRtceB12sryD4m8p0T9BrQj86d7IZUIoCkCA1syE9UhCnZ2sRHSTMOPMm4O+
	/h6GI0sAroCIOga7+G2GFAUv3ezIvIOrWjgc6STeAZTFBWBYQLeRfM2UU7AHAGVV16wf7r
	6TPdx60cadVY0AaGeTTPCqITFaCprxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782388452;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NkV2st0sLMsTbHFwiwvk5kn+uVSdhk0NXZ1YYtwowg0=;
	b=hI0L9869tNNt023jcNeITumXQqyQMyQAd5gYVPbGDMbSAhxqYL5KpeCLUJc7AE1ACwN0iq
	lKxElrZvqyic5dCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782388451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NkV2st0sLMsTbHFwiwvk5kn+uVSdhk0NXZ1YYtwowg0=;
	b=p+u5FFXNArgjZPjbWsB+PZEhynETMhdYhq5WSs1UZTe0qGlPOBM2l6lyy8yO60u3bCagRd
	/vmEt/5+YTj4RzPeGfWGgB1a6GKR+rUgdKm5vzig+GdTnXnBMYUTNaVDZQIY2ZXIO/BRld
	vq6c1yogsFbDkOz3D2hagfSK5rvJ2yM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782388451;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NkV2st0sLMsTbHFwiwvk5kn+uVSdhk0NXZ1YYtwowg0=;
	b=gyFNBj4kiD+suuuIcDWh11bee9ayeArh/VmehwK3fCu0lTLMwZErqvr5AEOFkmXYl4IvJQ
	O2acHE332f5uQuDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC599779A8;
	Thu, 25 Jun 2026 11:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +xHRMOIWPWomfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Jun 2026 11:54:10 +0000
Date: Thu, 25 Jun 2026 13:54:02 +0200
Message-ID: <87a4sivns5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kamlesh Chhetty <kamleshkc2002@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda: Add Lenovo Legion 7i 16IAX7 17AA3874 quirk
In-Reply-To: <20260622172247.19301-1-kamleshkc2002@gmail.com>
References: <20260622172247.19301-1-kamleshkc2002@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,launchpad.net:url,suse.de:mid]
X-Spam-Level: 

On Mon, 22 Jun 2026 19:22:47 +0200,
Kamlesh Chhetty wrote:
> 
> Lenovo Legion 7i 16IAX7 systems with Realtek ALC287 codec SSID
> 17aa:3874 and CSC3551/CS35L41 speaker amps do not provide the
> required CS35L41 _DSD properties in ACPI.
> 
> Without a quirk, cs35l41-hda fails probing the amps with missing
> cirrus,dev-index / Platform not supported errors, leaving the built-in
> speakers silent.
> 
> This model is similar to the already-supported 17AA386F Legion 7i
> 16IAX7 variant. Add the Realtek ALC287 quirk to select
> ALC287_FIXUP_CS35L41_I2C_2 and add 17AA3874 to the CS35L41 property
> table using the same two-amp external-boost configuration.
> 
> Tested on a Lenovo Legion 7 16IAX7 with Ubuntu 7.0.0-22-generic. Both
> CSC3551 CS35L41 amps probe and bind, firmware loads, calibration
> applies, built-in speaker playback works, and the cirrus,dev-index
> failure is gone.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221663
> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2157060
> Signed-off-by: Kamlesh Chhetty <kamleshkc2002@gmail.com>

Applied now.  Thanks.


Takashi
