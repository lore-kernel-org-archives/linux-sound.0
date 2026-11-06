Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793934171;
	b=tesNKxeN5x6r6N49T1Mn0GLAWNN+KHcFr8QA9GsQBcOY5yOfkuOgVEPaukTU4zxgwGee
	 4WLCohUpa5imERsqzLG4GhImyQt1t2dGICrkugwG6NJwFZaEcH1Jx82rG6GSHn/4eHXYh
	 PKODnCqHY81EnW+1ofA8fRdJRZonsER/xP+rwsPwwFuGduROoh5xlRK6k075/q1gJtz8d
	 8ayFeSE8jU0EFCRdzUseH9y721i1FO5CEii+Hcn4hm1CuZK32mTc6Z54ZQOpnKS6wizaY
	 1GHXXK5yMPRZ8P4iF8CEs9gZCZwGP1y1a+j+i1VZa1l4tQLfxAHf5HqiUPeX5242hZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
	b=um9ieHiqM1hC4gO9dLsPzt4uHjeqU8mpraYYqLgOM73MkenxYinWXH7tIyB43I0tP6c/
	 rx9J+FnPM54c/3KW0bRnSceqr08f+XJh7FvMeMF5LEGhOJca2g/aCXRtXFN+SKkRWrcDZ
	 EtCl7qVukuZ1++e8yZUjlYiifrL48rNZNsZPYUkRP1ny0NhTvgMrdeBcqLDiSpCzSdC4D
	 fYxL8RsxZgtqk7rz+Bn9ZfGLKRPg3XbAMb/X118aNpJ+kFcCE4iDli0O4v7AoZwPeVjJa
	 5KJGrFfkcte52WB5xwNQQ6cQR7HeJ5pR4Dh7o+/5WSEXJF41UMNFL4oKfiHhAZQtPpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lO4GhCfR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E33C606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 03:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E33C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lO4GhCfR
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd3310348d2so605355a12.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 19:02:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793934170; cv=none;
        d=google.com; s=arc-20260327;
        b=a5DA2NN1a4L9ZWs2L5uw1U9UbVFhHjgXk/lHZRIOdDma2jfY5CA4ZqpnJ5wsz0Wzu1
         9MxBgwTytnYs7O7r1LddBvS9bg2Ze6yavBeoa8h3JvYQWI9n9g+KXzcsSJ9V9viHRYgT
         481/fYTDu5rT9uyOnCBeWxebsCLC0FLHMzoxbDbcatgWU64nhI5ombpMcV6RItOHUgz8
         SOoxyBdLxQY9HwbqH7CuK9gnljUL/zv9fYvbAXw+ZJTURI9JIpUHMrtXe4RhrU1c4Qfv
         PmBznhKpuAcMuEYP8lzU8vFQwULp1vKZj3mt3ShhTIz602rlNp7+xmvTZ/nLUc4UsAgq
         EZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
        fh=gnF35KTFFtX8PtUodGlDnXjXzlpNIwGUyDcItY4da3s=;
        b=Xt9AIPGj+cSKuppRcLCvcWWuAzsa1sbe+Y4kGvFRFElfSNXV4wBCm8Z4XrA0WmddVA
         GBaVzmjsL49RvLdCPDWutfAv9i8CSztKnj6GqOXqbXMpmsq4bb1sV3P+priurUQFGSiU
         O8Ockfotdge3uUiBc8kRfbMBW5ciYCWgafQwZkco/VRSAKopbNKClMuHH5AiaWDF9JYn
         t5Wj99yhjvnr1Oqp8RKqDrkZEncFM+UfT4S/fslOrhoFgOZePGkL16FtD5kw6iw5CMXZ
         4RyvIxcqPBvVg3B0XUliMHHQBtqKzpZpccGDc0z4AKAZH48ZJZ0nuP2JAHRxXWKNNNlS
         BP0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934170; x=1794538970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
        b=lO4GhCfR/7BK9sJP+wnZzwv01sqFDJ6ywRWr7v1/5p4v1OpkpGnGEIex4w8uwuMax3
         DHlkliHKM3d49/uXXoUbrqUS6d91d3TcHYqG2ONXJxa4RXf5Gbfe+xe1svYX163eGr+Q
         gbIZB4PFTxOpM/8P0CDcnd6a4jClhYWysCAazejQOhg7CzbFEBAGN55ehTBvQuBxMYSQ
         FSr/2oNXSDtscr9W/iWqwgzH4LYPKacxvAirGvLfjWvlwea7VM1lzSBzZTLpi5HOiEU1
         zAasQsH0Ww9ieQDqgsy37/iIg2mF7kO5ZrYy77V3r6SMVeFKiAPJtGipHtzoIlXvnvIA
         9pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934170; x=1794538970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
        b=Pg9MVMXS5StuoDg1jIDml8SVJSW6kKSlwOYKKujD++3QRrxH0Fgfh0tkaq6xeuJxG5
         4p+1MS6QZldz5sSBxnJ9oRPic45hdh9/+gLLCtOllFj23JELKaosZE3EMD4AA+7bphlL
         V9zvuSDnGzs0MKj8DOP9WfSt5V6ci9lgDXdRTpmOuwMqo5TyYzu+PfUv5kdcZjzzCoBT
         S4Lt3RmAXFkIeCsmzsYfy3DJNRWLxbGLbJoJgw6s+6fPcqDPboKGLISeSdlY/pgI18ue
         zxHBermMPx2QqNHUHYm+44cEso1Vai2nk3cjITDtbVmiTgk4Zt+steZxoIdzOUgx9e3L
         WzbA==
X-Forwarded-Encrypted: i=1; AL+hErG+uGu1jr5Tyl8PsCrEgXuNmEcRl6tXqarcPF02iY/MRqa0pEOELOCMOXs7vfj+R64ttQrfgkhr8NK4BQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6zkOKc+6hr/Fc0a0Fjd4meprxJ0hJK4SFvCHDGn/GFMom2VfM
	oJRfaXidqoetjlh9vZc7P/nfeIYlfLf69XUYMeiEz6bN8HAOorYbP99koxzoBfvVlb/y1vCHsfL
	NGfDpAawIoZzXN8ut3JWvgVXVeYTtba4=
X-Gm-Gg: AYBFou0JqITATMHsi0EuQonsD6j+G/vkp3ByA8jfPfp4Rphkh7T3/Z4RgoH54SUNXrs
	YsLkbeIP6AdCRP/KTI1HO4dlgyacuVBb9qvAQd+fZtbnhUPQJr0JhFFqEv45Vvu9rY/0zzm5gTF
	leSCqPWUsK07NJtmYVyK8H1fTeHdUwiYHkOrbNX+UmHChqlPJtVX90MAsKNsZb6rvrMHvJ+tn+4
	55hVDmxEjYo3aQ7Z/tzZPY9HWkFyUbNBLHKsP+zrE+Vbrpn6YHjpb9QRp2MFpFdkNjWqjsxJ6yE
	+w/yaLNvZpqPCjVtbQYGCIRXD3e/NIa1pFsZrBSlN72aKitGYry99isHoK8z/voDauo94uUNvRh
	v2t62PEw75AvsswzmA3q+NtpuadJCH/ABR3Lc
X-Received: by 2002:a17:90a:d88e:b0:3a4:b509:88bd with SMTP id
 98e67ed59e1d1-3b0db608eb2mr752950a91.2.1793934170297; Thu, 05 Nov 2026
 19:02:50 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102195228.4084438-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102195228.4084438-1-Frank.Li@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Nov 2026 11:02:22 +0800
X-Gm-Features: AclHuK-7yWfD5nIIYc699a1XBrVl3zaaX5gaE-98V3Kig8gZod2anKcZN_IDxRY
Message-ID: <CAA+D8APkR05hUMm+KrRhZ+dkEzppNCqD9C3jSGiG42bFziE80Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_asrc_m2m: use dma_chan directly for dma_async_issue_pending()
To: Frank.Li@oss.nxp.com
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"open list:FREESCALE SOC SOUND DRIVERS" <linux-sound@vger.kernel.org>, 
	"open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev, vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:52=E2=80=AFAM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Use pair->dma_chan[] directly instead of pair->desc[]->chan when calling
> dma_async_issue_pending(), which is more straightforward and avoids
> dereferencing the descriptor to get the channel.
>
> Prepare to make struct dma_async_tx_descriptor private.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc_m2m.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index c6970a7e88f3f..796a78124765f 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -257,12 +257,12 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair=
 *pair, struct snd_compr_task
>
>         /* Submit DMA request */
>         dmaengine_submit(pair->desc[IN]);
> -       dma_async_issue_pending(pair->desc[IN]->chan);
> +       dma_async_issue_pending(pair->dma_chan[IN]);
>         if (out_dma_len > 0) {
>                 if (asrc->start_before_dma && asrc->m2m_output_ready)
>                         asrc->m2m_output_ready(pair);
>                 dmaengine_submit(pair->desc[OUT]);
> -               dma_async_issue_pending(pair->desc[OUT]->chan);
> +               dma_async_issue_pending(pair->dma_chan[OUT]);
>         }
>
>         if (!asrc->start_before_dma)
> --
> 2.43.0
>
