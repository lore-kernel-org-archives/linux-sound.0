Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5391D958E
	for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114092; cv=none; b=WGOxkoGElmRBeUB3K7UEqW10W50ZhJk7248gTIlUEVGgufd3/S+RykXKNlkmQeeo8D4X+voU7+2kvvPDjXdcZ4vMfsTpnEmGpXDR45JF2Jl+iTP8n1F/LpjRnqbq3wDksQ56XaZ1jMuvcEn6+PGTImN+UY6vra5/w3qhDIWyYvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114092; c=relaxed/simple;
	bh=rZV1CslZk1B8arY+dKaXuzo5OLwD/6vbUj85cb0sG88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tplAL3+6NXXfRAkOhKQtt5XBcTCmGubS6CS468isr8FkYTfhC1IKev6X4tpwwZtDnDu4sxQUXD2vn6BiMXSWD2vTRzgO3ic2URtb4zWm/0bcs4wcJN0wKpyFGrTn1VffuAXES34Y1L9TVaeXW869Y0QeBcwbqyr++sSikXxupTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fHTmNORu; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fHTmNORu"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-50d4797098dso1307423e0c.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730114089; x=1730718889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJAyl38jEw54JK8vLB+Jw3zg1/RGB44yP0anG4AqfEo=;
        b=fHTmNORuiYWZYyKnWufrERyTY3SU0//FXasX7ZwubuoWb357FaWDkqEwnIlmfo2Jxx
         3LBdgdcsZkH9SetTnxhLCM7yRhzR9BnDIolsph1gMxMNqqOJPgbZwgzKLDV7RGauRMzK
         nPsz1HZQP440hBvjPqSA2lvvHw2al8SCsRLVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114089; x=1730718889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJAyl38jEw54JK8vLB+Jw3zg1/RGB44yP0anG4AqfEo=;
        b=DdwnAAOIZSl1uHaj7lKQIcuDHRvNrcTa09lUkXHDiv9/j5ytECD+VknBti2jziYqfc
         Nq2zBXrgqGGqwX8W2IR86Cvf8JD0fRY4Ue7eEVouqrmDNmASEflAQppKUTNBd9qddCry
         kpHd2xwFXASBn+OWiHkXuiU2O5TO5Fgr9lnzPwFQtt1tK8ZPS+kfTEAsvMfm4BMJak80
         ZJdfr9v/L+f0FLVRCxNrkJ8/LfqKvMEXznlmqdG1LQh0x/JC098bbE7qpwNolm2xHzmU
         E2YNCiCzFI23rZxa3Lm4ffsrCNlCnNyeYYV+vw4W1tJB2VhpXXiRp4Ej+TidDvtJwrE2
         aY4A==
X-Forwarded-Encrypted: i=1; AJvYcCXF5fjYospt+PsaSmGwz9jomhrO+TedopX/bZw1jjSmPpow44ZBymUaQZRyvnkWA41rr/EDp+OKZOMUaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEPr7jRQ4QJOeDydsikrqw3jE0QjOa7t1DSHyRBkh87GzZsoFw
	pDEnTkyc1/tEyfif48Ov6KC+3R6AMSHAM0SNBrAtd2ClWxueJ/gwstlvjaLJDFTP8QIebo1ROnU
	=
X-Google-Smtp-Source: AGHT+IF3yIKYm9+1AcXMCViSa6h2G4H9xJfDgzt5Ym6/BsvmzZODfHX1IHhxnspnbMhvJUMWLuj2ZQ==
X-Received: by 2002:a05:6122:78f:b0:50c:e37a:97e3 with SMTP id 71dfb90a1353d-510153410b0mr4779361e0c.11.1730114088818;
        Mon, 28 Oct 2024 04:14:48 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-510047a7791sm818737e0c.52.2024.10.28.04.14.47
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:14:47 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-50d5d6f9fdaso1243972e0c.2
        for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 04:14:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqqNxh3RswaWtIfk+qNiR4UhGJi6R12QD++h3tD98xLrXjgKatWyI/0OofFCkqs541qDiaUpOfOTdD4w==@vger.kernel.org
X-Received: by 2002:a05:6122:1699:b0:50d:583b:934b with SMTP id
 71dfb90a1353d-5101510e5a4mr4976737e0c.10.1730114086990; Mon, 28 Oct 2024
 04:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025104548.1220076-1-fshao@chromium.org> <20241025104548.1220076-4-fshao@chromium.org>
 <i6eljb2nzhwr4bd55dbudsra3sni2hhk2eqgu3gttatwvnolt4@w4uhrklbyop3>
In-Reply-To: <i6eljb2nzhwr4bd55dbudsra3sni2hhk2eqgu3gttatwvnolt4@w4uhrklbyop3>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:14:11 +0800
X-Gmail-Original-Message-ID: <CAC=S1njm-YDo=e9Eh7Y_qkLJMa+SK63s8Nre54d0sV0V59DonQ@mail.gmail.com>
Message-ID: <CAC=S1njm-YDo=e9Eh7Y_qkLJMa+SK63s8Nre54d0sV0V59DonQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ASoC: dt-bindings: maxim,max98390: Refernce common
 DAI properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 4:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:44:43PM +0800, Fei Shao wrote:
> > Reference dai-common.yaml schema to support '#sound-dai-cells' and
> > 'sound-name-prefix' properties.
>
> Why? Is this a DAI?

I'll add a line to say this is a DAI and the patch fixes dtbs_check errors.

>
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  Documentation/devicetree/bindings/sound/maxim,max98390.yaml | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/maxim,max98390.yam=
l b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> > index deaa6886c42f..5bd235cf15e6 100644
> > --- a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> > +++ b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> > @@ -9,6 +9,9 @@ title: Maxim Integrated MAX98390 Speaker Amplifier with=
 Integrated Dynamic Speak
> >  maintainers:
> >    - Steve Lee <steves.lee@maximintegrated.com>
> >
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> >  properties:
> >    compatible:
> >      const: maxim,max98390
>
> Missing dai cells - how many DAIs are there?

Acked. Will add
"#sound-dai-cells":
    const 0

>
> Best regards,
> Krzysztof
>
