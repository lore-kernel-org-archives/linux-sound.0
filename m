Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474593;
	b=J9CxaDYAgXXAQ6BEQbyeU7HmfkuIudZtBpMpIGX+HRxx0gqr0dAMyGEywhxb9Ac2MhCX
	 D2pj67HQxVPSDeTVQ9rnCzGAS1PHwXqZlSwWNAUKGY8pjM3HLmZ0JL8LWUA6vP8QVWI9z
	 ktwTnHortSLTOVTKRCrpMhdBeTYDwGjQzpl8bU6T9W+VrHgVayaifeu6Q51idATa0cPVM
	 R2PUvHZQtUgI76Uv4+YpUHaOsRyViyi7zunGG5xwJIEP7nrtJaAjemCN0TgpStHp5TuaK
	 MWrQhFBVRRwIy2ljfHDtNRgqBR+hY7rrd/auvKTTszndWEWGHbt49iiVAVuWA7DzMzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=41TLMfuT+52fzNjjd3TBUzig4DGCNHOs3ZzjuOR8gQQ=;
	b=oah6E4j9SuJIYIIiW2eoOVSOn6KqWwkTCG9bSNHaIYGNlaO/NsNXl6h1vrAsGp20WOmd
	 ARjZlnp+i2/6ULtfgzEjiw2cQ2RqOjy/RuWb6Yt8Z8jLJPSG8baHwRIm0Z1k8iJrzvuak
	 wIxKgTY3pMfQQRIspDb8TkErv99cCzAHSa1lusebDrIfHCpMhqNo88Z1q925xHRvvpwG/
	 JevgDJT9jD+wDt4JQT9rGUJknsjCjhNmfndOT8wnrXr0uGaF7FfxTGT4ouQ5C+7qG8ypq
	 s5tvmrUBgK/E3d9yYZEBognnQIqzZ06saq+0lnaHvApznLLxDIC11lWeoLT/8Wl7WHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8dHr9sK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C63606A8A4
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 09:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C63606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8dHr9sK
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso2068824a91.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 01:09:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794474592; cv=none;
        d=google.com; s=arc-20260327;
        b=XAQ/BhHpb/rzyxEnqiRtP8lI+XRmYaXXomdjaTHyQTifCTneKcYeO8iblyM/NnNy+b
         ZVfdc5q0yLg7Mc5QlkvSCuRZ2X2j+sL4Vf/ADYnrDruJWeDjWzb+e1x0LrzZ2tZzRX0E
         lxxWk1LzwMygXfy8h/k+68FbMn0QBhaXj17jfo+Eljv2pEOUrtzbE+KBsZNUgwcVP/wl
         I1OcIJHe0U5ZeLY+iS5P7BC7vXZxi/wkX10s18lWShjA5hQb/yZZEFghAghIbO3eHgFM
         2H4d9pRCrz5DrPfGeTXUAP/VfPjmSJIvogP2bqzex+iaYYWF3HSHTub/NaYX5bSytkSl
         jxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=41TLMfuT+52fzNjjd3TBUzig4DGCNHOs3ZzjuOR8gQQ=;
        fh=3Y0m15gapn+A7diYb8bTHdX6c3PuWt/65KZvJhvB44w=;
        b=Q7UPJlwYJtnWRzMCtP0rDRk9G2JmeSqu6a4TK3koBmtbAUR0uewShu+MqdEqaS0OLM
         GLpwlG6eLZRaEIAhNtCVBp5wGM3B/0lAHrjEZ8RtNG+e0/shjwT+FWIwvJlJccmYK8FA
         CX8oJ+SdHPELMD49R96XnEWIU7LXMrzt4rY71dMH9UbZTQRHjrpNMh9t5nfi061rJCYc
         J2HvnRyg0rubSvLuBIuTM0YPedU7+VNfVCLz2LrMMGL34LzizrjKGIgV8v10wTx02niy
         0t5HlDK/NxvfrcFGafeGUgGxCv3lS1gI8Ku9M8hyUdnWrPjlvsHucNFg5SMWyZv2iotQ
         xi6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474592; x=1795079392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=41TLMfuT+52fzNjjd3TBUzig4DGCNHOs3ZzjuOR8gQQ=;
        b=g8dHr9sKrlebIhhpX9YJSJ9NG/s6oyEKCdlGE+CG4AkHmK3torPADx9tJZiu8b5NEy
         dN+gw0HiM4Umd3Ihvxwh+NgwcNlKRNbUYNGBaQE1636ERzzsL4c1+xlxwITvQquSrbou
         2ZCgvHZPl1Y7egA011uf4MrOdz4xwHeVZ+VJ2c92QrOq8US206cq8aB2pgnTADjZ8vfo
         4jbe5/Tbu0PIPzOjggmhkjpeaRPI4tQ0gVgjUlhUDAzqyyObN+fuTFk6azxTl51/moWP
         zd2L/gbWd+xenUecb1MeD0VJ1li2SWW/y2UQL0AlJe9qV5M4jPyqnNFsOikeUqD1lObD
         Unaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474592; x=1795079392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41TLMfuT+52fzNjjd3TBUzig4DGCNHOs3ZzjuOR8gQQ=;
        b=qQBpXNNdbguGt6sDZycr1akBNaHTR7bgRRXfugGg0mLdp7fEBHo/SOatmpp9sA12wr
         e4TP6bqJlWK1BD6p+KPPJNw/OuqyhmRilIiII6F6HFuPi/7+8vIJE6WAetMQMeRM4Ier
         JWOsWKw8vliuRpVziRyO3xBHKx+xB69ASQ8NDfDlE94ViSYtIYTuY10YEg1pGHEyTeHf
         DUgFBJpjAFVigUYjJK82pBKzr4ZbXOiBDBxyr7dmt2gse51mKiIO8eI0JCkyqUN91a5O
         G3DS4dOoNN6c8nkSwLIoFcVpj9C1S11MyQts9MmKas5ZjIcnDlIUwh+DyDfBJJvnXXkg
         ekTw==
X-Forwarded-Encrypted: i=1; AL+hErGNJb7lbUA/pxQXQWPebC51IM+j8wAivdchGbZ3h8sCoUFk8PGCc6Es+Qr+HHnQ3gLcGM19JPkZS4fwUQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Imgkb2gOJFOwnAvXDNveVJrg1TDvp5VYtZ6Dqi1YNb9nNtkzk
	aRNXXQHhtfSqXct0j6IohFzA18eukXRmSKamkYrvtYtCcGeSpQI0lEv87VyR48xxSgEhWB8Sa9E
	t2trwl/SQtgI2Wk9fN91x8ms0yQEcVyY=
X-Gm-Gg: AYBFou2nEGrZCoEHdR5jniRAtY0VeFbIqfQ7dHQCq8rfdMjma00kL71uKpzB+g6Xfn1
	aTECNIyiRgTzUSAxIXuhhkBePs2TGOOTLwKrsdGJIrB0ZuzGxoD5pW4U1R6gS1dHtiiEwMJ9llx
	GRkHZG7m9Efvyiia9YUcqIoiCZ8suISIai0vTj8ON4NANrUt7beYG6pu8xaE4BBu/ETjyTjfVFN
	9wnflZUn1Ff4I4TP55nFSZbXqFwO1nwtBViwOnB4KI+WIDQftwRo9ajN49IClyDXcjFnhyoGPq4
	MHVKSjIFcGTmwK6tfrINsJOH6MWlhGOB16pMc54BWNgEcSNRGWL7R1xXIXNiUeNEJZ10R6dixgk
	8NzZ65fUpslE54larvCFx2QyUKTZzw7tcwaXD
X-Received: by 2002:a17:90b:55c3:b0:39e:4c80:f67b with SMTP id
 98e67ed59e1d1-3b182eec04dmr4462684a91.26.1794474592451; Thu, 12 Nov 2026
 01:09:52 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110120743.6301-1-stefan.ghetu@nxp.com> <20261110120743.6301-6-stefan.ghetu@nxp.com>
In-Reply-To: <20261110120743.6301-6-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Nov 2026 17:09:35 +0800
X-Gm-Features: AclHuK-lbSv9CDph6_v29dZj64AdLc5AtI3F8vZxXUgTDki9rgE2Boxczom6dhQ
Message-ID: <CAA+D8AM6JnJL+6LkOEqbgtsMU0iQP6OYam4AWAxDBjuOV3VGrQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ASoC: fsl_asrc_m2m: allow only one task at a time per
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
> All tasks of a stream share one pair and one set of DMA channels, and
> get_caps() advertises a single fragment, but the compress core allows
> up to 64 tasks. A second task requests the pair again and overwrites the
> DMA channels. Freeing both tasks then releases the same channels twice
> and leaves a stale asrc->pair[] entry after close.
>
> Return -EBUSY from task_create() while a task exists, and clear the DMA
> channel pointers once they are released.
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc_m2m.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index cadfebb12e7c..2e91073f14f9 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -471,6 +471,10 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_=
compr_stream *stream,
>         struct dma_chan *tmp_chan;
>         int ret;
>
> +       /* All tasks share the pair and DMA channels: one task at a time =
*/
> +       if (pair->dma_chan[IN])
> +               return -EBUSY;
> +
>         exp_info_in.ops =3D &fsl_asrc_m2m_dma_buf_ops;
>         exp_info_in.size =3D ASRC_M2M_BUFFER_SIZE;
>         exp_info_in.flags =3D O_RDWR;
> @@ -527,6 +531,7 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_c=
ompr_stream *stream,
>
>  err_dma_channel_out:
>         dma_release_channel(pair->dma_chan[IN]);
> +       pair->dma_chan[IN] =3D NULL;
>  err_dma_channel_in:
>         if (asrc->m2m_unprepare)
>                 asrc->m2m_unprepare(pair);
> @@ -571,6 +576,8 @@ static int fsl_asrc_m2m_comp_task_free(struct snd_com=
pr_stream *stream,
>                 dma_release_channel(pair->dma_chan[IN]);
>         if (pair->dma_chan[OUT])
>                 dma_release_channel(pair->dma_chan[OUT]);
> +       pair->dma_chan[IN] =3D NULL;
> +       pair->dma_chan[OUT] =3D NULL;
>
>         return 0;
>  }
> --
> 2.53.0
>
