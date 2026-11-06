Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793935347;
	b=r1K6vSPMROiY2covBj3NV18pzKl3v2Lh9iInrC8rYphPkvn9P/WCab9OWhp3qG2y9Nj8
	 4mpRJK00hDZhvWFsTNYK974kwADKl3zerhnf7GsFNpas6WFN11ulYG2rVdHlwFR51ouhK
	 8ub0MzUhcqELfvnh9EjubkXu5GNYlDXkowYyuiggOVeWAcIV9XCJn35dVVtHP4TKGhs7V
	 OjHVZQtVgc8jbUy1bH3KNQHSnLBsWtYfgs+AsL1A7pHRP0uqHNwav9nzkIMNFk3fwGXof
	 4rGfwRj1hV+6lPMEfiz5GvmHbe/Ijibas++e8t4F0j+V5Ynjd46OjEDh6t6ecSHo72Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793935347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
	b=oUWES3iL6GexRrGbLSfPJu0YP3NYY24TE7d5/eXO3PLJsmjMGFtxDeDr5o5OIoZbVAkf
	 LeBiDp1twQ0FGCsHrcAN+qQSwM9br0jtWWUyQ8nh7LUEHpMR/kBfPD89X7mXbbEaUhwiz
	 NmoEa9SMibqznn0LRx9ifrn/390V/hYaUsORI1AUAb2YImffq7p7FAO/oKuhP3z9HZd1L
	 jjC2Krs6vH1ULOmXvmDO548FAJ9w54LlPiUab8PJC0u2k8JtPRFs0JNiQ3RDG6zTBB6FD
	 7wAaSCxCx82RZg8aUHtnHsH4MxFAivXwxSZBzPbZSpz8fPdnqdtIQquzfeEtwUxRa0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItRx1OjO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B91606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 03:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B91606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItRx1OjO
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so179474a91.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 19:22:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793935346; cv=none;
        d=google.com; s=arc-20260327;
        b=gJ5eUcHy8YkcBiFEKXryVN9adikQj5J2lkWBZCWck7hspsgf93q/QkNHddbnsWhZQn
         SxkPUdGxONiG3XlFaGJkHz8O0CeFFyETfSXKhV88RWFu/1NGXEv4jtVi5Nl27mblbwcg
         7L9SaBlBjTCfKp/AlfKAw06qEP8+tDOW0juhGZnQmNbAHlRlCBszJ6wR/rNP8zwPBwHO
         mW6O/XgkKgKtAz5xMUQnROYXsnaGNqq1XwJaOn2QTuODyUPhdvD5JievKNOSkhV0S+oO
         6FxUE2HIOgXoXuCCTc8Hg1OAC153CsW9Oc1xw+msOwkJ3ZsD+jXerWcygz31conuPZlc
         mUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        fh=RNHBVikOMybn1YYGgoBgBb/fMdTtr/w2lAUwJWt6jgU=;
        b=iNeSriDOPXmy21Iso60adwC/bBJEYSSY/M2v+2O1O09NvpMA+ETWV3haw9TlxczAuR
         KV6Xi1XhQhnYpFw2xVK1WcnbI2OH37pofz6rVbYlD5Qc73mFHE7Frio7dWo0QZiktfty
         luFiRBgjTMm0fvar933ZZrlUkA/jzqpJ7ZjYsyH5X3Q17/HSMgHcyGAtf90P7c9HzaCP
         eCw5ziAwXTx5H85+0AOPyh1eRyIDRiQbKc8FMhNjHw5Hk3qHV+RhHMwTV/GV3aDeRAZ7
         pXfXfdBj0ij3cRXzkWdKe6Q1OJA57B3R4tRZY51JDnZTSwCinzD+c9lqeSLB8HuNVGog
         BTZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793935346; x=1794540146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        b=ItRx1OjO5a1X44Iy7oo4XW8ssPwFufOtqbhIHs2am8aILhL7zKI92TPb8iOw6SxnPo
         yzUSINQd60f/+uVQus2eX4+bUjUu6bofU9KvJpfsurOlxmVu8au5LHaHqSot2OjTGLyA
         FisTbK0zIAK1+dUzMtez2Jp6vr9S43rWeiO24vE0aQcZtDUZoKqD3C/YSX+6uNdxIIDa
         gZ0ankMf/MaHSmy4xLV3XRiC/QdZ6zXNwlmZx4jqHVb8WGa9cWgMizYd3R+uCWnGUtcP
         OGgCh/sk388QOwHAhQVkqlxhsFcYl6Fd7a56LLn0NQy4fXsQ8LLE2Leh0Yk8xC7B6YYV
         FeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793935346; x=1794540146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        b=NmC3xmkY/6erBv1atpc0MbZhYiEUCILqwsOBnclyQ8B0S2kGQ5mWPKfzuHjRSUK7xG
         MAFSz1qFziqHqXZdvWXdhaMzr5fE7tMgOgMf8RPRBBkNLieyruAxKvBFZqLONjDjEKyI
         CSQwd6kCBYfGIPKTCAyXVozBVWoT85urhnla5FDt+8IWZBzGKxwUqc8e0ys2kjQfx1ye
         nUJZHX6sH8jxhYOhbejwiYqhrIFkoQ57y9uz2AaJVjY1VTtfc+9At5lmKLX/47q0KsQ3
         SkvH+dobhC53sXSq0JYqZHBSkTvbVPVgBnO44KOWF9fhkmrKtJTSfiKQfth+3/QzA/O2
         5XSA==
X-Forwarded-Encrypted: i=1; AL+hErFCnj6u5txtJFHQQbr/zev5QI3cUhwrIQc9dUhEid3GubijHNZo8Sirik9j3zs5+z76iS71CKBLm9VV5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8OaIxWQVP2stmhqKyciE18b5koTnsPCWpHXOCcvcT8mikthW1S
	Bqq/xnV/YFLYRnb7Zva5TAJD+AIW/NP6eG2KaE6cw9HEmXmWc1ska3Q7M358Wes7NVUO/nd0lgt
	TEU3T39nEZrE9HoiG24IPeYjBEzZk3dU=
X-Gm-Gg: AYBFou03c5QoXII27qMgTpWw4A8Da3owaukGP56G6g1SerqlTJxa43vxOTTmcKjeK7j
	wSrYRtpFR6gX+QUVi3f6OPKm3Wz9ilum+f0HPb+3hJ28szYWEhJQbHCGheYT8nYIjX6P8Gy3zYG
	nmnVq8DMQKOkR/7eYL/zSVdQgq1qLVAbsM/0Z9W5AOJ2lJ0PIfqteXlobu3RXlH5DYlR8SqulMq
	/F28cU+T2qbONG5DFOO3hZyfxNaiAA3K/fovV1wMIbAVyLXc+s/d8xfYUi+lfsMBohMsNF3I3Hg
	+JAbe0YWhIwB5svn7vV+SSL7iV1VAAcUaWroPGvXVqc3B9HW45e0ackZltk396agXIlkG9ppRkN
	iEqnaLzbfFz1BJiB8jUnuIUz+RarWY8HtAeM0
X-Received: by 2002:a17:90b:4983:b0:3ac:9d26:551d with SMTP id
 98e67ed59e1d1-3b0db6f11f7mr1320600a91.50.1793935346215; Thu, 05 Nov 2026
 19:22:26 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Nov 2026 11:21:57 +0800
X-Gm-Features: AclHuK-h3hDpTZTCQrDXlURnXU4dNiye78ZL33OWRSh0a0w-nnzOWFYn2sw0Q-0
Message-ID: <CAA+D8ANwEqFJYQ39h+1A3zXhcUfpFGzSvVjEzx2htoYxB4sLGg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC/sound: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Kexin Sun <kexinsun@smail.nju.edu.cn>, 
	Frank Li <Frank.Li@nxp.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Tianchu Chen <flynnnchen@tencent.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	bui duc phuc <phucduc.bui@gmail.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	"open list:SOUND" <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, imx@lists.linux.dev, 
	vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across sound drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

For fsl part
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/core/pcm_dmaengine.c         | 3 +--
>  sound/soc/fsl/fsl_asrc_dma.c       | 3 +--
>  sound/soc/fsl/fsl_asrc_m2m.c       | 3 +--
>  sound/soc/renesas/fsi.c            | 3 +--
>  sound/soc/renesas/siu_pcm.c        | 6 ++----
>  sound/soc/sprd/sprd-pcm-compress.c | 5 +++--
>  sound/soc/sprd/sprd-pcm-dma.c      | 5 +++--
>  sound/soc/stm/stm32_spdifrx.c      | 3 +--
>  8 files changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 1306b04be171a..41feb5312ffec 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
> @@ -169,8 +169,7 @@ static int dmaengine_pcm_prepare_and_submit(struct sn=
d_pcm_substream *substream)
>         if (!desc)
>                 return -ENOMEM;
>
> -       desc->callback =3D dmaengine_pcm_dma_complete;
> -       desc->callback_param =3D substream;
> +       dmaengine_desc_set_callback(desc, dmaengine_pcm_dma_complete, NUL=
L, substream);
>         prtd->cookie =3D dmaengine_submit(desc);
>
>         return 0;
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index b417de6abebe4..cd3bf6340b650 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -76,8 +76,7 @@ static int fsl_asrc_dma_prepare_and_submit(struct snd_p=
cm_substream *substream,
>                 return -ENOMEM;
>         }
>
> -       pair->desc[!dir]->callback =3D fsl_asrc_dma_complete;
> -       pair->desc[!dir]->callback_param =3D substream;
> +       dmaengine_desc_set_callback(pair->desc[!dir], fsl_asrc_dma_comple=
te, NULL, substream);
>
>         dmaengine_submit(pair->desc[!dir]);
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 58101ce07c9f9..c6970a7e88f3f 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -176,8 +176,7 @@ static int asrc_dmaconfig(struct fsl_asrc_pair *pair,
>                 return -EINVAL;
>         }
>
> -       pair->desc[dir]->callback =3D ASRC_xPUT_DMA_CALLBACK(dir);
> -       pair->desc[dir]->callback_param =3D pair;
> +       dmaengine_desc_set_callback(pair->desc[dir], ASRC_xPUT_DMA_CALLBA=
CK(dir), NULL, pair);
>
>         return 0;
>  }
> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 74e2ea002fbb1..fa21cf47befff 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1375,8 +1375,7 @@ static int fsi_dma_transfer(struct fsi_priv *fsi, s=
truct fsi_stream *io)
>                 goto fsi_dma_transfer_err;
>         }
>
> -       desc->callback          =3D fsi_dma_complete;
> -       desc->callback_param    =3D io;
> +       dmaengine_desc_set_callback(desc, fsi_dma_complete, NULL, io);
>
>         if (dmaengine_submit(desc) < 0) {
>                 dev_err(dai->dev, "tx_submit() fail\n");
> diff --git a/sound/soc/renesas/siu_pcm.c b/sound/soc/renesas/siu_pcm.c
> index fd5b20b469a4a..7208514e16a43 100644
> --- a/sound/soc/renesas/siu_pcm.c
> +++ b/sound/soc/renesas/siu_pcm.c
> @@ -125,8 +125,7 @@ static int siu_pcm_wr_set(struct siu_port *port_info,
>                 return -ENOMEM;
>         }
>
> -       desc->callback =3D siu_dma_tx_complete;
> -       desc->callback_param =3D siu_stream;
> +       dmaengine_desc_set_callback(desc, siu_dma_tx_complete, NULL, siu_=
stream);
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0) {
>                 dev_err(dev, "Failed to submit a dma transfer\n");
> @@ -175,8 +174,7 @@ static int siu_pcm_rd_set(struct siu_port *port_info,
>                 return -ENOMEM;
>         }
>
> -       desc->callback =3D siu_dma_tx_complete;
> -       desc->callback_param =3D siu_stream;
> +       dmaengine_desc_set_callback(desc, siu_dma_tx_complete, NULL, siu_=
stream);
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0) {
>                 dev_err(dev, "Failed to submit dma descriptor\n");
> diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm=
-compress.c
> index f790b959cd4e4..a810c9c8a0b5b 100644
> --- a/sound/soc/sprd/sprd-pcm-compress.c
> +++ b/sound/soc/sprd/sprd-pcm-compress.c
> @@ -247,8 +247,9 @@ static int sprd_platform_compr_dma_config(struct snd_=
soc_component *component,
>
>         /* Only channel 1 transfer can wake up the AP system. */
>         if (!params->no_wake_mode && channel =3D=3D 1) {
> -               dma->desc->callback =3D sprd_platform_compr_dma_complete;
> -               dma->desc->callback_param =3D cstream;
> +               dmaengine_desc_set_callback(dma->desc,
> +                                           sprd_platform_compr_dma_compl=
ete,
> +                                           NULL, cstream);
>         }
>
>         kfree(sg);
> diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.=
c
> index bbd7516f81954..968901ae4c335 100644
> --- a/sound/soc/sprd/sprd-pcm-dma.c
> +++ b/sound/soc/sprd/sprd-pcm-dma.c
> @@ -287,8 +287,9 @@ static int sprd_pcm_hw_params(struct snd_soc_componen=
t *component,
>                 }
>
>                 if (!runtime->no_period_wakeup) {
> -                       data->desc->callback =3D sprd_pcm_dma_complete;
> -                       data->desc->callback_param =3D dma_private;
> +                       dmaengine_desc_set_callback(data->desc,
> +                                                   sprd_pcm_dma_complete=
,
> +                                                   NULL, dma_private);
>                 }
>         }
>
> diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.=
c
> index 88863dbd05d9b..44467a25fb69a 100644
> --- a/sound/soc/stm/stm32_spdifrx.c
> +++ b/sound/soc/stm/stm32_spdifrx.c
> @@ -302,8 +302,7 @@ static int stm32_spdifrx_dma_ctrl_start(struct stm32_=
spdifrx_data *spdifrx)
>         if (!spdifrx->desc)
>                 return -EINVAL;
>
> -       spdifrx->desc->callback =3D stm32_spdifrx_dma_complete;
> -       spdifrx->desc->callback_param =3D spdifrx;
> +       dmaengine_desc_set_callback(spdifrx->desc, stm32_spdifrx_dma_comp=
lete, NULL, spdifrx);
>         cookie =3D dmaengine_submit(spdifrx->desc);
>         err =3D dma_submit_error(cookie);
>         if (err)
> --
> 2.43.0
>
