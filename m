Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5139099B
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777466392; cv=none; b=EI8xZ5my2VV2yGsemVOfcuBB/MnPTME0PYTVMe93BObVcpAzSuQm5oaxOmMro8s4AuHJNPaM58cZPi3wD3uEgM8l+GFZqFa9hRDZ0oqKuA8MNN+AelJ0c0sfL8sQfMovl+MS/EjeYc3/Gshp7wcr0OlsDnMK5hDnrxYT2gLiJDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777466392; c=relaxed/simple;
	bh=8+O3COE1Z+pUyobqVrAD/f8ZLdqBqGMD7IG/tHKnHiI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ngOlJTznD3DF/rW14RdAT3tkPWvwtSzlvMeDGm95tFXYdzQuOL7a6SOzoU8fAHkl93jke6G2erIw/72MgGRHTduRek0oS/uNHzeqNWqCbPypv1VB/FKyV9BCW/WUxfmCQ3BIWt3UHY0hkmTbCai6P1a/+5WvKdzp18m9E8LK0YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lEwQyMub; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i85lyKlq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z3N1zldd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MX1WZpdu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lEwQyMub";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i85lyKlq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z3N1zldd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MX1WZpdu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B637D6A867;
	Wed, 29 Apr 2026 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777466385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGzGyINWDwOT/90VyjPnOWJkV6LVplsaQQ3Hq+fssVQ=;
	b=lEwQyMubb0aWLm2w9G9d5or4eHEdFtuuCc4iagfaUnamV6csOWz41xEr9Qtj8KjEhM2XNF
	aoZa0/Knh8v2gx0T1hkFAuWrgtcOyCs7/sin7nI1crXaZiX+APMD/6+xo4Rr74w2fa87BH
	0BK8qmswQOBw9YRrS8JYjTpBpbW+AUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777466385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGzGyINWDwOT/90VyjPnOWJkV6LVplsaQQ3Hq+fssVQ=;
	b=i85lyKlqD1vpiH7oV9dVVRZgE1fpxHIC+3nsgOFCoX8mDfVnFURf66weHrDPCBlWPBS85y
	hj89mz/P6ytbviAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777466381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGzGyINWDwOT/90VyjPnOWJkV6LVplsaQQ3Hq+fssVQ=;
	b=Z3N1zlddi71sD4kpSzWBKrFNTYnhUkHvB1hS72TL+JcreUA1niJg/GuIbtlhjltofbz+BR
	qNTeanmkURdnqmvJnzFw7YG0Jnfco8KfqT+NUx8SCUZz8W1i6XprBHlyz4khtytUrfrCHw
	eAukRF9/hc/qzOYCnFSzRTKP2ExLIWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777466381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGzGyINWDwOT/90VyjPnOWJkV6LVplsaQQ3Hq+fssVQ=;
	b=MX1WZpduvvbIbKIBB+n2thPpb+ZntEmFRATTvfy2Wv9dVjPmxETDe8BY4vNOC7WwZBj+KR
	8nGI26hPhptD8eCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F58C593B0;
	Wed, 29 Apr 2026 12:39:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jvYvJg388Wk6dwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Apr 2026 12:39:41 +0000
Date: Wed, 29 Apr 2026 14:39:37 +0200
Message-ID: <87h5ouos8m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ac97: drop stale CMI9738 PCM-volume quirk
In-Reply-To: <20260429-ac97-cmi9738-pcm-volume-v1-1-d3f90cc00604@gmail.com>
References: <20260429-ac97-cmi9738-pcm-volume-v1-1-d3f90cc00604@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Wed, 29 Apr 2026 14:05:31 +0200,
Cássio Gabriel wrote:
> 
> patch_cm9738() still carries an old comment claiming that CMI9738
> has no PCM volume although AC97_PCM reacts, and then forces
> AC97_HAS_NO_PCM_VOL.
> 
> The CMI9738 datasheet documents register 0x18 as "PCM Out Vol"
> with mute and left/right volume fields, so that old assumption is
> not justified.

Well, that's actually the part the FIXME points to.  Although the spec
shows the register is available and the chip reads out, the volume
didn't seem reacting properly on the real hardware, as far as I
remember correctly.

So, it's really doubtful whether it's safe to cut off this workaround
just by reading the data sheet.


thanks,

Takashi

> 
> Remove the comment together with the no-PCM-volume override and let
> the generic AC97 mixer code probe AC97_PCM normally. It already
> checks the mute bit and the register's volume resolution before
> exposing controls.
> 
> This change is intentionally limited to CMI9738.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
>  sound/pci/ac97/ac97_patch.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
> index 64cc39dd2008..5e9f70c47ed5 100644
> --- a/sound/pci/ac97/ac97_patch.c
> +++ b/sound/pci/ac97/ac97_patch.c
> @@ -3002,9 +3002,6 @@ static const struct snd_ac97_build_ops patch_cm9738_ops = {
>  static int patch_cm9738(struct snd_ac97 * ac97)
>  {
>  	ac97->build_ops = &patch_cm9738_ops;
> -	/* FIXME: can anyone confirm below? */
> -	/* CM9738 has no PCM volume although the register reacts */
> -	ac97->flags |= AC97_HAS_NO_PCM_VOL;
>  	snd_ac97_write_cache(ac97, AC97_PCM, 0x8000);
>  
>  	return 0;
> 
> ---
> base-commit: 116ed8afab5e3217561a6a8bc4ca1c3d5d97830c
> change-id: 20260429-ac97-cmi9738-pcm-volume-898bf48a92dd
> 
> Best regards,
> --  
> Cássio Gabriel <cassiogabrielcontato@gmail.com>
> 
