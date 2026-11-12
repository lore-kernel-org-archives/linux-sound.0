Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474541;
	b=cw2W8n7bH2Jba8qUsCCjLFeHqRqZ4MjAo8YG60MkebtXU6NO9EMY2423Ecb5rjWIj8l3
	 +dLqhUopNKCnvLB61y7PFYSNPNFB7tB6cbGcePrH50p2NRMapSKt7OX0UNUUckHMU0ZYG
	 PQ2IbOVnj3trMIuGHSUAseRb1gR98FN3an0SLdhbj2j/5FAmE6jAJ/76soVoPgQQUyEze
	 XfnjdmQD+TkCiOtUhgNKF2UqcmKg+RelpzqBsyopHEWgkhiGhv2j1a7wzt7djPcsOrWXx
	 JQw9xDHGrUlTFnp9ouok/2RauDxeMHfoHAHmeexY/1+Ywehkt+dxEejEZbJop4CuDTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eRXv+o3xd/LwrjX3vtstrFSK4BcwlWxEyWog/B0Pb2A=;
	b=S0jX/RseP+A2nmpTpqrRbP9BM0Wf3MlLO24t13e/x3UCj5llOjPAv2wZyavGTyjKH++f
	 6NA6w4JxhozOhxgZrwPIhMjUPQ57Wp9IcBjiS9Cv64rbzwFI+cIhrndAzYqhKPJnpd0fJ
	 HKq41EMCXDqSvuRzD6EDIEAWVrsdObRp5K4c3PAt8CxrsE3Chi1+BaxXKmekK+d1c+eBf
	 gst/XUEkLU1yHNqSb8X6BATCogGG3hz8EuJ87MGGDc0uyu7hiOKKXC0ghqghyb8fLC1yz
	 tKDN/cjFdOYrhfR5Z6rQ2MQ5W1bZTVqs6xSupT7xR1R0bP7AR8esuRuRfrZDtVsx+pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MlHC5Pbf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85B7606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 09:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B85B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MlHC5Pbf
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1655397a12.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 01:09:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794474540; cv=none;
        d=google.com; s=arc-20260327;
        b=leBkB710pLUfSxs68ZlufOfMgDmQefoBRzIEu+x5uKRh678q2cKserEXyEGcBKOlzg
         GAa8m2I6N5exhFoR8kUrBo6XpQ0vJnNG0kpv97FvD7wonb3lkIDiccP0fFMag5ytSZI0
         e7mNZ6Kh8uY08oodPMZ6G97jVsLCuFH+menFykI64JM+eOB83Z/TnFajbFkimjkaOGIY
         ss1GzPK4I8Dp2JOrQzZQ4C97mC289aChp55dDh0uZUSNdePAum7NPsfKUGphe/VwAu5u
         09s60aX0CxAHvtDljHLqEA2pHOGrFBf5qr9y9ntArMO1udqm/fLNhRBiYVTNBWEnSuti
         I+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eRXv+o3xd/LwrjX3vtstrFSK4BcwlWxEyWog/B0Pb2A=;
        fh=m7ByFld2TkTZRVbx9OcvHgKROoXpJQh148RaWGCNlS8=;
        b=fVIQx3l5EsknDJdzc0VbIB+TKFBxX/dBqEKKFYx3NJJ9JHHEshZ5HMdWkH0O6iIwHS
         W290OOP/D+oU4VWtXuJf2euBA2pI86J6DvCr7U37z6Zq4uupUjtzh8QeJUCQ7SytkNq8
         le4zcnPPhMinbzGcyzxxjVJQEhlRDL0JqbfAMLRMcJgvQfsP+L/hAkO553Aqhyc2C/la
         FOuG9GqCm3iDH3j36rDNxG2ZRAZ3z2Dmy3eqcvZ2wHEYKrgVjU50DlxGfgDuFjyO1EsF
         xZ+V1H3AA6TigljSiWxLj4Vu0Yg6QqyVTteo38GoM9LE6rHSHf0auosJ0yLlQTbKW9sv
         1kcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474540; x=1795079340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRXv+o3xd/LwrjX3vtstrFSK4BcwlWxEyWog/B0Pb2A=;
        b=MlHC5PbfWnOapYhAS4wOV78OaA1SqQCzI8HRDtOqzxhf8Xfx3UDr7AAXCS+Yrb+tjE
         bLhc9iD4yqeTNyAB+UVpkCuGJOpt5uMYDCHmwWjiqKhiybdMHk5VITQrBM9EGqezRhs/
         IXfQ1Tjnx2a+X4XhyPTO8bKZU7g9rPmmfsP8Ff+xAS341flSdQWMNXuBydmJ+XIUS6z0
         r9EgvozlZ8nvOD9K+e4zr5P0P2Zwu/oPvKIfGzer8/DsD1yvLw2dMeXRd3LFPJXTNZLq
         NSUEtHhhLCxcveIh0um6OOdBFYWRznulJ4wQRLqFEbPfKu8PsZqxy1rcJ39j+nV3zluu
         C95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474540; x=1795079340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRXv+o3xd/LwrjX3vtstrFSK4BcwlWxEyWog/B0Pb2A=;
        b=Y3OFb3kI0lF9IviYKaYAtWxvUePKj5a9mFuDC5xxy2202yGjr3NomUSyirWsvrIBCc
         tN4VTmlc527wX5tcygYk2krRRMKLIv4XqfFdxZUiHyX9btfZwUQ+5ETbApUVcr+GO0+b
         4giAKAKXNIQfAO1j5GfygJJtw2OuLKR+3fEkZ7tbak1sw7wBMAHUQA5M0/Zu/GiLDcJW
         wJl1KsDsDM56AecFaCA7ApoXD49jIFjpa6+ydsw1UVeRCS5Wq2X2SrOz+YgtY/hx+lV+
         PTf+XPNrnh4C0zUsQ/qvWVsVdwVQK7Zo/5jTvU2VXPljEIGsxavE+E1EiS+97cWLi70L
         twGQ==
X-Forwarded-Encrypted: i=1; AL+hErGSyGdVuUJL8eRDcJUIHT98FtbVdVyqJJmw4o7AxE3NsE5iYJ0wY48MNkcm11Zy3uJkMg5Yut2DENZjew==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dPdHTTg8GkZL+aYzjUcjoQqX8u7DcoiQMdi82ICanQWrqztX5
	Vi8DHSmAHhK0fSTN4So1nRteU5ydv0T3GwawS2vN5xyzYLvbDehFHNZd7K7H2MEsARF5eL2MYuu
	W50LTq4cSHDFq6AX0S5c6MB0EnWhsUTg=
X-Gm-Gg: AYBFou0gWCqfbCXUS9J1Wv2Bxwa1e0Vctgby/DuNLvBUSSl6edv6NJdqEScJqTZ1DRF
	5NUUKZfGWRvB/k5KEn6ZcxzLO+a6nOWENiRQCUgoNGhe1rl6hPl0HlT8tZPMWETAW9G8rbOG4ob
	5eiC9kMwmB0DXucrh1TTW2DktWlBESdWO0L2Ls0Xx4r+MPVh17/uNQGVUHwmM797KdyZWubGWLA
	Y+cTwrryzeoCAdKWQB5NQUe5dSftj9khEkzLAYA0oqnZuuB12but6U/QlEhGjV7S/9PwGZR1yDH
	yUqXwgFy+t9zDo4mi5lp27cIAC2SeYL0r5HKkb34fYplJU6CnzB8Y1+gXwhdAB5ENftl1xuVEm4
	3tsco4FO7kQLak3kD0e3NLom52eDTXaXygaOk
X-Received: by 2002:a17:90b:1c0b:b0:3ac:9599:a689 with SMTP id
 98e67ed59e1d1-3b182f235d9mr3994012a91.34.1794474539722; Thu, 12 Nov 2026
 01:08:59 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110120743.6301-1-stefan.ghetu@nxp.com> <20261110120743.6301-4-stefan.ghetu@nxp.com>
In-Reply-To: <20261110120743.6301-4-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Nov 2026 17:08:44 +0800
X-Gm-Features: AclHuK-xo5sqQ1bv9bDSXOSJ-L9KATXVxPodrhMZvWrhDua3HJ3hpSCY1aITLMY
Message-ID: <CAA+D8AMqXdSK98qrsecZBk7_=ZVX91PjqejyN-xD0R6b-cqAqQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] ASoC: fsl_asrc_dma: release DMA channels on repeated
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
> fsl_asrc_dma_hw_params() requests new DMA channels on every call and
> overwrites the previous ones, which are leaked when hw_params() is
> called again without hw_free(). Its Back-End error path also releases a
> channel without clearing the pointer, so the following hw_free()
> releases it a second time.
>
> Release the channels of a previous call first, and clear the pointer in
> the error path.
>
> Fixes: 3117bb3109dc ("ASoC: fsl_asrc: Add ASRC ASoC CPU DAI and platform =
drivers")
> Fixes: 36124fb19f1a ("ASoC: fsl_asrc_dma: Fix dma_chan leak when config D=
MA channel failed")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc_dma.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index b417de6abebe..5ba4bdeff019 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -124,6 +124,19 @@ static int fsl_asrc_dma_trigger(struct snd_soc_compo=
nent *component,
>         return 0;
>  }
>
> +static void fsl_asrc_dma_release_chans(struct fsl_asrc_pair *pair, u8 di=
r)
> +{
> +       if (pair->dma_chan[!dir])
> +               dma_release_channel(pair->dma_chan[!dir]);
> +
> +       /* release dev_to_dev chan if we aren't reusing the Back-End one =
*/
> +       if (pair->dma_chan[dir] && pair->req_dma_chan)
> +               dma_release_channel(pair->dma_chan[dir]);
> +
> +       pair->dma_chan[!dir] =3D NULL;
> +       pair->dma_chan[dir] =3D NULL;
> +}
> +
>  static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>                                   struct snd_pcm_substream *substream,
>                                   struct snd_pcm_hw_params *params)
> @@ -190,6 +203,9 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_comp=
onent *component,
>         dma_params_fe->addr =3D asrc->paddr + asrc->get_fifo_addr(!dir, i=
ndex);
>         dma_params_fe->maxburst =3D dma_params_be->maxburst;
>
> +       /* hw_params() may be called again without hw_free() in between *=
/
> +       fsl_asrc_dma_release_chans(pair, dir);
> +
>         tmp_chan =3D asrc->get_dma_channel(pair, !dir);
>         if (IS_ERR(tmp_chan)) {
>                 dev_err(dev, "failed to request DMA channel\n");
> @@ -342,6 +358,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_comp=
onent *component,
>                 dev_err(dev, "failed to config DMA channel for Back-End\n=
");
>                 if (pair->req_dma_chan)
>                         dma_release_channel(pair->dma_chan[dir]);
> +               pair->dma_chan[dir] =3D NULL;
>                 return ret;
>         }
>
> @@ -356,15 +373,7 @@ static int fsl_asrc_dma_hw_free(struct snd_soc_compo=
nent *component,
>         struct fsl_asrc_pair *pair =3D runtime->private_data;
>         u8 dir =3D tx ? OUT : IN;
>
> -       if (pair->dma_chan[!dir])
> -               dma_release_channel(pair->dma_chan[!dir]);
> -
> -       /* release dev_to_dev chan if we aren't reusing the Back-End one =
*/
> -       if (pair->dma_chan[dir] && pair->req_dma_chan)
> -               dma_release_channel(pair->dma_chan[dir]);
> -
> -       pair->dma_chan[!dir] =3D NULL;
> -       pair->dma_chan[dir] =3D NULL;
> +       fsl_asrc_dma_release_chans(pair, dir);
>
>         return 0;
>  }
> --
> 2.53.0
>
