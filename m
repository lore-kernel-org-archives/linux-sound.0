Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2463955FA
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 13:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024139; cv=none; b=AJkt6VInHnLEaLKokFlb5FOmD/qp1lRk71I1o+6n6wWD9of2972YwU5vAEia8iXKw3ugLjaJo9A5pJiFw6ctmXrImpVfpoknkTz5lbjLkMSrXdrCbEeQUVVK21+yDGSfNnwP4FQcvjfelkimKjynK8sYGY/0hbTj0KUnCisS0NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024139; c=relaxed/simple;
	bh=UC7fDPgI5cTdTdSeS4WdJw9Gh9YJ8+ldq1dJmS5cP34=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GV9+W6ZNhehtZ3tW4JJQzU/m1ZC2dSVbFEoJyY28+wA9I57stW5IYR++vE/N1kEP/VNnLMiz6kqDaSSIb0Z2ONO6XvhnooxEE0bOnT/Monmv4tdOYlB3Cq6gSvK8lmfwUF1NHa+HWuEVszI6vhfPfTfgnQJgTMyN+kz8R+Qka34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DKhltufI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CJigHpvV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c8ksj8no; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1RQaR9Er; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DKhltufI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CJigHpvV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c8ksj8no";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1RQaR9Er"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D3CCF800C2;
	Thu,  6 Aug 2026 13:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8WywXhZa/OitV/VDXTJXu4k0JTdD/5VS/ws3s7kSq5c=;
	b=DKhltufIfBkEScqUM6dQobvxjmv4sLvyFCVo9e9tdAp2tfyByK/CFQbQ8g/5NczQj0Mb/9
	zh7Ze6Ww3qGlPbruuv5xtMgF+IdKBLzVbVaojjY3MKcKU/dptoVsOG+4n/eiW/aTI+brdo
	WN1ET8EmJH4CbXKq3ztb4BqVe4z4AoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8WywXhZa/OitV/VDXTJXu4k0JTdD/5VS/ws3s7kSq5c=;
	b=CJigHpvVIAwz3wBMKU0r/m/xfF03z0cpyBRPVcmorkK8JVAmv/jZiwLR0e6ORft4r59Z46
	qNDSY1vz14+1+bDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8WywXhZa/OitV/VDXTJXu4k0JTdD/5VS/ws3s7kSq5c=;
	b=c8ksj8nosbzx4p8FwpUExtvwyMAyCQQCU1mG1wiTGvHheSLxSQlEEBpr5TRRrB+LddSSas
	9uZORrWgPz/hxMLBb2sGhRjIuhzdZwahnP71P8QsNI1Bt83Os0d1wd3e9gZcgGTEt/kSg6
	hBTB/9fYKc6c0ptew9cnTxtgReAP7Eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8WywXhZa/OitV/VDXTJXu4k0JTdD/5VS/ws3s7kSq5c=;
	b=1RQaR9ErsNE7n6MxTTReaDLp8cJJZizDUersV9QIK7j7oSjFWmalbt9oN0VU+KN7SJk4Yu
	tgJGdw9akD/PYFDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9EA60779B6;
	Thu,  6 Aug 2026 13:48:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YPk6JbqQdGr8MAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 13:48:42 +0000
Date: Thu, 06 Aug 2026 15:48:42 +0200
Message-ID: <87v79ncqbp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH 13/31] ASoC: rt1320-sdw: Use auto-cleanup for firmware loading
In-Reply-To: <0552108d-13f0-4ae5-b620-a49f5295e9d4@sirena.org.uk>
References: <20260805135247.670693-1-tiwai@suse.de>
	<20260805135247.670693-14-tiwai@suse.de>
	<bed1131f-59a4-4da7-994a-d1d5a6728603@sirena.org.uk>
	<87wlu3em39.wl-tiwai@suse.de>
	<0552108d-13f0-4ae5-b620-a49f5295e9d4@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 06 Aug 2026 13:52:48 +0200,
Mark Brown wrote:
> 
> On Thu, Aug 06, 2026 at 09:37:14AM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > There's a goto further up that jumps over this which clang warns about,
> > > this will break the build.  Landmines like that are why cleanup.h warns
> > > about mixing it with goto.
> 
> > That's an issue because I moved the declaration of the variable fw;
> > if it's left at the beginning of the function as it was, it should
> > work fine, like the patch below.  The same applied to the error for
> > wm2000.
> 
> Yes, it's fine when the declaration is at the beginning IIRC (though not
> ideal stylistically) - the warning is generated when a goto jumps over a
> declaration.

OK, I'm going to submit v2 series.


thanks,

Takashi
