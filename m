Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA7228A400
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421594; cv=none; b=ZgaCw6fQ45Bjj9n5H/qK4D/cn3zNmcjrKUGvXQgeAJUJNYt4MECh6cCFoqh1DRm45RBJX2ewsctzM+x211+C4XiD0m8Dm+oxARtlGp7ObSGmAvlJFDZGVDd5ZRCY8UKB+zWYWRXujNiRctguomSPipkcu0HLh9rfD/yJrt6qE7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421594; c=relaxed/simple;
	bh=26LSMY857CcRz8JRTBROMgOasaBUKBV+3qzeLQ0WvyE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b6/sv//9oVHG8c00dVPzRtP3QVCm82sePS6sDJSSCaJJGsMaLEH06PIoQRHmlJ1iLEN9zbVfmGeL17cytEy2BpW9JmesbH6FeYFJg+bOGH1zdmTRub5CPyycbbExRHzirLHokKMwyHsppmVG/8cvxlP0mM5GSdVT9yf9V8uFmgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b8J9LsPo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oR+yve50; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vVef2+dH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ujztlUZ7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b8J9LsPo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oR+yve50";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vVef2+dH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ujztlUZ7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 412B32120F;
	Fri, 20 Jun 2025 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750421591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m7pibm/bIvpzbSUDcmXRHCpoPjJfJ+pH5DnWVONucOs=;
	b=b8J9LsPoPrixy/C4GY9FSwnxJbY26I/Q3Fda+q7fJ/fInIb2dURM4n2A7hkwF0z6Emg2Xj
	GYJk1t6/tDfMCBFdskO4lg7AiUYWfOGo1d5EygELMSveww5pQpC4m9y0eDIibUsW+4Lo1j
	LbBQ2vNwchdOcY6lqRpJ7vPaMXurfUM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750421591;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m7pibm/bIvpzbSUDcmXRHCpoPjJfJ+pH5DnWVONucOs=;
	b=oR+yve5026jw2o6EUJZR1OuJBWHW1BrS/i7kSMsI0PtCqAiNYXFviZ+T/kl3iMFIhpZtbg
	Me4qy/rvITWY8xAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750421590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m7pibm/bIvpzbSUDcmXRHCpoPjJfJ+pH5DnWVONucOs=;
	b=vVef2+dHeiqj/b4wUzxn9yFDZZ7yBCRO7niS+iy8HPGC6wNjnO2cVjbPpwkThrfB+mZz08
	3ZdTmyBNxbMb2or6SxUPax5TlrwFUGzFJF/RZ7Ks5naLVbSibMTmPgEH69PEvOAo8771Mv
	bU4GWXZ1uDBguEyC7mkBt0+iXCwYslY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750421590;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m7pibm/bIvpzbSUDcmXRHCpoPjJfJ+pH5DnWVONucOs=;
	b=ujztlUZ7OLBLpaoeEeOUHg94hDjgyV1dq+bhf+N+Z00HIY5UWzU1Kdr86228fWNfvAtQJv
	eKWMlxIpCyKzF5Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC0B813736;
	Fri, 20 Jun 2025 12:13:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VxQ2OFVQVWgKJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 12:13:09 +0000
Date: Fri, 20 Jun 2025 14:13:09 +0200
Message-ID: <87a562wqzu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: joakim.zhang@cixtech.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	chris.chiu@canonical.com,
	kailang@realtek.com,
	geans_chen@realsil.com.cn,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on alc256
In-Reply-To: <20250619020844.2974160-5-joakim.zhang@cixtech.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-5-joakim.zhang@cixtech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,cixtech.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Thu, 19 Jun 2025 04:08:44 +0200,
joakim.zhang@cixtech.com wrote:
> 
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
>  - fix mic jack detect failed on alc256, similar issue as below commit
>    commit 3f7424905782 ("ALSA: hda/realtek - Couldn't detect Mic if booting with headset plugged")
>  - confirm with realtek engineer, alc256 also has such issue
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  sound/pci/hda/patch_realtek.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index bca725bb8281..a79b542e2a01 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -12193,6 +12193,8 @@ static int patch_alc269(struct hda_codec *codec)
>  		if (codec->core.vendor_id == 0x10ec0236 &&
>  		    codec->bus->pci->vendor != PCI_VENDOR_ID_AMD)
>  			spec->en_3kpull_low = false;
> +		if (codec->core.vendor_id == 0x10ec0256)
> +			spec->en_3kpull_low = false;

This needs a confirmation from Realtek.

Kailang, could you verify it?


thanks,

Takashi
