Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F92E719E
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763973538; cv=none; b=oaQ6s1KgluEaEQHHFysHn1z6E7VMn17UHTGHsWo7oLVizv3eTLoQg+J57Pnp7MpqRt/2rvbZfgFObmCYMEOeaJ1ITdkbUsXnMdsfcFMUTLV/rDZ9psPWr2R6RFPD1/WLf9wJVNuoKxrXAmDTj9440TpNMYxzZZ1dOxTHojw48JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763973538; c=relaxed/simple;
	bh=j7JdtboDr0AYj9XUl8MyKmg0rxadHyLDpifDn5SLtJM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JPb+puBn8pDLSSjzyv+t9P38+J+cZ4vAxUr8HuZRaGeSatyub8vJJl4Fvy76Yzfekj+YIKbLYOqDoZdmsgvZqPqbDqzorvyIiRY5hN8U5hv7w4I0kgFdVQ4EEZSCuWijfGxJVnjxG1RmxNwsK/rkRPC9FtUerWCnYm0o7Air3oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qxfLDwyH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jCMgUCPj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qxfLDwyH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jCMgUCPj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qxfLDwyH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jCMgUCPj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qxfLDwyH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jCMgUCPj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AB3BA5BDF0;
	Mon, 24 Nov 2025 08:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763973534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iQtT2NCdONvvzofOQXfUOHlJZhbxJxMWkWRjjMq4hx0=;
	b=qxfLDwyHF63J+Foze5AbVFAmWqj4dmVAt2v3jSUT5W8rCqXlMJGNwja31BpallyAsrXFFp
	r+BsrWgZohFMM3gUC1+6RBvbP6aCdAVtwYvdnykGaFnHdvp6cFXjhFacFwAJ9rfa+wCC+2
	M6u8WiEyZk8MxbAqBDYwLuLA6McMZKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763973534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iQtT2NCdONvvzofOQXfUOHlJZhbxJxMWkWRjjMq4hx0=;
	b=jCMgUCPjDROjg3DWDx+vprfE4U86p3NtIkBodnqAYN034A05w+55pwDGgVfq/Zi2354mSx
	nI/4jyc4CHg6nfDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763973534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iQtT2NCdONvvzofOQXfUOHlJZhbxJxMWkWRjjMq4hx0=;
	b=qxfLDwyHF63J+Foze5AbVFAmWqj4dmVAt2v3jSUT5W8rCqXlMJGNwja31BpallyAsrXFFp
	r+BsrWgZohFMM3gUC1+6RBvbP6aCdAVtwYvdnykGaFnHdvp6cFXjhFacFwAJ9rfa+wCC+2
	M6u8WiEyZk8MxbAqBDYwLuLA6McMZKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763973534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iQtT2NCdONvvzofOQXfUOHlJZhbxJxMWkWRjjMq4hx0=;
	b=jCMgUCPjDROjg3DWDx+vprfE4U86p3NtIkBodnqAYN034A05w+55pwDGgVfq/Zi2354mSx
	nI/4jyc4CHg6nfDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80B163EA61;
	Mon, 24 Nov 2025 08:38:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cnVvHZ4ZJGkQOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Nov 2025 08:38:54 +0000
Date: Mon, 24 Nov 2025 09:38:54 +0100
Message-ID: <87cy57hlk1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] ALSA: ctxfi: Add support for Onkyo SE-300PCIE
In-Reply-To: <cecd1398-b072-4830-9495-c4bf8d7a3570@harin.net>
References: <20251121152221.1152523-1-me@harin.net>
	<4df3c2ac-88cd-42d1-9f1e-c5c2c5a2b00f@harin.net>
	<87o6oul8kf.wl-tiwai@suse.de>
	<cecd1398-b072-4830-9495-c4bf8d7a3570@harin.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Sat, 22 Nov 2025 12:33:51 +0100,
Harin Lee wrote:
> 
> Hi Takashi,
> 
> The official Windows driver does not expose a specific mixer control
> for this. It implicitly reserves RCA for stereo output and Front for
> 7.1ch surround, and simply appears as 'Speaker' device in the Control
> Panel.
> 
> Please let me know if there are any additional points I should address
> before I send v3.

Then maybe we should reconsider what exactly this control serves for.
It's for a dedicated control for what and how?

The dedicated mic stuff seems rather internal-only, so it wasn't
explicitly exposed.  But when we expose this, it should look more
intuitive.


thanks,

Takashi

> 
> Thanks,
> Harin Lee
> 
> On 11/22/25 6:29 PM, Takashi Iwai wrote:
> > On Sat, 22 Nov 2025 10:00:29 +0100,
> > Harin Lee wrote:
> >> 
> >> I noticed that 'rca_state' in patch 5 uses 'unsigned char'. While it is
> >> safe due to the bounds check, I plan to switch it to 'unsigned int' for
> >> strict correctness.
> >> 
> >> I also have two questions regarding conventions:
> >> 
> >> 1. ALSA control name (on patch 5): Is "Dedicated Output Playback Enum"
> >> acceptable, or would you prefer a simpler name?
> > 
> > I personally prefer a simpler one, but maybe it'd be a question how
> > this (or equivalent) control is called on Windows or other OS.
> > If it's also "Dedicated Output", then we can use it as is, too.
> > 
> >> 2. CA20K2 port logic (on patch 6): The condition
> >> 'if ((idx < 4) && ((hw->model != CTOK0010) || (idx < 3)))' handles
> >> the non-standard RCA port mapping. Does this line require additional
> >> comments or a helper function for better readability?
> > 
> > Sure, a more comment wouldn't hurt.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> >> Please let me know if you would prefer me to send a v3.
> >> 
> >> On 11/22/25 12:22 AM, Harin Lee wrote:
> >>> I added support for the Onkyo SE-300PCIE (OK0010), a Creative X-Fi
> >>> CA20K2-based sound card with dual TI PCM1798 DACs, a single TI PCM1681
> >>> DAC for 7.1ch output, and a CS5364 ADC. This model differs
> >>> significantly from other CA20K2-based variants.
> >>> 
> >>> Since official driver support for this hardware was discontinued a long
> >>> time ago, this patch series enables the card to be used on modern
> >>> platforms.
> >>> 
> >>> This patch series was developed using QEMU vfio tracing, and PCIe BAR
> >>> dumps. Tested with analog output (up to 192kHz) and line/microphone
> >>> input (up to 96kHz) at various sample rates.
> >>> 
> >>> Changes in v2:
> >>>    - Fix coding style issue (mixed declaration and code) in
> >>>      dedicated_rca_put().
> >>> 
> >>> Harin Lee (6):
> >>>     ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
> >>>     ALSA: ctxfi: Add ADC helper functions for GPIO
> >>>     ALSA: ctxfi: Use explicit output flag for DAIO resources
> >>>     ALSA: ctxfi: Refactor resource alloc for sparse mappings
> >>>     ALSA: ctxfi: Add support for dedicated RCA switching
> >>>     ALSA: ctxfi: Add support for Onkyo SE-300PCIE (OK0010)
> >>> 
> >>>    sound/pci/ctxfi/ctatc.c      | 97 ++++++++++++++++++++++++++----------
> >>>    sound/pci/ctxfi/ctatc.h      |  8 +--
> >>>    sound/pci/ctxfi/ctdaio.c     | 18 ++++---
> >>>    sound/pci/ctxfi/ctdaio.h     |  3 ++
> >>>    sound/pci/ctxfi/cthardware.h |  4 +-
> >>>    sound/pci/ctxfi/cthw20k1.c   |  3 +-
> >>>    sound/pci/ctxfi/cthw20k2.c   | 79 ++++++++++++++++++++++-------
> >>>    sound/pci/ctxfi/ctmixer.c    | 73 +++++++++++++++++++++++++--
> >>>    8 files changed, 223 insertions(+), 62 deletions(-)
> >>> 
> >> 
> 
