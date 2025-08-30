Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7AE16F0FE
	for <linux-sound@vger.kernel.org>; Sat, 30 Aug 2025 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756539196; cv=none; b=MqQIA+xevv1ZT/OnIGor1Klxi+tDKGoB7dmDOPkyBIUX28CcHMX2TcbtgpDX2K2HcESNst3C+UgNM/Wx634Kw6GimsJYuuWOjEDf/NKyda/SHbre+KyodYhPdkKB8tEXIhVPIki4o10PdhbPjLHXDOkF2AcT8ShCa8/l7o3hivI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756539196; c=relaxed/simple;
	bh=0qqBCdQuLh7SP7vLag/rTF52tQH8fM1lmu77ZGiKEMM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTmuDCI7HJ5BqunjP5zONLQYtVKAtJLpA2HOgR5oOSuS+jbJMZY3CPxfP/X/R5zWhuDUG1n/HcLYszN2LRn2dkd18hWJ5cpS6KKNJ4TZs/OgkObHJDpBnMgy7ptCdkW7EtVyeGWwXW7g7DPO0NMQv712SiIACrM3wo2gyp/e89Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LX51mv/P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KhSq3g1T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LX51mv/P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KhSq3g1T; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LX51mv/P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KhSq3g1T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LX51mv/P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KhSq3g1T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3953021C63;
	Sat, 30 Aug 2025 07:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756539192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gykHGNsPcyFMRAWH2maEtXfKeoO1Rcbx1PjKBdV00hw=;
	b=LX51mv/PWw404HsA4BaYMgHAl7ElGbcZBWIR1bwbSZdPvK4DWvwGte3VOPB33gsGJENk8A
	GC3P6S7Lko+8LRBdV6GNILF00EyOVnTZXH3iIurohivKlsayLxyIsVvzvl6YI/lZn9E/LI
	LWesqAppIeE9S2D9ulaCFGqK8y8qMnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756539192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gykHGNsPcyFMRAWH2maEtXfKeoO1Rcbx1PjKBdV00hw=;
	b=KhSq3g1TrKT/XSfCrLbfm7OexiyTY+Hw1YE97mwXM4cTgDLShl4W+FRixSfK9Ae2Iuj0Sk
	2gdRrahzzb9gMRAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="LX51mv/P";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KhSq3g1T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756539192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gykHGNsPcyFMRAWH2maEtXfKeoO1Rcbx1PjKBdV00hw=;
	b=LX51mv/PWw404HsA4BaYMgHAl7ElGbcZBWIR1bwbSZdPvK4DWvwGte3VOPB33gsGJENk8A
	GC3P6S7Lko+8LRBdV6GNILF00EyOVnTZXH3iIurohivKlsayLxyIsVvzvl6YI/lZn9E/LI
	LWesqAppIeE9S2D9ulaCFGqK8y8qMnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756539192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gykHGNsPcyFMRAWH2maEtXfKeoO1Rcbx1PjKBdV00hw=;
	b=KhSq3g1TrKT/XSfCrLbfm7OexiyTY+Hw1YE97mwXM4cTgDLShl4W+FRixSfK9Ae2Iuj0Sk
	2gdRrahzzb9gMRAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1610C139B1;
	Sat, 30 Aug 2025 07:33:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QcvVAzipsmguGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 30 Aug 2025 07:33:12 +0000
Date: Sat, 30 Aug 2025 09:33:11 +0200
Message-ID: <87wm6lfemg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-motu: drop EPOLLOUT from poll return values as write is not supported
In-Reply-To: <20250829233749.366222-1-o-takashi@sakamocchi.jp>
References: <20250829233749.366222-1-o-takashi@sakamocchi.jp>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3953021C63
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Sat, 30 Aug 2025 01:37:49 +0200,
Takashi Sakamoto wrote:
> 
> The ALSA HwDep character device of the firewire-motu driver incorrectly
> returns EPOLLOUT in poll(2), even though the driver implements no operation
> for write(2). This misleads userspace applications to believe write() is
> allowed, potentially resulting in unnecessarily wakeups.
> 
> This issue dates back to the driver's initial code added by a commit
> 71c3797779d3 ("ALSA: firewire-motu: add hwdep interface"), and persisted
> when POLLOUT was updated to EPOLLOUT by a commit a9a08845e9ac ('vfs: do
> bulk POLL* -> EPOLL* replacement("").').
> 
> This commit fixes the bug.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Thanks, applied now.


Takashi
