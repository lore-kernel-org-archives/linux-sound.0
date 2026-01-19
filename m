Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8826B2AD
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804058; cv=pass; b=G/ma91Vfjaobkw/Md2Y8+AcVbgC59WLJwi1ewI5JqIWgnR6d3UrVXazbthmf2NzCXwU6CDs3IAynbOLVHi4R7DEoVmhkG68ozkdbJFl01blkUDiVRv85yB9VYl+XG1AMYel/GFTAkFhmY0XoWgR8WS3MMIm+slYXJO82jWJEmk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804058; c=relaxed/simple;
	bh=oieor7VL7XmLcFuWp2WFAIYBHFITLArY/5uQmoKHexk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIsdrxxq2wHEJaKHZZUIrMA65pM/2eZl7OMkFfC8NFm3BP8OdRHn1nvjueuDnW3sk/1MPksPbYwt8Cz9j61/CaQB/5yVakAGmliLBoeRxm0eCjiqI0fFamx21oBLuZAw7mOQ1ty8TXNpLceSt4IyZNobtWeCSXDXqh9pfMZEydA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VldwaKEk; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VldwaKEk"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c5e051a47ddso2691195a12.1
        for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 22:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768804056; cv=none;
        d=google.com; s=arc-20240605;
        b=HEwFc5NRU1A7zyQJ3fg7tt+YzyPto9OU7X1S+eVtGBBgIADiv3H2dhzVLnuI5P7bir
         lJjU4yiDGoTqu7IJH+d5NLO6RK2b9rQWI3LYX5jugZ4mTyG/al4Mcu/wWhC3SybvaIUJ
         99+ttjNOW8vaGShfmBILfT8FFNbUi0Iag3mtRTmpwmnR8mv6R1ORNpDT1e+ZfLNRutG7
         eFDTcLH7+Y2a/j/oTOdGkuEkQX4dRAYFe42Ohnc8rwcBUDH1HngkmytysKS31qsWkMRJ
         R1i1cLbfVT4wVSnT1EhMCh+pHyZhcRbkbw0TrXXNrJFVZ5XfABts5Ih6K3AUKxBmTXvE
         sVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        fh=r/1VzSe+X0htZ5J+aRV/+oWPh66zP8kfCFDUSlfBwZg=;
        b=jCNpbl/prWscwqwsEaEOs12O36iZrIHUcwrZA6yWHMBF6Svi2xcyQNz94jjAM7v8YY
         cDSyqqZoOxc6PLJeTpUqMHUon1qRukZk7aQGLuCPsCXzBN9x5eIBJVp5j+xB586+FRyT
         Gcye2AVXul/4FAoBd9Y1Pn0OdMvUXN+2FQAjEpcF39mSRyww0OsUZzCI9m1Suzg1kVVW
         J7ZNvRhsEmdY9BgK6deRmVNvR1BRR6nkEGs01W+cuTQn5CRqw7ixnXJKXw5SGb3+mx0/
         QBYG4AHbXzGwjcR2/9fuaNBTK6ZE7UlGy9wS58XbQtJkOjFFoHbWMYKUagdultSPySSG
         Nc1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768804056; x=1769408856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        b=VldwaKEk9B3fXkomO9WgFGdXfCliMYo6jVe85PkV1RI+IAjH+lcrzLoxFmkv0InZPV
         TbHbzOffF6kYl56HEUDtu0LMe60BXjSqtdh7qR/95/U78RuWtC0YFp5B/kZHwB+t17qd
         yOeq4eVj1g37AX2wbQJRXqOAKe2GVbpw1w57/RkrAk4GO3QpbBT74/iAwh2TioH0+PXv
         J3mt76dgGQnflxIxF2qrnRSalXTh1qYzwYct6czLqadNWeS0SciHva8x0M6kAsPmg6cU
         IsgDREnwM4d4kL0wEQ/lvXYAOAQHBTZKqhU2e9+yoV/Un8ImnD3JRh4HsvgHq5hd3Jil
         p++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804056; x=1769408856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        b=ZfIuqcnoC3OPUeSnTDED7LX4IOYo0UZXAIsv2B5FPm3sJMgF48dup6C8c4WsAlSVlQ
         lp8uuYa6A2Wvg2+at9WO5bVMXe4ACab3IJQ16EQAFYYTEkAp7GJcGFgBeb3o6rPgQfMi
         lD0xgVyHZYqn5PW/B/xohijwAkpvprN2foE4xaWq1NL/9b8w27nAbk+GIUFRq7ScgE+H
         IyI5bWeuCgZ7A+vIlux0cSZ6FDx9brOJP0VRV8RLy3nate3scKXvG+sF93rG7pjkmhBS
         ADXt7f0ia27oZbJ8Z3/PkOrkIy19i/Tb128F7lbB/Esd04fQuZDCotJc+WaLjSHX4XxS
         bv9A==
X-Forwarded-Encrypted: i=1; AJvYcCXLtk47TKcy4/lt59Md7cbCfpSCpAxtRyf13LmqtK6/Ti8+IuLCan360Fw+SQ3Ko8uFD3CHbCaMC5ocQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycO0p6h5kTezU1BWLpk2fEgPleb7bI4n0P1+1CAzeJgW0IkQvV
	AN8Z12GJXoFqHy1gQFLLTXUF3xID/CcZdgNJqiC1mEHAQibRhZyfp5HyHJNXhKqwRxt6u5BiUD3
	5cIe5J2ApabFVIp/ZGKEDZE7qM6qAVAA=
X-Gm-Gg: AZuq6aI+XdmMA92H/gLPIL5CBtuJqet13wW88wHz5QasHHUKCbUvOUiW1D6B7cmbQUc
	uRgJBpz7guTkyItG7L2ps/0bgW7k44+oSQxaBwOn3xSyGh47cSMNDp5LwnpcPLUe26KqjcWI8Xy
	ihnQ6KdpmIhJObd5TSXDZygI1BSVbQfTVV7wshMJtnzIx/FpRQHcc0wGKytn/Iqra38Mw2pI2OP
	RrjJz916a5Z35zzYraWaN+lvvI2lYEi8ARvY3EV77Qnf62n8L+Wfs3ZFZBWlOciVrwXYviYszTQ
	zgnfTA==
X-Received: by 2002:a17:90b:3b8d:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-3527329ea06mr8752017a91.37.1768804055769; Sun, 18 Jan 2026
 22:27:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com> <20260117-versed-proficient-pigeon-bd0b2a@quoll>
In-Reply-To: <20260117-versed-proficient-pigeon-bd0b2a@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Jan 2026 14:27:24 +0800
X-Gm-Features: AZwV_Qh2xtpI3oElyCcH4AM0eV_DbnEZq9du-jVlcZi7tddPI18dsGW5cus42Lw
Message-ID: <CAA+D8ANrcjvOCfRN7gGGW+7YzvVieU7P2uexUpVYTw6MEHAKYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 7:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> > The specific feature for AUDMIX on i.MX952 is that it can be bypassed,
> > so add fsl,amix-bypass property for this feature, besides this there is
> > no power domain defined on i.MX952, so make power-domains to be
> > dedicated to i.MX8QM.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++--
> >  1 file changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/=
Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > index 3ad197b3c82c..50fb08460b4f 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > @@ -34,7 +34,9 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    const: fsl,imx8qm-audmix
> > +    enum:
> > +      - fsl,imx8qm-audmix
> > +      - fsl,imx952-audmix
> >
> >    reg:
> >      maxItems: 1
> > @@ -75,12 +77,41 @@ properties:
> >          unevaluatedProperties: false
> >          description: Output port to SAI RX
> >
> > +  fsl,amix-bypass:
> > +    type: boolean
> > +    description:
> > +      The audmix module is bypassed from hardware.
>
> I don't understand why device AUDMIX would have property saying AUDMIX
> (so itself) can by bypassed. If you bypass the device itself, what do
> you configure here?

The case is that the SAI interface is connected to AUDMIX,  but AUDMIX can =
also
be bypassed by hardware configuration.

Yes, adding this property in the AUDMIX module looks strange.  Another
choice is to
add this property in the SAI binding document.  Is this better?

Best regards
Shengjiu Wang
>
>
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >    - clock-names
> > -  - power-domains
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx8qm-audmix
> > +    then:
> > +      required:
> > +        - power-domains
> > +      not:
> > +        required:
> > +          - fsl,amix-bypass
>
> fsl,amix-bypass: false
>
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx952-audmix
> > +    then:
> > +      not:
> > +        required:
> > +          - power-domains
>
> Not sure what you want to say here, but disallowing properties is shown
> in example-schema (:false).
>
> Best regards,
> Krzysztof
>
