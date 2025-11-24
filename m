Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183AA2D59F7
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 15:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763999700; cv=none; b=bUJb7Yb8lgnJTl1c1kLRciG7Fsfsr+SZBz2M6jCdiCxks3Gzrh2KSy2nU7bbniQSLl/exfEueY7SidG8mN0TVjsGH11Q6ojrn6G/ycGEASpmTvFAcPx8FCfRJOSArs9C3h1Wpbtk8sTU2r5m3kgG0bR3dH59CfvrHq8zgMUNiU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763999700; c=relaxed/simple;
	bh=hiAY7oTzVh0IVeTHMAeeL3s5WxTO664UgKJH868jqD4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BsCvYMWI4UzRNsf2g0lQnR4gxBCiBBHG/WOuWqmScd3UCAONcslACjE5OcbL2biFm9OboIZb2BxiNiO0pIfu0UlO0inItaqRZo0jbhVXkVPbqaZbC+gSznolFozCkgtWqow49CVQZ68jQReWDf4GnjdC4VOpNDxshlZ/r+jXS4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VekABiBi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BPOoOiZi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VekABiBi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BPOoOiZi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VekABiBi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BPOoOiZi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VekABiBi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BPOoOiZi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5259421B15;
	Mon, 24 Nov 2025 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763999696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HsZkBEW2TM6AeN+OAZLLuatnFixOQCp4bvoph11L2gA=;
	b=VekABiBiU+MzD+mAMlclqFEWkYGW3CJ6+oZdKwNFC79+MZE903lMuC7mZPFcb0qrFA2kn4
	KiCXYdBB8ICW2TNygzRmekaL3cQU9fcJVFhJVUS0pIAH/3b1/a1KfO7YXWox10zBO1rgYf
	XDoE9CvMAyeHtucQk1mmsViiLsTbz/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763999696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HsZkBEW2TM6AeN+OAZLLuatnFixOQCp4bvoph11L2gA=;
	b=BPOoOiZiUTY2jKHTHe/eek3lkXBhReX6OBvxKHMa2Uxsjqw41xN3EPoVOJXvkathn4ufCk
	PP1dNYfV5MWXPTAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VekABiBi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BPOoOiZi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763999696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HsZkBEW2TM6AeN+OAZLLuatnFixOQCp4bvoph11L2gA=;
	b=VekABiBiU+MzD+mAMlclqFEWkYGW3CJ6+oZdKwNFC79+MZE903lMuC7mZPFcb0qrFA2kn4
	KiCXYdBB8ICW2TNygzRmekaL3cQU9fcJVFhJVUS0pIAH/3b1/a1KfO7YXWox10zBO1rgYf
	XDoE9CvMAyeHtucQk1mmsViiLsTbz/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763999696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HsZkBEW2TM6AeN+OAZLLuatnFixOQCp4bvoph11L2gA=;
	b=BPOoOiZiUTY2jKHTHe/eek3lkXBhReX6OBvxKHMa2Uxsjqw41xN3EPoVOJXvkathn4ufCk
	PP1dNYfV5MWXPTAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1ED903EA63;
	Mon, 24 Nov 2025 15:54:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DLhZBtB/JGlpZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Nov 2025 15:54:56 +0000
Date: Mon, 24 Nov 2025 16:54:55 +0100
Message-ID: <87zf8bpgs0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] ALSA: ctxfi: Add support for Onkyo SE-300PCIE
In-Reply-To: <74ffacd4-437d-4df9-b068-a5ec2d051a5b@harin.net>
References: <20251121152221.1152523-1-me@harin.net>
	<4df3c2ac-88cd-42d1-9f1e-c5c2c5a2b00f@harin.net>
	<87o6oul8kf.wl-tiwai@suse.de>
	<cecd1398-b072-4830-9495-c4bf8d7a3570@harin.net>
	<87cy57hlk1.wl-tiwai@suse.de>
	<74ffacd4-437d-4df9-b068-a5ec2d051a5b@harin.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 5259421B15
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 24 Nov 2025 11:22:32 +0100,
Harin Lee wrote:
> 
> Thank you for the review.
> 
> The SE-300PCIE features separate hardware routing and DACs for the
> Hi-Fi RCA output and the 7.1ch Front output, unlike other X-Fi cards
> where the Front port serves both purposes.
> 
> While ALSA resources typically map 1:1 to hardware, exposing a separate
> mixer for the RCA port would likely confuse users and applications
> regarding which device to use as the primary output. Therefore, the
> "Dedicated Output Playback Enum" control is designed to let the user
> select which physical output port (RCA or Front) is used for the
> primary output.
> 
> If you could suggest a standardized ALSA Enum name for this control, or
> any better method to handle this, please let me know.

So it chooses the exclusive output for the main playback streams?
Then it could be something like "Master Playback Route".
If it doesn't include the digital outputs like SPDIF, it could be
"Analog Playback Route" or whatever, too.


HTH,

Takashi

> 
> Thanks,
> Harin Lee
> 
> On 11/24/25 5:38 PM, Takashi Iwai wrote:
> > On Sat, 22 Nov 2025 12:33:51 +0100,
> > Harin Lee wrote:
> >> 
> >> Hi Takashi,
> >> 
> >> The official Windows driver does not expose a specific mixer control
> >> for this. It implicitly reserves RCA for stereo output and Front for
> >> 7.1ch surround, and simply appears as 'Speaker' device in the Control
> >> Panel.
> >> 
> >> Please let me know if there are any additional points I should address
> >> before I send v3.
> > 
> > Then maybe we should reconsider what exactly this control serves for.
> > It's for a dedicated control for what and how?
> > 
> > The dedicated mic stuff seems rather internal-only, so it wasn't
> > explicitly exposed.  But when we expose this, it should look more
> > intuitive.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> >> 
> >> Thanks,
> >> Harin Lee
> >> 
> >> On 11/22/25 6:29 PM, Takashi Iwai wrote:
> >>> On Sat, 22 Nov 2025 10:00:29 +0100,
> >>> Harin Lee wrote:
> >>>> 
> >>>> I noticed that 'rca_state' in patch 5 uses 'unsigned char'. While it is
> >>>> safe due to the bounds check, I plan to switch it to 'unsigned int' for
> >>>> strict correctness.
> >>>> 
> >>>> I also have two questions regarding conventions:
> >>>> 
> >>>> 1. ALSA control name (on patch 5): Is "Dedicated Output Playback Enum"
> >>>> acceptable, or would you prefer a simpler name?
> >>> 
> >>> I personally prefer a simpler one, but maybe it'd be a question how
> >>> this (or equivalent) control is called on Windows or other OS.
> >>> If it's also "Dedicated Output", then we can use it as is, too.
> >>> 
> >>>> 2. CA20K2 port logic (on patch 6): The condition
> >>>> 'if ((idx < 4) && ((hw->model != CTOK0010) || (idx < 3)))' handles
> >>>> the non-standard RCA port mapping. Does this line require additional
> >>>> comments or a helper function for better readability?
> >>> 
> >>> Sure, a more comment wouldn't hurt.
> >>> 
> >>> 
> >>> thanks,
> >>> 
> >>> Takashi
> >>> 
> >>>> Please let me know if you would prefer me to send a v3.
> >>>> 
> >>>> On 11/22/25 12:22 AM, Harin Lee wrote:
> >>>>> I added support for the Onkyo SE-300PCIE (OK0010), a Creative X-Fi
> >>>>> CA20K2-based sound card with dual TI PCM1798 DACs, a single TI PCM1681
> >>>>> DAC for 7.1ch output, and a CS5364 ADC. This model differs
> >>>>> significantly from other CA20K2-based variants.
> >>>>> 
> >>>>> Since official driver support for this hardware was discontinued a long
> >>>>> time ago, this patch series enables the card to be used on modern
> >>>>> platforms.
> >>>>> 
> >>>>> This patch series was developed using QEMU vfio tracing, and PCIe BAR
> >>>>> dumps. Tested with analog output (up to 192kHz) and line/microphone
> >>>>> input (up to 96kHz) at various sample rates.
> >>>>> 
> >>>>> Changes in v2:
> >>>>>     - Fix coding style issue (mixed declaration and code) in
> >>>>>       dedicated_rca_put().
> >>>>> 
> >>>>> Harin Lee (6):
> >>>>>      ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
> >>>>>      ALSA: ctxfi: Add ADC helper functions for GPIO
> >>>>>      ALSA: ctxfi: Use explicit output flag for DAIO resources
> >>>>>      ALSA: ctxfi: Refactor resource alloc for sparse mappings
> >>>>>      ALSA: ctxfi: Add support for dedicated RCA switching
> >>>>>      ALSA: ctxfi: Add support for Onkyo SE-300PCIE (OK0010)
> >>>>> 
> >>>>>     sound/pci/ctxfi/ctatc.c      | 97 ++++++++++++++++++++++++++----------
> >>>>>     sound/pci/ctxfi/ctatc.h      |  8 +--
> >>>>>     sound/pci/ctxfi/ctdaio.c     | 18 ++++---
> >>>>>     sound/pci/ctxfi/ctdaio.h     |  3 ++
> >>>>>     sound/pci/ctxfi/cthardware.h |  4 +-
> >>>>>     sound/pci/ctxfi/cthw20k1.c   |  3 +-
> >>>>>     sound/pci/ctxfi/cthw20k2.c   | 79 ++++++++++++++++++++++-------
> >>>>>     sound/pci/ctxfi/ctmixer.c    | 73 +++++++++++++++++++++++++--
> >>>>>     8 files changed, 223 insertions(+), 62 deletions(-)
> >>>>> 
> >>>> 
> >> 
> 
