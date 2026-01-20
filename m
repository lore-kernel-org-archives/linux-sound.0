Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF673ECBF4
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907282; cv=pass; b=BPiXT4Sa4QdmAs4by5U9DVttqcARLRIX0wt6Hq2kWPaKYGIY60QX16JG+i0+oCzDv1uRwk3VuvTDMA1+TY50d+HP4Fw7bb7OUdko01Dqvz96EM0INfxLXFfMnW00n/lR4j3zVEoC/Rikez2RI+8jbZjHj5B10lyZJQHnHJYKC+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907282; c=relaxed/simple;
	bh=G67HGmUfVGd2ZvWRQTeaSHRPd97M+0Ot/yOxv4YVwbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEl3yZuDPiNcHujqHCL3nCq9GCEOj0RjXNQtGFww0DiCJdz+qiab/tRW6y40JfUyZo29+qkyz0OYVoh2zsu4eJ5UCR2FIQpFrIXH3RoclhI7VxfAcXsMSzVXtTP+4DC0EWt/Gz6Hmu21oVImTNgVqoiQUUa/YOr3REvKTCUZNoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGkDI8DJ; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGkDI8DJ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so3026099b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 03:08:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907280; cv=none;
        d=google.com; s=arc-20240605;
        b=K7NtGllWeRLZaTF5IxktRIAuuH30k18Ygl0GRm0GGO9IIKYCTbXPOU6X/YIVGSPO1J
         9xaid2tsOs3/6LcIjEQe+4F0e/YWka1pt7Qm3r3HEoholQ2gbk3wAEtfesmSn6bURGnt
         I0mSIQQvWlINkisgy7URjDQN4u1Abyde0r6fJkbfq0c3fSanELpYcSfpNaPlIStz49HE
         Qs9YU6TF00dr4viKwXbhJAtx9WX9lhU+H0r0rFlacfz8UbneGY0zV2vFqmPDqBZMQhbS
         4j8MlK7ziSiDUZkpRX9bQdd2k9Wu2KJctJnu/H4oqyelVDse+hj7KN06YlCLTa7o00uK
         1Qnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        fh=GwtyAvqy6/gnemXQ8bBQRZFeMDbuo2nv6vZWbLSkfN8=;
        b=J4xdC/Y9IpHerYDDh3/da0i84qhRxUg7WhmL/I6ezVAjPDIjdOY05kNN+cJWwcc86N
         YGuMyvdWjRZ+3Hb1xhe1kfV32Hh/AQHNigHmrAOgcH5gAYWwKCr3+gN8eUZ3qxqEYm7M
         tjKPJ7WCgp7rzbMsuHt/RjQTxXUWlgz+AM0zgXfoDBKsETqD+htycMBuW+Siy1IffEJ8
         Rnj5fk6xFqvfwdyj04IzOBFkQ31wo5VU1AlTitpLkV1PBFMrG9yxilblyiFOXchGmxa4
         HTCCMeCiquAwkJGi53Dagq6kL9xPzW9sJba8l+0uaBEkE467tYsuCduFedH+wuh7VvsU
         FrBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768907280; x=1769512080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        b=MGkDI8DJyXabrsg1Hssr6kMgzexTbDeXoc9Oin7Wz0Ns4Bn1txsFySL2Tk9jKZZjQC
         d1BW7XfH4QKQY6Hug+oIKtnXoig+tZQLkXVJOJWDFgphnpOa3/YR7D7Ou30s42iphmFr
         OLDe21UDzefn4p7E+6evgaXLaDsMpBihRgCC0zgJmUufbAtKTzm/a5HfKwVHGFnqoO3O
         eT4aVNUfn8nlvCYisUUITOXw9I4AVNEWljk4YiIofDT6RTxluo9H+AOzaIJhnw8aiz6r
         erGJBPB6jfr2jXXeOv0ipziB3LN12VNo4tEgWvqFpi+g5XmvFWMOv6lEzupKL2RbXnrc
         Jgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907280; x=1769512080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        b=UoCtmIPeStDY1M3xn7TJXqF57zS6Uele/Z/kXpExJ8UypGHPWQ+FOxr8AYnFqfDMhe
         7kt0AF05IUAPvdCMrrxiB1lnuzYrLJV3tL3j6j5SWOheXvmVhTcf3xboP6+B9kbvWTAJ
         Gc/d/IPv7mHu7X3qAgoAX4GVTinPBk1wSwRQ/0PWUFU9RLNYa8T6/+3DK3EXrKveMvud
         TUqwGW8QQEBjKpwkpdeNN7UnP2KnDcCe+0UycoNTrQ/tuRKLSV2rPHnvqIRxIwphK7dq
         WYpdSFp8gI1aw51ZlihEFTK507c5DJoVntLydnh71LDnV2wM+OHhUFntU/DgI5CP9bW+
         B75Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZW0UiKdQGS5qW/uw8THGuGlxaV/Xtcsn9cfgeOxSfXZuG5DzM2DGFhJKHsOAQr3uJXQtXg3ymdMLogg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzwMWjcIws5DZSIKRFNGEv1qz8S2u1cTZaoIZ4NoYRw3zzEipJ
	ffr7Hx2VRnxRmnJWeVmsMRvGunNdCz8sfb95fzCX9fTJhInTLO9RPer46m5XpjIBt5YklUIQ5rN
	2b971qnrg33B52lsHmCmkgQS6CXmQFzM=
X-Gm-Gg: AY/fxX5ixlEzy32OowAUm45CqdVs2nr8L+y+KgoZojp9n80EiUqbkGnBFhcjvCruRgG
	h0cZ9CKE0vwzZjxWuh/snqE8P7lsvpXpR+gTr4KCraupCwIG6xN+hH3uWN10B17NMksGO+C7WJ7
	d9oxBwmerzGnpOva3ONo3/xaK1racBEyh7LAVx2wINQ6iPrvz0JLieWE3VgYoxKZgIyOcPS83Ef
	Vop1DPUyBO3jWk2BaXZ/kx9osq9ClO4r9x0RE9HGZOo8oW+smZmByq5maqTt28Zi5tLqSSxmJYZ
	E8cq4w==
X-Received: by 2002:a05:6a21:3a42:b0:38b:e70c:6406 with SMTP id
 adf61e73a8af0-38dff36821cmr13408140637.22.1768907280519; Tue, 20 Jan 2026
 03:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-2-shengjiu.wang@nxp.com> <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
In-Reply-To: <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Jan 2026 19:07:48 +0800
X-Gm-Features: AZwV_QjlRWGRppxCrBr9lEF7AFifqLu4-_l_Wvfec_Mh4jj0zdL8Z4fH3sbuZEk
Message-ID: <CAA+D8APePw6BnRP=Wnw+zna+oc4_aoMWZewYC7yx-XYLBrSKbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for
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

On Tue, Jan 20, 2026 at 6:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jan 20, 2026 at 11:52:07AM +0800, Shengjiu Wang wrote:
> > There is no power domain defined on i.MX952, so make power-domains to b=
e
>
> There is no defined or there is no power domain? If the first, then this
> patch is incomplete. Please read writing bindings part about complete
> bindings. If the latter, then you miss constraints ":false" and commit
> msg phrasing is incorrect (and remember that in such case you won't be
> able to add power domains later because now you add complete binding).

Thanks for pointing this out.

There is a power domain on i.MX952 for the mix system of AUDMIX.
But it is enabled by default,  AUDMIX device don't need to enable it.
So can we make the power-domains to be optional for this case?

Best regards
Shengjiu Wang

>
> > dedicated to i.MX8QM.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
>
> Best regards,
> Krzysztof
>
