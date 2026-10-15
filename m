Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57C93009F2
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071219; cv=pass; b=aTD+kiso+d6DnKenX6hbGLFdLsSPp4axYY8xw85ysZh2C6+40yLr/N/DLUTl+i/LOr/7pXMSnFwPmlPrZ5fcHHHPFjTsrStwO3JDczbE1trdMzmAgAA9rul/PrOALdNYH1Kvuxxsk69UdELlEN4FCpruXM0H5zKzjfeoIn/a7/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071219; c=relaxed/simple;
	bh=Z5Ri9F4+OVBBIEGoV+Mr5BnCUO8uTyNyHHmMRGWppMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EnJWHAiI2SGKyaI++9774svJ454VwZ87fbkIg+XOINpbmUyZfZ1djWIwdbV2QdeceFWkK0LOlmcCF9oOsim957+j6KNzpxELRO/WACyciPI0mBaDO57ctSy0R/yBy8tdqRLq14bHfKTKP1YyR9dSTR9RiyJeWH1w7d+toaEJSYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAuGi+DB; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAuGi+DB"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-354ba08cfd1so8811749eec.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 06:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792071218; cv=none;
        d=google.com; s=arc-20260327;
        b=G4RcWrUqy88FWHixxTlPlpgkBdeVYiX1Z1mMwr3B7+mT/7AE3h+VwIxNsnPN6Knw0U
         uu902IChQ1/NrWokvj3kzH6FMEvBPe/TfIaMZAypq9Ar4eeeBiXHrTuTsat5Qxhp6L5W
         /TGR3KoEsg9qJ6i+G0u/khtb7h4riT4DaGD8YANDbN3UPY+LiMGvNWm6Fza19rHB2/4R
         uGyArBETw4hs1H0/vZfdCDEpN1aKy71IyAF5jggxS9Xds9zR7mKqGP8TitZRaxjBKdHB
         EgHOieeNwpHqkF/sQsnliDlj3GOT21dCdZw0j1eQhK+nmdlQJwH2LplL2T2LXIrnmOou
         t/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        fh=uiLV8Njs2lVL1iROq+bxC3i17NdZyl0ofjBIJpUny3w=;
        b=GEvrSLNJuGgmh7Y7jQKjEe+cS2uueaVsJNDY81gvSZp9HDqRnMfCi053ISPSmnGmzn
         Ww7jT9mpPCy/t48QDDGYfAjA7Iajgi8DFi32JiNe8P24/NE7F3uuOYf9hl8zYxRx3Mw3
         oRYYBmUClXjKIOAW9XenSoknRypLFxyEG5cjo++IpPgtjpaZ1BBxLhyuBP3ahcjbTQIY
         BlCfD1VTJAvvWpDyMlOsxNVP0IjYGG2jmJBkuf1+TsTqoDppbfr35g8iSsaP5L64rfHH
         hMeAkeudTJMj3AFXm0CJnuCpuLmePk0bq/flF+FcDpP1pC7OtdmWIFs/UNj0jxelksBx
         MBLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792071218; x=1792676018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        b=PAuGi+DBtlHOAXfkTuvEgYPIz9waslOw941falizFo+xSe5yRbqlb0CwWyGRG7sxfO
         rqZ0ccbiXIZV3s6UrBg4hAkW5k10nM4p1zSouygV07q2YjdoIBrZOZG4SLnYrhCbk/k6
         reMDApl7nJGdp3HLpPZFQzwZoZeozOpymd0qETxSV+a8soC6YUhMOHtBhEHUcuF/niAo
         foz+SW23qmoIa0Im0rN6ecC2P6Cc1EzG72j+rXNXX+WXRXFuS+7Y9F4AX6zYo5jqZX1H
         nn249Xm2CiJkoVEWUwbuDy4J/n/XylSd4tpYvN3vBd1ndmnnFYMATBUbchW8GuRTP6pV
         E7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071218; x=1792676018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        b=tf8uTtP0PUsZrAPYnZUlpuLZn9O5xTdr96lwSMHIIPwr+WohtxAXQUdh750ewkKHqr
         SpFqurS7BsqGFBoQc7K12kjWsvVBX8XsjSp5DG/xCSvl0XAmfp/vYMcnchQ3kRX7cxy3
         9e1bHrr9N5qvguGlZIDDRaSPaDgG9+aRTzBIRkUjvJ8p59oob6GNGoArOu2K+CBbzE/u
         whdV0rEtfajpgXwieH524S9z+ORtcX2gq5lJ15WPSA3BlQZQAVrrWj7K53PM8q82WmlG
         5FJJh02EXlI9DcQp204Kh08C3xndkJ9kAHxhRAlTL7YKs/1hPH4IdwfrBKuwAdrKN8K5
         RH6A==
X-Forwarded-Encrypted: i=1; AKwUvBwNlkdnFeMayQp251QhdRx9iFd5aAq0PMTIjaYNAj/TbSzNZMO/NNOAg3dM9J8kbtQJhZancvFTFtw+EQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2riw7zJsVYR6rpDulupwu1qU6LJgptY8Fr303iyqE9uzh0k34
	kT6RGAfGeEWJpFJW0LgZGZoBYZXzYOLWj+nfbZsqRVFtPzTsu++chA/e/5w9m4M54wLfVxrc/U2
	nydKsdt+ysJCydSqVlt7Uh2gwQ1qRYt8=
X-Gm-Gg: AYBFou1jSENjgXsrLIsDrURPch84dQFEK/0jUCwgqoV6WL3vOeRGgkKunm1XM68L1F5
	p0YkOTYLcZg2wJHmI70YJ1J4ET6nNh+u1+sRQI1c1tky5lZhhL/Cxh6smoEIwHzrU201cYNHZny
	rziaN0yyvxMMEmeQ3+Kan+YMURjbnyK57QnruVqJHwAGQdN3HMkBKlcYEO7XjDN1m7/Ry0DJ0jb
	sbFVkp6brO9FLmHP03I0CtDUldBOEZo2Y54hGjJOch3NljVpziAYilHiigyPSj0ln9LJkANLQYE
	rsOsPqyVj9sX1A8zyROx4ZfDf2rd4rCUSyevO+ij07b6EcAfKE0A0zBJN1bFU/LBwkf1m6UNMMH
	gR2Yf2BaEkzBM8JlJoyZVLOw=
X-Received: by 2002:a05:693c:638e:20b0:351:7bdb:6eb1 with SMTP id
 5a478bee46e88-3537e03ce72mr25493475eec.11.1792071217690; Thu, 15 Oct 2026
 06:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015130628.184279-1-clamor95@gmail.com> <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
In-Reply-To: <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 16:33:25 +0300
X-Gm-Features: AclHuK-Vf3LgaGwxBoiNGM89Hp1VUWFEAhFQiO8r8Dz7zDRcZoB_S-mA-lnEEpc
Message-ID: <CAPVz0n17fZyoR+DPY2fznoFCEQbKeaH_qCSQ4j==_XefuNq5Pg@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate
 all codec support into a single schema
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:0=
9 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 15, 2026 at 04:06:27PM +0300, Svyatoslav Ryhel wrote:
> > The number of codecs supported by the NVIDIA Tegra audio complex is
> > increasing, which leads to an increasing number of bindings with minima=
l
> > changes. The main differences between codecs are the compatible strings
> > and possible pin configurations. With the introduction of auxiliary
> > devices, a definitive description of possible pin configurations become=
s
> > nearly impossible.
>
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that
> any important information is recorded in the changelog rather than being
> lost.

I'll keep this in mind, thank you.
