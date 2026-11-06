Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793957620;
	b=a0MeuzdyW43CPJ7NQxrjyjRz6aMf3UcLIVBeeLjbUMtwaY62fMI3uuVVsAQwIueuaq0I
	 ngNoqqGiZIh/IF9gYKaLfGWLhkVnRk3wKVri6GrB4jZOvHrzeY6YVMnaPYMCmYEtImdpm
	 h5UX3xmFvRq0MwsIpEtW5edFn7AxtotpQkDjnJHiGPDa71ZcloeokpNfIgxXqcaXxDFz9
	 e78q/7mZwJKLVznq+Opd035YbZCjf8vtEBr+g6Jg/A094+uertCYyjxq64qWY16RdiIXb
	 5YLoQBLr4zSm0Xfd7eP0WE6H5r3RfV/Zl+9JhwNj8rZXCrZG9f1Wn+ozPwPQGDoSa0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ybV5PJ0tMQr6qthaURptS6hX+OOSLkoiXlq2+ClE4YI=;
	b=Qvy6dcZmZVFR1QqfYMTwE4Gfg1A9ASgkW2klUnpm8iHNPA3kvBv7mkROY5WL2Ercuv0t
	 S2V9U8pkstu8rQ/9CDnNCYGo9uri4RYrvkT1lqm4s7h19FLTC0rEJeXvirG1jY3t8VYUs
	 I8fXzo/ozKD16z2J0DvsxjpHxSM8tqG1deIWIKvcCv4O6FpNvSCNpjkeeXtHqYlEf2lnV
	 7WmQzK21x5ZAxYDXYez0+3EpqAskspun09iBLj1Ni8/T2Ef0C+5WQi9GBIxJZlc+6/Het
	 hbQzCwD1cRXy0UkoZFYXGDmAMF3uSLajF1njBj8B8of6ZKoBpYkyDEvrro5RswoqRSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EYvze69F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D69060A2607
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 09:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D69060A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EYvze69F
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so647461a12.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 01:33:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793957619; cv=none;
        d=google.com; s=arc-20260327;
        b=NtBv/Oh6SfBmCjOuspFOIsLSFOlWqlILyMr8/2OEFVCVVQcC/1bZEYKURDD9UTW2yI
         XofG90Cq/coDJIESPeUUZ2sPmrvqbguCuBpOOqS2kYKM3cnaBft0YBiaW4zBAfiJmKuZ
         ZB7eb0GF1rg42re/dh4FrtxA8GU2RRNI9QBkSOczyjxjxbR0vUw5QD5tT9CSpoZdxtaf
         mvsBLQZhMg5Q7ZD/ryfV6LEMDZn+XW8kYH+WwhZ/2fUulXDbisIUhdYbyOGcYM3I01tg
         F92xSlh4p0e5Rrpnhq1YqLozfk2gRZCgGiPBgBChT736abmmfNM6Syb9tqd2JIqy/46i
         Uu0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ybV5PJ0tMQr6qthaURptS6hX+OOSLkoiXlq2+ClE4YI=;
        fh=xg+seE6ItRUNjsUG+IKWTa0Lmr3IhjjxRg9R87zVxL0=;
        b=Zk5/p5RS+UfJ+4lb2rvpMYSypAWFFJlp9XkCVZhDInj4rLOOKBucMNa80MfKh6ngw+
         ilAKq3XAnhOv6rMBTjnAFqa5+1OI3QH+fBoCR/PVu8yJccRuo6mqKniFrDa9KKNRO2RN
         lV83wA64KQFzOvO1aA/UG4KWPWb1jMleiLcl51k+kRkBvE3l1iSqJw9nliZtyUCt1xS3
         QBPne2fqXX9uQZaJ1mipKUsrnl7ki+GY19YTkTuci4CqO7D9lHpTQTer0amafqqv7A89
         +bM6W2rtD8P0YnyYFK1Wf/VosyR7+rEstP+PeOEJrvgGrbL/EgAPMIEdwM0KNNwLRUzD
         YS9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793957619; x=1794562419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ybV5PJ0tMQr6qthaURptS6hX+OOSLkoiXlq2+ClE4YI=;
        b=EYvze69FESKKR8bFw8xlkkRQtGjOUj20PwXtrnKFs44Oz71aPiKPyCxVpcTPVAUSLQ
         SYiwPS1quCOqEX+HHkjtMibW6qFe1/1yDwFEwdoN+OJYasqMKbrc8znXpJzA1u1VXD4E
         cvuEvJbAN69avgmyRcYvVqub84KEKozH5+oPhMuO4+Ibzx3O2hl/7kdZRjIa+w/ifa3L
         Q39/7nMi5Cy91JyrIWuyZNZbs32rpghyr29JmFDku786w56z0Z4U5Iq6AbOI/pPrSWfi
         L5s20dEnOPMic+CacS7bgKuBoT5qSQcUA7HgKOoGF68CX0P3mp3pXuZP3PvQXDZYzcpQ
         ReQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957619; x=1794562419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybV5PJ0tMQr6qthaURptS6hX+OOSLkoiXlq2+ClE4YI=;
        b=BS49nacWUHDb483gjddM1fQfgc1c3S13rIlpMRqPQhC5u8jd2qPZUmViV4qsqGlOYf
         AftyJLcQ8eaRJJuHgG29hnzmD5ckH31KscGkcjPMbcHFNiux23y2JHWBlt5xGoiFv3Q7
         Ay2o6WBoXiKstJoWHlhKcBWmTgpfD3Nf0T7IoA4/HUfN0RKZlQhNTETfDjABvSfFhnb2
         5Xzvs7xZybmVKvTlUya5FbaCb81CjaFgsNstRkmj7uvvd7QU4S/fONx6QDer+4W8uk+B
         LYO0OEy+lYclK+Fkms+wbUbZfchInmd5YthgWKFjzcwjq+5CWkwnSbEpIruWO0HYJAnE
         gMfw==
X-Forwarded-Encrypted: i=1; AL+hErGYAOU3KKeY38M2wvsUg39lPYzDW6wuXJ9561qJycejLsKtZOVh32f0i2EaOd7ZVDDUdDYLZW5BKtbMHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/amtWVTjJLPY33T3GSD9nVZUxJWI4so81HwVjWupQ3VBdK4btD
	dpRdQCiL3Jy7X8J47DYlo4kQByJzGJCYAWKHMFXLnGoFRKK0c7BLrojoQSX9Xi+puWjLtwxBI7g
	0/oLwWVeR595GNlE8cjcuOZXFnp8aahE=
X-Gm-Gg: AYBFou3GBZGU7KHxDsIqeHlzYFzu40bXwUrvwuHKaogAssXEd10HKJ4Wptahajwmaa0
	mzJDiT8XkBWGqEMq+zO2NMUjXJO2sLxdgYv56zx4kqTf9GJxK8EdwR3+QD9CCZHqKUB1PhoOyS0
	EYqScPdu/vfx1/auhozsQaOeWUQk1K0xD31tiCux7EhMl1hHKaGrP6uxV3Y+z88dZ/sIJK9RnbH
	4FBxUFZS3GOqn1PUya/H6FVDlsaPTO8Vp2wE0uizUbTki9rzeyQKgB9xCfd9qBZWqT+NqbFNBIh
	paSN3beKBcfVqsx9bznQ+10oUAZIFuky5mZCt+FIV9ZwLJ2C1B+kHpVmoEtvLHPL7insa+RS8SS
	Jfj5xwkAVhEz64mGSpveBgSkqALGX6RcfQv3m
X-Received: by 2002:a17:90b:3f4f:b0:3b0:a757:e370 with SMTP id
 98e67ed59e1d1-3b0db70fc26mr1220761a91.42.1793957619397; Fri, 06 Nov 2026
 01:33:39 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Nov 2026 17:33:09 +0800
X-Gm-Features: AclHuK9vpWE_SlFYNUyNg7Vdx2dzB0HS2FNB_3vVBzGexP4Y_R3XoG7q6HqdtEU
Message-ID: <CAA+D8APoQt1uSk9R+O6Xg0zUKc4TaGbB7DJX1QvyZ6wzjDwHYw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] ASoC: fsl_sai: Address several issues in the driver
To: phucduc.bui@gmail.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 6:43=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Hi all,
>
> I've continued reviewing the FSL SAI driver and referred to the
> i.MX RT1180 Reference Manual when looking into its register
> configurations and behavior:
>
> https://www.nxp.com/docs/en/reference-manual/IMXRT1180RM.pdf
>
> Link v1:
> https://lore.kernel.org/all/20261030091404.18757-1-phucduc.bui@gmail.com/
> Change in v2:
>  - Add five patches covering disable handling, documentation,
>    ISR error handling, BCLK ratio validation,
>    and preventing incorrect CHMOD writes to the other direction's xCR4.
>
> Compile-tested only.
>

The series looks good to me.

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang

> Best regards,
> Phuc
>
> bui duc phuc (10):
>   ASoC: fsl_sai: Fix PM QoS cleanup on resume failure
>   ASoC: fsl_sai: Use optional clock getter for MCLKs
>   ASoC: fsl_sai: Remove redundant error messages
>   ASoC: fsl_sai: Propagate device tree property read errors
>   ASoC: fsl_sai: Drop redundant dataline mask AND
>   ASoC: fsl_sai: Warn if TE/RE does not clear on disable
>   ASoC: fsl_sai: Clarify fsl_sai_dir_is_synced() documentation
>   ASoC: fsl_sai: Check regmap_read() return value in ISR
>   ASoC: fsl_sai: Reject bclk ratio smaller than slot width
>   ASoC: fsl_sai: Don't write CHMOD to the other direction's xCR4
>
>  sound/soc/fsl/fsl_sai.c | 89 +++++++++++++++++++++++------------------
>  1 file changed, 49 insertions(+), 40 deletions(-)
>
> --
> 2.43.0
>
