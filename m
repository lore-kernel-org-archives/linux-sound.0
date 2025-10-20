Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D7330D2E
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 17:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760982746; cv=none; b=NrUczTY66Fu02RZCsm8gm8SQzj2FZoI6qrjQ2GD1fY+oIRIHqLx8TGYmPGkvtAvAN80CcZYWXrIeaFXROCTwjdWLa9uoclzBsqLevJsKsGUvZ/IsVQRFjG+l+/0IBv3iF10xiDHXDdaZn41H9y/NKDbd5MHvgcW3JARNF8KrD+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760982746; c=relaxed/simple;
	bh=pdYHJcuACjLxyUbGtQJb6l+Qo8ulOoDOXrsmHol9Lt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSK6VxLivjgSBTczmQj+TnEP3+UDg5CUjb7WV+ozBl8etnImsIeHrQbxLwciC7+2vNfTuzfh/p0JDnES/L7QJj857vtG3rJzDmXcEim/q8MSV06D9YmBZasafrsvMnYKDebdjqETJ+E38UEQD4su2ky3TSE+an0HWBls95NvZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j87a7Qnr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j87a7Qnr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-426ff694c1fso212738f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 10:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760982743; x=1761587543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hPztYo4gHaE9LtG99gGwWjUyFltd44jOHvoR42cvBk=;
        b=j87a7QnrHSHjFhEFTU4teGZPeNQZlfIdzR1xQC8IjN9UPQSSXbpPCoTiiORv/5M26V
         XNeT9wtRjLDR26FEUpBkuYN8XedK6vEidP1psmaUBKW/DyQeDl/b1RiGH5zam0iNotsB
         OfHnoVm3xQx1F0ZKp84uPJyBTt/8rtkJDDiAZeVowPp+iQes2QMZBZizY5s2KYWqKKGy
         prGE+BCJv10yntaNtHknE5Z2ZudkCnDGH8Pu6aVvi3Zz+iacwJG8Opi1/3BVO4DF4cpi
         vvQAzIDEcUZm1DFY8pIuw4yLsSr4Eo7Pcpszdpe7ABCnq1T5zMIFqjpRtLgDsWaItaNt
         VX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760982743; x=1761587543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hPztYo4gHaE9LtG99gGwWjUyFltd44jOHvoR42cvBk=;
        b=hGrQyFLESuqEUp7YCfTTa8mniL9zNSvVK5mZzlBvcYE8ghEoN6hg+idttvKw10IrE/
         s/4AW/BPsGF6JTaWZ1lFgm5yIBkDONJ2N0pBToC+OT2MYvBAWFRnOT+YNG4csZaj1yDK
         3j+M5wuyxaju1gRAzh79Wu9jMofX9TejeZR1U6jZw8OWyKcRohYyInl0swVqHnMhIeBZ
         Cx/njUUmS5o9ObMpt9kxmtveh1P/vcKs0XwUc5tsi0kJTwyOcScrmuvP8MuQ+TfCCUY5
         Hbhr9yJdXWJJx4OcxOt1jQkaAIsZF1IFYH6GW+v6tUznHPHPpuWfrdw7tsPN9kYpfeYo
         oDuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUfP5B7JZ5MOgD2YPkDtWU5EqTY+ZY6npZETKmAgQpi80tOjLuemzPpgYo3U9/NVbABDf+yYSok8ns5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM/sPztTPcdwvq1/1xOUcXs+sILkMxIwwhvHmlbOJaFxAls9hZ
	T4kEK08SLI7r9D1oaf6Ri/4aqY25Rw3wlrQ4JJjYviA59dBNwM4HUDlq
X-Gm-Gg: ASbGncuS6X+tXW4cIGnfcbxat4UHcagT/UD2AVORUDZtg69e4rLUVCTmsz6idkcf14A
	KTtf3y/tZqAwzdsxhbrvzcyN16Ep9VxJ6wks/Dnv7kmc+U+F+SwzQSpZ//nXNCz1prwuzLSaTLR
	Rctekg3hPtbX9wTxCtSSIPEH9ISpolm+oLB9t40FYlegrykWyyZBctaQS1CoXJJ6+pSh9jnmg+1
	XgmbhnqHy1MnMfjsRQZ8l4C6WDnfuRkTe+oJODwR8Gi2Hfd1v4ogGNDO2/Xf3jTBzdnSvnKfJYb
	K9xIzPvxYbSGyWTLX5z0+HO7InZDWpJFssmWiRMUJqvysJvgGAxVM5ei+/JbzhtqFnIX449U6gs
	Q9q+/S79OiRDeen0jc2UTt9hdcO3xj+ccAYshDNiVx7C8r8sTArFbx3Y4Dkc7GmVxcYqOCd4lfG
	DR0/7iMgXzlAkYG1MrgJ/1muJ4EnFXTsypYzfen8FtIRMGvTvyJ92/5qBaq0089Aoz6DLinzqCx
	qHROA==
X-Google-Smtp-Source: AGHT+IGEpXcGziVc/IPeVNYdyzKmZC+YRn2Z3nf2tImqr8LtU1jXE0yH1+EHM8IBNjLdRoUankugUA==
X-Received: by 2002:a05:6000:26d2:b0:3e6:f91e:fa72 with SMTP id ffacd0b85a97d-42704d83dfdmr8290390f8f.7.1760982742464;
        Mon, 20 Oct 2025 10:52:22 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c34sm16222568f8f.17.2025.10.20.10.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:52:22 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 06/11] clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum
 rate
Date: Mon, 20 Oct 2025 19:52:20 +0200
Message-ID: <8591609.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20251020171059.2786070-7-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-7-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:52 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> While the user manual states that the PLL's rate should be between 180
> MHz and 3 GHz in the register defninition section, it also says the
> actual operating frequency is 22.5792*4 MHz in the PLL features table.
>=20
> 22.5792*4 MHz is one of the actual clock rates that we want and is
> is available in the SDM table. Lower the minimum clock rate to 90 MHz
> so that both rates in the SDM table can be used.

So factor of 2 could be missed somewhere?

>=20
> Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CCU PL=
Ls")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index acb532f8361b..20dad06b37ca 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -300,7 +300,7 @@ static struct ccu_nm pll_audio0_4x_clk =3D {
>  	.m		=3D _SUNXI_CCU_DIV(16, 6),
>  	.sdm		=3D _SUNXI_CCU_SDM(pll_audio0_sdm_table, BIT(24),
>  					 0x178, BIT(31)),
> -	.min_rate	=3D 180000000U,
> +	.min_rate	=3D 90000000U,
>  	.max_rate	=3D 3000000000U,
>  	.common		=3D {
>  		.reg		=3D 0x078,
>=20




