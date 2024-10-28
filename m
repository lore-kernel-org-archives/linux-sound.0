Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7031DD886
	for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114136; cv=none; b=u+1AcNTQ/AU09pN2QLOtMcWiGgW5WIe7HOjKe3YMRfN8wLHa3nr2WpvaD0ZE3EaU9+1idQJuR4PRhIbcLMfk207dGfb0LoTmKUHuBSNWHRySyrct+/h6DtXBTB+RioHzAhsciefgfa4kPQqqbhjcEgoRFj4QoG9mY81F2cmbKZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114136; c=relaxed/simple;
	bh=ynL2y9WuMgj3dveWKiLhJfkJgELagAbwDV6WYmDHEoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mz2rKRRHrF1IEOdUAE/PysqyMvZtBJmKLc4fagrFJkVShqmt1DiceytRysUJv0g7RWkrSOlv3+nsUT3vKs0rQwBuZ1zPkgMIYKY4GyWmi4pGV6wzZ3qyptqPZpjk1bW5S7rLDtCiYIUH92ngGwcSVnRvZdsrvM8Kvqh2c2Pr1JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OtI0qP7S; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OtI0qP7S"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4a49505ba64so1341006137.1
        for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 04:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730114133; x=1730718933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGypUE8EH0PE7RgIhsdX64LwM1rfHWiWWyyBVGZ2vjM=;
        b=OtI0qP7SSjHwh5LAuOqR28tFwITgpv013tefa1IK9N++UZCvWzr9MICMB78iI0zEKy
         S/KQatVKNINaUZ6fhJE+v+v1WePlZ0fCOM+qxYExCbPhukqTqogTpQZs8AsByCyA05AS
         ewjls/aQishMF9pohNiO1imFR6S5ET2Fr+/6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114133; x=1730718933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGypUE8EH0PE7RgIhsdX64LwM1rfHWiWWyyBVGZ2vjM=;
        b=tDZUI0+Yh90+T2h6JDD1ola7q3C1aaB+zr/LcjQcLo2NOJATR8KC6EccgnF5SEtw+J
         ReNNcLNCOkeehD1HJghtM1CrMszMMwpTyR9TtmXW68+SoNaZqnAWxyKEuqmuf5uWoovT
         Dbudz4QORrrKQdzRrR8YMArdg603GsCtBfAyfZEmz9NxvQQxyKUeUGfg8Fv/FEbAewCO
         GkqR8gLE07VNaXLJ/OE/VqPn0VfeNlHBVPi99UfmMmDf6/lKkvIHEuIV3/PS2t45owMU
         FkCTAiZLpFXLBlEHKjAYMT8PzLXuBVaVvuHhbjMoKr+4aMdJa60udBwB+IFW2F3nCjsQ
         YRqg==
X-Forwarded-Encrypted: i=1; AJvYcCXLUsFmyJta9MY865/DwXefUUOl2AMYwfr+Ru3DidnwWxOy0PRyd9dJhtkvcl4LyY1/mfwb0QdbFS4kPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOhie5vIFzTPZyq+OsUIRNkeEP7SxMFimAiBtpvuB+0Mr2Wi4d
	qQQioSpUNsU84DpGNep86LPrhF26/fFUpRbphavkZb269wipRpu1/calre+69p3IDlNfNR8CfrE
	=
X-Google-Smtp-Source: AGHT+IFOqeNs3eBVQkriXtq+P27AdZDDgFupDfS11Ntjf9nNA6gMZkkjNw03ooGY4FYVcugdEayBDQ==
X-Received: by 2002:a05:6102:6c9:b0:497:6bb5:398a with SMTP id ada2fe7eead31-4a8cfb5d0c6mr4579449137.7.1730114132855;
        Mon, 28 Oct 2024 04:15:32 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a8c526411csm1088824137.14.2024.10.28.04.15.31
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:15:31 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5101bd018ceso438776e0c.1
        for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 04:15:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8hpL4E2la+eZW7UAYxqGQAMzsSn4hoiVQv25Y9STlrUvIH3PNdwtitruHCAr+PRCvlg5nPvXE8sMRpg==@vger.kernel.org
X-Received: by 2002:a05:6122:2207:b0:50c:5683:ad56 with SMTP id
 71dfb90a1353d-5101501204bmr4351974e0c.3.1730114130593; Mon, 28 Oct 2024
 04:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025104548.1220076-1-fshao@chromium.org> <20241025104548.1220076-5-fshao@chromium.org>
 <r2qtuopc6d2vygxghgydole5ixxr4z5weougk7ldadyma4zi56@sp34zufvzdaq>
In-Reply-To: <r2qtuopc6d2vygxghgydole5ixxr4z5weougk7ldadyma4zi56@sp34zufvzdaq>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:14:54 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng0n25qrrBGa-Qm7XPBwSdW733tV9faa1q1s_z01RSJ5Q@mail.gmail.com>
Message-ID: <CAC=S1ng0n25qrrBGa-Qm7XPBwSdW733tV9faa1q1s_z01RSJ5Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] ASoC: dt-bindings: maxim,max98390: Document
 maxim,dsm_param_name property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Steve Lee <steves.lee@maximintegrated.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 4:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:44:44PM +0800, Fei Shao wrote:
> > Add the missing "maxim,dsm_param_name" property in the binding.
> > This property specifies the customized DSM parameter binary name.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  Documentation/devicetree/bindings/sound/maxim,max98390.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/maxim,max98390.yam=
l b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> > index 5bd235cf15e6..fa4749735070 100644
> > --- a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> > +++ b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> > @@ -32,6 +32,10 @@ properties:
> >      minimum: 1
> >      maximum: 8388607
> >
> > +  maxim,dsm_param_name:
> > +    description: The DSM parameter binary name (e.g. dsm_param.bin).
> > +    $ref: /schemas/types.yaml#/definitions/string
>
> NAK, you cannot document properties post-factum. It's not a property
> coming from 2014.
>
> For me, this is obvious that this is for ACPI and if you want to use it
> for DT platforms, go through proper review.
>
> In any case: NAK for this and other ACPI properties.

Acknowledged, I didn't know that.
This was directly from a Maxim customer and I guess they didn't remove
it when porting from ACPI or something.
I'll drop this and update DT in another series.

Regards,
Fei

>
> Best regards,
> Krzysztof
>
