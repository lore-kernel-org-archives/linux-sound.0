Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673333ED105
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992724; cv=pass; b=IjS6L2b5YRmRU30kXF0Fx0RwSCNKcjG5/nFjluY5Nv6BxAKkdpIyMvrk4G6QWY6M7UwU09Be0kcEGK0SdHtivBl9Vz1AnuVn0sfDj7S1cZiDKXyMBPdPEVH/vPf6CKrvazPZL7PtAijPik3Ia68Tuq+av890Rey9xWj55uwn+a8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992724; c=relaxed/simple;
	bh=AhsPNfeCJ9V0MojTT9laWo25XjBvnNJFVFJi677eOj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWvkdojBbHDmMbo353ocYEkpLMDv57rBS4z6dfpXCTjzM0cfUXJZIa6HXBEg8K9Yc6rtQUNeIzvOJmi0FHVetNa7lm1/8fwOcVwNAqtZBdJtVg61g39sHL8Ti8fGQa0upzLT64z7PBhbaFNKrtSxROptqCa/UzCsX9+RP3zx7nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IX7/i9jG; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IX7/i9jG"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c86214eead7so982516a12.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 01:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780992723; cv=none;
        d=google.com; s=arc-20240605;
        b=ElEWVz0wcc+ISk+MCc3Ex2/SNeOtgCIUQY5BuUMh87h6xt5RuJfW/xsaA5dhDi7wNH
         hOtkQbis8BOVdnR527RDxLQ8WuiqvveR7Ob9jYo8xGvvIQpnjV53MiihqbeJ8Iyz9Hpd
         eNsLMD4hZjeJr3NFhDi9epIwDBUtuUVWqLREMUlkGGX4N4SLoEm8FrRr+KoL0X9xjamX
         +rcVOaEytfh6IPbkJ8fSVyuWva1fwx7riOMtSOvclSQUSfKKsElx2cgjxHANuweEomxy
         jMzrntyjDlIrnp5E0z4E02t4HHn+xc4ctYf6U3b4D8kU2GcgsCgvCi99mYrhdAKVk903
         HHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IPFHCJ5rJwgEVLo96ifIMbncAZkuI8Dm8EuKwFx00SI=;
        fh=jXzp7vTMvcTk/3dxoLJ5k+OufCt0zaH4W3UesjP0Zzg=;
        b=NY/omNHZBWlzX4s9NqZmbS84Ncpq6pkLu1wJ35MuBYEXqLGcEm1Zk7Sjq+K49rcogX
         /g+Cq92b+KKTdcBAVtydLoFUNi2OJldTXSzxxgLBiGiwo8mNmNNT+D7/K4qRLGdAMclR
         Kkyc11mruoUdCQZhqlENmyeNvbzihHEGnnoIVFguzAD7YmD+WjnboPJkXUNyCDAifDaV
         4e6avfrhfqIQM5GW97YOyOX1TtygiImBuPFWJXCbmtV0j8ZDvAAmewufEAnw9MA57j8I
         asywbuQB/BxUsxQEHFc0UYjB/F59D1Y8wJrmtFgeq+RUMWSHohBc0wl1tt1zFW22IW0A
         7yKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780992723; x=1781597523; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IPFHCJ5rJwgEVLo96ifIMbncAZkuI8Dm8EuKwFx00SI=;
        b=IX7/i9jGv8/XlnB1SaApdOLNbvz1pfm+yIU5tcZq74wbZEOVu83VvygBB2xeJEY9Ll
         n8K+BpHEDCPVRTRRNZUc6seOwNUt6SYpBKjJVKLLuiGDnb0AUSnrrpTaICEMmSBer6hK
         ZnrQTbdjbJpZEum+VBDokQWQfyo0uUdEU5C4SuDdVPAwHgRlI5hsvwKa8q4im85vukDV
         WGNqmYsFbTqCJAewONRsUZZQ/68MS7y+zIjHWDUKQXiV/l7fAhMBeJN/2eVQWShPbCXa
         GGV9GMDFDyge1MU6w2cMDNYQ+V8+5jpIum18+VHkAVSJ1ksE1BKUpCO3wwJjgFsBTwdd
         0e2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992723; x=1781597523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPFHCJ5rJwgEVLo96ifIMbncAZkuI8Dm8EuKwFx00SI=;
        b=aJvXQWnCDujEVv5q/FCKWfW/ojQGI8aQEGg0PfpcMlcHGyLfB1029s6TTex1Fw2vJk
         bKfdRc5Iz6kq0E9z1x36zmPJ5Zq4KmSOi9Teh/o2sToUCSmgs3nFh4GxFOhnBiPfDJNR
         uKJSQe+rPLGs8xsOLkbHWbtPrNCyE2F2cUPjd46WMPAePzbWeBdHQaUhIHsVzt/Sa2Os
         /GrQihHXKOC1ZUOme0O2tYxCY358MHD5zAkglCTYCPbLBfdfHEEcUOCjF/vffElAKQ2R
         8OgbFkyLgMe7dwPCsWF0WAB/pCaZdo18HOQzShN0plgBE4LK3APZSSRqATRIMQI1ElaV
         QtJw==
X-Forwarded-Encrypted: i=1; AFNElJ/j0GWK4UlwBmZuHZCRSW8gT/szGUnuWiV5gxagiZZajjjAQS6+Mm3qpFTrsvzDEhiInO4rRCNcWPCZbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06guYYiREGoW9tEZcRnnmCf/yJrdhqibugpV+fQBuYvpljNsk
	Puz4sBVmfzAwwFdqeiNzHqodnhLFW5DsaKfBi5qSJgj5wHLs5MfP8v9evRyBpsqvRZ/XtcqjkoS
	xrHLxJ8XB9OXELVBK7KRVqHXFDS5x1nQ=
X-Gm-Gg: Acq92OG6vAVykeILAVqfYRytyxuXxzDEjlt60/hT7USJBZ691MzrqswFer+9VKqJ06Z
	mUKdOKFQAU+vRs1sQEsxvgD7S3PJcLyy16FscZgDG/LedLAmycTersGRcRZfoFPZChCUh0ikTiN
	hHLfaE52WZNHavJPeEnJQX/gSCopc1iNO4fIrroMU3Usf2FXBg/k7jR9t9qcsnM5GlfL+wbnbsS
	nruLg2OKKRm2U8RQ8Gj9uw5cHrJxRSv0NjeVbWpJUp8eKV+M+zEjLqO+1j/fiN3/6zw+xLAxXph
	wsZQLo6ZnMsuRh+PhtTjmi78KX/jTqPKRVRHsyfIV5FhHo8Ig8HQ5oPWI3U=
X-Received: by 2002:a05:6a21:a8d:b0:3a2:c9a1:2c26 with SMTP id
 adf61e73a8af0-3b4d39f348bmr17130674637.7.1780992722861; Tue, 09 Jun 2026
 01:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <20260609013107.5995-2-phucduc.bui@gmail.com>
 <20260609-nimble-guillemot-of-karma-bef5f1@quoll>
In-Reply-To: <20260609-nimble-guillemot-of-karma-bef5f1@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 9 Jun 2026 15:11:51 +0700
X-Gm-Features: AVVi8CeUKRnlxvhT2K6w3TvQNEVCC1-hs1J00Q_rHp-PFlql8hF1iJ-ZDEJDD2g
Message-ID: <CAABR9nF6uhEyCo-6cekhKwfm3zkqjXCpj2O8C8Xk=2Frw0arRg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your reviews.

> > +      properties:
> > +        clock-names:
> > +          minItems: 2
> > +          uniqueItems: true
>
> You don't need this, it's by default.
>

Could you clarify which part you are referring to?
Are you referring to the "uniqueItems: true" property or another
constraint in this block?


> > +          items:
> > +            - const: fck
> > +            - const: spu
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
>
> Are all optional in the board design? I cannot find answers to that in
> commit msg, but it is important - you need to explain WHY you are doing
> this and WHY such different way.
>

For r8a7740, "fck" and "spu" are required. The SPU clock must be enabled
to access the FSI registers because the FSI block is located behind the
SPU bus.
The remaining clocks (icka/b, diva/b and xcka/b) are not always required.
Their presence depends on the clock topology used by each FSI port.
In the previous discussion I described the supported clock configurations:
https://lore.kernel.org/all/CAABR9nEhOTz1-0NmCMTbz=-+782Pto0yovSQhBXrXqhLwMg80Q@mail.gmail.com/
The hardware supports several valid configurations, for example:
 - FSIA/FSIB slave: only fck and spu are needed.
 - FSI master using an internal clock: ickx and divx are used.
 - FSI master using an external clock: ickx and xckx are used.

Therefore, while fck and spu are mandatory on r8a7740, the other clocks
depend on the selected master/slave configuration and clock source, so
not all of them are expected to be present in every DT.

Best regards,
Phuc
