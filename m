Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405022D1931
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396896; cv=none; b=O7t3zW7cNfl5Na/1DPskkbB956hBhZRGK2eyY2K8JBaadXttk/FF/kCtt4KHatYThI//ArnFFchRKXNLLOFxK64SUSflh9WXsZNk/kulIhTKlrcpyfyIArFMhAp30E1nQG78wgK/sh7LUi7FNXLY+IuWeEg+L3zYfEity1nY7z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396896; c=relaxed/simple;
	bh=L4mevEsOtLYhrnmBV+rSDGXWnGrhBQ/+jo7ulX3F5VQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7/+x40cKYPk14nsQ51WVLo/Etss8R6hAmIdJ3Mpp52yce5stIvfnkDr50FT73lJfX/9kCMr7fgYdINWrWTfQk9FZugxjillq2yqXVB5kOExowt16IVFU5MC9Jg05nYpohcwk2yEyR7mSiFoy9/2Ih1nKTxKgw05DxeRKvrIr8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jmXLtTyP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mGfMv7Ga; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jmXLtTyP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mGfMv7Ga; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jmXLtTyP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mGfMv7Ga";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jmXLtTyP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mGfMv7Ga"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 502B21F44F;
	Mon, 17 Nov 2025 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ipq454AciJtSC9guDkGkaX1dQAIAJU8zZTiH/uofSqY=;
	b=jmXLtTyPrredRdcccif/cVVfVa65Lp3vZb9TrHzrjPwB65Pz9aO9wgz6qzfxpuwTnVT6lL
	E4Q9xOSnZhQ1OkcmL1dpfY3Rw3LWnweggMu01x4LHFh2sDYfUw6WWWJfYIC1sFNnJ10z2z
	50hY9mRpBSGeOWKs/x2UI4GTxwvI9LI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ipq454AciJtSC9guDkGkaX1dQAIAJU8zZTiH/uofSqY=;
	b=mGfMv7Gaqwam/29sGXVi4aKKJ8OvlFwGwbM/FBDLFwPxj71xfxmuTzQZdJMMDPAbkTdO7O
	ua8eGFWL2XK7CbDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ipq454AciJtSC9guDkGkaX1dQAIAJU8zZTiH/uofSqY=;
	b=jmXLtTyPrredRdcccif/cVVfVa65Lp3vZb9TrHzrjPwB65Pz9aO9wgz6qzfxpuwTnVT6lL
	E4Q9xOSnZhQ1OkcmL1dpfY3Rw3LWnweggMu01x4LHFh2sDYfUw6WWWJfYIC1sFNnJ10z2z
	50hY9mRpBSGeOWKs/x2UI4GTxwvI9LI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ipq454AciJtSC9guDkGkaX1dQAIAJU8zZTiH/uofSqY=;
	b=mGfMv7Gaqwam/29sGXVi4aKKJ8OvlFwGwbM/FBDLFwPxj71xfxmuTzQZdJMMDPAbkTdO7O
	ua8eGFWL2XK7CbDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 378E93EA61;
	Mon, 17 Nov 2025 16:28:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wIJSDB1NG2lJJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Nov 2025 16:28:13 +0000
Date: Mon, 17 Nov 2025 17:28:12 +0100
Message-ID: <87cy5gfwtf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: i.v.zhaldak@gmail.com
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add DSD quirk for LEAK Stereo 230
In-Reply-To: <20251117125848.30769-1-i.v.zhaldak@gmail.com>
References: <20251117125848.30769-1-i.v.zhaldak@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Mon, 17 Nov 2025 13:58:35 +0100,
i.v.zhaldak@gmail.com wrote:
> 
> From: Ivan Zhaldak <i.v.zhaldak@gmail.com>
> 
> Integrated amplifier LEAK Stereo 230 by IAG Limited has built-in
> ESS9038Q2M DAC served by XMOS controller. It supports both DSD Native
> and DSD-over-PCM (DoP) operational modes. But it doesn't work properly
> by default and tries DSD-to-PCM conversion. USB quirks below allow it
> to operate as designed.
>  
> Add DSD_RAW quirk flag for IAG Limited devices (vendor ID 0x2622)
> Add DSD format quirk for LEAK Stereo 230 (USB ID 0x2622:0x0061)
> 
> Signed-off-by: Ivan Zhaldak <i.v.zhaldak@gmail.com>

Applied now.  Thanks.


Takashi
