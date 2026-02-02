Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E3B352943
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770025472; cv=pass; b=k07B6QPhWM8nS3cDT60d7o+W9L+w99X1dTx7US13LVUpT83pH4ZxeLRmdOcdubIV0KQz3iPEUz9Qb3OsLAJd9VFtZ6vLB7yHqT59bOMihZ4K4P+8Ab5rZ3U3vrBKN2+/jUZBI3bJvX9pjGU8l+PH0+wp1ThTuCgRId2gQCUzR5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770025472; c=relaxed/simple;
	bh=TxocIH3WSUgiuoUqSarLJ9wDs59/gNeIjdpFZaZiiIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLWG9tfpN4ppzSo2UbIzEUUt15jTQU/fKNEKMIg0StnFLqGCKvzb2VxFEULl/h1RmB3EbbmL/qen9WegSTBEXNWW6xUS5a73IDMNXLQGH47WKl6Ks5AWxatUqUYFYfJdoI1Bi81uNgdGh1uVMPy03zILSx+wtSHnqvuYM9Hakx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dqiu0+/h; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dqiu0+/h"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35334ea1f98so1901594a91.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Feb 2026 01:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770025470; cv=none;
        d=google.com; s=arc-20240605;
        b=cCUgC19ubORRN0qHP1nffy7CDK+2pLcSzEbfYBOu+DC6tCzV3qPrBpn0eeqJGZmxLp
         8TmaPnRigQRPmBG6sZE4YlIfV7ohjlUdw1iU9CBAXYfMG4m407UkzeF8KMbvkwmoiCIl
         YrxULZdl8vKZIvYhlRmNi0SigW1eVGvjpms72kRL3sin8zaPQVwOVFXxtA7zdMqLipgZ
         BKnERwHzLrCNFYKPHkuvDJHuyaEUfud5DM4d9d3U61YoBh7x+9u283BHNUf0RZIxtQa0
         dV13xUQYG6w1ma1XASlBPUFfWJubdDDgRasWaPJ/J1+Bh8Gc4BkXd6ipPTG+VUIZYbVM
         gFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        fh=bfGhzUXAHmuBfl9ZRClp/RkYk8CBIlB/0erYw4q+QHI=;
        b=ZAA+StYerqlAt+LmS/1ITaGiM8zce0KA5Olt96eypnC8wdHpsVgLWuzykAMbyKxolr
         wfYsSPgXNiXRicnFVv6BsmUXcPTMbD+8u5nkS/tPaF1wNoz3Ik/rzcTUpsIwm3QSjydN
         0kc35cZwlHuXmBZl1zHN4NbUhxb7EpBWK2ZNYaB4GASh+gWhazt4O/JCreTPWKGd6opH
         1WP69bD8VF6/O0668bN7AH+LGpyJkbb6eypx5URHKXn3Hu6JM2oNOaJNBJlZhgGAJW32
         scUPaOCEdWTYdcuM5vIULMi1y94K4ODnoWN7BEooMw6qH5IJ+WuI3QfedanOdkcdEecm
         uPeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770025470; x=1770630270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        b=Dqiu0+/h9yK1+SB4ZQ3gyV9Cme9HzEJHfNKkv7SZx/f930OHwSPQBk2sFC7LcZ05Mu
         ia6Fulrp9Ih1j9ViqHhAqW0YLsHNKKd2wGz1EUKHXaP+hYAOFbLm3/v3w3LhWE0kalSY
         sK1hZgNmhUSzoiIvFK24Ka4VwTx2unZfJ4/uKhftLAphhl2+jbmnZTwRETtCfAoqvWpr
         iNxrnwrAOB6lKe7YHZi25V5SYYogK4GKISYy/jPmeqGFlCtDm+wCDt6/IhhF4uJ4z4w4
         10Pzp4kuFtLi7v/aTSfAv1ghR3wPL680ec6UTh3hW/2gwerT1XrQpQw7xvhiinL0dQRV
         w9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770025470; x=1770630270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        b=CDKIgc2Q6YtjHgsfJo1DoibxSsbbFaIVO5l+eQ/qmuDl1ZBqEw1z8seFa/vShYJU6C
         7iwm4LKwOCDTB0/XWps2PmiokmDOprrB13SvteTSL809COXdkRCmx/dFwfRBDld1pHxE
         7vl4LM6wibG5yrNRJU8FMDU23SZdRMM4Lb/jWsxuqKFARoSZOjgRSwSo9f50ksiiLX9X
         tXH6Pmmnx+I2ZgSfOxeG6/xKqfkur7/9l6hVgYWgFZSZo+CLiYo80/CXvhJnfqXVtkGo
         GSK91MnnbbLz48BkYnjtNM8zBiuO2RueZkhMLj/6l62otNi2LYGlSEqlbTHStwub8f0W
         4+HA==
X-Forwarded-Encrypted: i=1; AJvYcCU9O1J3mrRz8FxSF8ozjbkiNYcDmtRyb+4AKOPzci+ahBc+BkKW9eS5F7DbPt4wbH1ZwzJuXv9rgu7vfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKpRcgagF5q2Ej54sZ3YolcUEKpQ16mchWveoDIUwJTTpBAvfZ
	/nhMJaZ01UJmLNE8LoDiSl8vhM+Hg77xN+UC7BE4bDs7coD+z7gE4gS5KbT+fYFFPpDjc73pwFR
	CKpElZyCoPmAOxNZ0e+fn8rMJopgCgl4=
X-Gm-Gg: AZuq6aKZIf636LbMlAFvMCbvsViCFZ4qugJ4jdPlZj7CYyPqX4CZIFX/baDgN9ZpGML
	OCD0Y0WuedjIUwhMv1BevoLPE+ZefK8VFUYAwHMtVt1APyEnAu4HGw06Sqxs+Fr8zvsCpx32CHY
	aSDJIjpC/igCkR0rLC4QZvaxK1L/7rZ8o+oMdrF8GURwXZ19b7JmRSVL/s2S6bHM4U47z0Tzgjs
	9wmn7GEcZnZ4Lr5PRWoiOi4ICbqkLQjDsB4bzoT0gxdcGnjzHxqFJ7CZRAM5x729rWiAN7Fu7rQ
	bKfhNA==
X-Received: by 2002:a17:90a:e704:b0:340:f7d6:dc70 with SMTP id
 98e67ed59e1d1-3543b32db3cmr10551164a91.13.1770025470178; Mon, 02 Feb 2026
 01:44:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
 <20260130054330.3462544-4-shengjiu.wang@nxp.com> <aXzDlScEXfmUys32@lizhi-Precision-Tower-5810>
In-Reply-To: <aXzDlScEXfmUys32@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 2 Feb 2026 17:44:16 +0800
X-Gm-Features: AZwV_QgU5fRT0_5Q6bzl-9D65zjMNMGvATERP1AuFCLfH7W34TynL2XUXVAiodw
Message-ID: <CAA+D8ANrW0N7Sjbat_LN3d8UbcuN-=DOKjfF0XncgqqM62rCMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ASoC: fsl_asrc_m2m: Start ASRC before DMA device
 for M2M
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 10:43=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jan 30, 2026 at 01:43:29PM +0800, Shengjiu Wang wrote:
> > There is a limitation on i.MX952 that dma request is not cleared at the
> > end of conversion with dma slave mode. Which causes sample is dropped
> > from the input fifo on the second time if dma is triggered before the
> > client device and EDMA may copy wrong data from output fifo as the outp=
ut
> > fifo is not ready in the beginning.
> >
> > So need to trigger asrc before dma on i.MX952, and add delay to wait
> > output data is generated then start the EDMA for output, otherwise the
> > m2m function has noise issues.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c        | 25 +++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_asrc.h        |  2 ++
> >  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
> >  sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++++++--------
> >  4 files changed, 52 insertions(+), 8 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > index 5846a2b1f73c..2374577c13f9 100644
> > --- a/sound/soc/fsl/fsl_asrc.c
> > +++ b/sound/soc/fsl/fsl_asrc.c
> > @@ -1084,6 +1084,28 @@ static unsigned int fsl_asrc_get_output_fifo_siz=
e(struct fsl_asrc_pair *pair)
> >       return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> >  }
> >
> > +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> > +{
> > +     struct fsl_asrc *asrc =3D pair->asrc;
> > +     enum asrc_pair_index index =3D pair->index;
> > +     int retry =3D 1000;
> > +     u32 val;
> > +
> > +     /* Check output fifo status if it exceeds the watermark. */
> > +     do {
> > +             regmap_read(asrc->regmap, REG_ASRFST(index), &val);
> > +             val &=3D ASRFSTi_OUTPUT_FIFO_MASK;
> > +             val =3D val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> > +     } while (val < ASRC_M2M_OUTPUTFIFO_WML && --retry);
>
> use regmap_read_poll_timeout()

Ok, will update it.

>
> > +
> > +     if (!retry) {
> > +             pair_warn("output is not ready\n");
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
> > +
> >  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
> >  {
> >       struct fsl_asrc_pair_priv *pair_priv =3D pair->private;
> > @@ -1281,6 +1303,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >
> >       asrc_priv->soc =3D of_device_get_match_data(&pdev->dev);
> >       asrc->use_edma =3D asrc_priv->soc->use_edma;
> > +     asrc->start_before_dma =3D asrc_priv->soc->start_before_dma;
> >       asrc->get_dma_channel =3D fsl_asrc_get_dma_channel;
> >       asrc->request_pair =3D fsl_asrc_request_pair;
> >       asrc->release_pair =3D fsl_asrc_release_pair;
> > @@ -1295,6 +1318,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >       asrc->m2m_get_maxburst =3D fsl_asrc_m2m_get_maxburst;
> >       asrc->m2m_pair_resume =3D fsl_asrc_m2m_pair_resume;
> >       asrc->m2m_get_cap =3D fsl_asrc_m2m_get_cap;
> > +     asrc->m2m_output_ready =3D fsl_asrc_m2m_output_ready;
> >
> >       if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
> >               asrc_priv->clk_map[IN] =3D input_clk_map_imx35;
> > @@ -1565,6 +1589,7 @@ static const struct fsl_asrc_soc_data fsl_asrc_im=
x8qxp_data =3D {
> >  static const struct fsl_asrc_soc_data fsl_asrc_imx952_data =3D {
> >       .use_edma =3D true,
> >       .channel_bits =3D 4,
> > +     .start_before_dma =3D true,
> >  };
> >
> >  static const struct of_device_id fsl_asrc_ids[] =3D {
> > diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> > index 2f67b085de24..1be93148a879 100644
> > --- a/sound/soc/fsl/fsl_asrc.h
> > +++ b/sound/soc/fsl/fsl_asrc.h
> > @@ -446,10 +446,12 @@ struct dma_block {
> >   *
> >   * @use_edma: using edma as dma device or not
> >   * @channel_bits: width of ASRCNCR register for each pair
> > + * @start_before_dma: start asrc before dma
> >   */
> >  struct fsl_asrc_soc_data {
> >       bool use_edma;
> >       unsigned int channel_bits;
> > +     bool start_before_dma;
> >  };
> >
> >  /**
> > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_c=
ommon.h
> > index 0cd595b0f629..c8a1a2b5915d 100644
> > --- a/sound/soc/fsl/fsl_asrc_common.h
> > +++ b/sound/soc/fsl/fsl_asrc_common.h
> > @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
> >   * @asrc_rate: default sample rate for ASoC Back-Ends
> >   * @asrc_format: default sample format for ASoC Back-Ends
> >   * @use_edma: edma is used
> > + * @start_before_dma: start asrc before dma
> >   * @get_dma_channel: function pointer
> >   * @request_pair: function pointer
> >   * @release_pair: function pointer
> > @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
> >   * @m2m_start: function pointer
> >   * @m2m_unprepare: function pointer
> >   * @m2m_stop: function pointer
> > + * @m2m_output_ready: function pointer, check output fifo ready or not
> >   * @m2m_calc_out_len: function pointer
> >   * @m2m_get_maxburst: function pointer
> >   * @m2m_pair_suspend: function pointer
> > @@ -143,6 +145,7 @@ struct fsl_asrc {
> >       int asrc_rate;
> >       snd_pcm_format_t asrc_format;
> >       bool use_edma;
> > +     bool start_before_dma;
> >
> >       struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, b=
ool dir);
> >       int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
> > @@ -154,6 +157,7 @@ struct fsl_asrc {
> >       int (*m2m_start)(struct fsl_asrc_pair *pair);
> >       int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
> >       int (*m2m_stop)(struct fsl_asrc_pair *pair);
> > +     bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
> >
> >       int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buf=
fer_length);
> >       int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> > diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.=
c
> > index f46881f71e43..296e13a16490 100644
> > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > @@ -253,15 +253,28 @@ static int asrc_m2m_device_run(struct fsl_asrc_pa=
ir *pair, struct snd_compr_task
> >       reinit_completion(&pair->complete[IN]);
> >       reinit_completion(&pair->complete[OUT]);
> >
> > -     /* Submit DMA request */
> > -     dmaengine_submit(pair->desc[IN]);
> > -     dma_async_issue_pending(pair->desc[IN]->chan);
> > -     if (out_dma_len > 0) {
> > -             dmaengine_submit(pair->desc[OUT]);
> > -             dma_async_issue_pending(pair->desc[OUT]->chan);
> > -     }
> > +     if (asrc->start_before_dma) {
> > +             asrc->m2m_start(pair);
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     if (asrc->m2m_output_ready)
> > +                             asrc->m2m_output_ready(pair);
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> > +     } else {
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> >
> > -     asrc->m2m_start(pair);
> > +             asrc->m2m_start(pair);
> > +     }
>
> if really like start_before_dma, move common part no change
>
>         if (start_before_dma)
>                 asrc->m2m_start(pair);
>
>         ....
>
>         if (!start_before_dma)
>                 asrc->m2m_start(pair);

Ok, will update it.

best regards
Shengjiu Wang
>
> Frank
> >
> >       if (!wait_for_completion_interruptible_timeout(&pair->complete[IN=
], 10 * HZ)) {
> >               dev_err(dev, "out DMA task timeout\n");
> > --
> > 2.34.1
> >
