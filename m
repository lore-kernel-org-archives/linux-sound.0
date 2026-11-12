Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474569;
	b=CSZw3QoQ16dQKqCZo/GjwfmrDv0BEmjpYG3Ra9De8FA21EMz/NcGt6d/kgdwt/5Orn6n
	 QEgTAyLFzJUe4cdxgLiXezKC4wjlU9y41qk1f/oJXLhNJvs0p2RyC+OplzyrH7sz4nliz
	 rMImWT+UF3M0dmMoz8hN8OrFv9E2aodLcs17b4Kt2d20uRl9DW+TjG8cX3inZtE+CEgx0
	 QYNeRPsF9t2ygkA7aYCxhFIkO2RourHNBaOiuNbKoBacSDaHMThn6+obaC9g0aPptuHta
	 N8KEtL6pdswkLsqy8+MmiWWeIk3jcu9P+oIT/RvhV9Gc5uY6MJW1vZGdDZz5sFDW4aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UC1VFMCdsJy8HJueFJ4vPvh9lfR0tlzAuULdL6Oym6I=;
	b=UTfL4ADDv1GDy73E7PnON1vqDk/I0GKBwe9IlYPpBjqgAPAZt+Owg3w1JA3qYejQ+K2w
	 aCU8Ny617AH0TlmaySOefDKFCXZrwiqJ0AWXK1O+HBm75jcob7YLKU0mLM2bk00Jq59Y0
	 DhFhbcPc0R9V7vusYeTK47pss8KxLwfccJw71cmQwhSMyaYKtQr2FoDlHtibmIURl3PEl
	 A/9ttaPDA6A8wjn2u0VxectRfbejuPEDGiLFm5uSVott0PECg/og7ZKOM9x0sgLmlmhiO
	 oWQqNzc0cPz7YsbPGChhNoOEQv9Svg+2W+3GzK6u1XDIgiV/+NoO1TZtJM4gh2MvFMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTQ70lWv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E8A606A323
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 09:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E8A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTQ70lWv
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso2094120a12.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 01:09:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794474569; cv=none;
        d=google.com; s=arc-20260327;
        b=e0r1y/Tx6UIrc+dqn0C8AcA/PRYtPRItNl1rpLHHIUHhASnL/HtkgVOWjr4N7sp+oE
         sRLCqa+3H1w7yLG7X9GQfR35bQxeuyVJFFpcqZYOTOiKIstgkNgTa4UsJVjXI5P1+QCZ
         yndPwtXI3NgnT5e6KTLKQD0mwUOjIcTcuGDNPvUsKsC1XI6+XF1ueTr+XK9BUhKu8zdP
         l4WNULam3BxRifEZpepXKxsvIh10yjXJ9FCaEXheYsPWT/GqgjedC38dSq75I1Ql0cko
         SkeCvqYlOhbzwK9qzqfqrMhLQypUQKhiInmMM7K9ETZKTogs6emS1KMstwI4LJ/TGoxE
         Lg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UC1VFMCdsJy8HJueFJ4vPvh9lfR0tlzAuULdL6Oym6I=;
        fh=YyCCBSW+3fuiXe3qdWDzYGkL2CnZhqxue3m2m1fBhl8=;
        b=XVbmfTh59xzciBW1Int+82JUUNICgChTgXfbjE3E17y/OFBFyDipiLgad+Z4/YwCrT
         BBX/Ljh1QCcW2Nemzxx4baX+69O4QhB6O8DseaySEJhAf4T8Ek9N9BQ8mNqGydyRP2ju
         0q0GnBSCCjVPubGOi+WE2CkV3uE9OX0sM3lmcEOHRDIKWJyfxeMje7AdXYhjv56wLafs
         1q7pFDuHHT6GUbSocZTNBycP1lao+mn8/y7B3e3Ss7Wq3wS/csK8Yfu0y0NGL6pcq/v4
         BWFAl/AZ+ChVmhWc6FGXAtSJz3u7Hf4X1zt3lAFs+4/YJjNJL2r5QtM+RJzsIY89GBN3
         0y3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474569; x=1795079369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UC1VFMCdsJy8HJueFJ4vPvh9lfR0tlzAuULdL6Oym6I=;
        b=BTQ70lWvFNuSLgFt7TPP8jO7aRQrgictIqaJkvYVwxfCVKt94For0Em5dIM/T3/e/p
         V3tO8e4apQBUPqw+fNkqfOMMAQRk+F6xwfdaVn901eAf+L+eOonhxH/VgTK8CcPJIFAM
         Z0HJdPZ+MKtUEl5umuWI+EkUbm6v8B4SqUcJ8BzRPxmucMckwRTPebfdrLdyz/Ve+hOI
         ajAbO+N7jrU8puNH19kdDLtbc4c8W2Zry03S0GUU6w/DmKp50jUV40rsuI2/mJoo2NBn
         p3b29SfKb+puP3zEWpuirRYH3Ru4PUdboUxq/GEWhIHNl8S7OT01TOYwCvEJYT02rvJv
         u/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474569; x=1795079369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UC1VFMCdsJy8HJueFJ4vPvh9lfR0tlzAuULdL6Oym6I=;
        b=NOYYnjYdNrAJNBWd3lz1gjdYBv5+TUhzLeT1qcd4U8iuiOI1NoUxcCGTSdAt5HVcBK
         /j/4DoWgMbCdUzddP+r9Ngx+IMSWdbcBepiMofvv2dX9INYsJ1MYWtEKzOpOurLjR3ua
         TEwj9KHurmzNgAngsri+IYJYLi0td+OBg4zoAF0QSJgmNWKuAyp1hvGesott7rzfOpl1
         3lMCc/riGl16XbnnsLo6K25KtGlJA4c1LecvIdeWfVAjAtGAFuFl7G/DVkPc6bH0p/03
         pR87YI3PMHsrL+qiOGD/4E0lWHUBP1jRT9m58gdwXso6QhJdbCmnHA013J+To3sljEM0
         ajdg==
X-Forwarded-Encrypted: i=1; AL+hErFGYzV624l/p0AYDyhM+cNvI25aKgrdUXjd6/DZYKbeCPpjjCQKwjMxRdzT8BvlNH2MZorH5AWI4JlvmA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9B8NZrGK075QKAGlfUTf4V8jQDuUY6WYSJNTdd2bU8P1pFPEmH
	SI8LaIivinYuZyJ3vDM/2Yi1G6WNm1Q6ig9RzvwqnOn5kgNwZB5Xtgn/qxUS/BMkcdJyNQWr3vd
	SC1IDOhl57dpkSRNda8w/Te2Z9V36IUA=
X-Gm-Gg: AYBFou2GK/ERKm2UgOOGz+LnVsagRfSR/uVEzrlojorOZ5++UIeeoxEOl+td+aItvqI
	gyDjGHlp1wpsU+Fru3b69g9hzEAPj1DQAv/GUR/3TWKKcmPQ6sEgV4lBDJK2fig6TbPZqVh1gmL
	fo6Yc6zHUVrOt6OOiDGz5vblPEjb4xXk7ubaL1X6XDWx7yqE2Ds61AWrimeOsQIIBKMMCPXvDCg
	z6BjZrsOiMukZ7HPiUtYh+7iN9FZskE6UD55odp9GoAgZq7jxWo7fzO6hGLouK2wOM4NJrDf61p
	uhCiBODypQ7n9MoFSQPehZ/7tHY4gCFCj5Bj/+FhU0Fw18D3nmXuM4zs/G7s5IszPu7NhJSwlH3
	A+gXmdly7j8O6/Uig3og1ofUeBygTplLpPSMIqskEMKlScEPVPwp0JsiLUA==
X-Received: by 2002:a17:90b:2d8b:b0:3ab:be66:ddbe with SMTP id
 98e67ed59e1d1-3b182edaee6mr4922233a91.28.1794474568658; Thu, 12 Nov 2026
 01:09:28 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110120743.6301-1-stefan.ghetu@nxp.com> <20261110120743.6301-5-stefan.ghetu@nxp.com>
In-Reply-To: <20261110120743.6301-5-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Nov 2026 17:09:13 +0800
X-Gm-Features: AclHuK-JKdWd-ygPOBooCSX9cuJhp4rfiioKNxZzndhr2LBJ_ZnCQJKwcXGP6Go
Message-ID: <CAA+D8APshfNo5Ubooq=DnETHeUsAm35Z=LaHUa2hh-p6S5L3xA@mail.gmail.com>
Subject: Re: [PATCH 4/5] ASoC: fsl_easrc: fix context ownership on repeated
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, daniel.baluta@nxp.com, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:08=E2=80=AFPM Stefan Ghetu <stefan.ghetu@nxp.com>=
 wrote:
>
> hw_params() can be called again without hw_free() in between.
> fsl_easrc_hw_params() then requests a second context while the stream
> still owns the first one, which is never released. After close, that
> easrc->pair[] entry points to freed memory and is dereferenced by
> fsl_easrc_runtime_resume() on the next open.
>
> The EASRC slots depend on the number of channels, so release the owned
> context before requesting a new one, and make
> fsl_easrc_release_context() ignore a context it does not own.
>
> Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_easrc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index 5d715bc07357..ae0fbf6c316b 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1347,6 +1347,10 @@ static void fsl_easrc_release_context(struct fsl_a=
src_pair *ctx)
>
>         guard(spinlock_irqsave)(&easrc->lock);
>
> +       /* Nothing to release if the context is not owned by @ctx */
> +       if (easrc->pair[ctx->index] !=3D ctx)
> +               return;
> +
>         fsl_easrc_release_slot(easrc, ctx->index);
>
>         easrc->channel_avail +=3D ctx->channels;
> @@ -1500,6 +1504,12 @@ static int fsl_easrc_hw_params(struct snd_pcm_subs=
tream *substream,
>         snd_pcm_format_t format =3D params_format(params);
>         int ret;
>
> +       /* hw_params() may be called again without hw_free() in between *=
/
> +       if (ctx_priv->ctx_streams & BIT(substream->stream)) {
> +               ctx_priv->ctx_streams &=3D ~BIT(substream->stream);
> +               fsl_easrc_release_context(ctx);
> +       }
> +
>         ret =3D fsl_easrc_request_context(channels, ctx);
>         if (ret) {
>                 dev_err(dev, "failed to request context\n");
> --
> 2.53.0
>
