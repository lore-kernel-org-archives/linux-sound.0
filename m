Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869A036A004
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361850; cv=none; b=r0tUVnahqQ+rAsP58XuTzVEg3IRWB8Up0ICinvKZKeH3byTlOJVcRu6H5aqKJMWi9/fxgcofQTvBWNqGBUDZGvOzSzJlHkur3ksPrHTwA/YOoHDMSOX7fF0xOcqsJZrNZkXszggUkuHvmTqKMQQhxJYMfoyl/PRJCTBSXtlOqIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361850; c=relaxed/simple;
	bh=ytKXGI1xwlZgcl5flfEgSnWwDqGz+g2qGro/WOlcYNM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnpLkpveJsY3nPAiFgcJUhuGLxJUdLJ6uA97azV/OnV55z4oQ4j1j/gD2aorzNPa0rKdpd6YasuNM5eGZ/R0nAMOaLC/rBBrfuyXpKUIupkAUSnwWp9V6nsKGT4iujnpkFwKbqBflluMemVjzgalpvOqq78NS0EpasF2V3aHOLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yJgF4Z8V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eIWQIbDm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hvJLFupA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OMbzjmOK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yJgF4Z8V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eIWQIbDm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hvJLFupA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OMbzjmOK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3884E80937;
	Mon, 10 Aug 2026 11:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786361838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ifuhZThFFTAXzG5B1dTkBUFWN59Cd5TvqzP13JWLnHI=;
	b=yJgF4Z8V2qbH5E0v2DnuCIWyjVu7t2RpzL+/a5xpnv5bbDxBvlNaGcpxKAyZCYI1FL/ach
	+KfxCUNBBib/73b849ayDPNIyQA0eA15YkohqnbIGMC6z9nA7Umyghi0qmpb4g2AXkWKxK
	HGv8fVFxV5VWtV6aHvoIQwJCAb1tB8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786361838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ifuhZThFFTAXzG5B1dTkBUFWN59Cd5TvqzP13JWLnHI=;
	b=eIWQIbDmYatO03LpJvH59FWSr3TqqgWkI6kSs/372YGx2jyN1nAHjK/D6SMS53eGYwkmQe
	8swYd9jB6sb8eECw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786361834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ifuhZThFFTAXzG5B1dTkBUFWN59Cd5TvqzP13JWLnHI=;
	b=hvJLFupAi6fyiyd4ByiM78HWfHFbHSDIR0ozRaOBtmOODTBqCDrHVmp6FODNWyhtMy+zgY
	crdAtW5u/8MI+lCjkULV4VUz+ZvXKeuuJfgXUbXaM8+fLDDDpPTbtg67E6iEAiwBvsd0HS
	CmtkxhY5LH2yEkGwANRPupOJpcp1FR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786361834;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ifuhZThFFTAXzG5B1dTkBUFWN59Cd5TvqzP13JWLnHI=;
	b=OMbzjmOKs5TJe2UGBugclVPE8qmNf+UT23Q3aQKlDf81XfXfI8KZEFL4NA5GGtsgV1XMRg
	0AFenBzPXemtiFAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1455D779B2;
	Mon, 10 Aug 2026 11:37:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S26fA+q3eWqdKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Aug 2026 11:37:14 +0000
Date: Mon, 10 Aug 2026 13:37:13 +0200
Message-ID: <87zeyu8avq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: Don't share mixer->urb with the FCP/scarlett2 notification endpoint
In-Reply-To: <cover.1786290885.git.g@b4.vu>
References: <cover.1786290885.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sun, 09 Aug 2026 20:05:41 +0200,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> Both the FCP and scarlett2 drivers used mixer->urb for their
> notification endpoint URB, but that field belongs to
> snd_usb_mixer_status_create() and is managed by mixer.c. Sharing it
> means the "already set up" check in the driver's init_notify() can be
> satisfied by the status endpoint's URB, so the driver's own URB is
> never submitted and the first command would crash in
> wait_for_completion_timeout() on the still-zeroed cmd_done. mixer.c
> can also kill, resubmit or free the URB from under the driver.
> 
> Give each driver its own URB in its private data. For scarlett2 this
> also means taking over the free/suspend/resume handling that mixer.c
> was doing for it.
> 
> Tested on an ISA C8X and a Scarlett 18i20 Gen 4 (FCP), and a Scarlett
> 4i4 Gen 3 and 4i4 Gen 4 (scarlett2) on 7.1.7, including suspend/resume
> and configuration save on suspend.
> 
> Thanks,
> Geoffrey
> 
> Geoffrey D. Bennett (2):
>   ALSA: FCP: Use a private URB for the notification endpoint
>   ALSA: scarlett2: Use a private URB for the notification endpoint

As those are no new regression, I applied both to for-next branch now.


thanks,

Takashi
