Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A04C70811;
	Mon,  6 Jan 2025 20:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736194688; cv=none; b=HhZAe4EE5ciRJ2rk6zc2ylp1iHuOX/WrvPnXOOiwTWyIP3V3HAXorfrwB4nH534vGGa7j6az5c2lKFvSBzdO/ihY0gFFlRGWWEXD9bC5XABeZAqcgXiJx36ZaIX8V3iHTzgSiNFq12Kh55IyFptxjE7CLNZk03rAv3PDXQ5/3ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736194688; c=relaxed/simple;
	bh=P0GaMDU1JHDijDof5t0FbQDlFNQpuiTQnqh6uywyrTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFzwoyqMtwLScwdwIpfFWNUBYNjsadcfSH5594dJ1ZRDkauAH3eJ1j4EW95Oa5LVvWheKXiC8t4jGHPUdcD65853UCO4QppsrTRDX79l9v8dUjx9OpyN8WTWpW1iTrgH1ZH2+njyN9FI7RejUSu16Q6KkaaFmwJU7eTMY/IdKU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=aYoqYDEO; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="aYoqYDEO"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f4448bf96fso16459481a91.0;
        Mon, 06 Jan 2025 12:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736194687; x=1736799487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0GaMDU1JHDijDof5t0FbQDlFNQpuiTQnqh6uywyrTg=;
        b=aYoqYDEOJ2MBrDtc3per+K1LVu9+9JPdjOS5vOkHlXIOVbaIQSW4T9tm0tbgMnrKC5
         aJTxZEVXTE0/zEFxeSZUBCv2QGs1GJ1w9vFS3wGN4q66JRz3dDUpvomu8+65g8UjXuFk
         AAHMzSGmz3eltzig0f5L4DXibxVy00aUvYOQJ0TLlkSqzncALznbsx5t7xUvY7Mx4FXF
         57Cm2EmPSvJM6IANRCq1XQm/41Uvo8qovSO13eTFmHx3zEDNvmpXVonglvG4nDPv10Yg
         NIoyWVAb5Lb7sjgLCpS6vrURaQCptCFnEXGqXzFqJPSFrOGpv3F2iJ+y2cobG2BSr1JF
         TJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736194687; x=1736799487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0GaMDU1JHDijDof5t0FbQDlFNQpuiTQnqh6uywyrTg=;
        b=EvGNxI/CMo8pCsdu7ZwaVlFUwf5Zxex2zM1INRyEoPSu9//ZlHgOehQspnrlFyRB6i
         AKp9igIcAHvQm8SUESgTnH+0s9VDPO6Y8ZXoOANwhAVi4p4K0PAkfJHTD9UyW5wmqKJQ
         8G/+HGi8ambKa3tId/R04AHx2Bl5EnPgjxelCIIDTeb0DrO1lfKrzyVtvJz99Uu/wHVi
         1ZukM8y7ri+aBxZ2TwdlijbUU/l9fI1apWAyrn8A+/GcNGZRxjg+8UjhSRFWdBFeM8cM
         Omoicu9/shtw2gP0PGZtPREOLLzvSiX6osPih+cX1P1+SPZwCNVGXKbU//IjQYzGaxa9
         eUpw==
X-Forwarded-Encrypted: i=1; AJvYcCVD662gg9vGsiCJyKVlbsmr1wmddDLZ6hrNuggi1GKrc/M6qRjs9UefjtUs7K5uuMYiyHESDOxY+uip5kI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkfD8rVPritsgBkMoToXNeEE3ToXFQSvhwkLHAKPg5O2epXVrq
	mc0VEqbJXgF3Zhd6H+yPnSIUBCHn6j/mulsEQjJwCJUaXUjkm/zcH1SQv5u7nsYFiL8dcL5tpWH
	jz5FMJvIe40BMZz7H66lR76pUYS4=
X-Gm-Gg: ASbGnctYfvsXV2JSte9mRk1ziYtRhnfOTQoN0qja2r9DX2mYeG4rzl9x90CWLVW+Aru
	U0QsxYxzg5mMrmvRsj2XRJ7PGmT3y4fPRj3vvztpm3qex7pKzwArHzykns0PixgF6VlomS9c=
X-Google-Smtp-Source: AGHT+IEMGb87OFQuJfOXeyD6W2MV/LaUciQW64MBFpUBXTvmXxqYjiY4re2OdxXlItV8fNYPUYktNeEauohkfWTnwKY=
X-Received: by 2002:a17:90b:54c4:b0:2ee:cded:9ac7 with SMTP id
 98e67ed59e1d1-2f452e38d72mr89776314a91.20.1736194686711; Mon, 06 Jan 2025
 12:18:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
 <20250106141316.375984-3-martin.blumenstingl@googlemail.com> <1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jan 2025 21:17:55 +0100
X-Gm-Features: AbW1kvZ4sjlSpzNI2qfZDOfjihDRPUGNnWB5HCHlgSe6uNrrrt1gQ8zPmoQo7Nc
Message-ID: <CAFBinCDanNUqcM35gEn7yREY0egddGMCppemnxj57Wo065Rwww@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] ASoC: dapm: add support for preparing streams
To: Jerome Brunet <jbrunet@baylibre.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	s.nawrocki@samsung.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 3:28=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On Mon 06 Jan 2025 at 15:13, Martin Blumenstingl <martin.blumenstingl@goo=
glemail.com> wrote:
>
> > Codec driver can implement .hw_params and/or .prepare from struct
> > snd_soc_dai_ops. For codec-to-codec links only the former (.hw_params)
> > callback has been called.
> >
> > On platforms like Amlogic Meson8/8b/8m2 the SoC's sound card
> > (sound/soc/meson/gx-card.c) uses a codec-to-codec link for the HDMI
> > codec output because further digital routing is required after the
> > backend. The new DRM HDMI (audio) codec framework (which internally
> > uses sound/soc/codecs/hdmi-codec.c) relies on the .prepare callback
> > of the hdmi-codec to be called. Implement a call to
> > snd_soc_dai_prepare() so the .prepare callback of the hdmi-codec is
> > called on those platforms.
> >
> > For platforms or sound cards without a codec-to-codec link with
> > additional parameters (which applies to most hardware) this changes
> > nothing as the .prepare callback is already called via
> > snd_pcm_do_prepare() (as well as dpcm_fe_dai_prepare() and
> > dpcm_be_dai_prepare()) on those.
> >
> > Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Thanks for working on this. Overall it looks good.
>
> Not sure if the call the .prepare() should go at the beginning of
> POST_PMU, as done here, or at the end of PRE_PMU ?
I only know that .prepare() should be called later than .hw_params()
so this is what I came up with.
Mark, do you have any preferences or suggestions here?

Regarding the call to snd_soc_dai_prepare(): I'll take care of that in
v2 once the above question has been clarified.


Best regards,
Martin
