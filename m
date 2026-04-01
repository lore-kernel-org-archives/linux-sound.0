Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346DF3FEB2E
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047629; cv=none; b=cZV9io6oY3eLMe6aFbUdC23qKOkay1TCAw7XA3Oi+xFScA9hgf+5At2ts0XR1j6/gm8ruUrbwcxgXqW3PHEO66d3hn45HxjBa27AxQFZ4cHmp9MRUXAWNZcmm/CNtmUDPyvtaRVEg4mwb4TcZubE9BIVvL1NNSJvaTiRdVYlG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047629; c=relaxed/simple;
	bh=GmzmzNQVDxBOf3oN/PR6GDOypv7Dgl7auJiB82M4cjg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ttVNuKSN4+SO3/aPLLWIB0Ajl8obcvJZdxjBfA3alH2Q/yK2l70Ov1R1uVwwEsfnwRvdyUQnHsEE6pO/Sl3hTo1XATZHREHpxx3ccByVRhtRvOT8YF9iqk0gCo66Wf1zgefA/v70jhx76NAMih4sB504ZgVhIGPV7/NVId6jDAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1jRb9Mb2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JcphEtcr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1jRb9Mb2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JcphEtcr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1jRb9Mb2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JcphEtcr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1jRb9Mb2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JcphEtcr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6FB4A4D5CC;
	Wed,  1 Apr 2026 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775047626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7YE1fDglRyngHv5VTHFG/uV5mtbCXuEoH3TT1P5EwU=;
	b=1jRb9Mb2gR+hQvnhF/JD5YsEE7XvQCOSFQNRDFrLpU8ieHM5Wd/YRYc/CaO2PpqlfQpKMk
	uksTGdganAiMGzxaYlHlub0PqcibiPZK0ys9J/k03S32w3ELBn7d1HKpSek2zqxv6kbUeq
	7ihfvvQ72ImH0lptcJu/zjxjpaTNuGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775047626;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7YE1fDglRyngHv5VTHFG/uV5mtbCXuEoH3TT1P5EwU=;
	b=JcphEtcrtS7IMp0qKKUb6lFanMbNkAqOcM/p2JXyeXx8iAsVH+jvCo9bzZWtgHLQWZvk4K
	ZQwO/q23D6ViH9DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775047626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7YE1fDglRyngHv5VTHFG/uV5mtbCXuEoH3TT1P5EwU=;
	b=1jRb9Mb2gR+hQvnhF/JD5YsEE7XvQCOSFQNRDFrLpU8ieHM5Wd/YRYc/CaO2PpqlfQpKMk
	uksTGdganAiMGzxaYlHlub0PqcibiPZK0ys9J/k03S32w3ELBn7d1HKpSek2zqxv6kbUeq
	7ihfvvQ72ImH0lptcJu/zjxjpaTNuGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775047626;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7YE1fDglRyngHv5VTHFG/uV5mtbCXuEoH3TT1P5EwU=;
	b=JcphEtcrtS7IMp0qKKUb6lFanMbNkAqOcM/p2JXyeXx8iAsVH+jvCo9bzZWtgHLQWZvk4K
	ZQwO/q23D6ViH9DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44B894A0B0;
	Wed,  1 Apr 2026 12:47:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8xyGD8oTzWmdGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Apr 2026 12:47:06 +0000
Date: Wed, 01 Apr 2026 14:47:05 +0200
Message-ID: <87fr5ergom.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: es1688: add ISA suspend and resume callbacks
In-Reply-To: <20260401-alsa-es1688-pm-v1-1-510767628fe6@gmail.com>
References: <20260401-alsa-es1688-pm-v1-1-510767628fe6@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.25 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.15)[-0.757];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.25
X-Spam-Level: 

On Wed, 01 Apr 2026 13:45:37 +0200,
Cássio Gabriel wrote:
> 
> The ISA ES1688 driver still carries a disabled suspend/resume block in
> its isa_driver definition, while the same file already provides minimal
> power-management handling for the PnP ES968 path.
> 
> Add ISA-specific PM callbacks and factor the existing ES1688 suspend and
> resume sequence into common card-level helpers shared by both probe
> paths. Suspend moves the card to D3hot. Resume reinitializes the chip
> with snd_es1688_reset() and restores the card to D0, propagating reset
> failures to the caller.
> 
> This wires up power-management callbacks for the ISA path and keeps the
> PM handling consistent between the ISA and PnP probe paths.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
