Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1623F65F6
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853170; cv=pass; b=pbKIKnZy6XTYr7UfFrfSONLZf0aQoxV2XnmKbObVfo3hwv6XBTH8LZ3+g1Pp+LejQGvbSOD3Nls9IvH7VJvOpRaOb6hWAz6pfcPp2P6cIszha53QQ3sqMfiUj/ymdvqGUZmr2SwSq+r5F+E8dkBeU8/rCzGdeoS5mY1tUxu4mQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853170; c=relaxed/simple;
	bh=zexJpO5tXmn8HAg25izfUIHU0LdTYmQLXuVMKzDs2bE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hcwkbc2VapYVcPIVXpkkfqvonuerlSVAu01nUAcNPmla8jI/NBW03xGFIlE2zPR0RlQBJKFAg7nVL8r9+0lKjvyaNrZkGIggWbTW1aQkPKesEOtetiZ6LicVYZ8xm6QjYkHdPfMg9g1Hrotc7mLFobcwTUYFBYca3v0FI3Y7oj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3TVNuf1; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3TVNuf1"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso5729177a91.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 07:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785853163; cv=none;
        d=google.com; s=arc-20260327;
        b=Q8uQBBC2GVkDykcLGFUzKVZCyfELzor9+3WIr+NmfXyVH/JG/NWuXTnsXKF3ZMYRxp
         nusQCdoJLPEDmcs6KbOiEPh8OgfqzucYeaBP7TrqkBdctHuc5Z+39K/1kYAJHJLeMTeZ
         yxwOnT1kpDPh0uGz0M4fIvFFSlsOeccNxuGehMNXWgFCFIhXLvKdN4SP2LgILGEmqAhe
         tTQssWpU6Txyipms7yXYoMqUXvBm7brdwo/MIi6r9Jf89/vi+1Zx5IAt492lOMVf9LYG
         jX9H/1YCrAO0IqaeTAlI0fJBs7gDbkQtMB/P+7lQuZHxlQD0nKZVO/3/8MoAxxx1YFeQ
         F0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nkmkxc4DOuqtEwvtF2rpwARowqLW40SS4Qr/sKzRoYg=;
        fh=jPLGe/MweHvQzdUgIWy9SmbpsmUBOcmO9BYpCel1+qg=;
        b=n9yBgT9dsAyTFyptgat8xBqya+E+ByqeQoAOd92HUlQu6QZ27oy/XZXaI5YyzScbFR
         xyDoh5NOkyiHz6jsf9S5AHU0ZVkC7nuCvqkgRmSEBqUESgOe5v8MDBFEHQOuBBG9N68h
         j6Z3XMdXLxlapwnsMDw3sNNWGzLdYyJPFBVR0sIM3EKdpXar2qJUgwKFJqO95n84gQV5
         JaKBFho3NKrIsWMIronSn6MbFSycUCc8JEeIkqaXUVdzVoGSm3KAMoLhuqI/y5wenmW0
         xG0Qcu0IbdZyK7BdDXTbktxcjyQsHC7jwG9MQiBKY9/V3bUJj1nHvnx0pmp4y/+gE9j5
         Gq8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785853163; x=1786457963; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkmkxc4DOuqtEwvtF2rpwARowqLW40SS4Qr/sKzRoYg=;
        b=l3TVNuf1h1uuD0q/wkuHkx4uHx+HgMh+XA2mnP318YXgoswxfYU2l2zuW7ZWgExEqZ
         g4lZtqMi3inQ/oWbA/jCbb0PitQYdd9Mb/bt4VjnbQL7C8mJ2sWclEgw8Ny70D6BXBBy
         YLl5j4QnhwRXFrWZOj0oRBnmHxCB+qS3bU1MblGYVRluJ8ki9AAIHIHE7KcwIrBuW8Zo
         7G565DsIFm11chGOi5meiyy6k0Gks/vc3GQmGKcfebTLTVYapUM6ajKY88wHmXBoo8rr
         3pa3DLRouRsn0c1vfXjWrNEQAMAFJHeeSTjHzAzd+PDRWj04lmKaqw/WiiP4l5nBOZ1T
         JPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785853163; x=1786457963;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nkmkxc4DOuqtEwvtF2rpwARowqLW40SS4Qr/sKzRoYg=;
        b=rsglu97L1EuVYbv1AtB7V+AX/9DGDaO8XX3mm3tcpVH98bb532Qh+gKTw5LTfSnJzo
         QPLaVqYf5+r6xMIZWq8CC1st4JK1JpX7eiGuY6L/hgh6Zmv+2lpMSK+puqV2EQ7Nz+dI
         GWovfRGSN7Cc3HuDVDySHpySFAl5HW9wQ4MzMJ0cSgSloMPbGcN4EFX4A6RVVIiemWbm
         XCk4q2ee7CHhRKq06CZ3I54RrrhlgtH1vWbSDbER78Acyue07z8ot+uq2aAvQZq10pjK
         +wnSTGMGGroP9ZdfkmJJOmxbIMlwpUm6BVaJpHme4mwoBSrMuZMc33gJ4XNEbwSuoZEq
         prEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0XxgehuvyOl/a3F16Sz/2BM0lDhOPwAekdswdX3R9P2DFHdvTEfA8UvDqc4PEYOh20mBFwXYsCfRkfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnFJXXsqaWOPBpXvW9GtFtxVfygCFJcKVaFQFGfyGC4XpDRSqB
	fVQvMx5ipGShcKYp3MBirdFuDmWOB7k3ydqbDH6lYdSaAOEMiQgAmQfD0g/y/ZEk4kzFIHFCMWc
	k7Qh2CFrL+lPsHxPj1wi6YX/0r4EBzrk=
X-Gm-Gg: AR+sD10ter+NkrBZI2pFiqlrsVSKd6VJfBFVVhoU18Mh2oOsCQNHgUcIr9EzSrz2UY8
	hPJA/09evYJKq31vigN0XYKcEFWtCGN1Vs9TScRvMWm+/gCGdPJi+R/OvZVV1kfG12c3NV6m5hU
	jpTFl2wrQE/Yrwb7+0Q8EB/Ei6WY+eGnNgVjJjR7sbVNj+u+HPUeBP2oQKbsVByQUBWCWZkZqtf
	BshL7id6NHkQIS1XPaYX74LTksWlgc1FDNLAaS3bOV7EU+SSUSm7HfiWUsWENKDKAYHujJlFy0g
	U54i+7gmg82xhCXkrNbJlv7U7nQcWC15b3H1NlT8fQkDtMMF035X1GElzI67Vz/au2EjD4xDWBK
	yWVIwDBvDaiaX6C4N5O03iERl57v4xbCHM2pzsnBT3/D2+LempWEy3IICcssDao+dbV3TwMkTvI
	rOJdc4QhzeZt/GiEE=
X-Received: by 2002:a17:90b:4985:b0:38e:4f41:83df with SMTP id
 98e67ed59e1d1-38fbc44465emr15422254a91.15.1785853162959; Tue, 04 Aug 2026
 07:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804043036.22065-1-phucduc.bui@gmail.com> <DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
 <CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com> <DKG2L4V8Q2EU.1W5VODY60D6D7@linux.spacemit.com>
In-Reply-To: <DKG2L4V8Q2EU.1W5VODY60D6D7@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 21:19:11 +0700
X-Gm-Features: AUfX_mx_KW5_NPCjT1WIS_jueD1He7JnKmss4jz44IKDHBp3hMCmxJRzwHiKS0I
Message-ID: <CAABR9nEjZ=qHBHZ6=CWyauOVSnX1isW3Z9+BoSnmvuBBCKHiyg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: spacemit: Remove redundant DAI field initialization
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

>
> More precisely, channels_min alone is not sufficient. The codec DAI must
> also support capture (or be the dummy DAI for a dynamic link), and the link
> must not be playback_only.
>
> Under those conditions, the path is:
>
>   soc_new_pcm()
>     -> soc_get_playback_capture()
>     -> soc_create_pcm(..., capture = 1)
>     -> snd_pcm_new()
>     -> snd_pcm_new_stream(CAPTURE, 1)
>     -> snd_soc_pcm_component_new()
>     -> dmaengine_pcm_new()
>
> dmaengine_pcm_request_chan_of() tolerates a missing "rx" channel and leaves
> pcm->chan[CAPTURE] NULL. Once the capture substream exists,
> dmaengine_pcm_new() returns -EINVAL with
> "Missing dma channel for stream: 1".
> The conditional initialization prevents the CPU DAI from advertising that
> direction for a tx-only node.
>

Thanks for the detailed explanation and for tracing the call path.
I don't have Spacemit hardware available to verify this myself.
I'll update the commit message to reflect the behavior you've verified
on the hardware more accurately.

Best regards,
Phuc
