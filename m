Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6628237E5E2
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256382; cv=none; b=CebotaUE0z6+xBWoUUTRUjaRfHwGrzBmrvFyzWdTvBD8qZzXdpV5AQpu0KZXifWWKBy1xcXzX8AMx9OMEMyzQnvSvGw6rapHEVDEONQ7r8xgnnARCu7AtHO4D5uigqCdYhqiEF8ZIxK129YW03CZK+TBrK8FyDS2YIR4nvRLRuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256382; c=relaxed/simple;
	bh=6F9q/hMKd63bW5FxHg3ni/eFwjdN57K8MfnP3+02Iss=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sMy/K2MM29DeOTcp0KIMFLAvW2zV11NGxc0N7bDILyu/OaA0KUS9ujzcCgyPkfF3u5CYgixEPq7uB9otRoQU8GBwckxuNsBIKtn2tt5tPCCwQsM/7A6aHGPKxHv4AUfSKdhJv/N4LsO1XaomCmIRGsVTostQS0wjeTvqqu6G1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hWqRM6Y8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XT09Crxk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y8svPd8p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TQrkXp43; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hWqRM6Y8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XT09Crxk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y8svPd8p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TQrkXp43"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 535527C4E8;
	Tue, 28 Jul 2026 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785256375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eYok06xWWDJHEwNvUxns5vwup+FSwcb9nAsj7FtfCJU=;
	b=hWqRM6Y8555eCdhUlAarFSzIz6M8p38mYE7u3RslA7wiCRjT+ls9hJU9U2adwQjzo1NYru
	MA+ZnTf3Ue1eJABDmYfUfpFWrbpeeRzm6d26bEvBln5YkX0I/z/BOkyTAZiKTEQJ0F+ZEW
	wIrFx+8w1XBUiw9YLjaQT9ZKdyx9RZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785256375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eYok06xWWDJHEwNvUxns5vwup+FSwcb9nAsj7FtfCJU=;
	b=XT09CrxkQW3A57hTXNJtbzpJRzTQi+O/VqY0QS3y1+t1rjQ3VLGMLCrdb9NOR1azN2dpFj
	FmiuhSTyks3Q5mAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785256371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eYok06xWWDJHEwNvUxns5vwup+FSwcb9nAsj7FtfCJU=;
	b=y8svPd8pi5Sm2DStkmeJI/h6MHFbc1sF16jl4MmPPxPo2Ya58yYtpaW3Ny7WE+M7vIFusk
	GtgDajXTH70wwMYCDZaovnGrToLTCh1btQJk7CB0UW2OznLYr09WLEH9CHnK9mkUq5RnuN
	WKsaD+eiNpK43EIgupSNLzK9hZUDaJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785256371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eYok06xWWDJHEwNvUxns5vwup+FSwcb9nAsj7FtfCJU=;
	b=TQrkXp43fgPIP+VExWswKPvX3jlKwMY6YlWWHVosp/aqsb54lv6G2ac5dxTH5ELCQWaT+V
	i5Wm0MwFyZTHBLDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01546779B1;
	Tue, 28 Jul 2026 16:32:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id u2JNOrLZaGoVDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Jul 2026 16:32:50 +0000
Date: Tue, 28 Jul 2026 18:32:50 +0200
Message-ID: <87zezb5b2l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	chengordon326@gmail.com,
	jussi@sonarnerd.net,
	hulianqin@vivo.com,
	i@rong.moe,
	g@b4.vu,
	cryolitia@uniontech.com,
	pav@iki.fi,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: usb-audio: Fix boot-time audio stuttering for USB Audio device
In-Reply-To: <20260728111309.1271834-1-zhangheng@kylinos.cn>
References: <20260728111309.1271834-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,gmail.com,sonarnerd.net,vivo.com,rong.moe,b4.vu,uniontech.com,iki.fi,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo]

On Tue, 28 Jul 2026 13:13:09 +0200,
Zhang Heng wrote:
> 
> This USB Audio device (0x1e0b:0xd01e) exhibits audio stuttering
> during boot when playing audio. Once the system is fully booted,
> playback is normal.
> 
> The device reports its isochronous endpoints with the Asynchronous
> sync type (bmAttributes = 0x03), which causes the driver to
> calculate nurbs = min(max_urbs, ...) = 3, providing only ~16ms
> of buffering. During boot, the higher system scheduling jitter
> (e.g., from init scripts, device enumeration, and driver probing)
> can exceed this buffer depth, causing audible stuttering.
> 
> This patch adds a device-specific quirk (QUIRK_FLAG_PLAYBACK_URB_FIXUP)
> that applies two changes for this device:
> 1. Forces nurbs to MAX_URBS (12), providing sufficient buffering
> 2. Sets URB_ISO_ASAP flag for more consistent xHCI scheduling
> 
> Both changes are required together for stable boot-time playback:
> - The larger buffer absorbs scheduling jitter during boot
> - URB_ISO_ASAP ensures consistent URB submission timing, preventing
>   the xHCI scheduler from introducing variable delays
> 
> Test methodology:
> - Without patch: reboot and play audio → stuttering audible in all
>   tests (reproduced consistently across multiple attempts)
> - With nurbs=8 only: occasional minor stuttering observed after
>   multiple tests (insufficient buffer depth)
> - With full patch (nurbs=12 + URB_ISO_ASAP): reboot and play audio
>   → no stuttering observed (tested in 10+ reboot cycles without
>   reproducing the issue)
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Looks a bit like voodoo, but better than vanilla, as it seems.
Applied to for-next branch now.


thanks,

Takashi

