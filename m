Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB9E213E77
	for <linux-sound@vger.kernel.org>; Tue, 20 May 2025 06:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747720919; cv=none; b=oBjVhUfns0aoRxphirpQ0OLYucNficnVumGpGFbA0WCKbPYQuC0nM/JcGdZFWJydRojvm8oruxpR/VyJXizSeJjdUZH/RNsplMYxlJlDAmAv2Q1XYkr3oPhYVBaRHW8Qdw4zm0/Fc3+Z5Y7D3vqH2Ps427+Bip3rSc74u0CmrvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747720919; c=relaxed/simple;
	bh=68hYLa/1khIONIfR9S+azS9t2WuAU3FTbh2Y1O4VgxU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHSWJEv+vtg59VCrbstBwxmbp8fgoKr4SVbChpwE949yo2M5db7b6gGCiM4UtVkWj1V4M6kbAo6OQvC2UTYelqSOiIeNLjqhfeDQVXJ98neyOuiMmaZPkASIBJVhxlb/PPsFudMxMb7hk2oqYkqAVC3WrvSGEEOfaD3pYwdn2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kj/elqNg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6AOsW4jh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SX+Oc1Wa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pklkAexd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kj/elqNg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6AOsW4jh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SX+Oc1Wa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pklkAexd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1AF88205D0;
	Tue, 20 May 2025 06:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747720910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CyOKSBpnibxGtXRo5GCpdUKaNbw/qvB+v4F5UK+G0k0=;
	b=kj/elqNgtIrfBML6e13diSy7qukaIy3++kVxV3QOSae+U9wNcCCVBEgiI2SHvE+EsTJgV/
	1CsqKKoZStOIzRi0mNLYCUQuNNl1dc20wy3MhpDa2gE9N0R/VhnXDfps5QgPFesQznLAkd
	JlL/TaDoGthxX18bED8SP5gZY5VLbC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747720910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CyOKSBpnibxGtXRo5GCpdUKaNbw/qvB+v4F5UK+G0k0=;
	b=6AOsW4jhAntjfYxKsM17IAKAfjfYUnHJzT6xV7/+FGk/VeZhq86D1fSR9mz7AfJdN9ozG+
	rROr7gDWDykxoxAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747720909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CyOKSBpnibxGtXRo5GCpdUKaNbw/qvB+v4F5UK+G0k0=;
	b=SX+Oc1WadYyIFsE42LgQJFyndcCJ3//355Z8FG1jQGD3UWY+kYAYQlgTNgtqMic5ixU+xj
	5lxYUJuB09HeTmG4fCJ0MH6+5Htc/UJPCcpL+7hkj5+MIDPnq93/rEkGLKbdnSg32Gab/Q
	egiUOpihYMlSMjkFmMCxGx99/S/Cckk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747720909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CyOKSBpnibxGtXRo5GCpdUKaNbw/qvB+v4F5UK+G0k0=;
	b=pklkAexdtXGpjLE+gH8Fw4Eb7nX2mir/ko4v546Yv+Fu8eSwJffUo/UtUeauxAtwpX+U8C
	rrdbaNoSJsxuZ5DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 039EF13888;
	Tue, 20 May 2025 06:01:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y0QTAM0aLGgQIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 May 2025 06:01:49 +0000
Date: Tue, 20 May 2025 08:01:48 +0200
Message-ID: <874ixf6cs3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ed Burcher <git@edburcher.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10
In-Reply-To: <20250519224907.31265-2-git@edburcher.com>
References: <20250519224907.31265-1-git@edburcher.com>
	<20250519224907.31265-2-git@edburcher.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 20 May 2025 00:49:07 +0200,
Ed Burcher wrote:
> 
> Lenovo Yoga Pro 7 (gen 10) with Realtek ALC3306 and combined CS35L56
> amplifiers need quirk ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN to
> enable bass
> 
> Signed-off-by: Ed Burcher <git@edburcher.com>

Thanks, applied now.


Takashi
