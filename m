Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E580C364934
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 03:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529445; cv=pass; b=pJFt4C0j5ckO+IS0dkuAWe5Ax+dALWT7tWU26aVz+QjdAlD9CpEhVNbiYb60+c9cNQ67hecv+07EoXvMeqmPzEXyJt72fHCa96n0TfOowUsbZJnjByGVidBmT8cd6LVRGns10zZR2Y0fH+dLJAsTbAV78fSyh/1FEdN2CmjC0co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529445; c=relaxed/simple;
	bh=K9IGp7wMzcm0ipHMR8TG9YSgdmNh9Pwyoo0H/rmFIBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzYKvPly5EwlfmyGjdl7sBjcz0yIXdCenO+XXgv1kzXVHIfwIAK77hE8RIkrpwCOKTfytrD/NPZHruywhcAvGFYsGuUvSQ4xPWHnkWI50He7L0mco+mWJ1qc8lGpfoDhI7xCOCDxhxRdX2UpQ5bw0NuDEsO098OAXaLQjav9lNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE7t3A/y; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE7t3A/y"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so3085715ad.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 20:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789529443; cv=none;
        d=google.com; s=arc-20260327;
        b=HNjY9oEyR60tp5kig4ow8Jt7Ik9KYgW20Q7mj2EGR5oPu+jw0f/g2C1QDCFqOtxAK/
         /5F+AQBCrNo8P972yU4FAcxTEJMe4gPhOM1RgZtF4DVrzMsrTtkdjmCopvfoS6i73BFl
         2slw6OZfsXfcyCC+x4c+39VCm6EMsnZacHHR2JLJRErBkOEo81tWLPrWq5OxgeaQDmIW
         J41m4syyHba6h2dBYYIx0m0vfi3wY2LkYfuCR6j9OsvVLzo6Ykr4mUP8AZSot+KnyUY8
         a2XHOLX8xzuTzy3NJJuZQjc66GomPEOa/UNJ7YdT57Mrn4CqXO3NaFn5li60fKMeQTrz
         8/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oQBcZLRQSJNhtU+t6MQeVLZ2u/wOeujIUGm2gsEJiuY=;
        fh=zxPQIHh67AI3ob3qehK6vMyDN0JmCXJgy11BhU5utBs=;
        b=OSEtNkQQ1AqO2CjI0M4wk0sFOoeE/ulLVTDHfJxjmGQXxvQ//pBnhiVOC8ijtPv2fl
         jEGFRQ7qK984r+nf6EyvdUXV+G1qcZ/PO5RcWEyN1TekodnDfqNz0OZ4AfOUbhM3t+Ig
         4RWd7t63eqdUB/iab0UNgk1X3gH2hCl9Ns2mgch0NPl6u9iOql5UatNuOh09gRA3rAcA
         WLYY9a5g7ivGBcCZ1YfzX8dDFUewgV+ezHq7I6DqPmPCVQ4YKtXEH26U0OILgoAPOJp9
         4FQyoZfoUAMvk2igj/rdFUdNy5bSWYOQ1Nxa7fpnKS7+qb+3QGccL/nKKyzSYAX15iGb
         NoTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789529443; x=1790134243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oQBcZLRQSJNhtU+t6MQeVLZ2u/wOeujIUGm2gsEJiuY=;
        b=YE7t3A/yJ+mdGE+CO3NN+3g6tybzbT+gL9pQ6Tufy2EGD0TqLgdSnO/XbmA/0oELAO
         mWY04psHGsKYlCCEXn4CD9BVJrsKv/e8vVgVvPdR6juGWHN4upxe/hKdEGB2TJYKuu0A
         psQNSM+F6A1x9k7HI+GqgjPwcza2JGxSN4HculNIWktPAWjkYz0kDJV9n0DakY9r+dVz
         Wjw1Wkkzs7JBix61EypUze3lVK4onQ+eWN/BDxyDj5remMHi8OeFEpCZha58ESb6chUN
         bWhNAe06E5lSW73NrUUxG65jsP6GW+2W5P1GyoLfbkcgDI19KybfF7FWkrqMnfKc+yCh
         KVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529443; x=1790134243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQBcZLRQSJNhtU+t6MQeVLZ2u/wOeujIUGm2gsEJiuY=;
        b=j0vIaZPxFZjzUjjHnMvAWazdCSaRWvO71Cmyio9KjLkdoEkcQguRRtK4JTgS7ZCBdx
         rC5VYJVRXOtU+NktWmTPfBH7WsBjpVpNjKF4i8kS3DBzmq0MtxzCHByfOLYmR3gnmgnP
         wCwYgwZt7CkPZyZu03fz5Svnh8iJtdslYenqKZMTh/diYNZt3YV4LBHNQWjc4VAy8XfG
         FPIqg1F8u97Ajq06uD8I9lJw26MKFY3Ykl2Qg6+ha85hv6AM5ebLS2BN+5wyr6ReFnXr
         NejkvgVtl15ibQk4n5+tVUldoelISIyate0NPttfCG/hfeTV5yqP7QL4ueMSyLmQjsxQ
         wfmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBa5rwJWnVn+VxdR4WusQdYO7V3tkZl1W5FymYOL7j3/gPTAwLavQFlDAESyTR+DqHLtgipaiNzNgGew==@vger.kernel.org
X-Gm-Message-State: AFuF++nwObfUzdZHB6HZX2lbgm+UUjMdvfV4Pxk35IwFh9Taf1bPdqwI
	j2GP3GvOynOOEzO7eRhUdlzlmmEHDNg7sSVyMX2m6wD3rnWz/Nr5EZJ15IGI+iI/aHq6Ephkt2q
	JiU8dKpOj3q3qR4jxm5wDqTrdwEFt9Z4=
X-Gm-Gg: AYBFou326Li83fiNLx/1x+tfVxwVoRqxDxgbX2Fy4UiJosB/MJgnWPPPYI2ARpSn843
	xR5bwjWThsesFzrScHMSakvpuLZBrjI0sAzLVVx0VIOJfW87KlvzSPVZpzPStOFCh5mv4AVw2p0
	fnZRBEW2x633nTWxP4tghiMscb1ibUH1sHzEjyN6qs0UoCQs1K93An1LLr/p8urNVpIgwzL489r
	jYRLt6I/evlu1kcyk3QQ8HW/9zYIgMonWl2J9TTsV/3bRn2hXL3vLw6K/PXIy6FwiOYoe2drxUP
	gLVi9hhYOKy5zvpxQIffhXnlRKx0RQn1SLB2b+h2TuIIELpr9yNiEJJaZnAJAAJHA7Q=
X-Received: by 2002:a17:903:1ac5:b0:2cc:864b:539 with SMTP id
 d9443c01a7336-2dd8e003302mr22506815ad.6.1789529443281; Tue, 15 Sep 2026
 20:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com> <20260915100931.3593242-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260915100931.3593242-6-andriy.shevchenko@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 16 Sep 2026 11:30:15 +0800
X-Gm-Features: AcwNN1XutB8iZg2AF0p02q4kvkV9mnifXUYQQ4fzj9LiCitjAIk_rhIx4BZpDsc
Message-ID: <CAA+D8APje43K1vNagzzH4yX=q1fx0Ntwa28fuFfyhYt5MRCkbg@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] ASoC: fsl_asrc: Replace dma_request_slave_channel()
 by dma_request_chan()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, bui duc phuc <phucduc.bui@gmail.com>, 
	Tianchu Chen <flynnnchen@tencent.com>, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Dave Penkler <dpenkler@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Lars-Peter Clausen <lars@metafoo.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 6:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Replace dma_request_slave_channel() by dma_request_chan() as suggested
> since the former is deprecated.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc.c     |  2 +-
>  sound/soc/fsl/fsl_asrc_dma.c | 13 +++++++------
>  sound/soc/fsl/fsl_asrc_m2m.c |  8 ++++----
>  sound/soc/fsl/fsl_easrc.c    |  2 +-
>  4 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index b24737add001..ae682bf450f6 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -638,7 +638,7 @@ static struct dma_chan *fsl_asrc_get_dma_channel(stru=
ct fsl_asrc_pair *pair,
>
>         sprintf(name, "%cx%c", dir =3D=3D IN ? 'r' : 't', index + 'a');
>
> -       return dma_request_slave_channel(&asrc->pdev->dev, name);
> +       return dma_request_chan(&asrc->pdev->dev, name);
>  }
>
>  static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 2f662bdf14d0..5cd12781c604 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -191,9 +191,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_com=
ponent *component,
>         dma_params_fe->maxburst =3D dma_params_be->maxburst;
>
>         pair->dma_chan[!dir] =3D asrc->get_dma_channel(pair, !dir);
> -       if (!pair->dma_chan[!dir]) {
> +       ret =3D PTR_ERR_OR_ZERO(pair->dma_chan[!dir]);
> +       if (ret) {
>                 dev_err(dev, "failed to request DMA channel\n");
> -               return -EINVAL;
> +               return ret;
>         }
>
>         ret =3D snd_dmaengine_pcm_prepare_slave_config(substream, params,=
 &config_fe);
> @@ -404,9 +405,9 @@ static int fsl_asrc_dma_startup(struct snd_soc_compon=
ent *component,
>
>         /* Request a dummy dma channel, which will be released later. */
>         tmp_chan =3D asrc->get_dma_channel(pair, dir);
> -       if (!tmp_chan) {
> +       ret =3D PTR_ERR_OR_ZERO(tmp_chan);
> +       if (ret) {
>                 dev_err(dev, "failed to get dma channel\n");
> -               ret =3D -EINVAL;
>                 goto dma_chan_err;
>         }
>
> @@ -497,9 +498,9 @@ static int fsl_asrc_dma_pcm_new(struct snd_soc_compon=
ent *component,
>
>         /* Request a dma channel, which will be released later. */
>         chan =3D asrc->get_dma_channel(pair, IN);
> -       if (!chan) {
> +       ret =3D PTR_ERR_OR_ZERO(chan);
> +       if (ret) {
>                 dev_err(dev, "failed to get dma channel\n");
> -               ret =3D -EINVAL;
>                 goto dma_chan_err;
>         }
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 4bc40f328f58..e440cc083ebb 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -503,16 +503,16 @@ static int fsl_asrc_m2m_comp_task_create(struct snd=
_compr_stream *stream,
>
>         /* Request dma channels */
>         pair->dma_chan[IN] =3D asrc->get_dma_channel(pair, IN);
> -       if (!pair->dma_chan[IN]) {
> +       ret =3D PTR_ERR_OR_ZERO(pair->dma_chan[IN]);
> +       if (ret) {
>                 dev_err(dev, "[ctx%d] failed to get input DMA channel\n",=
 pair->index);
> -               ret =3D -EBUSY;
>                 goto err_dma_channel_in;
>         }
>
>         pair->dma_chan[OUT] =3D asrc->get_dma_channel(pair, OUT);
> -       if (!pair->dma_chan[OUT]) {
> +       ret =3D PTR_ERR_OR_ZERO(pair->dma_chan[OUT]);
> +       if (ret) {
>                 dev_err(dev, "[ctx%d] failed to get output DMA channel\n"=
, pair->index);
> -               ret =3D -EBUSY;
>                 goto err_dma_channel_out;
>         }
>
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index aced16d1228a..d30cc3e90215 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1433,7 +1433,7 @@ static struct dma_chan *fsl_easrc_get_dma_channel(s=
truct fsl_asrc_pair *ctx,
>         /* Example of dma name: ctx0_rx */
>         sprintf(name, "ctx%c_%cx", index + '0', dir =3D=3D IN ? 'r' : 't'=
);
>
> -       return dma_request_slave_channel(&easrc->pdev->dev, name);
> +       return dma_request_chan(&easrc->pdev->dev, name);
>  };
>
>  static const unsigned int easrc_rates[] =3D {
> --
> 2.50.1
>
