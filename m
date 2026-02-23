Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13833491D6
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771836671; cv=none; b=XC2eHrZpzTCswcfUzI+iZ9NJKfovBOfN/6l4ICD9ZkHf6xhGT1xmazbCxVplg+51/KybkZ3YB84HWzs0YrkNUnU+ttJLXAJ4mrWDZPhu1gyTXVHSDcqIwphSnvyhkT0PxeZncwpreESS1ESo6S4cHFpGa9OCzzblQxI8U4guvBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771836671; c=relaxed/simple;
	bh=Wml5/a0xLKpxzAIiktcB6ycfHbaMQbFz0v3xTOUUbF0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ACe0sHYg4lCuY7I5HlGe0rkSgr5Nb6x+LRvpgPMnW/ibcR/TdhOAZ7vdnY+DF+5ZKGN2st8EbG7nLeptc1yo/OpD09L4y0Pepx5hlLWp4uipeZCTKMDuzcmLpU7VtRjwFZC5N+15UB6YfzrNn8q9s9tELGjlmP70DyI8eWF07NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EkX2sOr3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T6VLCxT/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qq8C+ff9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XnK3rByJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EkX2sOr3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T6VLCxT/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qq8C+ff9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XnK3rByJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED7EE3EBA0;
	Mon, 23 Feb 2026 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771836668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IfeLpCUDhmM5Ji3ZzYoYtyi4AXV/pQuFz6bnFMiLB7o=;
	b=EkX2sOr3ATh8Av8fKsL4Sd15hmLouu6KxNaqXumN8Ih6Vx1elJ6FbxqSXr3NUpbTYGA9Mf
	wNdFlyPkgcIUO4APZEVw3dOHAe5xc3GdJqg0hhGxeickLC9pjdfPtRcUj7D19gitmdwSl0
	9hQHjOiyZLPO9Dv6gwNqkIkpeGKGPSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771836668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IfeLpCUDhmM5Ji3ZzYoYtyi4AXV/pQuFz6bnFMiLB7o=;
	b=T6VLCxT/wR6OPeShkksJKtov3UL0l0Vio6z/GmSrTSLCAowADfgn8jmSbjICNjaFEWCOOW
	2CzQ8Cpv4kMoOCBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771836667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IfeLpCUDhmM5Ji3ZzYoYtyi4AXV/pQuFz6bnFMiLB7o=;
	b=Qq8C+ff9PucJfOWz8vRyVhyHauLta7wDOh3+3kJbPdFijTqbgnNZtBWb5N5OELXUaHQ4h6
	VGBsgJrC8oClQZyOGzoxVWDTCWrm5myztwIkfeaTg9hNXhpnv1fBROAZqLPdkDYLJ4NU3B
	Z/nWvHfXAf8UT20hGicF0zkggHn8DFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771836667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IfeLpCUDhmM5Ji3ZzYoYtyi4AXV/pQuFz6bnFMiLB7o=;
	b=XnK3rByJiusHJJZTBZGHh/XCKI8RRk7TYqqSQyzFY34yjMba7vgoEvPQTAWm2PnQ5h6G/C
	79aaaM+TRyUXcnAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F4EB3EA68;
	Mon, 23 Feb 2026 08:51:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id erCMJfsUnGldegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Feb 2026 08:51:07 +0000
Date: Mon, 23 Feb 2026 09:51:07 +0100
Message-ID: <877bs3n8qs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v6] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
In-Reply-To: <4d5fb71b132bb283fd41c622b8413770b2065242.1771532060.git.sean@starlabs.systems>
References: <4d5fb71b132bb283fd41c622b8413770b2065242.1771532060.git.sean@starlabs.systems>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 19 Feb 2026 21:14:26 +0100,
Sean Rhodes wrote:
> 
> On Star Labs StarFighter (Realtek ALC233/235), the internal speakers can
> emit an audible pop when entering or leaving runtime suspend.
> 
> Mute the speaker output paths via snd_hda_gen_shutup_speakers() in the
> Realtek shutup callback before the codec is powered down.
> 
> This is enough to avoid the pop without special EAPD handling.
> 
> Test results:
> - runtime PM pop fixed
> - still reaches D3 (PCI 0000:00:1f.3 power_state=D3hot)
> - does not address pops on cold boot (G3 exit) or around display manager
>   start/shutdown
> 
> journalctl -k (boot):
> - snd_hda_codec_alc269 hdaudioC0D0: ALC233: picked fixup for PCI SSID
>   7017:2014
> - snd_hda_codec_alc269 hdaudioC0D0: autoconfig for ALC233: line_outs=1
>   (0x1b/0x0/0x0/0x0/0x0) type:speaker
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Stefan Binding <sbinding@opensource.cirrus.com>
> Cc: Kailang Yang <kailang@realtek.com>
> Cc: Chris Chiu <chris.chiu@canonical.com>
> Cc: Edip Hazuri <edip@medip.dev>
> Cc: linux-sound@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Suggested-by: Takashi Iwai <tiwai@suse.com>
> Tested-by: Sean Rhodes <sean@starlabs.systems>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>

Applied now.  Thanks.


Takashi
