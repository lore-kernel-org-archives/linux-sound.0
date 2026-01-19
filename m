Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0901E264602
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768807880; cv=none; b=QKTq0Al5IRZVt0Ch0ENWacEN0aQaubVJS9q+F9sdrSMxPu4Q8WPL2NBOAMROVZgyHjCEPx/vmAWwOb5FbWCLhdsasWwxYvZV6QglusTKh8IaFW+fRxYdRxPSfYHXzKjDu3yq3VbIt1eOmcH1nqpCoaYrkYbAVIY0KzUJ7oZR6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768807880; c=relaxed/simple;
	bh=05TtTHgNdkznqfwnElj2udcrcsdoU2jg/0WhEE3uwVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liOAc5K3O0XrlL6GZqdlyq7Ji+43QGBJcBu4prIusJpsjHtBaZL2KvyZ19skwSj4Vqdqsf4wpaZHSlUwzLoXvf+bqGQ/i6pdthtl9tpfsHg+HtPZ9Ghn8rr19MPgXcl8vz6iikd2CiXWNsiXZllPi143AoZuDGfgWVhifecn9lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EL+Qux2+; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EL+Qux2+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34ccdcbe520so2626302a91.1
        for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 23:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768807878; x=1769412678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmBvNvnKo3AicJkVDkgT9ULTWLrciXVW8Cf69nuUyxE=;
        b=EL+Qux2+p4S0GMN+UbqfFQsveq8jsI1J4KOnyaARNfcfhNBlF8r9JTpQeF2s0b7k0C
         rHIpbwOYqjc23L0u1xMk8EI2N84aA2mo/YWxbOp+MYUwGBVvxMWHTGHILHdSbYXNZrzL
         6w6C2bbG0giK668dYZ6PPimjup/8sKlTSi+PysY/pvN3+kbHImN2GnaJM9OXzusoErRH
         6WKwB97vCtKVSvD5hBZLHWpiuVF6TJq6kJ7/RZi24qQycoO77ZIbS9pDbHR4RTbACcYo
         V0MIrX8VeJema3MwftpKr6erg+6Es6hG8b/fwkV6P9xNiAnz8yeDh06Yn91WvJ0+NdYt
         6sUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768807878; x=1769412678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AmBvNvnKo3AicJkVDkgT9ULTWLrciXVW8Cf69nuUyxE=;
        b=lzodb7xKs81luLXyGlxREGb7n4YdWcKHnnaryphelBxtVVcFSpAZC6yNU6Rb9zc+d7
         JYjaDEkusOlbNuteg0Aka1Oj/P5v6OdQfgI7PSMKAtEhLicKoWnjoNnv59+H6wf9zPGH
         PpJOnmwdwiUROaaZvuS+m/EbYuWAWAUWoosiqC00naGEHmNgq+D4hXVPuooDS8PkZEwW
         is8U2kPCh0Ld8JGqRFrBzVzVfsNGlM0/TLU38RRVbqfbwr5csjrr+6OmK9DbzJUMSRq8
         fPlIVvGlPAOGpg0MyGAgwz2hV4sMIcWSzjMTuNBzQz+hP4pv2tUBFQBgLf4wnW71f2Jt
         d++Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnPOt8W5u/yUe7rKWEi21O+05Osl6X289q3EwyBr7PBWNuG0WgnFkzC4Mn95LH0MvitFkfd3E1hd7KHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0e3FesLUsaRjBwY2Kzcw62K3qVfKrRskNqsTWydUkGN1Upg1b
	Tiz25ILxv3H5vOSy81TaUvfXqQpO+NFxmsL84UOyJxOK3a3v9a2eAsrqZ9W4pZgcNpWtMY01RNr
	iG1HpSjeuoRrqAE8oBZPJXT8m09ffypE=
X-Gm-Gg: AZuq6aLNvnRavHCcXsTXCVkaXt265tRuS2AZUNKINgD82q4eHDSHaCTEhBLibsYcEgY
	n/ax1MnE0Y77zhhJ93+qM83rU2fIFDNTFNH7yKpE2a3wFTqMxRBy2crgcMMYSgCBOj2bXWagre/
	HDIWDd/wOJDP9rzzFG2sx0t/4TuqNPBEJ+sKdstQ4odyW17h2b5uX5sowvTQHktfXlhNmJEYzew
	BqUQ0611gfboSlz/GTfbZhZfoelRewX9lqIZVxM7rHtBJpfsduFHlviMMQGOBSiVTim91w=
X-Received: by 2002:a17:90b:3884:b0:34f:6ddc:d9de with SMTP id
 98e67ed59e1d1-352678fcf6fmr11202077a91.16.1768807878309; Sun, 18 Jan 2026
 23:31:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com> <20260117-versed-proficient-pigeon-bd0b2a@quoll>
 <CAA+D8ANrcjvOCfRN7gGGW+7YzvVieU7P2uexUpVYTw6MEHAKYQ@mail.gmail.com> <2be56ba8-5659-4d03-a886-ad32a32f6b44@kernel.org>
In-Reply-To: <2be56ba8-5659-4d03-a886-ad32a32f6b44@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Jan 2026 15:31:04 +0800
X-Gm-Features: AZwV_Qh5iuoRHWZMiK5VT4SDQMVso2DrWmENEWodorBSh_MSb2zROT8lpDWRAvg
Message-ID: <CAA+D8AMv0TaGwCU8yWWVbVfuYHyPMjMnz0MWNLh86nfsGMZtYQ@mail.gmail.com>
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

On Mon, Jan 19, 2026 at 3:07=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/01/2026 07:27, Shengjiu Wang wrote:
> > On Sat, Jan 17, 2026 at 7:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> >>> The specific feature for AUDMIX on i.MX952 is that it can be bypassed=
,
> >>> so add fsl,amix-bypass property for this feature, besides this there =
is
> >>> no power domain defined on i.MX952, so make power-domains to be
> >>> dedicated to i.MX8QM.
> >>>
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>> ---
> >>>  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++=
--
> >>>  1 file changed, 33 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml =
b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> index 3ad197b3c82c..50fb08460b4f 100644
> >>> --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> @@ -34,7 +34,9 @@ description: |
> >>>
> >>>  properties:
> >>>    compatible:
> >>> -    const: fsl,imx8qm-audmix
> >>> +    enum:
> >>> +      - fsl,imx8qm-audmix
> >>> +      - fsl,imx952-audmix
> >>>
> >>>    reg:
> >>>      maxItems: 1
> >>> @@ -75,12 +77,41 @@ properties:
> >>>          unevaluatedProperties: false
> >>>          description: Output port to SAI RX
> >>>
> >>> +  fsl,amix-bypass:
> >>> +    type: boolean
> >>> +    description:
> >>> +      The audmix module is bypassed from hardware.
> >>
> >> I don't understand why device AUDMIX would have property saying AUDMIX
> >> (so itself) can by bypassed. If you bypass the device itself, what do
> >> you configure here?
> >
> > The case is that the SAI interface is connected to AUDMIX,  but AUDMIX =
can also
> > be bypassed by hardware configuration.
> >
> > Yes, adding this property in the AUDMIX module looks strange.  Another
> > choice is to
> > add this property in the SAI binding document.  Is this better?
> >
>
> Not sure, but certainly it does not look like a property of AUDMIX.
>
> I assume you acknowledge all other comments.

I will move the property to the SAI binding document, then please
have a review.  As this change, the binding document will be updated, for
the comments to use the example-schema (:false) will be adopted if needed.

Thanks.

Best regards
Shengjiu Wang
>
>
> Best regards,
> Krzysztof
