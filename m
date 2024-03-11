Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1A111712
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 08:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710144860; cv=none; b=pT4v3Z1x0Dzu3hPS1hbKh5IbGR0VJnE2qSIYZMNnqTqpqdkzS0t0DpahtFiwCfVN8tbQOI6ThjcKHyMjwTlzMGNvrmiEDTkJkR5v5Ldh2hZnId0XGpxKxhGHkZFBKS63T8X0beFD7d43G3M396Qjb3t+ptdg1UMelgno1XbMgYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710144860; c=relaxed/simple;
	bh=L8pE2rriGLEEGfiuwXw3mYF6ykLsTXp4ZU6wQeJbuk0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d9W/DTR7P9NuH1ZF6EiMU3clMgBygDb6Q3ktmTaHRakzemP6ScfgilQdB+caAH9AORQJ9RgAq12pzNLJ5yk0fPMu7c3NSMoREYVpNUgVjNpbGjEYkrY31MFZui5Bv2DCLJNVSt52g4BRKlaG/oo//LfN8MYpEjHz95FOSwrpVJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jy1yYbjG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Byhf7VqX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vXxfad5N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YTBnjh2O; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jy1yYbjG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Byhf7VqX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vXxfad5N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YTBnjh2O"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 171C55C3D1;
	Mon, 11 Mar 2024 08:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710144857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dyyq7PAUCamcq2051WVlO5gVnMHV6Gi8VxOD/thsbPM=;
	b=Jy1yYbjGVs8wzGvfF9mqUK8miyWtxZQCE0fWRoE26kiMlTM7HCi6tfkIQd6sypnf1BTO3J
	bpS3u6A8LKk2d61u4S3xxJD/AJYS7h7asp0G5qlrH9WBc8m3nJ3dTtfU+jdx4sq3xM225/
	pE1VknAGx+3oo8M4s0EDG9SB/YvLlb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710144857;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dyyq7PAUCamcq2051WVlO5gVnMHV6Gi8VxOD/thsbPM=;
	b=Byhf7VqX0/WqoqYFMQ9MTqiLYbi8G3sJWi6f9HT+EMTT5AgPbHuapgZDY50KdAmChqy1As
	Gh7gBWSHGxpHRYBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710144856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dyyq7PAUCamcq2051WVlO5gVnMHV6Gi8VxOD/thsbPM=;
	b=vXxfad5NA8uwzUkAXTORz+E1duoNtjgScYQXMPJVyRqkbk9eJfzCgZV8cGGVrOYNLw0cQU
	XIefZPorxP6aUKopO39Fdxaoy0Ls3PdwChLDrQWoxyOp4RVGiV4TGE8s4HtkNAkumGjHX/
	mjlUJtBJAWqyGjGR6ZANwqDid/J/Aus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710144856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dyyq7PAUCamcq2051WVlO5gVnMHV6Gi8VxOD/thsbPM=;
	b=YTBnjh2OItXNMrvh3xKzlrhOD934mb5HiBILTx7FgKE73Q1MQr2arNB4ev4Gy/Ev4UXaTu
	LtihZ792mzda7EDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3CEC1383D;
	Mon, 11 Mar 2024 08:14:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cvROMle97mV+aAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Mar 2024 08:14:15 +0000
Date: Mon, 11 Mar 2024 09:14:15 +0100
Message-ID: <87r0ghb2y0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Athaariq Ardhiansyah <foss@athaariq.my.id>
Cc: linux-sound@vger.kernel.org,
	kailang@realtek.com.tw,
	pshou@realtek.com.tw,
	tiwai@suse.de,
	jwoithe@just42.net
Subject: Re: [PATCH v3] ALSA: hda/realtek: fix ALC285 issues on HP Envy x360 laptops
In-Reply-To: <20240310140249.3695-1-foss@athaariq.my.id>
References: <877cidxhny.wl-tiwai@suse.de>
	<20240310140249.3695-1-foss@athaariq.my.id>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vXxfad5N;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YTBnjh2O
X-Spamd-Result: default: False [0.65 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 URIBL_BLOCKED(0.00)[suse.de:dkim,athaariq.my.id:email];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[athaariq.my.id:email,suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.04)[58.36%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: 
X-Spam-Score: 0.65
X-Rspamd-Queue-Id: 171C55C3D1
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Sun, 10 Mar 2024 14:58:44 +0100,
Athaariq Ardhiansyah wrote:
> 
> Realtek codec on HP Envy laptop series are heavily modified by vendor.
> Therefore, need intervention to make it work properly. The patch fixes:
> 
> - B&O soundbar speakers (between lid and keyboard) activation
> - Enable LED on mute button
> - Add missing process coefficient which affects the output amplifier
> - Volume control synchronization between B&O soundbar and side speakers
> - Unmute headset output on several HP Envy models
> - Auto-enable headset mic when plugged
> 
> This patch was tested on HP Envy x360 13-AR0107AU with Realtek ALC285
> 
> The only unsolved problem is output amplifier of all built-in speakers
> is too weak, which causes volume of built-in speakers cannot be loud
> as vendor's proprietary driver due to missing _DSD parameter in the
> firmware. The solution is currently on research. Expected to has another
> patch in the future.
> 
> Potential fix to related issues, need test before close those issues:
> 
> - https://bugzilla.kernel.org/show_bug.cgi?id=189331
> - https://bugzilla.kernel.org/show_bug.cgi?id=216632
> - https://bugzilla.kernel.org/show_bug.cgi?id=216311
> - https://bugzilla.kernel.org/show_bug.cgi?id=213507
> 
> Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
> ---
> 
> Changes in v2:
> - Re-order SND_PCI_QUIRK based on its PCI SSID
> - Fix missing whitespace
> 
> Changes in v3:
> - Fix minor commit message mistake

Thanks, applied now.


Takashi
