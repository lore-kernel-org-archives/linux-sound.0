Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A70C1917ED
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 03:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770607008; cv=pass; b=FZe2tb/u6AZepwfILkv98IsdHc3Udn5ZLZtG1PUWKfRbjlBXK8bXehx3Na77KAe7rHXJjDmKC953VTOqqN0ywKbmPOeX1AXyFBk5c3m26zY+yMrFNy0LXCbZ/Oqax0Y8rAOzfc6LF1uVBzYHThJAbMr9J7OyS/17NhbKf1sIPNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770607008; c=relaxed/simple;
	bh=sy9i0GbkGW6sCgJAocj4I0jaoiqTfxyZRM8jNwWfqiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cH2p9tcjuIm49hs8Tq2CU8TYb5oUIm/CQpbCh58c8BOu+LKb/A3agwwdIhPSCzc99zFOUghzPKRc7Oc3h14qpORni6TZqbNjNrwnRRi2sFViPZ3vCfq+sVNlVbkr80kHSGg/kpazgYIgnkkriJP5d/+9rjsVARamW6owfPXbaZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/Ev0Yn4; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/Ev0Yn4"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35480b0827bso2369398a91.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Feb 2026 19:16:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770607007; cv=none;
        d=google.com; s=arc-20240605;
        b=RNmkGgYNruoRC1y/+jetj4sLYwZP3BZG5W4KdF7o/vT+zR8MntTMFm5CJEUiZ0+M8H
         lrolw35sCIobMpFYF8/7LeG1EANskyTDWPLe3HDDt3FCv6rG6FEweJGk6xkN1t3z5yVv
         JLgH513uFAj5mNfY3dLk1waCSjpkvcPdpEEjs06AZv2mUkulRnY6LI0K4VD9PLoyuRAQ
         9ZN2lvtSbI/77knEYwdvnQ2AFQqhqj7KoN6UdcA/C0Uryc5Vy+HdIMXrpAw/bhISZ5tB
         ESXVFqfM2zOyOKBxDg5GfPwYUf7J536NKnamfPziv/fHv7Ez4TSGFjB4c0OAj7Md+KSJ
         6t7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gHTyT6nEnXSnplwUfxDYJkQonZefuQNxcoEB9kIEWPk=;
        fh=8aXVL/C9052Hit6l87V/yLlwBsCXGqYwjsaPvabQp7U=;
        b=fu3uP5qAiIe7gHuzRQUpt/5RgQOoqZfUlE4cuVp34zoPMM+A7o/BKRJ+vjyiLaWTbF
         bME3jnHObVTQ7Z6Pb4rnMJqZTrYQko7bhnegyE0elaEJKemDwOh0UNDJr81Y/4sT1U2X
         7vEYtLgjwqFUHqj4lAMKQfsxRu0ji8lY6ehw+A2xizHnCQ6LP3dMdAuz6OaUjx+ws4vy
         JGa/mRWlGrVB3pByrwcqcEHcEal23E4SzeF2Ebl725OrG7KXOEX0q0waq5NNI4Za9f2N
         h5idzIj/T0au6XzYDYvbHOnr9B+k02oSJRUiMi6yUvuq7KgeFoCltKS0fnTYdyvzmYQS
         NZow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770607007; x=1771211807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHTyT6nEnXSnplwUfxDYJkQonZefuQNxcoEB9kIEWPk=;
        b=I/Ev0Yn49VmmE+C8qLMHA1X9U5WExLIlqyDILFFZXKcxI8DXjivOnkMxOFidHocQP/
         0iHX550kR6EIPQ/aK01BslejrOPL8ipw813NubSJFMOPSm50Ye86xCyFcrPWWn+XZ3tW
         B86cipIq6wy+c5VrewJTxZemtXiHGSa8GpPuHEzrczgl3D70Q7phq0jnsd3Gz3Hp9Dy8
         msOOQMzjnrKuYLOvJFNKoFIXzBu5avDgNM4U+8dUcN45LUxAA859YCX0DTuwho37qhWt
         nGWYbl3O5rDSvAhB12dwxxNexd2YscWfCTD1iLYZLBBT3KC72/Lbja5JFMtYlD5Ec5uU
         cuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770607007; x=1771211807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gHTyT6nEnXSnplwUfxDYJkQonZefuQNxcoEB9kIEWPk=;
        b=beEwqIIKEXTlvINaseK6iOTguXM2GidUtea54wqvxlxYDi45rvGJXDwCuhCbYgrFN3
         r7Cvnu82IoVw4Y5uiGv6hrJB9HKkFiMww/03txlHeMh3RvwJIDDR6EIpjhTdNuHWYqlO
         OTcY81eZj6rWUbR8vx5o+B/ZHnLRFACdiYjoghBYPG+IOi2DEdttUpXn04QCs9dKIirD
         2E7LNufyq17TFGPqIyZoq3r8oJhpxliNkqio0Gly6gT+6+uLtaTfUHIlhCIHPoyXkQz6
         hIhffdwc5bLLQFOtnJD9WTazay66j4+6fFXdmQ55bNxkGyk6HtVVGDmUKVXHz6nd4qVf
         Izaw==
X-Forwarded-Encrypted: i=1; AJvYcCUIBWdjf1tfGIPSVKF3yKnugglsAsKSotHeboPcW9sXZOtRzIMGiWJ59uWZ9JLSGF/aaWz4Pws8QthvgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7z+PEXI4ddT1YBTUQKGpzgS8U2dcwWFAEJabQYJnlvTzcJtf1
	EmhCxdr+Ic1cpcRGoJZGXWeu/X+N/rLSkdqf4o27yoGhqIQdP4VMrudj167HVqOBGwjrnDY9YAP
	oYZE9yxVfgGK+S36CVctOAqg8SOYfuyw=
X-Gm-Gg: AZuq6aLDnqSkKsBkfwsImJMqezjdQNGNkQnCVpIWAK+U6qMSqJJ0se+hb1Fn+GlC2cp
	mTmdZOmyAY3mTB9Ks0Pb2piganznsYajdiX0bUhmjrgutqgt5k7BY6aIcrmTUEmfKE8CeGEn+hP
	EQ6v0DsTCzuw8CpguBIVuPgQvNAIrehZhaYVHOireQYnV8WHlcG+BFK7rAlj+iFlWKE5g7D+mdB
	VCU6weS8fFf/gKy/nvNx3Cd/ItE461gGl+//0tIrWBKk9CpvbPxvLkvgjDLCGVLCwP9Xl8=
X-Received: by 2002:a17:90b:1e47:b0:353:2972:74a4 with SMTP id
 98e67ed59e1d1-3549bbf563cmr11484025a91.13.1770607007093; Sun, 08 Feb 2026
 19:16:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206084334.483404-1-shengjiu.wang@nxp.com>
 <20260206084334.483404-2-shengjiu.wang@nxp.com> <aYX8qnKiPxHej-Xo@sirena.co.uk>
In-Reply-To: <aYX8qnKiPxHej-Xo@sirena.co.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Feb 2026 11:16:34 +0800
X-Gm-Features: AZwV_Qi1D-HuZj6R86-IG9_oK8GOda7quzttYuSgvVtuYCMC-SLchN_iGAdvXmY
Message-ID: <CAA+D8ANHrwN_vL_JmC8ZUQ_FPUcOqvBof=Wrzkmpbexi5iFMQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_sai: add bitcount and timestamp controls
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 10:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Feb 06, 2026 at 04:43:33PM +0800, Shengjiu Wang wrote:
>
> > +     SOC_ENUM("Transmit Timestamp Increment", tstmp_enum[0]),
>
> Don't have arrays of enums with magic indexes into them - this is just
> error prone and hard to follow.  The normal thing is to declare a
> separtae variable for each enum, or if you *must* use an array use
> named constants at both ends to index into it (but that's not
> meaningfully different to just having multiple variables...).

Thanks for the comments.  I will update it.

>
> > +     SOC_SINGLE("Transmit Timestamp Reset", FSL_SAI_TTCTL, __bf_shf(FS=
L_SAI_xTCTL_RTSC), 1, 0),
> > +     SOC_SINGLE("Transmit Bit Counter Reset", FSL_SAI_TTCTL, __bf_shf(=
FSL_SAI_xTCTL_RBC), 1, 0),
>
> __bf_shf()?

Can we use the __bf_shf() to get the shift of the mask?

best regards
Shengjiu Wang
