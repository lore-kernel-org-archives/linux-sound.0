Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AA1FECCD
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 01:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787191038; cv=pass; b=HVE6Cp/2t9jGf/uT+cjuQvSrbnyVq6C9pF+oXEg+owifWyDfU1ipySfbkNMAnLCVas/zhFOvVxeu/DDkQkGBDNz88g560RRTQLv1UHQOZlQeie7ESOHK4Q+e7fyJZ/LO26pHSrPek8s+eDtLuyfHMZdmvOgRu8uoEiXuKIIAwls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787191038; c=relaxed/simple;
	bh=C3bR8dbH4tqhnjcwmnVGD7d9p9jk+49U/r8avnE1URo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aurp2hEhSJb09kOfsK2yw7G7VOhutUFrPb8aQpFJLE1SfLIKimeK6BfiAvWA0hUhc1YblFOwYIm2mcFHoEVTe++x8W19XXWThhH1Ga3ovaZbzmLSVg+jl59OzRNx4k4ouNEC5iAvyg25jJ+CTKZixWMwXz8zZdqzNe/n0dmQeQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLv6I/A8; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLv6I/A8"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84a2c90e383so323494b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 18:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787191036; cv=none;
        d=google.com; s=arc-20260327;
        b=EMcsBX55OM8x9eQfL4U0QSAUl/qWKmZFqhWimwtRDP2WO7A/Ma//C6YCRhavPIoDiA
         qV3tSXseNAHA6qHPwa1sOiFpfUQNCOyw+Co6tZKLnl5Dg51e7g5oqNqV6mliW8gg2Me3
         nHR6bybAoSozwgMKEN+RfSovcpl8LWU8R5jPBG0hvMfnMmN3jiUbig2W1sOH+1exCCnV
         K6fbJpJjvCwy9NCDM1Kwbe/ys+I7dEhkzTC5u3zdOR0xNP8lmJkD38t71NXGcw5AgRm7
         CxDRuOGff/GuRSxIfsX4VgJURHJLw7Y3GXhtRXeJUdjv3FgyQvDTlt0JhLl35PssTjiT
         zGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=it5S9JSefBP08qQNXkvnIfWUHs/AeH/D7OPJ+RS6iTE=;
        fh=qFkm5TCmquKMQCYEJHOD7yXq/otJw/5kLCnTJTWyZjw=;
        b=azKMq/3vxxWSJ+cjyqd/vy/O3i8dGn2OgVDRNaFX07QNNqeQGgs0kzDS4wE/29F++c
         y9MLLAUd9RcMCSi0yIOcspndTa2tpvoje93QlYpmvRC/xZxkMtjueskTUzY1gJ0RmhqY
         s4B9bPKZmkEcEHSnsyL7mO2FxAVMMa6Eh1B3zQrYH7WCUFEgF2ejjm+r3tHm9oZqFfnV
         ONyXDv5DZLDWwIkdIqsM5xshsVlz+0qb6jcitauzmB46dgZWk+A2NLHmHHJJIl56vl7i
         2V3eqAqeT98wNyRTMr1i0sF/dVZuILHCtblrAnRFxJ9swziXweiyQlAeNVVWKKQFzxmK
         g0Ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787191036; x=1787795836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=it5S9JSefBP08qQNXkvnIfWUHs/AeH/D7OPJ+RS6iTE=;
        b=sLv6I/A8dWeegSJIqGWkWhXKgDPhBQtYSiTIBA/conW0p7V8L4L33Sr6iMdD+PM7yb
         +va5Vp5mdyS+RsJSmUrh+cVKxyureVJWLc0QGs6Uk9vKObIJg+T7Ze2NuG0A7KywmbLU
         D513yfLhpSQnCVeRvylnxPAZytUTbiryLwSKKRYEIM7HtRul3UTomtXmQ5CmnqAlU0fY
         NCVN+MttKDQUG2Mq7X2iPo5vuhUmo9kOGsIpmSdsnqiQhuvJ3LqnDzp6nqshdr1Hb1Gr
         3dUUkzMsWvrUqjEbpV6h+JRl93jFfwoMlpEOalN6/5y07jCJGJZe9qdwl92u/2XADnT0
         WozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787191036; x=1787795836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=it5S9JSefBP08qQNXkvnIfWUHs/AeH/D7OPJ+RS6iTE=;
        b=dygr1Nvut+mzGIC6AXrUctVKfGlXNOoORyRKVtiT4gnJdOueQTDCIrhwxGBza0/3LJ
         loXxxk4jRnJZwSDvMEeyG0NYjcGSmRcEfiwUQCuI8OFxQ1iSHRI9yk/Htk7pUAu4fNk1
         yzxwd5wIBzEGR6JWZ4xVAr+RwU6IcBbEsDv2AEDjZ9E5nyr7XkSgVO003hw6ivBroy9+
         gJc+R9YwPpxTZ56wpsVh0RNbYHxVuIl8Pz0ikamd9z1/cmS5Nc98AHvKJUNqawkR6bWv
         irmMI+6N2n8X5Lk61qMvTdSSkNUgAXINADFI4DD2hJ3S3ZmFVC2I3BuoPIYb6OgUyu11
         +2+Q==
X-Forwarded-Encrypted: i=1; AHgh+RranRY0NqAMrHMzaLTSyr3SR3DNgi5TER5CJW5cPZN5Z71z9o70AzXZrzSN7QZ5TJ6mY5I+nursb73lXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWrqMiblCYF9tTMyC96OtfdNYjSonqTV8ckHMG+j1S/NWCOjkp
	QJHUKBdClHGI/5vo4GPYfr3N/SPVO4Z1QjQWlzLy5jZ9Fmiw7eyznlKB32j0zY1pd8jeHOq9dbt
	VnZeeLygSY4o18sx39g1MERbpvmtzgsM=
X-Gm-Gg: AR+sD11VaRk0+d9L3ZhJXA/TWLLc0kO0Gn1QkrLwUtDFUFtWmnwY7kghRhSDVqR/PWE
	C6CgNggGdYCK+ZpCNjpDsYCly1qToOntgEfQoNpb6OGDItxIh4bEBf/lzGcTrBWlKDHlV1pzY6N
	aSrHqSeLPm4YdvHqmA6OoUvrktfWRz9fNLnUqiwetdAdKtGBgweEW9FnW+cnK8ss/Q6NpI18x8L
	WGldBsAdXzKqmhqIHdjlYASJoPU7RY/O0EzCfjbRBJiTqFvc4QUqxtqU0q9YfOBU98xWkG+CsgA
	qMgY2ThtEVRIVyM73aezV5HbRYbUQsfoasqwYUzLCuL/jIsZ3z1fxjQMxO8ajdFRpD1HRhsVhBe
	g72/x6yPpY4za277RtpR/HmbWV9f+e/rCtR3xNA9N5WcIyRv8W/sd2SRs
X-Received: by 2002:a05:6300:6182:b0:3b3:3506:cf3f with SMTP id
 adf61e73a8af0-3cd14c6b150mr3711941637.1.1787191036226; Wed, 19 Aug 2026
 18:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819101849.68010-1-phucduc.bui@gmail.com> <20260819101849.68010-2-phucduc.bui@gmail.com>
 <8881e314-0825-4686-a296-97c03b1dd33d@sirena.org.uk>
In-Reply-To: <8881e314-0825-4686-a296-97c03b1dd33d@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 20 Aug 2026 08:57:05 +0700
X-Gm-Features: AcwNN1WvPV8f1W6lpVMiV3TmhZ52Aju5OoAforzPDg8091qw5BC36o8DvhecH-s
Message-ID: <CAABR9nF1VaUKeUDhJydJYYc_Jc0kdYCdD3+rtLNR2SPCx9RPbg@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Thank you for your review.

> > -     apll1_mux_setting(afe, true);
> > +     ret =3D apll1_mux_setting(afe, true);
> > +     if (ret) {
> > +             dev_err(afe->dev, "%s apll1_mux_setting fail %d\n",
> > +                     __func__, ret);
> > +             goto ERR_APLL1_MUX_SETTING;
> > +     }
>
> apll1_mux_setting() logs errors, do we need to add another log?

Oh, sorry, this was an oversight on my part. The apll1_mux_setting()
function already logs the error,
so there is no need to add another error message here.
I=E2=80=99ll send v2 shortly.

Best regards,
Phuc
