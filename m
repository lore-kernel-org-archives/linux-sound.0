Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E72D24A0
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 12:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763643105; cv=none; b=pVWWJ7Qu2H0sGsyZY4OBs4qixXRxwnKpd9IxwgIMGUHXjoj8cq7E+lG/mPZhUS1+/jVjakaha7Fl4i8zr+hahKQj3iUDKNaP2/2dBNEuZR+TdhiNg9UgRTwjs1VWHccVv68l5TR87OdpOOjTWSP+3ZDHvC5MG5NPPzv09kUsqhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763643105; c=relaxed/simple;
	bh=RnJ/p8YjD0Ag/CEqcWigNmqjOaQ0kairDAhcBwcimA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHfUQoKnR3PR5Fn6INiUI+I/3TvCkxgvpq300pzrV/NUDDGyh8+Crbz9vOwfITyDhJbP6PDHKjyCxRetn+5zBcsw+r7Nx4zhRz0IwYO5i2nDo4Hh1VySCojdwjM3OmNjtJjaAP8OyJeYWpTvYZdQ57DylKU0Fr7Eb/JgeDWPdeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOa7FMF+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOa7FMF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437A2C4CEF1
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 12:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763643105;
	bh=RnJ/p8YjD0Ag/CEqcWigNmqjOaQ0kairDAhcBwcimA0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KOa7FMF+bhHsiu8PNGOoRg/2dYvRt9PNaJYXGTFfIWSr/IjqvNIb0m3KKmIV+1O7s
	 udMnVcM3ejGP5UQa+yJDh6zNdx7Z6HeyS8miQJv2nVtDsG53z6CDyoYzUODkR5bMad
	 b9BuTeEALZTWpS9pplkHPfhTHpXNl0PB+LdLp+CqxBqzrY5WFH34l7AFxS/j93aAgy
	 M3az97ZNXY9Sz/Rk/MVBkXIcCZSPAOqRPID+wDdt5ZsKDrroR3fWPCPk0zO2sV2naE
	 McKtLkdU09WhW/UatUP/sqjChNqmxLW7Tz1kg5RKk+NkrGqY66VqGCqTXRdMAyg9A/
	 0KenW2IDNCmBw==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63f96d5038dso695707d50.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 04:51:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWftYOPAWsp7uVppxhmbnP+60BRYIp6pgSOsgCD7NgxBd81YXMTPy/yYpd/Uk7OlqWXIiyj6I2x1icYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/fxdDT/c8kIR1KkcUYR+bMnNrMvq87166C3SGO7E8MlKSJWMO
	aqIMKq6lz2XznJyby3x7scG6BwUV3oxRoNUtmXUu5bS3lf8PiviX4JfQFc2Xi7sl+NLy6rO7Yjm
	qZEGNPE6T+sUGvI57inXVeX/rKy8LHuo=
X-Google-Smtp-Source: AGHT+IH80vXYAzLWR0rO/iTn7sfXH5sd5CT+kxPmbGIP2pnGd+/kUX97Sgu34zly7rBQ1kLVD9VWZYxMkA/tnqIPS9E=
X-Received: by 2002:a05:690e:11c8:b0:63f:5785:a201 with SMTP id
 956f58d0204a3-642f9dd8b25mr1231279d50.15.1763643104511; Thu, 20 Nov 2025
 04:51:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120101847.41294-1-baojun.xu@ti.com>
In-Reply-To: <20251120101847.41294-1-baojun.xu@ti.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 20 Nov 2025 07:51:32 -0500
X-Gmail-Original-Message-ID: <CA+5PVA61P1raCFq_2nGhF9Z2ajvTdv-tDRN+ZY=7ZfCg=w63FQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmljICfFjbhD4Cd8sdUKDoxiT2mVsSjEjWtah8cr5G-ujt4VCDDa1Sfmjw
Message-ID: <CA+5PVA61P1raCFq_2nGhF9Z2ajvTdv-tDRN+ZY=7ZfCg=w63FQ@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Add more symbol links on SPI devices
To: Baojun Xu <baojun.xu@ti.com>
Cc: shenghao-ding@ti.com, linux-firmware@kernel.org, 13916275206@139.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/792

josh

On Thu, Nov 20, 2025 at 5:19=E2=80=AFAM Baojun Xu <baojun.xu@ti.com> wrote:
>
> Add more symbol links for compatible with the source code.
>
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  WHENCE | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index 64f55dec..02e6d357 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -8825,18 +8825,34 @@ Link: TAS2XXX8DE8.bin -> ti/audio/tas2781/TAS2XXX=
8DE8.bin
>  Link: TAS2XXX8DE9.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
>  Link: TAS2XXX8DE80.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
>  Link: TAS2XXX8DE81.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
> +Link: TAS2XXX8DE8-0.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
> +Link: TAS2XXX8DE8-1.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
>  Link: TAS2XXX8DE90.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
>  Link: TAS2XXX8DE91.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
> +Link: TAS2XXX8DE9-0.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
> +Link: TAS2XXX8DE9-1.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
>  Link: TAS2XXX8E17.bin -> ti/audio/tas2781/TAS2XXX8E17.bin
>  Link: TAS2XXX8E19.bin -> ti/audio/tas2781/TAS2XXX8E19.bin
>  Link: TAS2XXX8E1C.bin -> ti/audio/tas2781/TAS2XXX8E1C.bin
>  Link: TAS2XXX8E8A.bin -> ti/audio/tas2781/TAS2XXX8E8A.bin
>  Link: TAS2XXX8ED5.bin -> ti/audio/tas2781/TAS2XXX8ED5.bin
> +Link: TAS2XXX8ED5-0.bin -> ti/audio/tas2781/TAS2XXX8ED5.bin
> +Link: TAS2XXX8ED5-1.bin -> ti/audio/tas2781/TAS2XXX8ED5.bin
>  Link: TAS2XXX8ED6.bin -> ti/audio/tas2781/TAS2XXX8ED6.bin
> +Link: TAS2XXX8ED6-0.bin -> ti/audio/tas2781/TAS2XXX8ED6.bin
> +Link: TAS2XXX8ED6-1.bin -> ti/audio/tas2781/TAS2XXX8ED6.bin
>  Link: TAS2XXX8ED7.bin -> ti/audio/tas2781/TAS2XXX8ED7.bin
> +Link: TAS2XXX8ED7-0.bin -> ti/audio/tas2781/TAS2XXX8ED7.bin
> +Link: TAS2XXX8ED7-1.bin -> ti/audio/tas2781/TAS2XXX8ED7.bin
>  Link: TAS2XXX8ED8.bin -> ti/audio/tas2781/TAS2XXX8ED8.bin
> +Link: TAS2XXX8ED8-0.bin -> ti/audio/tas2781/TAS2XXX8ED8.bin
> +Link: TAS2XXX8ED8-1.bin -> ti/audio/tas2781/TAS2XXX8ED8.bin
>  Link: TAS2XXX8ED9.bin -> ti/audio/tas2781/TAS2XXX8ED9.bin
> +Link: TAS2XXX8ED9-0.bin -> ti/audio/tas2781/TAS2XXX8ED9.bin
> +Link: TAS2XXX8ED9-1.bin -> ti/audio/tas2781/TAS2XXX8ED9.bin
>  Link: TAS2XXX8EDA.bin -> ti/audio/tas2781/TAS2XXX8EDA.bin
> +Link: TAS2XXX8EDA-0.bin -> ti/audio/tas2781/TAS2XXX8EDA.bin
> +Link: TAS2XXX8EDA-1.bin -> ti/audio/tas2781/TAS2XXX8EDA.bin
>  Link: TAS2XXX8F40.bin -> ti/audio/tas2781/TAS2XXX8F40.bin
>  Link: TAS2XXX8F41.bin -> ti/audio/tas2781/TAS2XXX8F41.bin
>  Link: TAS2XXX8F42.bin -> ti/audio/tas2781/TAS2XXX8F42.bin
> --
> 2.43.0
>
