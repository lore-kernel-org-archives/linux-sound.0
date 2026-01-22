Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2314357A28
	for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085294; cv=none; b=hqx2CjXck/z2633rK2NqZYtMwf+W/6JGeZ7crxcC9B0RC+xTCRO8Ohb0cci8CJA/BOzUW1CeZ+FPvsLCufxs9csqcRgb8ge0EpBRJWOC5DcepyxpCUYop7Z0xmHA3ly62MroTsiM/SQo5SqUCez3xcQFBkkfIvvyhiOKNSs3ce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085294; c=relaxed/simple;
	bh=ZzYw5bk4e/B078aKO0IEvYa95EGbGmcg+XhQgC2KrHw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wp72YkmZa2PVaKybeWmrlj1q4UUnqwCEkR8zsOZjGae2yRtjO8oMOh2YBUhbdLROvNzUaLEfPKDALqCh0qO75TA+o9efFsvJheqtJQ0pQecdPkr+X+C4d97HowHd/BtOMg/G8UnKfzCq6qoKldzXXysxrJbj3RI2LSdFFY6mFMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P84z946e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HwbJfgeK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uw1Jddkq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TvT8AOY2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P84z946e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HwbJfgeK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uw1Jddkq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TvT8AOY2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E11EA5BCCB;
	Thu, 22 Jan 2026 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769085290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K0ikEkJ3Gu2NaD/B594ss5OJmeR3ddBBanxLSa9Uh1I=;
	b=P84z946ewFtMJLQr5OVRf9O0kA2+sL+/SIlXoYHl3n8o19U2vvR/soUc2p+HmrK6JNNdID
	7wtzZ51owom31Sj9nZ/bRuQ1/vPFBFAnkJM1y58OgFW5ol6ohMdgMvyZEDWXYHzEv6Ca4y
	fsBVvTGoua3xL7B+mQdtHDD4gS5SL1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769085290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K0ikEkJ3Gu2NaD/B594ss5OJmeR3ddBBanxLSa9Uh1I=;
	b=HwbJfgeKdO+H3jYILqDs0mSILjwmDFZClOxoXJgULWu5ix3siaUM//vCcJw0scCDdY1Hic
	HRh3iFWMqYDOQCBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Uw1Jddkq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TvT8AOY2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769085289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K0ikEkJ3Gu2NaD/B594ss5OJmeR3ddBBanxLSa9Uh1I=;
	b=Uw1Jddkq5jNteCwI1XadtR9waEeGYKp69196dctLG11+fOcigXlxsswTLVwrWvLiLGWLQi
	QRL4JPQWDxGjpGCxIcyc+WiIuVeuKue23FVGHMaCAjDpyXJwGBxJr1WsIV+gcPB1CG2V4g
	TYZp7vaM3/UeXNF5niziBxSW6RPNRCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769085289;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K0ikEkJ3Gu2NaD/B594ss5OJmeR3ddBBanxLSa9Uh1I=;
	b=TvT8AOY2/I0AVrXlbfvKTHOMKmpG2ZwIAVzn1GkGiKABSq7mRorNCuTSW1CPzL9AVINTHg
	3l2xs7e5kE8yDXAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96EB813533;
	Thu, 22 Jan 2026 12:34:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 02IrI2kZcmmMDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Jan 2026 12:34:49 +0000
Date: Thu, 22 Jan 2026 13:34:49 +0100
Message-ID: <87y0lphlli.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Martin Hamilton <m@martinh.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: ALC269 fixup for Lenovo Yoga Book 9i 13IRU8 audio
In-Reply-To: <20260122-alc269-yogabook9i-fixup-v1-1-a6883429400f@martinh.net>
References: <20260122-alc269-yogabook9i-fixup-v1-1-a6883429400f@martinh.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E11EA5BCCB
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 22 Jan 2026 03:51:18 +0100,
Martin Hamilton wrote:
> 
> 
> 
> ---

Please drop this delimiter at the next time; otherwise all texts below
would be dropped at applying the patch.

> The amp/speakers on the Lenovo Yoga Book 9i 13IRU8 laptop aren't
> fully powered up, resulting in horrible tinny sound by default.
> 
> The kernel has an existing quirk for PCI SSID 0x17aa3843 which
> matches this machine and several others. The quirk applies the
> ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP fixup, however the fixup does not
> work on this machine.
> 
> This patch modifies the existing quirk by adding a check for the
> subsystem ID 0x17aa3881. If present, ALC287_FIXUP_TAS2781_I2C will
> be applied instead of ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP. With this
> change the TAS2781 amp is powered up, firmware is downloaded and
> recognised by HDA/SOF - i.e. all is good, and we can boogie.
> 
> Code is re-used from alc298_fixup_lenovo_c940_duet7(), which fixes a
> similar problem with two other Lenovo laptops.
> 
> Cross checked against ALSA cardinfo database for potential clashes.
> Tested against 6.18.5 kernel built with Arch Linux default options.
> Tested in HDA mode and SOF mode.
> 
> Note: Possible further work required to address quality of life issues
> caused by the firmware's agressive power saving, and to improve ALSA
> control mappings.
> 
> Signed-off-by: Martin Hamilton <m@martinh.net>

Applied now.  Thanks.


Takashi
