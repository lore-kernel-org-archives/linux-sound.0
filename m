Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A1A286415
	for <linux-sound@vger.kernel.org>; Sat, 21 Mar 2026 05:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774070392; cv=none; b=c5PIDHCmVcZZv/dhhS/SFtNoFQ31ahvD2wUVEZimgIBWhhPGQ7cVBeZFhHFtZm2qj2uoWO1L+wdJxHZ4jk60c+edtBO48lstozI/n05JhEHduG+Lh0U+Z/21Qp4IP9+ZP/EG6RjQDuwWUnoylAFvj3gP4/9KfF/UELKUOTzkrrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774070392; c=relaxed/simple;
	bh=m2z7Z52vEtkmXpDXSDrHJQBpSL7yZOVxmPOqmW4ddH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agHnmHQG5kheominV/TpkZkj4ubIRi0TE0lqCAuruQpZy92oJ7Vx3o585TbjT2I0WZCOpdoJR4s1EdPZFiKTKJaYX/d7M0q0OgTDT7u44VMq9APaA8AuuMevES/9l02LYFgBD9dF+PofNLOFv4O3n9Gn1+ghDQqSx8Dsm/+Vw50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGlR7fH9; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGlR7fH9"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94abd52b274so623318241.3
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 22:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774070390; x=1774675190; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SzhWVO+ZYP8rYycg/NZNrY/PYPY5m4ICbKQOoOjSETU=;
        b=AGlR7fH9HAHtS0jE7X6pZoqYOPzuspU2DoRZI8MseJ1jNkv44LSv3aDHb7wC1sIoM8
         Dz7YZeWv4wwSlTgmVgd3QUqAnJiYjnt6c4m+biGdgQW4turT1sKa+EXPgHRc5Mi4bruw
         frklEsjyEHMlvc7jkqO2iEEp13o1DMg1rmcuKb4bd8Y+ShGwywI2ClwhD8xTwjr4GHwV
         067czPyk8GuF1CWxP1a24Y6V0QprwtJjp188y2BXAKhJy/ntySodfy388t+JYj8KEKRd
         nop1HBOdCSmYjHvOOiJDHpIKYRHqCHdtIkNHkUT/gPljd2kxL9ewqMommGeHBlMa8HQp
         ZvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774070390; x=1774675190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzhWVO+ZYP8rYycg/NZNrY/PYPY5m4ICbKQOoOjSETU=;
        b=FwIxE5MqR1VyD0w1kd7W2x6nXhVIsebwHHymLTJXNxjYIiMt1SXXhHG8joI/iP3qwt
         u4AUkhMfIIFftk5hmSYbjgRBeXt0DpWZvrvKI9YFxdFw6e/RgOELVxZqxC3n5H37zOjX
         qv4DEOUah9+rON7SjfGdCLM3meLz/o2tOx8rKXqqppOvoU/1FwNruvPjZ6RNR5WpX89q
         u3FaPiHWBJURcTKHQEoasbWJGzEMCwfFL5x+A9ffqztJYZfUB3JyrTg8Hk2Gs8P1KubK
         qC4VIfwH738gjCRgMPR1CqKwN00pQtlCXbkbEI9x88SZUeSwox1z3rc1ooZ/XAgukgfc
         3oug==
X-Forwarded-Encrypted: i=1; AJvYcCWCCjefS0rQHCM7MBVFc0aqrZ0ueG6rr52OQe4dt4EazeUg2CTGANtSm2iV3sBSba4eVexn7wrqtggK9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5hWerx7D4zNlyAJFu87mrlUIlgh0DimsYf4hCH6YstS5Cq4yh
	oKtw0VMlAqJ5aEoYViIpXFleVJZdMQh4iFiSAsV6CqBafRPAen7WOuqVCsB1VMYy
X-Gm-Gg: ATEYQzy7Vjg9MFR0xzP8wp7bsj3u2so643HqwDk6kfSc2qLN7fA5RNhGoWtjCtvgqPl
	+8Va9Uj4YuPniPu1+XMY/drqLCcsF5ZNzT3fQdWXxc7l6FiYZx3qrkEwN9Bf8pLO3dc0caNlN9F
	rI7D64Xa9rkvXHpSsQ71RfjqvToBT+wdTsKhb4tBnVGFdqGXd8qtsGQFoLsra42pB/NQA6rQhUj
	D5DoXweI1BOhfEJ2Ybx1YmrPFTnyvFovkVunTXeNBFeLffBYZRqzOPWEh5YcGz1SVwsdG87iguo
	73TawlV9mpRWpVg9+gyQ5avu2lfyZKda9lUO/wf/TfcY1vh/5+5/EyFyTFVihTYVTaF76X11ahz
	Cle+b86usaewe7JY3XUHPA+hUHVsG6DsBIJpRrGPWHZYzQVQS0Ek434G/P22l9lgKl+k17qMZWK
	fcNRaQLvwIZdGZgqT6OpsVwXV0agAoPtiZMJk=
X-Received: by 2002:a67:e703:0:b0:602:91f2:6b07 with SMTP id ada2fe7eead31-602aeca3620mr2490483137.23.1774070390301;
        Fri, 20 Mar 2026 22:19:50 -0700 (PDT)
Received: from localhost ([2804:984:80c:b000:ea0d:627b:10e6:d9a6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8ae780sm2423397137.4.2026.03.20.22.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:19:49 -0700 (PDT)
Date: Sat, 21 Mar 2026 02:19:46 -0300
From: =?utf-8?Q?C=C3=A1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: reconstruct compat appl_ptr in SYNC_PTR ioctl
Message-ID: <ab4qBUW2lnc1_PyX@ortodist>
References: <20260319-alsa-pcm-compat-syncptr-boundary-v1-1-ce2b2a61f167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319-alsa-pcm-compat-syncptr-boundary-v1-1-ce2b2a61f167@gmail.com>

On Thu, Mar 19, 2026 at 01:23:40AM -0300, Cássio Gabriel wrote:
> The compat SYNC_PTR ioctl exposes appl_ptr and hw_ptr in a reduced
> 32-bit boundary domain. However, when compat user space passes appl_ptr
> back to the kernel, the value is currently fed to pcm_lib_apply_appl_ptr()
> as if it were already in the native runtime->boundary domain.
> 
> This leaves the compat SYNC_PTR path asymmetric: appl_ptr is exported to
> compat user space modulo the compat boundary, but the value written back
> is not reconstructed in the native boundary domain before being applied.
> 
> The mismatch becomes visible after appl_ptr wraps in the compat
> boundary. At that point, compat user space sends a small appl_ptr value
> again, but the kernel may interpret it as a different native appl_ptr
> position instead of the nearest congruent position around the current
> control->appl_ptr.
> 
> Fix this by reconstructing the compat appl_ptr in the native runtime
> boundary before passing it to pcm_lib_apply_appl_ptr().
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
>  sound/core/pcm_native.c | 50 +++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 46 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 674b50c7c5f6..f2e2854847ae 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -3228,6 +3228,45 @@ static snd_pcm_uframes_t recalculate_boundary(struct snd_pcm_runtime *runtime)
>  		return boundary / 2;
>  }
>  
> +/*
> + * Reconstruct the nearest native appl_ptr for a compat appl_ptr
> + * value modulo compat_boundary.
> + */
> +static snd_pcm_uframes_t
> +snd_pcm_compat_reconstruct_appl_ptr(struct snd_pcm_runtime *runtime,
> +				    snd_pcm_uframes_t compat_boundary,
> +				    u32 appl_ptr)
> +{
> +	snd_pcm_uframes_t cur = runtime->control->appl_ptr;
> +	snd_pcm_sframes_t rel; /* relative offset */
> +	snd_pcm_sframes_t new_appl_ptr;
> +
> +	if (!compat_boundary || compat_boundary >= runtime->boundary)
> +		return appl_ptr;
> +
> +	appl_ptr %= compat_boundary;
> +	rel = (snd_pcm_sframes_t)appl_ptr -
> +	      (snd_pcm_sframes_t)(cur % compat_boundary);
> +
> +	/*
> +	 * Pick the shortest relative distance in the compat ring so the
> +	 * reconstructed native appl_ptr stays nearest to the current
> +	 * position.
> +	 */
> +	if (rel > (snd_pcm_sframes_t)(compat_boundary / 2))
> +		rel -= compat_boundary;
> +	else if (rel < -(snd_pcm_sframes_t)(compat_boundary / 2))
> +		rel += compat_boundary;
> +
> +	new_appl_ptr = (snd_pcm_sframes_t)cur + rel;
> +	if (new_appl_ptr < 0)
> +		new_appl_ptr += runtime->boundary;
> +	else if ((snd_pcm_uframes_t)new_appl_ptr >= runtime->boundary)
> +		new_appl_ptr -= runtime->boundary;
> +
> +	return (snd_pcm_uframes_t)new_appl_ptr;
> +}
> +
>  static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_sync_ptr32 __user *src)
>  {
> @@ -3253,13 +3292,16 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
>  	status = runtime->status;
>  	control = runtime->control;
>  	boundary = recalculate_boundary(runtime);
> -	if (! boundary)
> +	if (!boundary)
>  		boundary = 0x7fffffff;
>  	scoped_guard(pcm_stream_lock_irq, substream) {
> -		/* FIXME: we should consider the boundary for the sync from app */
>  		if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL)) {
> -			err = pcm_lib_apply_appl_ptr(substream,
> -						     scontrol.appl_ptr);
> +			err = pcm_lib_apply_appl_ptr
> +				(substream,
> +				 snd_pcm_compat_reconstruct_appl_ptr
> +					(runtime,
> +					 boundary,
> +					 scontrol.appl_ptr));
>  			if (err < 0)
>  				return err;
>  		} else
> 
> ---
> base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
> change-id: 20260318-alsa-pcm-compat-syncptr-boundary-0d52d2f8dc7e
> 
> Best regards,
> -- 
> Cássio Gabriel <cassiogabrielcontato@gmail.com>
> 

Please disregard this patch.

After further analysis, I concluded that the supported 32-bit
compat flow already handles the boundary correctly.

Although native PCM setup creates a large runtime->boundary on
64-bit kernels, the HW_PARAMS32 compat path reduces it to a
compat-safe value, and the SYNC_PTR32 path passes appl_ptr
through pcm_lib_apply_appl_ptr(), which already rejects values
greater than or equal to runtime->boundary.

So, in practice, the compat sync-from-user path already accounts
for the reduced boundary correctly.
