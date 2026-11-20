Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194551;
	b=iw4HpiJvgnphS+vaK0mY+BSyiTtdXKt46upmQaPLvLBC7pHYWNFpBM3uQ9q3fcybYCeI
	 6Pl4gprNTjzgCSh9jbbaoc3UCfSX8WnAkfu1vs7hyrLYJoYxySsSfmM09JHIexYhl4dUD
	 WQI+ZJ1kTqu2j6OVuRNbpG522DF5alsiHZREji2lzNlJj6YgcNmE+kFt5EiYbu2uiZzU7
	 PShupwPpoIFuw9Em03wfTq6oxAbY/sRDENYNn9MlkHAinw4rU8mazwPGHp247Vs9I0DiT
	 vk3/jB9S5MEXrJLvLSvH0OJ5NYhYNIyHyMaFl5DvxBStJpIDoIkC5xfpmir1f5MngWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194551;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=aoWT+2BSpjUJRhMXG6Rg0wLsCrBurv5q4LV08hsOWtM=;
	b=RvDYjRCNLhqL2UXtWn4ZpTE7Em8YXz20lUilfwM9luX5LpHeViMFIvuo5j4UoHNoTPKu
	 jjoj6Ptn375u/Fqqv0eDe3Al+/fPpUlWUenHn1D36ZVlc75zq4YYmhOLzbZdjgph3WGau
	 +4HnR4zJPYLVMEGSwBGJ2PWoGr8QmNkYgoJemK3uYRmyLCG+yf/6qotvKMEAbwatpyQxJ
	 58dXStuwLHlxuxo6EbiXuoIMD5ttU+kdmJNX3dK+akH8E23OC9p58kw1ftwFK3HW+qhyX
	 RDu+AoCt/tchtD1+Eb6keeWc+2IX2G/NlQ4MXkTcZ9fOfLtydK8CSTuflzxlpy0t+1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t4pXnOP3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vNxXW9sT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t4pXnOP3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vNxXW9sT;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77FC606A320;
	Fri, 20 Nov 2026 17:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77FC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t4pXnOP3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vNxXW9sT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t4pXnOP3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vNxXW9sT
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BEA5622297;
	Fri, 20 Nov 2026 17:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aoWT+2BSpjUJRhMXG6Rg0wLsCrBurv5q4LV08hsOWtM=;
	b=t4pXnOP3kIcweGARDuRt4iXbiB/B4ma0vFIwoEqxl10Y9hP69ZsN+UK2YBKOIQbpPQQkbb
	5B5U9jLC4WIrMoH5DczT0ljgBb6DcRyDEJu4HQB3EeSMGZQp+/F7KbjAOhr4XZvdMf5OkG
	hTRMyAyIeuBYmQztc0xoO4kG2qk+w5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aoWT+2BSpjUJRhMXG6Rg0wLsCrBurv5q4LV08hsOWtM=;
	b=vNxXW9sTRHlNYC0uNUoUG9cELSJa00mJipPYr4tOJOpyb07SGFoXNUxFBsVOaq93Hv6jxV
	6vRga9b8Ti7aB1Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aoWT+2BSpjUJRhMXG6Rg0wLsCrBurv5q4LV08hsOWtM=;
	b=t4pXnOP3kIcweGARDuRt4iXbiB/B4ma0vFIwoEqxl10Y9hP69ZsN+UK2YBKOIQbpPQQkbb
	5B5U9jLC4WIrMoH5DczT0ljgBb6DcRyDEJu4HQB3EeSMGZQp+/F7KbjAOhr4XZvdMf5OkG
	hTRMyAyIeuBYmQztc0xoO4kG2qk+w5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aoWT+2BSpjUJRhMXG6Rg0wLsCrBurv5q4LV08hsOWtM=;
	b=vNxXW9sTRHlNYC0uNUoUG9cELSJa00mJipPYr4tOJOpyb07SGFoXNUxFBsVOaq93Hv6jxV
	6vRga9b8Ti7aB1Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DB9B1342D;
	Fri, 20 Nov 2026 17:09:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QxpdEbR+AGsJUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Nov 2026 17:09:08 +0000
Date: Fri, 20 Nov 2026 18:09:07 +0100
Message-ID: <875wxrwhu4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: chris@kode54.net
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Rong Zhang <i@rong.moe>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: usb-audio: quirk_flags parsing fix and Logitech PRO X 2 LIGHTSPEED quirk
In-Reply-To: <20261120120356.10909-1-chris@kode54.net>
References: <20261120120356.10909-1-chris@kode54.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 20 Nov 2026 13:03:46 +0100,
chris@kode54.net wrote:
> 
> Patch 1 fixes parsing of flag names written to the quirk_flags module
> parameter with a trailing newline, as echo produces.
> 
> Patch 2 adds quirk flags for the Logitech PRO X 2 LIGHTSPEED receiver
> (046d:0af7). This is a mitigation, not a fix. After a hotplug the
> receiver firmware resets itself on the first stream open, and also on
> repeated GET_STATUS requests or on SET_CONFIGURATION shortly after a
> port reset. It only behaves once it has gone through such a reset of
> its own. The flags avoid the worse failure, where the probe-time
> interface setup wedges the receiver for about 77 seconds.
> 
> The same receiver hotplugs without trouble on Windows and macOS. A
> USBPcap capture of a Windows hotplug, with G HUB installed, shows no
> missing request that made a difference when I tried it. Replaying
> G HUB's initial HID reports before the audio driver binds did not
> help, and neither did a host port reset. These differences were not
> isolated:
> - Windows never sends GET_STATUS.
> - It sets the playback alt setting once, about 0.9 s after
>   configuration, and keeps it.
> - It only reads the volume controls at probe.
> Suggestions on how to narrow this down, or on whether the quirk should
> be expressed differently, are welcome. Captures and logs are available.
> 
> The device entry repeats CTL_MSG_DELAY_1M from the Logitech vendor
> entry, as the other Logitech device entries do, because a device entry
> replaces the vendor match. The receiver also worked with only
> SKIP_IFACE_SETUP | IFACE_DELAY. The PRO X Wireless (046d:0aba) entry
> does not carry the delay; Rong, I'm not sure whether that was intended.
> 
> Testing: with both patches applied, sound/usb/ builds without warnings
> with W=1 and checkpatch --strict is clean. Patch 2 was runtime-tested on
> a 7.3.5 stable kernel. Cold hotplugs on a front-panel (PROM21) port and
> a rear (CPU xHCI, behind a hub) port recover within half a second and
> then play normally.
> Patch 1 was runtime-tested on the same kernel. Flag names written with
> a plain echo are applied, and an empty echo is ignored by the parser.
> The sysfs readback still shows the newline as written, because the
> parameter stores the raw string. That is cosmetic and left unchanged.
> 
> Assisted-by: AI
> 
> Christopher Snowhill (2):
>   ALSA: usb-audio: Ignore trailing whitespace in quirk_flags
>   ALSA: usb-audio: Add quirk flags for Logitech PRO X 2 LIGHTSPEED

Applied both patches now.  Thanks.


Takashi
