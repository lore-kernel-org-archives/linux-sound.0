Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BDE73446;
	Wed, 18 Dec 2024 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734532092; cv=none; b=el9i661TTpjS3gQV5CbdFOowK37eQbdsJI3fYqd+1/+Z9dIMN5dZnowenR/b+6++75POIcvzDmdkxfq/CUJ0vmr3wL7EvHQtsdMh6fZgtXgDYgybWgG+uAJMqn3SmyqxV2PMMzENFF6IUy5x2T5PV7qrYh3R+G0mhpNJgleaueM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734532092; c=relaxed/simple;
	bh=jmiAS9C+mnQCxHDibXsU+nU+ddnJNenlLtS3Cw3OyB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6pYk9mZlJnIPRxQ887lxJy7qkHBJeMtryo4Fz00NeFzOwlcDJgsfV/5ms6AN/ARQ6kbbxNuRY/TdbgyGLUZE77pw8rgpOU/G+IsNBeKZqG3D+Or6S/1yLazBha23BAp2wCw5dfDwiaQR5Mz4SkO6xyx3zCCCPKuKQusN9dAHmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xphzn/A3; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xphzn/A3"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd17f231a7so3944191a12.0;
        Wed, 18 Dec 2024 06:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734532090; x=1735136890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8jtJujB1TTw1eVv4jn2BLcoiUTyaKBpavnO2MJUXJY=;
        b=Xphzn/A3MuxOLPnVKCNr5yWEcGgBadX0U1C5oujneSrXFXcHho3Vr0XFMdoHseYE23
         R7OaT4k0qtovIlA2YZnmgM7JYT50//oRX738oaM+dC3fZgQaSprTrjn9mHEtmk1V36WM
         EP18yGWfYkccLIHILvZOz0k9rK8odds8ve64LsFyoBJMUsz7/7blfm1MyEwHWGhULASN
         WBa1QNFAa23f7YuoJ9prhtzoL8Q/D91h2Wqef1NaMgbFNUa5LhRl5Y1F/WjbhQDXBXH6
         jFjomG59siLqtL8CqIcaxYfVmDoSigHJyJd2e7pxV9cNNiEhvplj8gN/5/UlMwyHxbZ6
         UtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532090; x=1735136890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8jtJujB1TTw1eVv4jn2BLcoiUTyaKBpavnO2MJUXJY=;
        b=mTLHKJ6lnas2Vf1D+8/m+y0J9q+K+7F9pZBbHLWpR3BCjGbs94zcyd/Nqn2x6Pdr8R
         Yn9Ge9OS7n2+/xL1QH0haQufUJJ62qd4cOO7xof5SxLf9JA3KMWxKZ5UI6cGSfrKKUFC
         tWIzu/uAZ7Ucxy0zWOf9wZ6hCflUwKrBuesH1uvM7Z2hwRpSK9b3UDYddZSTzrJwn1N7
         ewEo36U8WIVU0EByENNrC0+qPLdl3aD4IthCYlrw7lD40+K+jTBjlw2hasnBiea0HJXA
         KF510Zop2rz3JuddDiz6k9QCO34T3wFD2CAYCsZJO39VN4DGA7gWQka1CTtNl2ynTge5
         opCg==
X-Forwarded-Encrypted: i=1; AJvYcCUSDe2VTjlS9YqU5K6mr3PkkrbueAZ/3GN0sA7NqTMrwHyH2XqkDi1HQbQWX+OGc7tYWkS2SQWJ7b4+RzU=@vger.kernel.org, AJvYcCVAI30MhjzVZtTfFpRf2RuMmDfrGzn6MmFi/FVXC1BiMpSrsntR7N3Rzj+SjYmBclo3u/+xLltEisapUJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSBPQ7MVWt0F5/DxyMbV46utzAE4E0xysa+M0CpdaIAnbB3rlW
	BHp3/Xr+kVFcfzYNsNGh1iWqu8E5/G/WwvZbFNewaOpvnzi56EF2zkVuBZZXxXmnbr4c2QwhRSi
	+A3hFTGlEzG1gvjXaOGyn9JfEIIo=
X-Gm-Gg: ASbGncs6PRQSRit48MUma2QEMUFCjPwr8W+iKv6O7ycvnCpWC1AE/bPMoHexSujA3LC
	tk+7j+cOg3WjSDwt70reDJOMPZLCyEo/0pg==
X-Google-Smtp-Source: AGHT+IGLICEXof9Lk9Mu0+8v93sLWV1+QqNEVr04r0jLUUI28fU+qASD7M4o6Aa5GsX612QHPLBszL0iDSMJ0gEToXs=
X-Received: by 2002:a17:90a:c884:b0:2ee:5111:a54b with SMTP id
 98e67ed59e1d1-2f2e93910bdmr3927977a91.31.1734532089984; Wed, 18 Dec 2024
 06:28:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
In-Reply-To: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 18 Dec 2024 16:29:26 +0200
Message-ID: <CAEnQRZCd-t1wX3-tHt2VFOSE-6JCzzp+nWCa2zQBSZjjoNqUFQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_m2m: force cast for snd_pcm_format_t type
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 4:46=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Fix sparse warnings:
>
> fsl_asrc_m2m.c:360:45: sparse: warning: incorrect type in argument 1 (dif=
ferent base types)
> fsl_asrc_m2m.c:360:45: sparse:    expected restricted snd_pcm_format_t [u=
sertype] pcm_forma
> fsl_asrc_m2m.c:360:45: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:361:41: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:361:41: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:361:41: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:365:45: sparse: warning: incorrect type in argument 1 (dif=
ferent base types)
> fsl_asrc_m2m.c:365:45: sparse:    expected restricted snd_pcm_format_t [u=
sertype] pcm_forma
> fsl_asrc_m2m.c:365:45: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:366:42: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:366:42: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:366:42: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:595:54: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:595:54: sparse:    expected unsigned int [usertype] format=
s
> fsl_asrc_m2m.c:595:54: sparse:    got restricted snd_pcm_format_t [assign=
ed] [usertype] k
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412180043.PAA4t4sQ-lkp@i=
ntel.com/
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
