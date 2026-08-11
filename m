Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41823FBEBB
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433607; cv=pass; b=N2pU134Y8kM5YEI6QaMlKpGY/R9/BI7q6UaRidnE7XJHFDEBafYal57XEQDQNwMlqAL/Z6mkbOQr33jj46n0LXLxriy7d4jkCFP0N4KZXg3Su6pi0XDuS+MnNQIrLl0cAeOBq0JEXVbJo6F5Oz9zxPY7pWh8SCIJBQxzC2tuWpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433607; c=relaxed/simple;
	bh=kfaDMc7SeR1228IzWwSdYTwwBERUmTN0kZ5yR+E6Fjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=caH8q/by/SrR3y36WTLqmFSGUND6u2A72q4bwDWzL4IBUJLmp/DdBA1ws8DQHfh/H4mQp/++wad1gdOJ4XqrfGa9PkyBSge4VyoBhknXhVz/+LkRVqmb0Pmp6JymdONIsHfhITaYLjps/WscGJBMyMlg/bnb4hdfQyM2FPe+VLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWsCmxPs; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWsCmxPs"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc73e322dbso30793365ad.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 00:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786433605; cv=none;
        d=google.com; s=arc-20260327;
        b=Bxc0ffUdzLE547QpoyNRt85ZwkJj/lPgxW1nkOJlywutxcxzKeAzbjcGnFt7+4xT2T
         zVWLa9r6BSxK1S5v3YPEVpqIdTZsOR8H3Klk+yJeMxKv7AIRNT9dsJ9PNcHNPipBtYB+
         QqqfzYFpIUjG1lvb7gTnFc2J6X8ziCBmulqAxUh17k3yZ8VvWv4vCm6VwNF/XopxsLH7
         07I4/Ge+oDEBIDbYr01AA2uOdcU/AfudpvzekETdYrwEVSdv6D5qCO7zDWgDwlEas/z0
         0R7DFOnaSjD2FVzFD+v1LNO2Pfe3nZetoWhqfdmVT8UOmdxbtfFkIGs/y4UN6A/mByY2
         3Dig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        fh=RWf2bpXBjkXyMtQQFmhPQ8ittixdyGe4UAvUMs837O4=;
        b=kXfTct2jKIQXMhIPOYqa12Xw1zrUTxgQyerTouKmr/pB9toXVCFWhFVBJR77joCDR2
         bbLg4rxZKRctb4X8Og6cCHo/SEIcSgvoqr/FGJW44wPt5pjEFKnRTXBl9nB705HflC7t
         RWc99IQYI+ARNDZegI2gtJ6N7n0s0WVZmv/m1rx4+Oh4+k0CpBbXeBPTNKhThFBgCMiv
         RcKDAgHqPcdBsgim9fOcrIguGH7RDBhTW/iIb/WHea0iViXKHmfMi6GRF2HIsyl6nKAv
         blS6IxL+Spfmx5fVVagyD0Erp0NsDt9qVeoa80EA6fvGnkwYWxOTzIfiFQ9l8yYqn9FX
         M2lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786433605; x=1787038405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        b=jWsCmxPsz6rM0JqqXMDzCdyIJyaf/vlz6gfYrXgA1y2K5Reou40w85WAAnEzYjcv0n
         x2imTbMY/pKLvyBJg2YOndD1f4FCNRWog+tEyyzGlf51zHWUZ8kEumaqSry1qtZCBRRw
         c2EANZ5ciWVutVOpWlWElzCaHBQwV0S7O1+0Uxi+JyNgliVONLfayQeWKEMWDMLO0T4z
         rqaJ03RJeKd2GCmSLkW/zPMhG/NxJEehdxphg38HbZDuaS5H4plJWpQdPqH7xpx1IzMb
         rraoL1vIPJJltCQfMatxivuBSGcz5ze1qN0AKfyLtLwefitPQN6l8ZWhwratOSFftuhn
         ElPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433605; x=1787038405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        b=C2etOF0S+fgu6tZyquBkeXfwE7SJj30tUdRvILha8m0ve/g1O2WIl1I0WIGnJCbxEw
         DSPy/Gfbpqvqsf4q+r7B8fJ6+WSY5vtfs1+ipjHz6LnFMa9erTSsTbsGgGsoPepGcqHh
         gEiIoobKdchRk546pveVhJdA7aZzHrmj/cNavtpKtlrB2DXMH+dY2r0nm72VvOhZIgfy
         7+ZUsuKpMdZ4B3T+HZbkLJaGjEl2VGs2eZmr286BZ7+t/9VQCmLcpTApJPWg1rj3IcL2
         CfHDYFm22VTl1t8kArKXE9Z2c2UyS8iFxexhKtQWsPhHak35Mti1G0WxEjJByeZW/Zg3
         8OaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqLl1K4LTHBuhyU2LZGelKeQQ5W/gxYRiuD4wHbVaRtIyd5PkPgO4dtfDtac4lOqlQXBjhR1Fh/ROIbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKgAp+2uhLePiC5u1GIxuBk/FdavPyApkSk83GhkEQK8TXBTPo
	FhNkf0bag+huz8omT13iLB7kUpDZOgN0jd0MJSMgaMlHM7dNGwlMFWRMD+bbDqEIVA5GqNI+NWy
	99eIJ9lqPQjxSC3fCYJAkyC1ZwYNAvcg=
X-Gm-Gg: AR+sD12vKlVA+0icSIsB5GlOQT4OyL5doPAW6RJ2ozSkyiqi6g9ldUIsVYIhmNrI67Z
	J0HiiP1OA4fj3D4dnt/pCHT2eDtOns3kdPMGs4GKdSDKu77CTTnpktmDoYVMtGMCGkwrMgTYndv
	aQTYsba1qTA2G56QXg5WSRcLoDw73LvXL6DGTQJqzIAsgiQBf2iLAMWdvgHcFp/kc9WS6+2ObcU
	us5/LVcb28gsXwuLIMkm93/2qttZqs6hv1iSmW5IZs9jpk5lUEXvPLtBTvQHrvWy0/vGRnajgxB
	IhYS+tiPGHUMj8cKm4xrLcEoP1RtARSrE4dQpqUtBmJ4
X-Received: by 2002:a17:902:d4cf:b0:2ca:d975:5bbd with SMTP id
 d9443c01a7336-2d3179365d0mr16451405ad.20.1786433604824; Tue, 11 Aug 2026
 00:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
 <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com> <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org>
In-Reply-To: <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 15:33:03 +0800
X-Gm-Features: AUfX_mz8xzcQdpAVFUpNZF46ew2dm49dWd2moRqPqyVHFf2Y0Ny2enqss2gXdZU
Message-ID: <CAA+D8AOQ_y7BdR4h+X6qxFygPU6h1iFV0cYXHN4KB370yM2Bkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/08/2026 04:28, Shengjiu Wang wrote:
> > On Mon, Aug 10, 2026 at 3:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wr=
ote:
> >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>
> >>> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C=
).
> >>
> >> Which SoC? Did you read this binding you are changing?
> >
> > The i.MX35 ASRC (the original) already supports three conversion pairs
> > (A, B, C).
> > All subsequent SoCs that reuse this IP -- including i.MX53, i.MX8QM, i.=
MX8QXP,
> > i.MX952, share the same three-pair hardware. This binding covers all of=
 them.
> >
> >>
> >>> The existing binding exposed only a single generic audio-graph port,
> >>> which cannot represent independent conversion paths when multiple pai=
rs
> >>> are in use simultaneously.
> >>>
> >>> Add a ports container that enumerates up to three sub-ports, each
> >>> representing an independent conversion path:
> >>>   port@0 -- conversion path 0
> >>>   port@1 -- conversion path 1
> >>>   port@2 -- conversion path 2
> >>>
> >>> Each sub-port references audio-graph-port.yaml as before. Hardware pa=
irs
> >>> are allocated dynamically at stream open time; each active stream
> >>> direction (playback or capture) on a port consumes one hardware pair.
> >>>
> >>> For backwards compatibility, keep the old single port property but ma=
rk
> >>
> >> Why? Did the old hardware change that it has more ports/paths?
> >
> > The hardware has always supported three pairs; the original binding sim=
ply
> > did not expose them all. This patch corrects the binding to match what =
the
> > hardware has always been capable of.
> >
> >>
> >>> it deprecated. A schema constraint (not: required: [port, ports]) ens=
ures
> >>> that both forms cannot be used at the same time. The binding example =
is
> >>> updated to show the preferred ports form.
> >>>
> >>> No existing upstream DTS file for fsl,imx-asrc uses the previously
> >>> documented single 'port' node, so this change does not break any
> >>> in-tree device tree.
> >>
> >> Does it break other users of this binding?
> >
> > No. The existing single 'port' property is kept and marked deprecated
> > so that any out-of-tree device tree still works without modification.
> > The new 'ports' form is additive only.
> >
> >>
> >> Why mentioning upstream in the first place? Either this change breaks
> >> ABI or not, explain that.
> >
> > The deprecated 'port' property is retained, so this change is fully bac=
kwards
> > compatible and does not break ABI.
>
> So why? Drop redundant parts.

Ok, I will remove the sentence below in the commit message.

    No existing upstream DTS file for fsl,imx-asrc uses the previously
    documented single 'port' node, so this change does not break any
    in-tree device tree.

best regards
Shengjiu Wang

>
> Best regards,
> Krzysztof
