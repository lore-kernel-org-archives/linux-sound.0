Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB2837187B
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 19:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789932800; cv=none; b=SzaD2zyiY5ROw5+N7WRdnpIcvrceKQe18l+Jo2ZWlbgdXlwzMSY1Ucv99qocv9uLKmfpXW7PEJPZUEFvSQbDTS6iqdW/hKJLwQtcv88o3uln9gGR7ULJqLaJsOKmtASZODR22MCy33xdHh5FZzmXjEAdd9Nf942khnkWphbYE7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789932800; c=relaxed/simple;
	bh=GkuXYxzwfyqpDMVLmSMx2O0wFNYfK7zgRRp/qShPnZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHmO/j8KDcVGj0vjSNhVp9w0lquCBRNvi3hZm5gTsXRTNtjgVGz1iUsMI8PKwLXiR4CAsEFOKQIOgjMpFzRu25T3sRKWzh+G3f0fd5NpdSILdcZixYSIQJoALWohHH8YMD0Y0uDRj9OcMxUn3Xp569eWzisXiBgLyt53t0ICaZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f10.google.com with SMTP id 956f58d0204a3-66e56a1fe8aso827855d50.0
        for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 12:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789932798; x=1790537598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6Swky4LrvS7CuMJp/QS0OJof1ZhY4lFCOIL0gHGn5E=;
        b=mPhCViZfn+yoXLmsg173E1SsNrGYjjEAkjyx8IC6PlGuKhNf6b/a8hvMwlYZ7VLwDz
         +29F2xoUdLckmUmGxdl244AOZR5RCoEgJbLt+/jEvvMh8/6A2taTjyGqykSw25pCWbgP
         gJtv6wdWrWgt8Q1iLFswagXHRdfp9zrFZEp/oPb0P8DdzzteHoIPNgR2sxdm7sEl4qKr
         xEVUo1j+nFKpA/1j7i+zDEIBxoysLZW41p3jJwdB+7a3UBu6GOEvZq28ENr2VtD0fL8m
         9JsCrzUzifbDcubLSLpHLkKHNCrrrCqits9oE4mHuY3UmXohJOUhi9JjAvxUlGrP8Yfr
         GejA==
X-Forwarded-Encrypted: i=1; AKwUvBwCU7XPVMgdtCtEf93p4ISRsL0UmUOpe2J+rUbAXlqh3wVmJ+wx05AYQmpZWh6RKnT+IxBzlj48aBz7Uw==@vger.kernel.org
X-Gm-Message-State: AFuF++kXY6XzdYRmmj/mAsWxFK/46DU/lCiSiijweMnMLb32KgfyTc+5
	c7+5ZnqIrxC99HMMSWprnxrS7Hh5N+hghectfP6fUIMhvrJX6yONMCD1y2Rwn1QQBm89Tw==
X-Gm-Gg: AYBFou12tYPT5Pye/ko7RJgX6g5ILDLEAMmJj6aUJMnpyz0h/Mr42bG+f1HUxYli+LN
	7sLwyBfs5gVTgXFJrACQZPUS4kU7k1JjKxmAQncbYkoSiGtLnvOufEQ24/PbIuM6+aom4kctwc+
	uxwlr7vgJCyvXn0ErcTXOODaOglRHByhTbzXwl8k41i4BL1mNCOisdCIKoyWD9Ajj+4ceBXQRyk
	Kf1gsQ0+r4uXL0bGQM4EIzqW61m7ztYZzeyVzTi9jBJa0JKz547GSZ+7meXOD9vV64wW09VyOP2
	P8Zz2i9+WqAMaiKSJ9RAcOf3bmUB6LuCEVgXS8lFXJt1qT7Z6Uo0FODEPABM5bvxd2akYGnh2CE
	1BEuIaCTYPB9CgcnfP5TiajbCS01Dw14oSkmfxJadsQ/w0ZIlxW38a6K5Ei6vsIp8qpib+7vC59
	BsgfWMDW+Yu8ePX2npassmQsW5gtOvcCjVgFhyeBIo1ZcegBULrPzr/dN28IIFpPpI5rF8UwZqy
	YDCncz9SLv3ZKn4hK4KonxlEA==
X-Received: by 2002:a05:690e:b81:b0:671:3a9e:d03e with SMTP id 956f58d0204a3-6717fc66295mr2322809d50.2.1789932798284;
        Sun, 20 Sep 2026 12:33:18 -0700 (PDT)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com. [74.125.224.141])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a415208b4sm19085097b3.7.2026.09.20.12.33.16
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 12:33:16 -0700 (PDT)
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43ac8d1eso16251267b3.2
        for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 12:33:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByx3mbydlZmtsYPJxGPgRGLlml5ipQSlzP4Nuf9UY238We/xVdTDYGkv1a86+/ya2FDvrAayyaXJzVIfg==@vger.kernel.org
X-Received: by 2002:a05:690c:c507:b0:882:1d1e:88ca with SMTP id
 00721157ae682-897320902a1mr28886997b3.10.1789932796607; Sun, 20 Sep 2026
 12:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920145848.44521-1-me@lizi.moe> <393a1343-cef7-4fe2-8236-8946185bb394@oss.qualcomm.com>
In-Reply-To: <393a1343-cef7-4fe2-8236-8946185bb394@oss.qualcomm.com>
From: Zimeng Li <me@lizi.moe>
Date: Mon, 21 Sep 2026 03:33:05 +0800
X-Gmail-Original-Message-ID: <CAGFxjKKG_AZ7n59vWfFY-at0-AKXJ7maCOxTseVp3=_JbHhQuw@mail.gmail.com>
X-Gm-Features: AclHuK9we0KMkaoHHPoZOe6GB6anvoi-tuFPPwIk9CS2LHJ7CNwJddBj7GdmBjQ
Message-ID: <CAGFxjKKG_AZ7n59vWfFY-at0-AKXJ7maCOxTseVp3=_JbHhQuw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: use DAI table index for playback constraints
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srinivas,

No, I have not tested this patch on hardware. So far I have only
compile-tested the ARM objects listed below the commit message.

The IPQ806x example is based on static analysis. Its DAI table contains
one entry with hardware ID 4. If that DAI is configured for QUAD01 and
probe reaches this branch, dai_driver[dai_id] accesses beyond that
single entry. I have not reproduced this on an IPQ806x board, and I
have not found an in-tree IPQ806x DTS explicitly selecting this mode.

I do have access to a SC7180 device, but its relevant DAI table index
and hardware ID are both 1. Testing there could provide regression
coverage for the changed code, but would not exercise the sparse-ID
case.

I will add Cc stable and identify the model as
GPT-6 Astra in the Assisted-by trailer in v2.

Would regression testing on SC7180 be useful here, given that it does
not exercise the sparse-ID case? If testing on IPQ806x is required,
I currently do not have access to suitable hardware.

Thanks,
Li

Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=80 00:05=E5=86=
=99=E9=81=93=EF=BC=9A
>
>
>
> On 9/20/26 3:58 PM, Zimeng Li wrote:
> > The DAI ID is a hardware port ID and is not necessarily the index of
> > the corresponding entry in variant->dai_driver.
> >
> > When configuring a DAI with LPAIF_I2SCTL_MODE_QUAD01, the probe code
> > currently uses dai_id to index variant->dai_driver. This is incorrect
> > for platforms where DAI IDs are sparse. For example, the IPQ806x MI2S
> > DAI has ID 4 while it is the only entry in the DAI driver table, so
> > the current code accesses dai_driver[4] instead of the DAI being
> > processed.
>
> This looks like a bug, however the code has been written in assumption
> that the dai_drive.
>
> That also raises the question that was this patch actually tested on any
> hardware?
>
> >
> > Use the loop index i when updating the current DAI's playback channel
> > constraints, while retaining dai_id for indexing the hardware-port
> > specific playback SD-line mode array.
> >
> > This fixes the incorrect DAI table access for platforms where the DAI
> > ID does not match its position in the driver table.
> >
> > Fixes: c223f41c1a52 ("ASoC: qcom: Add four speaker support on MI2S seco=
ndary")
>
> Cc Stable ?
>
> > Signed-off-by: Zimeng Li <me@lizi.moe>
> > Assisted-by: LLM
> Can you please add the actual model name as others do.
>
> > ---
> > Compile-tested with LLVM for ARM using multi_v7_defconfig with
> > CONFIG_SND_SOC_STORM=3Dm. The lpass-cpu.o, lpass-ipq806x.o and
> > lpass-platform.o targets built successfully. Not hardware-tested;
> > the IPQ806x example is based on static analysis, not a reproduced crash=
.
> >
> >  sound/soc/qcom/lpass-cpu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> > index 242bc16da..079177a6d 100644
> > --- a/sound/soc/qcom/lpass-cpu.c
> > +++ b/sound/soc/qcom/lpass-cpu.c
> > @@ -1234,8 +1234,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct pla=
tform_device *pdev)
> >               }
> >               if (drvdata->mi2s_playback_sd_mode[dai_id] =3D=3D
> >                       LPAIF_I2SCTL_MODE_QUAD01) {
> > -                     variant->dai_driver[dai_id].playback.channels_min=
 =3D 4;
> > -                     variant->dai_driver[dai_id].playback.channels_max=
 =3D 4;
> > +                     variant->dai_driver[i].playback.channels_min =3D =
4;
> > +                     variant->dai_driver[i].playback.channels_max =3D =
4;
> >               }
> >       }
> >
> >
> > base-commit: 0ed6f7f62318a581fe9698f8a4e98c7ca01160e4
>
>
