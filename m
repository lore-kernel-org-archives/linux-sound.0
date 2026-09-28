Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B972472B8
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599059; cv=none; b=EDDQNZgXjz/OLfWn6ozk3JUYetHFFDmtJ9gFE5TV5OqnasS0kWbKSoLnKAgcW+/IzWRwRw/r4ooH352ioIZKldkG9DA98D/y8rc7lb6TIEvs0qwSw9ksmKnD/++X8hOrMRHrlbXc1jHXuo5Ca9ploUzywif6hWCwPYqqtM1qDRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599059; c=relaxed/simple;
	bh=2x8yhHh2kmEQVXLaDHl+36Q7EfNAdtmGoUFGxWLkQrc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uhkKvMh28zWnmBzQSWJDt0wVs9CK/I60pcQ+E1M8APiOdmXuYEBji5L9qs3tgKHks1Dxa6OH2vdYyvbkytuhK1T4fGEAlf5CH3xYnAydN/m+Cfs9Su2DNqoSHkoiNLtzbxL3B73B+Zjr/wv9GdgQQfNEFevsZwLEvQf+BIvzI5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r61pa3IY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MWNXg8OT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N1UUHcQn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=orUzpoIZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r61pa3IY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MWNXg8OT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N1UUHcQn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="orUzpoIZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 629BB22349;
	Mon, 28 Sep 2026 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t60G93mok5MZCTSXdVRlQDK2imIweju8TvU0Mluj0e8=;
	b=r61pa3IYxh0R5blWJ7E+7MUH0uPwwTjW+rFJ2ea4JRYCo/TsDR+vR9gwLZ2pV74jxZoN7i
	uIJWup4+h6BGHOHEuJdLodvpof2qlG1Hh0/wfpciDGvOXVKpV3QuZ7ccHfgQU1Nb8m+LId
	Vem9SZyByeDAdCq1cBjveQzLxN/uasI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t60G93mok5MZCTSXdVRlQDK2imIweju8TvU0Mluj0e8=;
	b=MWNXg8OT4CnaV3Iuo4OseUDWUlTpEp3a7wKRt5Qh71JJS5/YUVvxZU0VSO+mEyGAI/O+3h
	ODTftEJhVo2ApkAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t60G93mok5MZCTSXdVRlQDK2imIweju8TvU0Mluj0e8=;
	b=N1UUHcQnolobzhuQUB4HoxFHCZh3u022/m6N3B9EEo6d+EU1CY5cQQtIRNWPv5nyl0VcH1
	XCQKm/OuR8U2K25F56ToujZ2cEpAwy9YSFGb89Uw3myN8aJmCSsqfXLhuR1nBBaiTZ2Bj+
	GzU6wq+fFIMg7FmJbeY81QVF0Hsnpjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599047;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t60G93mok5MZCTSXdVRlQDK2imIweju8TvU0Mluj0e8=;
	b=orUzpoIZIPcuUbg5BolexadLFZjV9AAfCBU96mvEsJJ3rDJSIPqdFkR7KYCXkb3Btq6ToF
	gaPa2OICgu0GLXDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20BC1133F1;
	Mon, 28 Sep 2026 12:37:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LBaCOoZfumoGBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:37:27 +0000
Date: Mon, 28 Sep 2026 14:37:26 +0200
Message-ID: <87a4p15z7d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Saim Masood <s.m.saim074@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speakers on ASUS ExpertBook PM3606CHA
In-Reply-To: <065927dd-cabf-449a-992d-64887eedda01@gmail.com>
References: <065927dd-cabf-449a-992d-64887eedda01@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Sat, 19 Sep 2026 02:07:09 +0200,
Saim Masood wrote:
> 
> The internal speakers of the ASUS ExpertBook PM3606CHA (Realtek ALC256,
> PCI SSID 1043:3501) stay silent with the default codec setup, and the
> headphone jack is not detected either.  The codec needs COEF values that
> differ from its power-on defaults: COEF 0x10, 0x16, 0x35, 0x37 and 0x57
> on NID 0x20 have to be set to the values used by the Windows driver.
> Toggling the codec GPIOs, and the existing ALC256 fixups alone, make no
> difference.
> 
> Apply the COEFs from a new fixup at the INIT action, so that they are
> restored after resume as well.  Chain to ALC256_FIXUP_ASUS_MIC_NO_PRESENCE
> to keep the headset mic and the jack detection working, which the
> fallback pin quirk provided before for this machine.
> 
> The COEF values were found by the reporter of the Ubuntu bug below, who
> compared the codec state against the one under the Windows driver.
> 
> Tested on an ASUS ExpertBook PM3606CHA (BIOS PM3606CHA.304) with the
> change applied to v7.2.5: with this fixup alone, the speakers, the
> headphones with jack detection, and the headset mic all work, also
> after suspend and resume.
> 
> Link: https://bugs.launchpad.net/bugs/2167288
> Signed-off-by: Saim Masood <s.m.saim074@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
