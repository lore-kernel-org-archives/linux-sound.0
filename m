Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC67D528
	for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732630150; cv=none; b=WRA+SheLf8/K/Z3MEU/Xh6QpDN/PMbSp2ccz2nLrPOpZZrQObwEQEOGF8Uaqx+qXzBbz/ilBA+I3qn1e2PEDwT1iPp6BtGoDJJlJ1fGYZ20y3wst2NJRV6DLE+X5h0chKiZlCWswwEHrM0by57mUf1Nnkr8RduvfEwvUIIn8WTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732630150; c=relaxed/simple;
	bh=L8jfaL3IIivgsSHYwK0obIyod/JHy3ugOzMFp9k2J1w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GYoF7kECP8oTYUmlIlW+MwihWfG9ZfbKv2C0NyA+tyDx8/cpSwAnjPwBvTMFlfCRyYIWlzEdo5sace7CD4Aoc4znOuRzDPMwVTOnWLWriUz0DiDx9I1nF2hd+Va++0ufQrR+LY+VAdcWzpL3FgvbKWFL44CU21bxJPeAVn2XG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=04swAq7K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aetlFBmz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=04swAq7K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aetlFBmz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="04swAq7K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aetlFBmz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="04swAq7K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aetlFBmz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 20ABD1F74B;
	Tue, 26 Nov 2024 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732630147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XdFqV87bvCKF9fqbmasfDFCuSHehKZpNIZATTCyQnbw=;
	b=04swAq7K4ahkr7D8955XjtuBE8Le+xbze1GXegW6YO3GpN39WQSmrMmA8YB16sSyV0SvUd
	Wu5juCqHneimWReCvbrcIKImGuoSj+hctAat0+MrSptdgh3ZJdHYkq3VOKCvyaEs8uujSE
	Otzo7RjlxBpBA1AX6p3RhaJ1UTQMdl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732630147;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XdFqV87bvCKF9fqbmasfDFCuSHehKZpNIZATTCyQnbw=;
	b=aetlFBmzUHiE7w0dqkAAO4+yxgc0UFhXVzpNyv/j2kIhcoR0D12E8rPwgC3E4iYKIx2rr5
	/MnOAMZR6BOsujBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732630147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XdFqV87bvCKF9fqbmasfDFCuSHehKZpNIZATTCyQnbw=;
	b=04swAq7K4ahkr7D8955XjtuBE8Le+xbze1GXegW6YO3GpN39WQSmrMmA8YB16sSyV0SvUd
	Wu5juCqHneimWReCvbrcIKImGuoSj+hctAat0+MrSptdgh3ZJdHYkq3VOKCvyaEs8uujSE
	Otzo7RjlxBpBA1AX6p3RhaJ1UTQMdl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732630147;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XdFqV87bvCKF9fqbmasfDFCuSHehKZpNIZATTCyQnbw=;
	b=aetlFBmzUHiE7w0dqkAAO4+yxgc0UFhXVzpNyv/j2kIhcoR0D12E8rPwgC3E4iYKIx2rr5
	/MnOAMZR6BOsujBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 104E5139AA;
	Tue, 26 Nov 2024 14:09:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZyJNA4PWRWe/cQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Nov 2024 14:09:07 +0000
Date: Tue, 26 Nov 2024 15:09:06 +0100
Message-ID: <87ed2yaxz1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Set pcbeep to default value
In-Reply-To: <2721bb57e20a44c3826c473e933f9105@realtek.com>
References: <a76a10fc88e740f2b157375d44f167c7@realtek.com>
	<87r0731uk1.wl-tiwai@suse.de>
	<cb9caa0e01f34e3b881bad24701c741f@realtek.com>
	<87v7wbxti2.wl-tiwai@suse.de>
	<2721bb57e20a44c3826c473e933f9105@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.969];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.29
X-Spam-Flag: NO

On Tue, 26 Nov 2024 09:05:37 +0100,
Kailang wrote:
> 
> Sorry! Attach again.
> 
> Add ALSA: hda/realtek: to Title.

Applied now.  Thanks.


Takashi
