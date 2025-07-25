Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B812222D1
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444835; cv=none; b=bvFI4STpuZAHIF5Ap5bDgYw2rnspV7PXtUIeSA+jDvjsU2duBhA3FAPB3IaqL0ZPqrXsL4ib1sU0MCFVowjZ4KsSF00Eb+U+9wbX4ymIVIffDodgp4KfLXxj/h7dIjPgdFe+3bBCNGR0QdwIw3Fx6GeZOeCbE3BPvWPt4Va4Iuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444835; c=relaxed/simple;
	bh=70cZJ5+MOSuyvoTc0hRAELy7cfRbFrHaFdQesC+yVH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mprxJLzEDFE7V5gnYQS3TEgZf3wrea6Ilz+O69LnuPsdLNtP7MIGfCIhB0R/qas7Q84hKw7TD4fujiQ4uh8wj6B2ePrOLrhdG7JdnnDV/D5/Omzz2zWs4B4H7p5HGfCfrU+R31U8gMvDEcgp0cNgTdFz9SYsL//txw889ah2Co4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m/1bHFN0; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m/1bHFN0"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-615bc88dd3aso1118508eaf.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 05:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444833; x=1754049633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
        b=m/1bHFN0x2sbsbfDc0mQc3D2ei9mvCk7D//t8KtxV5y2YaYnNBPDk3Di3VPQc/2NFy
         0Cpm/r+BzVIc0dzvhhLhghF1kgWhV1iTRELkuQaFjf+XSbOqloCeJQ4KvEPeM8L1NKF7
         ikoe5CFJJ+iWetNhzq3CpJCWoBeHI97oZ2FLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444833; x=1754049633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
        b=Qr6JsH9ogHJ5C4HiEYWaDV/gRHd9MYIfJpUSuhsar3EuobuHZq/cKAAbPz++hMApue
         DMDRrThkbcEu+HrocKhcxmtXdKop8kyWWQm5XuFSFAHfsqQ7MtdCMfU6Rn4EFKeUYnTO
         e2cBjY9CjF863z3hbrG2bx8+r/N0CrAJfoPiwKcDUyikCLOoTJJ86YTzfCxRDrJWKQV6
         kwNWU5O1XnJJuCwNxlcYhMHJvmHVMYpzHTMFCHC7Q+IZh3aAK+LMuf5JBFsJEfhYj565
         apV+JNkyls7/5CbZrx6uEqy0mOQ4/4WotGvwM9M7HIpkmlc1W4F0GjJp1qS7fCqsXeYq
         DC9w==
X-Forwarded-Encrypted: i=1; AJvYcCXxUns1nn4SVIFVTY48I3nFUTgyqLw2QMSewWbLStmdvVEH9d7kezoFG+gXCf+WBtyMA3jLtlOC4qhUPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5TBimr0gzWKjvqCD69/FyjI7uiHFquen8Vw3mcPMWyK6cNoc+
	FuHA8Zwf6+Kn8lslkcxjv0AAhSNKgabPTwb7ZgPouGs2gx30ZJ5cawDGhcUFzN6fk5gFYm/Y2Lh
	itlg=
X-Gm-Gg: ASbGncsNtYp7hLnHVEmzC57C+MWFT4CVkWx0V97derDvjXS+d9KQKSpk8tI7yF/a/1R
	FQXyRtyA8qkMPAADnb9eM7O93okom/NzovXxYJh97NpmaNgY2sExQaACe0t2FuiJKH/SVoEilqY
	z4YnmzQVCPftrBrgNWduNTm/080SIfvJOn2kiNRDtScfVh9L0nVkQQ4W04P65jfYZwruuLoWatx
	VYsZy4Af1Frfr0Rpjwz3mL2B+sX+NWdayAEpZKyI2VLsxExdrdE3vDA87iny4C+ymI+ox7bxs19
	v+68NjIlw8QCmJFhnWUVcw1niPBil25n0eC2ucMjQbe5hVnw2mdzyfcDSbFKiWlPXyAu9yZIclZ
	GRfn7UFZ0SsS7FrbBs9NKmMYz1pzOvuamEwAy20LbVF9Nmz4FWOj3JTr2WQ==
X-Google-Smtp-Source: AGHT+IEn7xL4kxpFfaOYNvDY7eLhA1KFPgAyHVyWmluKUu/QpW8Px2ebG9tMpU1gvFoVKoCbtQY1AA==
X-Received: by 2002:a05:6871:9d04:b0:2e9:96f6:1795 with SMTP id 586e51a60fabf-30702031439mr978174fac.33.1753444832933;
        Fri, 25 Jul 2025 05:00:32 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-306e1f20b9dsm1036692fac.36.2025.07.25.05.00.32
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:00:32 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-615bc88dd3aso1118499eaf.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 05:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFf+pkojuRc7k6/j8Nz3xoBhES+wzaFRQXmyYkiF39/9oJyX+hnD2mhOBuJB/ZZeQF3LdgsrS8ar0LlA==@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:4eb:f003:a636 with SMTP id
 ada2fe7eead31-4fa3f8f1683mr313640137.0.1753440679035; Fri, 25 Jul 2025
 03:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:50:41 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
X-Gm-Features: Ac12FXxJVbrVgIPSlm6u4--DKBHxaHRjM_36IT45XEIgpl9bR5PM8dE-s5Wt-28
Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
Subject: Re: [PATCH 24/38] arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C
 node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The binding wants the node to be named "i2c-number", alternatively
> "i2c@address", but those are named "i2c-gpio-number" instead.
>
> Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
> dtbs_check warnings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

It'd be nice to mention in v2 (if needed) that this patch also drops
redundant #address-cells and #size-cells, but it's minor.

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/a=
rch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index ed79ad1ae871..6d2762866a1a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -64,23 +64,19 @@ wps-key {
>         };
>
>         /* i2c of the left SFP cage (wan) */
> -       i2c_sfp1: i2c-gpio-0 {
> +       i2c_sfp1: i2c-0 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         /* i2c of the right SFP cage (lan) */
> -       i2c_sfp2: i2c-gpio-1 {
> +       i2c_sfp2: i2c-1 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         leds {
> --
> 2.50.1
>
>
