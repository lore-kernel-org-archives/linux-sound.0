Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7163D7D6B
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780565842; cv=pass; b=Q0sF08M/Ow23gMIDqVaBZyM+qXMvNgss/hMCGRkSPBOImm84GkA8HjEXKR6PIOvS4I6iXy3NBEUwp90yykOSt24RLTK1ILclaA51UxKAgSDiPqgIZ2rdlTbMLuY0DKRjsiIOymrhU6gW+Uy2sHV0AJ1XysWbuGATeXqZJMeSdeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780565842; c=relaxed/simple;
	bh=q5T9rZM3Aio5noPxLVxqh4TcJRM+o6ZrEdGuHWqUiHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjgSDm085pK0UGJYmBKk3oXnj2/ZlTRPs5mWVxUjP6ZnkWeKEGmzt/4swvVu8ES7Zd03yldg1N/Nclky60dcN0Pu4VxnS+o+2T2TbJysjMLNZP6jGYSZp4zmuYXnmmiXq4r6y9YqYlHK9v/bzLxR4WjWcq0vJxdry+g4i3IfHAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzzzSDIl; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzzzSDIl"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8422871b42dso283228b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 02:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780565839; cv=none;
        d=google.com; s=arc-20240605;
        b=MRJwkHTKdXZXxCqpGyt/H6UaxKZ+jMDYQTHicIcRbDfpUkAuz7DCIj81zwVIvsr8MY
         moAcq2lAbW/jPnr4E6AWyqYNpCTl2rLzkKQ8FOBIyDP3qcN3oOAP5VLBbQGP/cHFOjXe
         8+p/RBeWZvuty3pKaiPLd1Z1T909T2LWVjZqYxowhGzyzd8dmMG1+XwmU9vGI3W7WwzL
         Bt9fxzU6OUUP+O/pg9JT+2QJgVeqVzT1LEQaq3oQza3mlneZAeb0oMdIfaoKOlsKzNwS
         2Dj291yZWFPfZ7JHI+ZpJG/zAOBZVffRGVMTYdjG2omJNfVQmR0hIuf7cLfzHhfHze1K
         hr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WAE5dsUcOf+50j6c1n0GmreYE4E4GrWSX2T6ZZrsAus=;
        fh=63ez2bBGJvBDP3mcNldNvL2ejP90T+z/20phexrqFwU=;
        b=S5jqfQoQZbbgHHS26a9jjQhwh1Z8EqYNZ46i1wnTgRzPbWIXppQdYW+11/wRjdyITT
         EaGPKaEC+8jXcII9JU2YB0zGUWiAyp2sB74Fmr8bXn3nJ9PU+8QmQkpVbOfEp4YSQJTK
         E7yrEtYRITq1igjyRYzDKo8A/hK4R7a0NAK4lttZnsrFud/yhIUeCMUL+wMyW/Ui219t
         ZWuQOMqIPUHpu0tKFROLN+Lr3+RVZMhrnZ1PkI5ptT0gCBqwg/vbvvLrNhpcvGIq2/2N
         yt6BCdumQs/W8jy4yeIkcJvZUHTVc0tBVkxTAV63ISNvMk+ub+/J1dxCBiO+/0JLna4E
         QsSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780565839; x=1781170639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAE5dsUcOf+50j6c1n0GmreYE4E4GrWSX2T6ZZrsAus=;
        b=nzzzSDIloSEfI7GLh2+Jy4hatV70I31t1iqG/JJlwGXRBXW2ryRqApFFrkZBSHUP85
         no5DNe6eLGDStWVTLjX8VJM2slXt9vQ88jfT+5USX7FMrjIUMjVijSM64u9o7WzJ+yRP
         KJ1OXb+rQPjiBOES7rqKLqFbfkwdclgjU27HO61JqgFFPOViiPW3GjjCV+8MCYEWT9tB
         2gfu5MTmjfvQXbK9xSj2BOMzA7/Dj6myIscyxs/VfNgmp1ADOWdafXg0CoE7vVsvB9SB
         1bovLiGXoexnP+zpsJx0lYwxZEhRqnQ4SCMewep5NmKocop+VFn9Em5bd6ggeXh5F3hA
         9a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780565839; x=1781170639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WAE5dsUcOf+50j6c1n0GmreYE4E4GrWSX2T6ZZrsAus=;
        b=j13FZo61Q9GeTS1h5F5UHKOA+GBixJ9uyxYMW09k/YABcCcKnaSE89LRwmSHMkhxP9
         fkghXrfxnYSQdMbKYPBNTkj5lFTAKm5Pftxvrf/i3qJuFAtqsUqvbL58tHAcatygUgFn
         e13XKpTMWjkzZp79AvU3Mc+7g5/NipLq8tQCUtNXUwa9KEAZSeLRPjVevgvbWeP3KS39
         P6ICtQLlfIP6PYKXvatrOQHZHM/vIjfkRF6jmh+WidHAuOEpouZEnuimL+B4j3l5rTdb
         UhDjs+qUoKTU8xpq5k+QI1yidSXryXAQy9LIm4y9IpojirZ0JLZtAz26dGADJPQSx4Ok
         8yrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pcfig8MvyqbxyLXPL8spJZhJlY0cb+uebxr1Yxirc564R3CTUlxp/141Yv6Qm+GgLsRVVH03u0q8tZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GjhQrRKxu8gvA9zRHQFz/cNVB5P39yaewr7JZzdEZNg2lsUu
	ayBgpdX4Oom73QJmc7S2Tmt7x5G0Zs/nTO4vxAU7lXt++LboUZ89TO9GngOIpj1Ze3UJw6ysQkD
	E1aXLVa5dZmJ5sEu/wZ513+YNeXDkdRA=
X-Gm-Gg: Acq92OEjMC81ayP+ZQ45tGVHfrHIlu7+aivHJaWKwGpYo2H6VOEXlmJDZoD5IfNi8Pp
	s/NMIVb3KqxV/vdKk/k5XrU4uMmT5bixPEqSnBfjjfAaFiYazzBomGvHIPXdHzqKNGmKh5IPreY
	HyENH/KrK/b0FdJQlrhU/NEyWbcjw3vbTNEtWx4kc+nERJm8vla5xm4Q03S7vt9lPSHo6Ta+19p
	P0YKUyCUaF1fcy3xEad2sWf4k+DvWR3yT+j4y0p0E5QDdT8LCt4I1j2R9RcAgkInMz3v6uQbvhn
	RBhTuscwOIJjR5YazA==
X-Received: by 2002:a05:6a00:4191:b0:842:65f8:bb3a with SMTP id
 d2e1a72fcca58-84284dc1e20mr7432079b3a.19.1780565839303; Thu, 04 Jun 2026
 02:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601083327.1535185-1-chancel.liu@oss.nxp.com>
In-Reply-To: <20260601083327.1535185-1-chancel.liu@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 4 Jun 2026 17:37:07 +0800
X-Gm-Features: AVHnY4K0i1x-lAIE5B37fSqEfd9RBkopGxh1S9hjIVvMEyOSCUjsLJScERtWN3E
Message-ID: <CAA+D8AMEv4++ZC_xgXxiLrWWBmJS2Xo10Bj9pboDQ3mFh9STfw@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: fsl_sai: Fix 32 slots TDM broken by integer
 shift UB in xMR write
To: chancel.liu@oss.nxp.com
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 4:33=E2=80=AFPM <chancel.liu@oss.nxp.com> wrote:
>
> From: Chancel Liu <chancel.liu@nxp.com>
>
> When configuring 32 slots TDM (channels =3D=3D slots =3D=3D 32), the xMR
> (Mask Register) write used:
> ~0UL - ((1 << min(channels, slots)) - 1)
>
> The literal "1" is a signed 32-bit int. Shifting it by 32 positions is
> undefined behaviour which may set this register to 0xFFFFFFFF, masking
> all 32 slots.
>
> Use GENMASK_U32() macro instead. For 32 slots this produces a zero mask:
> ~GENMASK_U32(31, 0) =3D ~0xFFFFFFFF =3D 0x00000000
> Behaviour for fewer than 32 slots is unchanged.
>
> Fixes: 770f58d7d2c5 ("ASoC: fsl_sai: Support multiple data channel enable=
 bits")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
> Changes in v3
> - Fix patch can't be applied
>
> Changes in v2
> - Use GENMASK_U32() macro instead to make it clearer and safer
>
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index d6dd95680892..9661602b53c5 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -797,7 +797,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream=
 *substream,
>                                    FSL_SAI_CR4_FSD_MSTR, FSL_SAI_CR4_FSD_=
MSTR);
>
>         regmap_write(sai->regmap, FSL_SAI_xMR(tx),
> -                    ~0UL - ((1 << min(channels, slots)) - 1));
> +                    ~GENMASK_U32(min(channels, slots) - 1, 0));
>
>         return 0;
>  }
> --
> 2.50.1
>
