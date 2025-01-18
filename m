Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5FD126C18
	for <linux-sound@vger.kernel.org>; Sat, 18 Jan 2025 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737198456; cv=none; b=QJQ2QS1a5JvoelQjIUKTwQ1hYnMKtN/doP83aN3sW+3lRkzlbfjqgwHySA1uObnG4E8poXUT1ZzskRAhqwvoxx6od5SjoRLOiTWOOerkAk1Cw23nEPimfQmftsix0PIDixuV3B8DbzvtmdyhWVyZpDfatSaF0hywYoTTg5KpXP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737198456; c=relaxed/simple;
	bh=zvAi++UOACN0eFXwDvbBH6AgxUkR5pqOLgIce2wxy28=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QAhEYLU1lZ+MUNAykXA3YLqcsTJg1jj3yJzMGgB/XpQ78fsPIGrcALa8CEjHs8HAkobep3dZFQva/Nj3rI4BM0/qbP1WHdsB4zROQ4do2l1ZEsTq7zMjopVjnea2MImzZwHnS7QeVBMXP+F3sK+fAIYAjeZDmIlV8l8Y6l7XE4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uv620B9/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0kuTk71n; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S60b9wVF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WWgq/HDS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uv620B9/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0kuTk71n";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S60b9wVF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WWgq/HDS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CCA792118B;
	Sat, 18 Jan 2025 11:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737198447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lCvW80vssDe1k1ASQKKL6VvEYCRWnDY5FDFyCtzIBQs=;
	b=Uv620B9/IbF9HOZ0fZ/SPHBjGGeKyvbyziahEQ3wUL7YpHOaKnZrOmdUbVU7zcSEJkyWvc
	LnJVgfPjU7JTCngTdMIPiv6FFbI+5CO+zMnPQA73Jb649+gdKqlv0tMvUVZZdk0kuoo4lu
	f7Z6TUBei4sgmxK6DCfw60iD2j1HSk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737198447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lCvW80vssDe1k1ASQKKL6VvEYCRWnDY5FDFyCtzIBQs=;
	b=0kuTk71n9jCpNyKGTs8wkPQ1voUju0eflGbWPWvypeSwW2ZRvlxNzs0mrrWpl6SPx/FQmE
	WvIRZLxEpeumzfCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737198445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lCvW80vssDe1k1ASQKKL6VvEYCRWnDY5FDFyCtzIBQs=;
	b=S60b9wVFtzoHYJi39jAwnO6IoO6DYSqlDvLpHaAtNr4WKXXazwb4Kt0Tc2NAUTUOQg7KGN
	For9mQtM+Uqr5ViFGXDGFuCex8lvq+MRtfvr894X/JBCBL2OnSrvfVOTHUpVUqMj3HZBm0
	bnXGHGSmlAs8TrnMiwCeDrd39jcwouM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737198445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lCvW80vssDe1k1ASQKKL6VvEYCRWnDY5FDFyCtzIBQs=;
	b=WWgq/HDSG2hff1dx4t0B8xl9lVFeaWMp2T0taHCGXskiRcyFdL7F6MUZkjXsKzw0tP3gqR
	OvgLlNGH/SdEU9Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92CB813332;
	Sat, 18 Jan 2025 11:07:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6t0oIm2Li2c7NwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 18 Jan 2025 11:07:25 +0000
Date: Sat, 18 Jan 2025 12:07:25 +0100
Message-ID: <87ed10qt1u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v8 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
In-Reply-To: <cover.1737048528.git.g@b4.vu>
References: <cover.1737048528.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 16 Jan 2025 18:47:07 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> Thanks again! All changes from your feedback on v7 incorporated in v8.

Now applied to for-next branch.


thanks,

Takashi

> 
> Regards,
> Geoffrey.
> 
> ---
> Changes in v8:
> - Rename SNDRV_CTL_TLVT_LABELS to SNDRV_CTL_TLVT_FCP_CHANNEL_LABELS
> - Make meter levels buffer persistent rather than allocate/free each
>   time
> - Add data protection to fcp_meter_tlv_callback()
> - Set private->step* and co after allocation of the buffer
> - Use ALIGN() rather than open-coding it
> 
> ---
> Changes in v7:
> - Add #define SNDRV_CTL_TLVT_LABELS for channel labels
> - Add ioctl for setting meter labels and remove TLV write support
> - Simplify reinit handling
> - Remove more unnecessary casts
> - Add #define FCP_SEGMENT_APP_GOLD to remove hardcoded value
> 
> ---
> Changes in v6:
> - Move re-initialisation out of fcp_usb() so it's clear there's no
>   infinite recursion
> - Update theory of operation and clarify the use of meter TLV metadata
> - Rename meter_labels to meter_metadata for clarity
> - Remove unnecessary casts in fcp_ioctl_cmd()
> 
> ---
> Changes in v5:
> - Remove version/union complexity from init ioctl
> - Add documentation to clarify ioctl usage and big picture
> 
> ---
> Changes in v4:
> - Use variable-length data arrays in ioctl structs instead of pointers
> - Add CAP_SYS_RAWIO requirement to hwdep interface
> - Add validation of flash commands to prevent accidental bricking due
>   to erasing/writing the App_Gold segment
> - Refactor URB cleanup
> 
> ---
> Changes in v3:
> - Update ioctl structs and add ioctl_compat op to work with 32-bit
>   userspace on 64-bit kernels
> - Update driver to do all init steps so it can re-init after
>   suspend/resume
> - Add version field to init ioctl for future compatibility
> - Improve error messages when unexpected response data is received
> 
> ---
> Changes in v2 as per Takashi's feedback:
> - Use fixed-size data arrays instead of pointers in ioctl structs
> - Define notify struct outside of struct fcp_dev
> - Use u8/u16 types without __ prefix
> - Use cleanup.h for code simplification
> - Add init flag to ensure FCP_IOCTL_INIT is called before
>   FCP_IOCTL_CMD and FCP_IOCTL_SET_METER_MAP
> - Do not destroy/recreate the meter control (the number of channels is
>   now fixed when it is created)
> 
> Geoffrey D. Bennett (2):
>   ALSA: FCP: Add Focusrite Control Protocol driver
>   ALSA: scarlett2: Add device_setup option to use FCP driver
> 
>  MAINTAINERS                 |   10 +-
>  include/uapi/sound/fcp.h    |  120 ++++
>  include/uapi/sound/tlv.h    |    2 +
>  sound/usb/Makefile          |    1 +
>  sound/usb/fcp.c             | 1134 +++++++++++++++++++++++++++++++++++
>  sound/usb/fcp.h             |    7 +
>  sound/usb/mixer_quirks.c    |    7 +
>  sound/usb/mixer_scarlett2.c |    8 +
>  8 files changed, 1285 insertions(+), 4 deletions(-)
>  create mode 100644 include/uapi/sound/fcp.h
>  create mode 100644 sound/usb/fcp.c
>  create mode 100644 sound/usb/fcp.h
> 
> -- 
> 2.45.0
> 
