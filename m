Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8914594B
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173510; cv=none; b=Wzc3hi1BY4VEEm9TAcvXICSnH9OCdiUDhGZgGCUsYvS/AhvUfWX1oVymn3Q90iWX3dYZO0+piznDr/MSSU3bLByOchVKc/9vkY+VQCm5SvxHIDj4dyam+CGFC75dkgkJCw9g2joC5LbZl+gyFlILhgYJLmvX3nqUmXwVWSA6tGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173510; c=relaxed/simple;
	bh=AV70jdQ4o94VsArS8UX2EGkrXnyjvWJnnsWDDjPbX9M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JyGjcySdp/4mwagDIggM//CbsNkLxRgdjCw1VQSz0MheKgDxUs0+UT/9E/fFzMGpOKEQfkUlxxmOIstC4l+AC1ppCIbO1hubb1A5evFpGeNsjJi0j5cmhf3aB2mO6aX6UkbO8tCZjXVqtxi2cFa/WMaeYNMjRnFc6z5ikiLToE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JNuoVbtk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tgIKP/Vn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JNuoVbtk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tgIKP/Vn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JNuoVbtk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tgIKP/Vn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JNuoVbtk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tgIKP/Vn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3377334DA4;
	Mon, 11 Mar 2024 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710173507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsctFa44iaHjWvfExbUo1jBG6B1owU4na/++r7MHOqg=;
	b=JNuoVbtkuFGsBK7hnjY1qwnc6cswI6HjApLKWAdSmOU+bpaSEwp3eChrM7R6zgvRgmOnUI
	zmQbufgt4HwATtDA1/YN0dHQ974osrScgSGXagb38pjAM3VpuWpr0a4mtI2wV0hUa8nWlW
	XKJrE3y6149haNdbAv9ZsPZHbsH75Pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710173507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsctFa44iaHjWvfExbUo1jBG6B1owU4na/++r7MHOqg=;
	b=tgIKP/VnKu6p+bmeu9Hm/NsQ4obtQGHwTXUBT4XlQxzUU3fQNUzSyosIvne3d1hTSZkDbu
	YjT1ypjatciIuJAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710173507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsctFa44iaHjWvfExbUo1jBG6B1owU4na/++r7MHOqg=;
	b=JNuoVbtkuFGsBK7hnjY1qwnc6cswI6HjApLKWAdSmOU+bpaSEwp3eChrM7R6zgvRgmOnUI
	zmQbufgt4HwATtDA1/YN0dHQ974osrScgSGXagb38pjAM3VpuWpr0a4mtI2wV0hUa8nWlW
	XKJrE3y6149haNdbAv9ZsPZHbsH75Pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710173507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsctFa44iaHjWvfExbUo1jBG6B1owU4na/++r7MHOqg=;
	b=tgIKP/VnKu6p+bmeu9Hm/NsQ4obtQGHwTXUBT4XlQxzUU3fQNUzSyosIvne3d1hTSZkDbu
	YjT1ypjatciIuJAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F398C136BA;
	Mon, 11 Mar 2024 16:11:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ShWiOUIt72U2EQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Mar 2024 16:11:46 +0000
Date: Mon, 11 Mar 2024 17:11:46 +0100
Message-ID: <87plw0rbnh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?f=E6talize?= <faetalize@proton.me>
Cc: Takashi Iwai <tiwai@suse.de>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"trivial@kernel.org" <trivial@kernel.org>
Subject: Re: [PATCH] fix volume mute and mic mute LEDs on HP probook 0x8a74
In-Reply-To: <UwvCaJlxd-Yl4F38jw51-h6pkKKDF3TmgctMT_FviyLpACTtzCTj_NSU3sp8LDuJrLmvpIo8maUyh_cZkjBcevtbucc859HnRV35h0E4nWQ=@proton.me>
References: <_svHAlMKMyPfAYW80GE0F2Nh_0nIyML552foHvCW2Zr7rT4bgt9wKaTVDP77iOL2CCoFzh0uuvwEXRAgSH-DqNwTyZaRY9fIs9bCb5763Zw=@proton.me>
	<87sf0wrclk.wl-tiwai@suse.de>
	<UwvCaJlxd-Yl4F38jw51-h6pkKKDF3TmgctMT_FviyLpACTtzCTj_NSU3sp8LDuJrLmvpIo8maUyh_cZkjBcevtbucc859HnRV35h0E4nWQ=@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.20 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.10)[95.61%]
X-Spam-Score: -1.20
X-Spam-Flag: NO

On Mon, 11 Mar 2024 17:04:31 +0100,
fætalize wrote:
> 
> 
> > The fix looks trivial, but to be merged to the upstream, could you
> > resubmit in a proper format?
> > https://docs.kernel.org/process/submitting-patches.html
> 
> Yes, I may. Could you please guide me, as I don't recognize what is not conforming to the proper format in my initial submission?
> I'd like to learn. Also, do i do so in this thread as a reply, or as a new submission?

See the document above.  There is a section "The canonical patch
format".


HTH,

Takashi
