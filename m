Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EAA19CD01;
	Wed, 18 Dec 2024 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734526796; cv=none; b=SOU621tl5rXzmaUmmmb+lGpozZTIKtffpvIQLhAk/LnmZsJYxaCQooK+eqnvU9M409ZTeJ3D24dxcTPWaih92B2lHrgSd6mwLHWiDBGwFAPU+pKDDiPW2Gu8bi8m1wdEUqYekqD8/byTL2w9zJ18WUyIgOkBghPUpPi3GbDeXKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734526796; c=relaxed/simple;
	bh=/qWCv9pXBNXlSLTUOgXh7xlzBdgLrJ6tkCgRkmuCAqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCJ84Eqa2djSeUlyRwnY8o9ZsQ8AAbCY5+BiFUO4TBIp8EAItoX5N76Kx8uC3Ap8qOyTxn3kvaZma8Af8PC3v8VcGY8X1RbKHjM4wu5ISa07tdBRVU4tSwVGCY3qpRi49rx7m8U0Scih/mucR1OioUQ/wCzu50adu/SIbenXxJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjhGsTXF; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjhGsTXF"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so4297449a12.0;
        Wed, 18 Dec 2024 04:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734526795; x=1735131595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qWCv9pXBNXlSLTUOgXh7xlzBdgLrJ6tkCgRkmuCAqU=;
        b=gjhGsTXFiBuSB66b1MoFQMCQSQly+q90wEraNbnf1q98dDiUqObviFZtF7SjQo8jMq
         nL7rQaxeUJJb1s3NDXn+Y2MT+b8HEw9YUK5w9Ii+HZ0/gz8vQQ6+oZVLgpwM0STeykyC
         swRPQuLYsvz2J8NsrewX1/6vkZI379Bmaj9MqmAFFsoBs+0ZmYDG1f0NcZ9jb6aUapnz
         gq8CRPKNp1CGRy8nYtchqd5XtEViRkvjtcn0GYH57BDns0v1lv+PIh1531OFKoNdr35B
         F4lIIcetm/Hm3FLDij0JbKTVoj0eMUflIcEpf6o6WpWDm7pubqZEi4lKda1HNYe17n1F
         bCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734526795; x=1735131595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qWCv9pXBNXlSLTUOgXh7xlzBdgLrJ6tkCgRkmuCAqU=;
        b=hfhpYR+80H8hAdUgDfxXQwkeZ5xnphkxbofkQI8emEEyhO1avxy6JGuvnNYuZUesmr
         9sZ7vdqTWvUab+ZlfZNX69YfIW+sps/EG/H7jLawrP7QIBvrWYAs3o9+zz0WXcXk0wS8
         ulB5ufaIKmYTv5UMdeeFzeBNsXjy0uHtsgeDIKO1ljV1wyjYbegArOSEAOQkAkBtT8H2
         TzHBB5et/VsZFRBFb2x1Wo0Ag6rz1iWWP6369w6EbuRSiJE0iPJVZhG5ixUaniGMUt+h
         RxhUDVoIvo+05R3DX4+huEVn5zxoGqfwyJthaNR8f9xJgELAgUUzfdc4kt7pFn20Kabv
         fI7w==
X-Forwarded-Encrypted: i=1; AJvYcCUQZ1Fv5si1TLx8JHXC4u8/X0eMTksX6gx6SlB/t01ZREghKoFwQHV1bxUaeqxosa5Po5wEwDYAsC6lA6+8@vger.kernel.org, AJvYcCVUUJdJZDe2wECdl0IcqIBSCJ10PBpFHmTAhP2ox+uJvdVDshZsaS3uOGpBvSOSyaMQ1SXQvfAaXrTo@vger.kernel.org, AJvYcCX9WSNnvISvYDXJOFEpesP65xU3kDUFqk3MXq7+seT95eFTM3jP9dIC7gSSocUIG/n2ZmJkKLM6Hp2PWDs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxca+bAitVkVD6wHhrz2oJEEOrWSBbc0zALwGyXsAX/Iyg3+16d
	chtQkdpEkUBeJWKSwi+1kruWKo+EHyyOMuoV8ZhMh66F5fNK8xZwpmEEejpfraaVkuU7Y8ZW6Pj
	6ij00ZVqriqSKPkXceMmnkgPZ/Qc=
X-Gm-Gg: ASbGncsyNpPNyOg8b6sujJxw5MgDEUibrXk/fral3PgdICmuBXqpKTcpnjj8/0Ox/WK
	NzkZJTWuqwm2JKX4B9C+HijGIKvhflAUgPQ==
X-Google-Smtp-Source: AGHT+IHrwBpS6CcQxAZmukcsGo476EQmoqWM2slhHPAXzThtNb2IK1NBH/tbUgYtw/82HwemO/owjrylht1ANbiMZYg=
X-Received: by 2002:a17:90b:380e:b0:2ee:f22a:61dd with SMTP id
 98e67ed59e1d1-2f2e9374547mr3475436a91.32.1734526794842; Wed, 18 Dec 2024
 04:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-5-laurentiumihalcea111@gmail.com> <ZzUJQCeWclsrr/lr@lizhi-Precision-Tower-5810>
 <c47710a5-7e53-48b1-bd6b-c0123865aee5@gmail.com> <Z1r9hWH1ioR5vI5H@lizhi-Precision-Tower-5810>
 <c3c9389f-5116-4a5f-99f6-1b37c1e8c457@gmail.com>
In-Reply-To: <c3c9389f-5116-4a5f-99f6-1b37c1e8c457@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 18 Dec 2024 15:01:11 +0200
Message-ID: <CAEnQRZArKSOtka46A_SOiV2=8bs9B36ubAJM3GqYJZkKyBt_4A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ASoC: SOF: imx: add driver for imx95
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Takashi Iwai <tiwai@suse.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> >>> Frank
> >> the SOF drivers do indeed have some similarities, but each of them has=
 their own quirks which IMO makes it a bit harder to add the 95 support. We=
 need to figure out the common parts and then move them to imx-common, but =
I believe this can be solved incrementally.
> > You should create common part firstly, then implement equal function wi=
th
> > existed part. Finially add imx95 part.
> >
> > Frank
>
> Yes, I'm aware of how this _should_ be done, but, like I mentioned, the c=
hange is not trivial and will
> require tweaking the other drivers as well. As such, I'd like to get the =
95 support in as-is firstly.
>
> Are there any other thoughts on this?

Laurentiu, Frank please trim the emails and keep only the relevant
part for discussion.

As for this matter I think we should go with the current version Laurentiu =
sent.

It is inline with the implementation for imx8qxp, imx8qm, imx8mp and
imx8ulp which we already have upstream.

There is always space for refactorization and improvements. The
current version of the code
is simple enough to go in as it is.

With this,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

thanks,
Daniel.
