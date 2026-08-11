Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C367F412261
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436246; cv=pass; b=C+rn43OsWXTSInNjTT3jrPLF8fFsH8c0UalmRnnlQFeNjdht7AefcVNTlGeBxE6lb8scbaOjk4rVOfjA28Z09ggGtgBAOzmVUNoMi3sxpXPDPBTDb+cDfiw2W4bm4toIWpNZfKM0xNnm1UkJwTukTKOkgY7dVREbzjGtdL7oCYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436246; c=relaxed/simple;
	bh=5tfluHqupps5STIW6gd2bV81yHlP1aogVix3b1hDENY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tC7JciGn1nAre57lFMGFJxb0yHMcJNu40OwxwfJ7Y50wJQsTUtA0VnOwSPl2n2HtVCXbyaanMt/3+fTjWFqiMdR9T0lBeUMzN5IMYvrC0dDjsx5aDRGDkefba/1po4vyLPyoSHwQ89jhyjAcMmwvm1aVr54A5fKrxovackHxQ7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8WLEBz7; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8WLEBz7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce98cb8165so8076475ad.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 01:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786436244; cv=none;
        d=google.com; s=arc-20260327;
        b=lWZsuuoiKPggXFbHMZOklm8Xwlm+6w0lGRRCZN3NMgCb09T7Pvu8sbkVPMUv4UxSPe
         Ez0lwpHoq8wMdD50/4kvOT9TA1uT9/wC3lBDy1nP3sXe6djXXqL9qp4HA/HDVgvdRbNk
         Q5xSKH6dCZQtyJ9mjFzeZ5SRkdCfWJluJ3FOil33Ida8pX0fOL75J/pKgCwU4L+Zjhlx
         VQwYoL/S7uduTfyYe37nJ5QdGE2k0pvG0JxqIFe4dzmOqVrnOKi7sw0/qwdJ1H21Y/x/
         KhOO1O3AkO9AVsOpdlVXAReuK9YC3zwo425kfxgNWCVeeu576+dBWrePycfmF+0doxCp
         CRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        fh=oQkSmkyBgclUYIuxUhF4paI8L273tpymiTehpQxrecU=;
        b=p66cE5WJbWke1EdtO4DbGmaoKXHMz62vS5G/ek7OJSHsxh0/QKLUKrCA3X01n7LzmY
         7pqGTpfcQqa9+oJMYR914gKwNYDAoiwr/jcrzyJPl4Np7xLU7vTiMkhz2OfD5Kj8Js0+
         7VXKSK+IEq6vzDQooRxDQQNY5xirsPqS/MwXBAc48an93l4mQ9azTZp9lQhIoH5JK/lN
         6fQh87MhmGB8u8gGuSFUvW8ovBhLAX9gW76LD0ePG5mSM2IiL1HD1Hj71Czv9zbrlPNo
         byBYgr7Gv5w5TA4i9JmjtH+8Hqk4XOF+ZmpSKFMNTVnhU+FH7V7ZdJmI0HTMnMwABJgw
         mZXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786436244; x=1787041044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        b=C8WLEBz7CXPoNEzVO2MEkUCgI7I/o4HvAzkSRMGH1U6t34GUNmvHbDAUl4c9wleTCW
         /0lmJSRnTNtCb64qoICV/YTAJXbIvcqUX2zFb3xgVJhOGh2vzsxCW4dd3+rNZPIHs+T1
         c5FsscP5LDhIFpPmjFAKYq1r/6y6JdALcE4G73+BO8H7ercbPKya1OLHEO12r0TH9EFi
         HYFk4XlzYIOHs2jVxuDbAffVXwhviSxPn0X13t2qzxo0dQ6J71ofyUt6kzeYclXKks/H
         xIVFtXvLyl5h4iBmPnUCyvPtHv3JCuaNfvVOT62peoj09Uoa7srKxRUw6XDt0WXIzdGD
         6gcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436244; x=1787041044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        b=EqrnEk6GZ1BH0iq7fxeVeUfmLapwnd2094tJxzYFfCjwo1enMn+ainkr8/ZcMFnlbk
         rJNYpCb/e8fpBZYGC5tbrpL3R2ZWXKvY2gKKa8Xcij9qjbscy81MGDM5+zU4JuI8kxu3
         x9SdDBv8O4p58vu3LJeI2tDpywczjR5n7RvOMF8Jm2fZjjZ93iK1lJyq5we/E1ofaXUG
         BWTpKjcyaDfFfd9kh6dNLlvLyRfzEE2/hF3J2FUza/F5sZvKqh/tUCbjoBUUAbLRFlka
         XCebIi7dh6pRPUtK/FCwzzuBCPyX4w1VWbJa4D2ExKkJq0MLQTbq8G0d3paqIQhqswTW
         yjIA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1gX/AschCgzbwQIIcJafQ9CIIiw31rOonpVZ+M7UNYDSGNJIph6Rq3CdxK9E8Jjn7405DGeqafaUVOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxve1IuNFbqhJauYfgMmxdgfaj9V9zd2eHBrURATS8ogncMu5Zk
	VB3lHlYEYZq9+ta3+7ofG+R7jlxkv6Deq6b93O7gBqEaPvgXKQkEgOC1qwXAHooRR8O0bVm4hQM
	X0S4GCKQ64tvyx0c5CYW1lBjeW639iSo=
X-Gm-Gg: AR+sD1381ytmnv/llKunJ2aBQucgGZWxuS9YIZxe6ymDWODi0PIyFcInL8f2JUDIk0W
	u3qDLq97Z7F08nglMXJFt+q570dNwEyVms1qzUYed94QMVYsgX+72w+tZUHI9TDm8wIHPno+CgO
	7ddkSEEhgDuLwtDB5bXz+Oll22FRie1DETDwIcSVH4Vlz1i5rY22giy+GA1SRATEIUhDsKUc7Ow
	Jc9aKE32LJjn6ng0qV2FblSXP6RdTlhZIOtJKyi07Zy7EZf4LzES1336SymdvJG8keT1fB54vBE
	pGiM517h1xj60o7vmhk4/awW8L+RkwYmisV9ZTZsEqb5+EKffVX/pr0=
X-Received: by 2002:a17:902:ffcf:b0:2cf:7ea3:7cf1 with SMTP id
 d9443c01a7336-2d31877be01mr17789185ad.5.1786436244086; Tue, 11 Aug 2026
 01:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
 <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com>
 <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org> <CAA+D8AOQ_y7BdR4h+X6qxFygPU6h1iFV0cYXHN4KB370yM2Bkw@mail.gmail.com>
 <3219a2e7-d11b-478e-ad2e-5f1ec2bbdf27@kernel.org>
In-Reply-To: <3219a2e7-d11b-478e-ad2e-5f1ec2bbdf27@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 16:17:02 +0800
X-Gm-Features: AUfX_mx1LX0wZY0j5iDajd7W5oe3f6Rmcs5OiNPXvXt3EbMHLfrVtGbE60ayIAU
Message-ID: <CAA+D8AO1q-n2S3X2d1ZZ_yXxNrHPjCPvrJrPZmTMOYZM9uEGeQ@mail.gmail.com>
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

On Tue, Aug 11, 2026 at 3:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/08/2026 09:33, Shengjiu Wang wrote:
> >>>>
> >>>> Why mentioning upstream in the first place? Either this change break=
s
> >>>> ABI or not, explain that.
> >>>
> >>> The deprecated 'port' property is retained, so this change is fully b=
ackwards
> >>> compatible and does not break ABI.
> >>
> >> So why? Drop redundant parts.
> >
> > Ok, I will remove the sentence below in the commit message.
> >
> >     No existing upstream DTS file for fsl,imx-asrc uses the previously
> >     documented single 'port' node, so this change does not break any
> >     in-tree device tree.
> >
>
> Honestly, it's redundant, because you are not dropping it. So even if
> DTS was using the port, what would change?
>

Understood. Even if a DTS was using 'port', nothing would change since
'port' is retained.  I will drop the sentence in v4.

Thanks.

Best regards
Shengjiu Wang
