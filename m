Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EBF63C
	for <linux-sound@vger.kernel.org>; Thu, 18 Apr 2024 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422106; cv=none; b=p7XhjUfjJqRPC4jmWCAqK+8sOhsF08bgGWEegAVms5NEXrud9wG9pk/TvRRxT5ubdMHIfqaVeHwD/esZdb3D3o8UDNjlUuFJq2WvTrFRaNv/46q/60y10chFlzJMvuVtaLh2xX7/2UOQw1/Oh+RmW78i3EwDyrOyLyTOmvYAPp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422106; c=relaxed/simple;
	bh=J3k3tTmZfrVceDuMg0lUkAZkK/fe/ws7ZQ0HPFNy9GQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fwwQGL/aLr0xa0bXbRr7co0VRPKuALu95mLp5rW1rynuRYrX/IwyhgLQqsirfEd2ADFbQOlCITikCHhPfrKxOB0pnopoOf8ICzFsKaXL6FckXt5dhDj43yeo2FnHFrK1wKBDuSwnrsU/Ugj45t+jjksv8ehq3NhSI/+l0zk/3Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YKROAPgq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C4D9VK2O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qUzunFrK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mAfXbosC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YKROAPgq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C4D9VK2O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qUzunFrK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mAfXbosC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 477A63391D;
	Thu, 18 Apr 2024 06:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713422103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZCWND1YQg8sYkgjFGdv/r8RippDxkvH+z9AamWn3Hw=;
	b=YKROAPgq8VoN2iiaQ609S6dpGbNgFGVMzKe0DACeUueKVpLmdnOsfaGubIts8od/BzwbHe
	lNDchV3wXQm/NirRRs/PyAm5X2gRCSJff/485Gwc1/XcEy1EquDWpQASfvSspdJkMsv1Q2
	pqLJoKSDwCo5xKUggP/KkQ6kOsiJJJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422103;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZCWND1YQg8sYkgjFGdv/r8RippDxkvH+z9AamWn3Hw=;
	b=C4D9VK2OIYPI5O8Ertqa6EbcCFdS4uVY9TFuSN6ACDUaRlAF2dQj4BFnI4xIGtsz7t5VrJ
	Sjowiqj9LkOsNhDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qUzunFrK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mAfXbosC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713422101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZCWND1YQg8sYkgjFGdv/r8RippDxkvH+z9AamWn3Hw=;
	b=qUzunFrKrTFTvI18rAt+EyV/itGjqrnx65YyTX5KnsDAS/JS5OGEze8UN1+pZL01xvQ0Zt
	Ail2PhNb2G1llFVqHSvuOdXIQaErY3XVxt2YtV2DwzbQV8GRRQTIEXKSeeAGctfmfJma2f
	v42ckJ/50EDzDd0O+rlBOOcBVPZDHXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZCWND1YQg8sYkgjFGdv/r8RippDxkvH+z9AamWn3Hw=;
	b=mAfXbosCqEeWCcNYcV8GD6gaDlQ2uPK0rRzKYh0T+NvPApBPcI9jumSs6ordsow9fWZuTW
	YCPzExjqrkbdiwCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 234D813687;
	Thu, 18 Apr 2024 06:35:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TzyqBhW/IGaEdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Apr 2024 06:35:01 +0000
Date: Thu, 18 Apr 2024 08:35:09 +0200
Message-ID: <87msprxjoi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/14] ALSA: scarlett2: Add support for Vocaster
In-Reply-To: <cover.1710264833.git.g@b4.vu>
References: <cover.1710264833.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.39
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 477A63391D
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.39 / 50.00];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.88)[85.83%];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

On Tue, 12 Mar 2024 19:28:52 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> This patch series contains:
> 
> 1-2: Fix to wait for an ACK from the device after sending a command,
> before attempting to read the response. This didn't seem to be
> necessary previously, but with 4th Gen devices it seems to help with a
> rare issue where the device stops responding.
> 
> 3: Support for reading flash segments from the device.
> 
> 4-11: Preparation for Vocaster support.
> 
> 12: Vocaster One and Two support.
> 
> 13: Add autogain target controls for 4th Gen and Vocaster.
> 
> 14: Add Bluetooth volume control for Vocaster Two.
> 
> Thanks,
> Geoffrey.
> 
> Geoffrey D. Bennett (14):
>   ALSA: scarlett2: Move initialisation code lower in the source
>   ALSA: scarlett2: Implement handling of the ACK notification
>   ALSA: scarlett2: Add support for reading from flash
>   ALSA: scarlett2: Rename gen4_write_addr to param_buf_addr
>   ALSA: scarlett2: Add pbuf field to struct scarlett2_config
>   ALSA: scarlett2: Add support for config items with size = 32
>   ALSA: scarlett2: Add additional input configuration parameters
>   ALSA: scarlett2: Define the maximum preamp input gain per-config-set
>   ALSA: scarlett2: Define autogain status texts per-config-set
>   ALSA: scarlett2: Add input mute controls
>   ALSA: scarlett2: Add DSP controls
>   ALSA: scarlett2: Add support for Focusrite Vocaster One and Two
>   ALSA: scarlett2: Add autogain target controls
>   ALSA: scarlett2: Add Bluetooth volume control for Vocaster Two

Now all merged to for-next branch.  Thanks.


Takashi
