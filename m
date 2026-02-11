Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42446312829
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770814545; cv=pass; b=ibF+xig2FT39+yp0klLsCZ5RIFnG/rZIW7GOJmqdAcdgExsX+scteuLr5wHG7AnB+gyf27lwhQGOZbMxb6f3gA93VpoJaznrfOoNrfbMbJtXG3EB78nBm9lH2zFwdoaWj372zCBm5wsFjsMY8a1ZSiMv823xoGBz2EPEjAwzcAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770814545; c=relaxed/simple;
	bh=TQPLyNUOsT853JeRVxd4vRCseL2vBGqTHc+YT/1DnmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdcLvu/+MCFqGyv7VN+0Y8gfR6Drym3QrNSlGp+nkwsDlXzbWbevu8MEb4v5UqrOdJ3UIEpHDrW0w9h2UXEvfPTy/YEEsbhcpx7ice9Vi6V2nlpQ1TEx+NkPDfI1sB47xeXaTwWypkLHbpGVpk0ip32QMNvQvaHZtlsvixS0FiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsW3xJVx; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsW3xJVx"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35640ad94d3so1656792a91.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 04:55:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770814543; cv=none;
        d=google.com; s=arc-20240605;
        b=dBWF6xuhBAlhls7ZlpRbO8aQYgIeU0WEfs0vh9GvCRKSSyF2k7kKIIBl4r8DBRK8hW
         C9p/thSabCeuaHFww0EUXjrDij0uFx9IVjSoLY7Umk0YScpInCtShdDK52v6yKoWN/8t
         s0/GHfm612Y3+XNL+TOw5rFJv09ODS41vqlE4LSgWAePzVcVgTDaFG6HIHLNRmBs//vF
         Qr9eQfTFTyqeRRS2R3hpJInOPYQOyt2jLC0Z76ID+H8bgaflx3FVUSkqKa29eSxW1qkf
         CbpAugLB96KZQLZNi2VsYPyTzS06F/tw3X626laB9vXzRnR/cLSSajNps+B7ip+VJwje
         fmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JDIByRHWTJu+F1u757ei4DkwCvzO+Ps6ZysiTaCKLsI=;
        fh=S0XyqfG1KVOcRsu9ov8Xt4MRLiNnBLZ+gk1QPfAYgVI=;
        b=BOJ5H23NTZ3YAkizUV5UcQ/iZL5mvYo4k0oeYsgYh53wA9o4lDysanEmGlP1u4T7CN
         9nlX2FHUecgEVdyjPR/zw9CHHWRSyhr0UqK403cvwZHF3WDftonprJGXb6QSu4s7/8Ia
         uJRhy4MbIV7nOPO6xUrCj48EL9YxHicMZbMc77Gi2kLitanPF1oRpOrCEU53IeiqN0Hg
         MRrAo42J3uN1hTg8XAZvAAENvzAf3yo8faPKPUHruv/a6KnZ3Zs71MX+wxXvSCW9dSDv
         JS3bZYpikWFgJWLMOm2b2XAk1jC1tDD5YZMgrBS2xI5A9YQswxB7neBmyIKbeX7MR929
         nqWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770814543; x=1771419343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDIByRHWTJu+F1u757ei4DkwCvzO+Ps6ZysiTaCKLsI=;
        b=bsW3xJVx2AN3kQbVQirjWMupqyEA346ONkkcgCXHQFU+bWZVqv6NFm+sm1SfvbLnzb
         2oeGvgdQH3stzn8iU0XKJV545ykgvYLYz6pUNTa4D9Bdw9Dn8iOWlAlm+OIE+hySnDIW
         ZqC2++W78aT5ABtWCf49FVyxG28/qW+l6CjBeZsWM9OpI/zjQzm4mMS4ebHcD446UDrn
         t59ga3rMdL+7LFurS0OZyZiXOkY1Qx7VNvEwt+xw6fvS6xeyHy7kyB7RZDdu6EHRguM6
         la1lEJ2kfzeWS3EgRS4mE3hfMRUiC9my4E/zJFLi6hbw9Z/cGH97cxMnE997Qjy7jKqy
         xzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770814543; x=1771419343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JDIByRHWTJu+F1u757ei4DkwCvzO+Ps6ZysiTaCKLsI=;
        b=CxRITRvO4xKYwtJJgGPWTCODQ7u277aiZUjn60Z/84UC7pVAC0doI/NTaxl1mn2PAF
         sYensyDGzihIdjho0dV3ofCYmawBBp34jWYhsmRNwJjMtCCLrBs6i87XEtFYrOWHUtfp
         qOafQXTqdGWO4a8VCx6A8X/XMxKMorXuzfvkvRaGddQxas/pMF+KvOHBzBJG0kq/PUHy
         ZdLmWXlNnwMvp0elE+m4AY/rexpL34Kfbq93Gl9UtFBJn9cIzkChRgRl4ovy9zP/oAvH
         UG8U90B1ZRdSWTzzKhpULmFgd+MEs2kpy28GtBdLnwQ960QevX5NSwQONABMjYZL4qUT
         lTCw==
X-Forwarded-Encrypted: i=1; AJvYcCUkcDfyQtfp4GHmnxhD6JttWQCtlDDE/fhdmYFDgaQtwp6MSXHsG4Vccp2SwYPw+sIzTOcMPlbOxPlegQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGlEpXdC+3jpyaO6UIq6wVrakaICjPjcyvBHnQivAyOVen+bjo
	r1g188nxqYyKq04NQOE0qtG10D+xq/bOSEMS9YLLDXKiTzMldEqWKg2nkzPFzRE6lsCvOPthVh+
	qPyJIChHi6iYfcDhXUgA4vG4fgp4wrAs=
X-Gm-Gg: AZuq6aKUl21swXlzOBC/QsxksVvNpNUYAYYGt9QAvrKVzvxAL7xHtGiLr7viTiva4Ck
	j4wjc6mFHpj58h397rqHtVMo+0xZsqJp90cSG+Q7xVHVHV4T4DXvAoXqIpzdw2tC5VoY2VfaTVK
	FTXa5tbroiQ37xb4sKC5QpGSHe+bcaiki0keTq+/k7deVdVBYBsSLPzWOpkTYrQZnm1+HSVmeMa
	R9FaI2sR2/OoBUjtm4sqglJc3AZVT4CHCEGRuWdBdystejsO1j1dpSFZ7yIBSKexl9doqniPB+i
	OmPM7R2Q
X-Received: by 2002:a17:90b:2883:b0:354:a662:47ff with SMTP id
 98e67ed59e1d1-354b3e648b7mr16011029a91.35.1770814543492; Wed, 11 Feb 2026
 04:55:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
In-Reply-To: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 11 Feb 2026 20:55:29 +0800
X-Gm-Features: AZwV_Qg3zVlSb2OtUw50o9EccUdHn6MB5auH8_NcMuGj10Ru5NS97QaC1VqXYZY
Message-ID: <CAA+D8AM-HH+=kY+ytziDcuvfwyGkcJeooM58-6nxPdYb3M4F9A@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: codec: fixes for ak4458 and ak5558 codecs
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
	tiwai@suse.com, ckeepax@opensource.cirrus.com, 
	andriy.shevchenko@linux.intel.com, nichen@iscas.ac.cn, 
	kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 5:34=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Fix the binding document of ak4458
> Fix the supply name of ak4458 and ak5558

I will send v2 to fix the patch 2/3 and 3/3, to fix the binding doc instead=
.
Thanks.

Best regards
Shengjiu Wang
>
> Shengjiu Wang (3):
>   ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
>   ASoC: ak4458: Fix the supply names
>   ASoC: ak5558: Fix the supply names
>
>  .../devicetree/bindings/sound/asahi-kasei,ak4458.yaml         | 2 +-
>  sound/soc/codecs/ak4458.c                                     | 4 ++--
>  sound/soc/codecs/ak5558.c                                     | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> --
> 2.34.1
>
>
