Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82599331A5C
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 01:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769737499; cv=pass; b=uj3ZuphizbcwxjDrpnWWYjAup5A+ss1BofoQWNqpRpd91B4Qwp90DUbDb2s7u5aR7r8x80rWsDL1Z45G23K30A/Sn3w4FMC6RsyszaqOK2PYDQWnjY06Dz27NtHUOunPpGRoszVrviZRXUsrcfPOXUaXEN9ilqX/99pex/0liek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769737499; c=relaxed/simple;
	bh=6hJecC+jJ0J+VKAtd6bMBI8k9pmiUZLLcZyL9RL5cVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=if+jFaJT5Yn/jm9a5oGf5MlALhJemdsS12W02kP07ZRmoesKsAqnRMciU2xIY0k6TzSmXXYZgzHWS/NRt+XJ6VOn/pSYrv0AklX7bo3afijuQxv8o1fov7pH8TsPBra+CB4w0qu3Occ5XbKoUEmPILkXeWxh/aKGefjvRpDRoN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihifhpGv; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihifhpGv"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso899483b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 17:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769737498; cv=none;
        d=google.com; s=arc-20240605;
        b=g6fpzqLAAwaK1eVwIbEhaCLoZHxAzdM6M2t7dc4kL7u8XbaNq0XqjnABdvpvIAWdEo
         O/PA/f0+7XcZLLsWgTEOopSP/gDnn+SWW5oOn/mTIkPRQ/RL2EBKgQup4OHcvO/CNwjr
         TxBeIPygR2YV1rQqgeOaeic9JUZgfVogxSL7cOPqp5HmuT7v9q5L4ifX2/Khpqv5MsdT
         bh2QQx53fNhKtEjXp//dzN5D81oAPNZ5piI35zb4ntbU35++OPhozvewF7G2WW9zdmW4
         N2qWX54JNjsDNJsEjgQ3noDC2lCa+3Z1xpteC173bJDtK8DDM61HC7lBSvIwO8/HAL4D
         zl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        fh=FvXlXBf/PtP8NRL+Zp6ADoDIgVqCenJJ09MreoC3BBs=;
        b=crKJRO4KF5Wc/017E/O6s03I5mRVcJ0ZVAwLiURvB/gYa7HUXiLkJQsXMjHRLt2/RJ
         0Ccp3QM9DvarldZX0ycD1WlZ+jw7b8ULGTG4iFcug6cp6wLbGujGm4LrPL6Xoa3gYUOi
         mNp2Zcw2JSyuzSkPaTa3K+u9IWyz0Kf4EEmag4kk+YIFaVXotIzIYc+fnIxBH2qG51EW
         cD301H2IVPxK63d9/E93NtrbM6LuE4jpFFgstpTyYYOxCjF5K6CwstRdtMNVrk38YYBw
         95IrQIvNbenY1o7XgYL7BPaNWKoHwbo9r/uj5z8AKWaf+bh+hyAaJvAM2ZA0NrJEoujh
         0dyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769737498; x=1770342298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        b=ihifhpGvf3Cr/iXOKBs6+yt/8GKjPnGz5zNAThyhC2SyRZMF2oA0oNudqUOPyXhiG5
         XiMw7q2AkTHU85M5PWrT35ymLGYLsQfuILMqvyPdGIJrTJI7AA7A2wL56ZdaKcPAqTON
         TWTHENWJpL/5IZsgxZqi70KoNtq6MvJSbMxoJhDBUODrc6krZ94ULk5wj70jGS52jOZ8
         o2mwQYe5Uq3J57n7+leOk9VuCCaG62oYUzeSHyLQg8o2RBuXDo0XPUhaORbOcEb4LkSp
         aac0JYx+2hmAB2UsnRstq/BRuitKyjSWcoBjZmEEvE77T7HlNuWQXywH2sjFJJWdZqfC
         vi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769737498; x=1770342298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        b=oa5kgZ13lUBPkU24sIVsl5o5kvEZxoq/4wj1O1jYNygr10UthFLx3UHJqwztGvqofa
         uGDEE2biQALDVAt+IDKg2WNPbamOx02k8AXSUdQnICMBaq7I02SV0uPd8pZDV9dETUg2
         /XTK+Mf1OnkwM8fR2FzmRgdxLzvqG6bvUZGvO8kin5lCASkNq9mdO3BPBQsqoT50sgtP
         UqR8EGiLTvd24AZpqOGFNhEH8Mi59xeP9dYB1Wm9ER8d76/fO6iADqaYdGszGw1CUTj3
         KRczkthCQf+2fUHIuHeoYkqm3QsfvjLnJ3QaCkTSFeqV0PZBZqwbvkOcCkxB9PIS8SYE
         ejXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNPQbJqN+Y4Jf0aNwHTa2jDhFOaS5PrI7iwKfUlgC0aVcHgpQLv2Wa18TwwXUhNVgh+YW7CdnkpFa6nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJQ9/YUaVGQmewO+NZQbD73gPE9VAKSMVb0fO9WYPxEZB+sqeZ
	FDwVmXI3SK5H4DTMCtypoJPE2Eypf1OP39/vJ36YjHNyVLhotixmUB6u52+3xl+STBMDoAe0xng
	Z1CdROliiJww/8gXZvJ55UuihlhsPHh4=
X-Gm-Gg: AZuq6aKN9ID8QJYF0xrrcg9YqNKj/lKBOKETzqzWQrV/R1A+Ghd36wGYf/kj0Wj2BS9
	Mwm+N5oO8gj47S4GfWteJmV5YmnnbO1dgiE0osSrxA/o/7RVOd969Y936GsNOvcldU3qFGnu0Pp
	N9nNAaziIddsu1twLDAkgt2PR2jZOYYCi8RSSmL+kmxXpzdjWDlyRcUN6FrlRNLM2dIDQUsBaLf
	yMdK5JBwg2ga357DGLSJ/VvEjBULHck4xIrcU+P7hZfkpwobMGE04QFW6+vaKkuiInrprw=
X-Received: by 2002:a05:6a21:9214:b0:366:14ac:8c6f with SMTP id
 adf61e73a8af0-392e01842cemr1045926637.69.1769737497875; Thu, 29 Jan 2026
 17:44:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-3-shengjiu.wang@nxp.com> <aXuVXruPir7hasdd@lizhi-Precision-Tower-5810>
In-Reply-To: <aXuVXruPir7hasdd@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 09:44:45 +0800
X-Gm-Features: AZwV_QgRSYSkN9m3U3HWfvC48m_G_i-4n2rGz9NZqS3r9F4yXRNiuZDo3HAYyaM
Message-ID: <CAA+D8AMYEVbFTgTaVhTU_ZJ=eoyQAj4zygLsfuK+Yt+=8qQk1Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: Add support for i.MX952 platform
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

On Fri, Jan 30, 2026 at 1:14=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:52PM +0800, Shengjiu Wang wrote:
> > Add a compatible string and clock mapping table to support ASRC on the
> > i.MX952 platform.
> >
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
> >  sound/soc/fsl/fsl_asrc.c        | 39 +++++++++++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_asrc.h        | 16 ++++++++++++++
> >  sound/soc/fsl/fsl_asrc_common.h |  3 +++
> >  sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++-------
> >  4 files changed, 79 insertions(+), 8 deletions(-)
> >
> ...
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
>
> Does other Soc also work if ASRC start before DMA enable? Suppose most li=
ke
> work. Then needn't start_before_dma.

Yes, should work.  but I don't want to change the original behaviour
of other SoC.

Best regards
Shengjiu Wang
>
> Frank
>
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
> >
> >       if (!wait_for_completion_interruptible_timeout(&pair->complete[IN=
], 10 * HZ)) {
> >               dev_err(dev, "out DMA task timeout\n");
> > --
> > 2.34.1
> >
