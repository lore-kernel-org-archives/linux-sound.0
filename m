Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4F429D268
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 02:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770258974; cv=pass; b=s5/yJVu4xYW/IFD6QEzrsaobPFEyp/Hc1Y0PSbepcEYQbEGGWyP3h6HRKrK28G60g4c+33IqZAffHVrvCItYMmUYK8+U9oX46lMBt+gKC7NbASwl1LY3v/HDMu1bvKZ3rOS0XdH9IUL0ATx/+hyRWhjheuoIokzFUlBPDgxr3rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770258974; c=relaxed/simple;
	bh=NQVV8HUc0psH2m9YHAJXRggnCctk9iGZTyOGajgLGcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZjQGuU3b+OdOp35NlKLbleQG0ymj31l/fhXtrf+lZg1mKFwXtsn8nRCo+bu4yyriKR/hYbusev471XLM5iEPB8wzOVYuIh+t/4nOAABkqeZVFdG65thUi2OLS0WbtQ3Z5VEQ43Bhplqi06z6kCsHvJdTaILHvOPbuWrO0LgHXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsWrZvZF; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsWrZvZF"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-352dda4a34eso125809a91.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Feb 2026 18:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770258974; cv=none;
        d=google.com; s=arc-20240605;
        b=SFqMQPAwPhLDjxQpdXSqj+SqUMqTOvjXxZurEr6a1KVUWL/q7Zm+z6F1Saa7OZUsfJ
         y2aAzcxN/m4YoW2YEOhL/ditIFR0KDu5LPJiBs3883fUf4k9I+Qx6VqGUO0XKNdMxRCU
         dYiMUSfCvf82TTgDGQnFs/DT3/C2dO3V37+AGlLFY9FYtMu2PkfCwXCOIxUiSTbXueC+
         sa7mAoAjVX7BK+mqPQwwGhB9KNBjuLXLweD16wG2suR/KaFmRszTvaFmJUxiFoUElYzB
         E/mR5yxr1MNNl2hJXrmbCscHqvB3fGa0LReSCtgHSyW8YJIHy/XIB7EbmoHjxdq+lgLv
         XNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        fh=NQ7nfXA7RThD/2avt2aVSm8tdiYnar7QQRSwZ0ke7ww=;
        b=R9PIh0XcM/ZYUGLAdi1XMxm/+PhMPHgGk8k/ZvnVYehfxHt6xb+hQcXdUAHWjS1lqX
         XqdneFKokOb6dfvj2TLqVtgGOnmB63xzDND+oc5UteYPhL1Rz9w5X5jVS0mbhXToMWPj
         m0LUL9yH/01zjgwQbN9o3ffYrXbIU2evmt87058BlH1WfDxgynf3xnQLmSv9SKf9SwR1
         zpuFeDIKWBXkOJMBHgSKn5+0PM7jkadmgXMZZIK9hTsifcxzCD1mJKbQ7+fzl883nhQS
         WJL4Ab8R9t6Q6HsTfYS03AV0l7JqN3nfOOHfZNRmiZfdw0V2pmErpuY+WjUtIXLttmA5
         c/qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770258974; x=1770863774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        b=BsWrZvZFLwi2RbxIb1Ad/Vxm1WKifPErkP0QYZmfGsVu7cDjHShHddHYQcVO22uwcy
         RYCdczgw4mfRAIf4O6du2lV7Uvur3zznqY9yrcdPBzims8BghQIs8/PwbvZHa+7meU6T
         cjXbgbkVU+YdjftZJ6B6W5ir1l1SSKVDmdOs99H7RjKo0Yn3Nyi51TgkEFi0et1ZsfxA
         7wHNrWD4VU6ZvKtYpKO+opDDZNn5YAlnHvFrX+CUQYGIJoO6bjjkxftTs9f2PgQQ1bFy
         zyJfr9Jt3bkMRNPc8SfC88N0jvXIoaZDsKXGHdfL0/uT2PYG8PnyuqTVv2u41Fe5FF5x
         ePIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770258974; x=1770863774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        b=QbaoaZsoMHBdQ5bP76NcJjE1zFSUNcHcsMpim4ojxUPjmPcyEZey6EbBiqoN2oAiSP
         d7j6ruQ50wVLpOdukmYkRHMysL6F5TionDU+JBRRkRDOfMzwNcdPelzE5ch4jCS3/KEu
         8WMUayNvYK8I5mfYpevW0tnpyOG86ZPVhwqQA786DOI461bas7KU4xyhCpFgLm+AajXM
         f3Uo3MTnKlu8YIbJR66Tf8ao3j9z348r1OLv125Iibgm1+L47zyAocXnSMFFEC7oC1Tm
         qw7iPZo0WJI31qlvNU/1DM3y1o1nQh3WlCYByw1P5QzN6T3CWlwA0k7ejJMhZunLERkn
         fvOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYjPfTo0rq1J5/8p63pEuKQa2ViLRQdd6Erbmi/IUEjsRM9kz/8rUazCp2KI+rfmUmKB2+33GVlva+aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhSONXAKEfKU4x4CIwxFD63A9Jp0V7mDLMz3SslVzvTY6A8Ck4
	Hdd2i3MMf/SvPMcWzqgrIgjikP6CqkGyng9lSZJ2G8TVoAU+l8bPf1d7/KxZQxXi34T+Tkq7gTV
	r8bDgfMoxHYO+7E24nFWlHelL2pckgZ3E3w==
X-Gm-Gg: AZuq6aKHKBg79z2tnBd/f7v3Wegfc/p1O0F79DHAvwftp7LIMNM9l9U6YDgNAS49NCf
	hqC3FwPFlZ20QYwKovEz2J0VuGMNUnBewX6XtNg1MzF69IqeTN+89SPtf41yTPJNuN3tzkeT8z4
	j1M5uswH+CBJBAiE1+SRc1slm3Fg1yRGi1DBdgxB+864jqYrMJfY+JT1cOU6n9X1wNSi60EZEmJ
	mfAES4MmTaDTPbseqJee3N9BIunXR00a6OJoH8qREhoqDM9JKH0ePszL8oH1W4TSDMztNszm5Nv
	nmD9gQ==
X-Received: by 2002:a17:90b:3884:b0:340:4abf:391d with SMTP id
 98e67ed59e1d1-35487125d82mr4318915a91.16.1770258973498; Wed, 04 Feb 2026
 18:36:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
 <20260203031345.3850533-3-shengjiu.wang@nxp.com> <aYI2KZE8/MGQ633A@lizhi-Precision-Tower-5810>
 <CAA+D8APXwucOLhhnZF7ASPufWyQs4tbxtR46UFdpm=4wRyHOyA@mail.gmail.com> <aYN0CQbRwyYJDlJn@lizhi-Precision-Tower-5810>
In-Reply-To: <aYN0CQbRwyYJDlJn@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Feb 2026 10:36:01 +0800
X-Gm-Features: AZwV_QgTCuKmUaXOlpjmbiCTEgTaxxVjxr1vFqJ32-N2ro_Vxt5AFFdiFJtKCnI
Message-ID: <CAA+D8AN_xej-DWHbWKMCwgZVVcW9N2mHrK=4GUyoRiGLXBAoTw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC
 before DMA device for M2M
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

On Thu, Feb 5, 2026 at 12:30=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Feb 04, 2026 at 09:41:55AM +0800, Shengjiu Wang wrote:
> > On Wed, Feb 4, 2026 at 1:53=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrot=
e:
> > >
> > > On Tue, Feb 03, 2026 at 11:13:43AM +0800, Shengjiu Wang wrote:
> > > > There is a limitation on i.MX952 that dma request is not cleared at=
 the
> > > > end of conversion with dma slave mode. Which causes sample is dropp=
ed
> > > > from the input fifo on the second time if dma is triggered before t=
he
> > > > client device and EDMA may copy wrong data from output fifo as the =
output
> > > > fifo is not ready in the beginning.
> > > >
> > > > The solution is to trigger asrc before dma on i.MX952, and add dela=
y to
> > > > wait output data is generated then start the EDMA for output, other=
wise
> > > > the m2m function has noise issues.
> > > >
> > > > So add an option to start ASRC first for M2M before ASRC is enabled=
 on
> > > > i.MX952.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  sound/soc/fsl/fsl_asrc.c        | 23 +++++++++++++++++++++++
> > > >  sound/soc/fsl/fsl_asrc.h        |  4 ++++
> > > >  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
> > > >  sound/soc/fsl/fsl_asrc_m2m.c    |  8 +++++++-
> > > >  4 files changed, 38 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > > index 92fb16f7be45..b6d4f1e09e2e 100644
> > > > --- a/sound/soc/fsl/fsl_asrc.c
> > > > +++ b/sound/soc/fsl/fsl_asrc.c
> > > > @@ -1078,6 +1078,27 @@ static unsigned int fsl_asrc_get_output_fifo=
_size(struct fsl_asrc_pair *pair)
> > > >       return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> > > >  }
> > > >
> > > > +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> > > > +{
> > > > +     struct fsl_asrc *asrc =3D pair->asrc;
> > > > +     enum asrc_pair_index index =3D pair->index;
> > > > +     int retry =3D 1000;
> > > > +     u32 val;
> > > > +     int ret;
> > > > +
> > > > +     /* Check output fifo status if it exceeds the watermark. */
> > > > +     ret =3D regmap_read_poll_timeout(asrc->regmap, REG_ASRFST(ind=
ex), val,
> > > > +                                    (ASRFSTi_OUTPUT_FIFO_FILL(val)=
 >=3D ASRC_M2M_OUTPUTFIFO_WML) ||
> > > > +                                    (--retry =3D=3D 0), 0, USEC_PE=
R_SEC);
> > >
> > > are sure need "retry"? there are timeout, which should be equal to 'r=
etry'.
> >
> > Yes, "retry" is what I want, timeout is not what I expected.
>
> Okay, but it will be strange. you polling a register, you suppose it will
> be finished below 1000 IO read, which is certain time in SoC, for example
> 1ms. Compare to timeout us value, 1000 is hard to understand why you choo=
se
> this value.

It can be removed by reducing the timeout time.
will update in the next version.

best regards
Shengjiu Wang

>
> Frank
> >
> > Best regards
> > Shengjiu Wang
> >
> > >
> > > Frank
> > > > +
> > > > +     if (ret || !retry) {
> > > > +             pair_warn("output is not ready\n");
> > > > +             return false;
> > > > +     }
> > > > +
> > > > +     return true;
> > > > +}
> > > > +
> > > >  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
> > > >  {
> > > >       struct fsl_asrc_pair_priv *pair_priv =3D pair->private;
> > > > @@ -1275,6 +1296,7 @@ static int fsl_asrc_probe(struct platform_dev=
ice *pdev)
> > > >
> > > >       asrc_priv->soc =3D of_device_get_match_data(&pdev->dev);
> > > >       asrc->use_edma =3D asrc_priv->soc->use_edma;
> > > > +     asrc->start_before_dma =3D asrc_priv->soc->start_before_dma;
> > > >       asrc->get_dma_channel =3D fsl_asrc_get_dma_channel;
> > > >       asrc->request_pair =3D fsl_asrc_request_pair;
> > > >       asrc->release_pair =3D fsl_asrc_release_pair;
> > > > @@ -1289,6 +1311,7 @@ static int fsl_asrc_probe(struct platform_dev=
ice *pdev)
> > > >       asrc->m2m_get_maxburst =3D fsl_asrc_m2m_get_maxburst;
> > > >       asrc->m2m_pair_resume =3D fsl_asrc_m2m_pair_resume;
> > > >       asrc->m2m_get_cap =3D fsl_asrc_m2m_get_cap;
> > > > +     asrc->m2m_output_ready =3D fsl_asrc_m2m_output_ready;
> > > >
> > > >       if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
> > > >               asrc_priv->clk_map[IN] =3D input_clk_map_imx35;
> > > > diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> > > > index 1c492eb237f5..60b6865ca952 100644
> > > > --- a/sound/soc/fsl/fsl_asrc.h
> > > > +++ b/sound/soc/fsl/fsl_asrc.h
> > > > @@ -257,6 +257,8 @@
> > > >  #define ASRFSTi_OUTPUT_FIFO_WIDTH    7
> > > >  #define ASRFSTi_OUTPUT_FIFO_SHIFT    12
> > > >  #define ASRFSTi_OUTPUT_FIFO_MASK     (((1 << ASRFSTi_OUTPUT_FIFO_W=
IDTH) - 1) << ASRFSTi_OUTPUT_FIFO_SHIFT)
> > > > +#define ASRFSTi_OUTPUT_FIFO_FILL(v)  \
> > > > +     (((v) & ASRFSTi_OUTPUT_FIFO_MASK) >> ASRFSTi_OUTPUT_FIFO_SHIF=
T)
> > > >  #define ASRFSTi_IAEi_SHIFT           11
> > > >  #define ASRFSTi_IAEi_MASK            (1 << ASRFSTi_IAEi_SHIFT)
> > > >  #define ASRFSTi_IAEi                 (1 << ASRFSTi_IAEi_SHIFT)
> > > > @@ -432,10 +434,12 @@ struct dma_block {
> > > >   *
> > > >   * @use_edma: using edma as dma device or not
> > > >   * @channel_bits: width of ASRCNCR register for each pair
> > > > + * @start_before_dma: start asrc before dma
> > > >   */
> > > >  struct fsl_asrc_soc_data {
> > > >       bool use_edma;
> > > >       unsigned int channel_bits;
> > > > +     bool start_before_dma;
> > > >  };
> > > >
> > > >  /**
> > > > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_as=
rc_common.h
> > > > index 0cd595b0f629..c8a1a2b5915d 100644
> > > > --- a/sound/soc/fsl/fsl_asrc_common.h
> > > > +++ b/sound/soc/fsl/fsl_asrc_common.h
> > > > @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
> > > >   * @asrc_rate: default sample rate for ASoC Back-Ends
> > > >   * @asrc_format: default sample format for ASoC Back-Ends
> > > >   * @use_edma: edma is used
> > > > + * @start_before_dma: start asrc before dma
> > > >   * @get_dma_channel: function pointer
> > > >   * @request_pair: function pointer
> > > >   * @release_pair: function pointer
> > > > @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
> > > >   * @m2m_start: function pointer
> > > >   * @m2m_unprepare: function pointer
> > > >   * @m2m_stop: function pointer
> > > > + * @m2m_output_ready: function pointer, check output fifo ready or=
 not
> > > >   * @m2m_calc_out_len: function pointer
> > > >   * @m2m_get_maxburst: function pointer
> > > >   * @m2m_pair_suspend: function pointer
> > > > @@ -143,6 +145,7 @@ struct fsl_asrc {
> > > >       int asrc_rate;
> > > >       snd_pcm_format_t asrc_format;
> > > >       bool use_edma;
> > > > +     bool start_before_dma;
> > > >
> > > >       struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pai=
r, bool dir);
> > > >       int (*request_pair)(int channels, struct fsl_asrc_pair *pair)=
;
> > > > @@ -154,6 +157,7 @@ struct fsl_asrc {
> > > >       int (*m2m_start)(struct fsl_asrc_pair *pair);
> > > >       int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
> > > >       int (*m2m_stop)(struct fsl_asrc_pair *pair);
> > > > +     bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
> > > >
> > > >       int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input=
_buffer_length);
> > > >       int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> > > > diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_=
m2m.c
> > > > index f46881f71e43..77999526dd9e 100644
> > > > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > > > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > > > @@ -253,15 +253,21 @@ static int asrc_m2m_device_run(struct fsl_asr=
c_pair *pair, struct snd_compr_task
> > > >       reinit_completion(&pair->complete[IN]);
> > > >       reinit_completion(&pair->complete[OUT]);
> > > >
> > > > +     if (asrc->start_before_dma)
> > > > +             asrc->m2m_start(pair);
> > > > +
> > > >       /* Submit DMA request */
> > > >       dmaengine_submit(pair->desc[IN]);
> > > >       dma_async_issue_pending(pair->desc[IN]->chan);
> > > >       if (out_dma_len > 0) {
> > > > +             if (asrc->start_before_dma && asrc->m2m_output_ready)
> > > > +                     asrc->m2m_output_ready(pair);
> > > >               dmaengine_submit(pair->desc[OUT]);
> > > >               dma_async_issue_pending(pair->desc[OUT]->chan);
> > > >       }
> > > >
> > > > -     asrc->m2m_start(pair);
> > > > +     if (!asrc->start_before_dma)
> > > > +             asrc->m2m_start(pair);
> > > >
> > > >       if (!wait_for_completion_interruptible_timeout(&pair->complet=
e[IN], 10 * HZ)) {
> > > >               dev_err(dev, "out DMA task timeout\n");
> > > > --
> > > > 2.34.1
> > > >
