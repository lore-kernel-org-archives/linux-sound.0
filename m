Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792430967;
	b=oZla4teTTotkoPeykMBSSlfskSoB63Fj2cmI8zk8yns91jEmfu46qWpDzX/aVHYmD/S3
	 53UMmLff9Z4wJhJrM3aLRjnmiISI1kGc+/LwiMvLyGYV2R+/Qi/JHJto0+u8iEBXI74L2
	 zB7iPrB4Mul82DdsRw5qDGGle4KoeTxYkZmOcWZmnXfPWoQQJ6RJVko27B5Df+20v/RQ6
	 dkhgE/N6VsTUMoMctquWDBdOjSH+qFhGzp5y2yteE6Un0Gv+CZYY9fl6lQsIMFU7npLT0
	 eK+6RLvUCcC3ZympLktiWG+YPWH2B5rOtZEyd4Tzo52PdQaJNAFBTwXtXtmDkgkNtZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
	b=pHQ94dUKf/G39GI8m3pNcXyWgAhT7NsW3ZG2eq/KCVCk23ImjWzWYxwC7Nz0pKu3nXsV
	 B0dmOHiSOEYacq+jRo6yIQ+gdiVoYrnC+kF9jSbPN+3TN6FH5pIxTltLzw+6DWeVyCSkK
	 YHKsiWbX1DJn/hVWdj90jAoq/E4zaZgqJktAF3N40TETF+Zu1hGYP74rNMiqcmP92RtwT
	 1KeCgK1wS8YoVZGZsqDbo+Ev38y5xOuHh+tuEnr+L4OvqG1MrWbIb2/Icofe9eNq6gFi1
	 HVE8g7/kDJGeR8gL3mRHvN2tHaUrET55NDasC0yNc6kTxq9YmQSVli18FWvVX+vp8nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fX+Gl0W7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3922D606A31A
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 17:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3922D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fX+Gl0W7
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so31241091fa.1
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 10:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792430965; cv=none;
        d=google.com; s=arc-20260327;
        b=NSzQO4w3XylJYybVt8CVI54ugoGv78YcU8oJmjpfwULrV0KmDOTqh5utXZefYvtIaW
         kRXiBXL74ruOmIeTP0i6v1S+BpuNIiKZuB87CtSJbY7hi1CQGAaBmEm32fnEZxeq4CWe
         SbMBhTVW9ee9NU26BSR3GF0NvLrYrF6LUqtCUYG6aG5/ugaDl+8TfWWBqvE2PN15EEKa
         KCN0ntm0SlaWzK+DPMPF3+nE0C9aAqdk4JM+JYRKaJ18sJQylB8xNNuWGZ0svvR/aL2r
         IIU32TymXopQMMO3nZ8QNJLF+h5nIjH/3pVevRSAexvBN9hhVZpLYEzKazjizGN604Gc
         jp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
        fh=wnZVtndv3r/WdCRDnS5xpY4eDfWZz25fjyMbQDFAkfc=;
        b=PKWj+ekQY0vxp1TYiV9VOA6dFDrKGGsR4HDjxl2NGuuh+jPbjNelSrFwJfPwKmytdR
         zKJnhMGlttMXzrfyETO9xVVxl8grg7WSM4+dmXvRQCrh2bvs6efMC+aS0h+ixDJYQrQg
         +M0FMH5PwT3sItwsB2xHtj8iXR//SDMGbQ/Oz4+h3bBc4yn7MHu0lCWpISauVNhe/SVF
         nPP/p022By2AHd+ZEEib11W0FhBgDzxHaJW/RYX8Ke1/wn3yH9YvamgnQRKVJDQb5w1Y
         X197Ei5BxDbxjAbZeYlVhiExM6zGHQof+YroVIXTTV/j2tT8kqizXmiBA66Hdm/08/OS
         iZeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792430965; x=1793035765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
        b=fX+Gl0W76Ub+1zWUQnlSEBDXLvC6MZJZ62Jua1HcNIT7N2rVI1gkW+dx7RVVwUl/DZ
         MiyB5pJdAo+SZrSVIuaoBuFgJUwBh0eJ9GzFYPimn5DocFuxfzywVhiw9Gh2Iqk22WzO
         mV7hXaFEfodmTSnyb7RoQkYED71RVo3Ms1slJJLXNMvPaIbl+2+ReKDfaOZalneFwJHn
         egJkEcZ5IqK6hDzccfESLFP7eZYAYk6ih5UE55A1s63jWfpAlcIurfw4sEZsARvKKkvN
         dN9rR0Waa2NHfwYYQmk1dT5Sc4AcnGEfN/tzbz4vI0o7mqEN1bZPk2shPZeJnpty19k5
         jNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430965; x=1793035765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
        b=dTjl2PZCkSUPmh0Y7/tVTCUkFnLYpf0VjndzEMYuqhza+PxNO/NeX+yxuTlHGwD0Mj
         /FM5CZVVv3Pl7nFxw0nTxMcYYXaXwiErZ46bqMYOp8FQ2luQyw+9KQL2XsuBqy4rPi4n
         Jx5LtOeKFU6wn+fnMFTFmH9xDyDhvh3Q257Ee8BPIj6Qh+KhsF//sga3Z/+KoMSqt+cg
         Fz7Z12GYRncCOYGvq2m0Fjvn6GvmMQ638SWQOdJ6VDwvFdDEWlkV8uvFrFpCsITomaxB
         b6G0MIqxePhpepurZLoVcmBHLoJwa7iQrm0I7lZ7J1jDHWBMQttCwUvDKpG7wa6BsajM
         FTEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMY7z05gCqs4Bw4FvADM5pmmjTbrGmtvxfjLBZN/BLvnZnvABNkp6wmTP9UelzLB+MuSTTOOk75ChYSQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUKTXoYF38wSF4pZYt6/eQ6qgrxoCTegw2p9myIsItKeXA/WN9
	I9M9wX/FqakSO9gzjQc3vJFau5QnCAWcUc5bg5K931TmqxMKhujHhNYzkUAPRkuUGaFQDhbiD0k
	WDny/LHOjuqKHro7XTuAhrikEAmBmb/atkA==
X-Gm-Gg: AYBFou1XBO0aZOaqB1P85bNp1LCxZLQ+YpuBBvioSKEv8r0LV6aFcpfZ+zFLdwoucgg
	HyK07oJzn3FOEsRHyAWLnpL7JV5tUmKswu2iLu4bqFlpIF7Oazpg2YmmIruMwrs5R29OlF/Eusz
	an8KfyP1+a7qCpM78S1fUJofrQQFlFMpiuy5GxVsia1HIfiqTTIvYT0sBbvcdUpMok/CR7Dk/LO
	5zrkc9mZIidrkchODDr7bu7nyp6yfI6KvLu/C0kYv1OcI9YDbyXidnUXUhTq3xvVzb1yVAO1ojt
	kAr/3sdU60dfb8qSUkkKTHv2acUltT6ZqN1lbvpJbHRdM+hqxvFl4SiWO+nx6UKVol2EM28wf58
	1wz56MLdLXDwLBAd7ZFmx/laAGPjPFB9yrqir7QhdZ98=
X-Received: by 2002:a2e:bea4:0:b0:3ab:1729:e08c with SMTP id
 38308e7fff4ca-3ab292917e9mr16875971fa.13.1792430964535; Mon, 19 Oct 2026
 10:29:24 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-tegra-hda-hbr-v1-1-b8bb1f1d8d15@gmail.com> <87ecdmaxh1.wl-tiwai@suse.de>
In-Reply-To: <87ecdmaxh1.wl-tiwai@suse.de>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 19 Oct 2026 12:29:12 -0500
X-Gm-Features: AclHuK9pYgXL6PjRd-4EMhy8uGYeAfm8xiH3e07GVU1bNqM2yd8kKJKrKzkZa0A
Message-ID: <CALHNRZ_oXkdOO=Q8khQTeAfH_1XQjLK4Vp1WQZ-J3oHoihAFQg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/hdmi: Enable HBR capability
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 3:47=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 19 Oct 2026 04:16:31 +0200,
> Aaron Kling via B4 Relay wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Tegra HDA does not set the HBR capability bit, however every SoC since
> > Tegra114 does support HBR. Override the hbr setup function for these
> > SoCs to unconditionally enable the feature. Since Tegra30 does not
> > support HBR, this function will report invalid on that SoC.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Before this, any attempt to open an hbr stream resulted in a rejection
> > on Tegra hardware. Looking at the downstream support, that just bypasse=
d
> > the capbility check for all supported Tegra hardware in the common code=
.
> > This replicates that in a driver specific hook.
> >
> > This has been tested on a SHIELD TV 2019 Pro trying to bitstream an
> > Atmos demo video. It attempts to play, but mostly just underruns the
> > entire time, with a few spurts of correct noise. My expectation is that
> > issue is userspace, since that is a WIP android audio hal. But even if
> > there are more kernel problems, this should be correct as a standalone
> > change.
> > ---
> >  sound/hda/codecs/hdmi/tegrahdmi.c | 37 +++++++++++++++++++++++++++++++=
++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/=
tegrahdmi.c
> > index ebb6410a48313..c4d8d8a570542 100644
> > --- a/sound/hda/codecs/hdmi/tegrahdmi.c
> > +++ b/sound/hda/codecs/hdmi/tegrahdmi.c
> > @@ -227,6 +227,41 @@ static int nvhdmi_chmap_validate(struct hdac_chmap=
 *chmap,
> >       return 0;
> >  }
> >
> > +static int tegrahdmi_pin_hbr_setup(struct hda_codec *codec, hda_nid_t =
pin_nid,
> > +                                int dev_id, bool hbr)
> > +{
> > +     int pinctl, new_pinctl;
> > +
> > +     // Tegra 3 does not support HBR
> > +     if (codec->core.vendor_id =3D=3D 0x10de0020)
> > +             return -EINVAL;
>
> I guess this will break the HDMI on old Tegra.
>
> Better to enable pin_hbr_setup conditionally for newer chips below, so
> that the older chip continues to work without HBR.

Mmm. I was trying to replicate what the default version of this
function does when hbr isn't supported, but it does look like I missed
part of it. Blocking the override entirely is simpler, will do in a
new revision.

Aaron

>
> > +     spec->ops.pin_hbr_setup =3D tegrahdmi_pin_hbr_setup;
>
>
> thanks,
>
> Takashi
