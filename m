Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353C42E6D3D
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443904; cv=none; b=SIAAj3p1PgEW8Ty1L3M5Y1JY9sp0TH++udfnnoFp6+rc0iobqHbQlr2DA981OsCZYD1cvd+nXieJvx3crluQWq7ysPKO6M8mq7ZxhEkSKJkhIkqhEUqdUosCL3qrLp5HhidCYNwbEvW1vhJHcPShJj1B+aX9Axax7RtSN90CXag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443904; c=relaxed/simple;
	bh=DZf8o481vjpJ7QSUoolpwJajFBT1Vwo8xHyfUgSq//c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFiY+lvs8Y0QZUH0Bgq61bxPX/nQNIoa47+5vUSdw6GnV56PzgqhoWmnefuyC4YR82sj5s3ZO33naFJtG/vvb5C+ViH7+OdzkNW2SUhho1zft+txg7LieuThLjIF5VHURCS2UQnULKLzdzMK5TJGd5dxHDanJs9oG720sxCqsxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jFTr0Qnd; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jFTr0Qnd"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e33d36491dso277261585a.3
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443902; x=1754048702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
        b=jFTr0QndW/4heJ3u7TpXCls7xXFbcz16bFdQuj/H/DlzEHxuU3FQhATkaLlcO/iU4m
         b3LZrQba6GolUlulx50B6H2h7jFywoo8UYuM5eQ5yCmFw4BKq//LcmqPo0CMwHK8vsVk
         cGel+pnSK0qUoa4SAeK4/Dq/YM5ENhZZFOUQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443902; x=1754048702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
        b=G6lrLXL3YZ8b4MbjyxRiQpK97UFcHadGrULgrMVtS4mjPr2Ksrzx2pwivi/Xc1HFqD
         Kg0fqpdn6G8blbVx1LvpMp0sjWuhMVKH4LEjZmbibtwYVmyb6PkpclxYw0Mz+/BJ1O8P
         NHIzFTcQMI/aeT99e32frPDQkGMO+WtUjEzGXwi36mdOk34cXnU59Bja+x4Mp0vQPGwu
         ACpgNC91arv6QWwIKU3GBmyvPugT663yaicIKSNGi6fOwvmYRKyZVeZdDIGsAuOmqzZk
         K1cpmun06qIPOfpbhQXHqEcDyC5HWEYlQVzA9/yaUCWnDTnbEQ8PQ81utr282kLmZ1pJ
         UPGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfi1OrEshi3fI8NbNvhDZx966ecihD70qtra3sEswZOq/42iKVZuJW6Al8OBdD/08MJ5lCJL8cAiHWjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx32IFaUMCjHmytsyjoD4WFaKP2MX7WrzIqGfgePpOrZIVRPYDt
	cCRPgQ3NSspeTfQK9CFDC8JaTo56x7z+30Kvskx0VRuleXFAAMGgZKsS9nOd2VhSsT72pCcnmIY
	6TiPrCA==
X-Gm-Gg: ASbGncvudqA4dm/1RdsTH1CU2nGlnQG4V62Hn2za7EI1oVoRuB0SVgpOJ4Z8t2idOrG
	Bv+lX1RPEzKC1CAnGFh3g9p3d7WfRA7eVz/XiZ03I9AUd86DgyGzR+/upz1YoeQCsGh2xTFmE2b
	Blb7oYU/prz3vsTdFUUNlNZy2wq25sGoSJiAZKEPlAGobEJFBXWlU4KNc+Wy2n9e8A5t2unjfAs
	kolQ7REDuPE9aiRy4DcH6M+cDibFn7QbbvPwBE5jIomH7N/8e+YGUIK6QB8dzFdeyiEdA82WgbI
	HTYSy62UaZzprAe6y48YKSzkZGN8n6JdaLbI64wH3BoIXK1r1TFxlM8DFYIcZcR6j2xWo5kCJ4Y
	fJDadSwbBpMkCRZtzyMvseXnxBfeB3d9C2880NsqTTpxcAOBeb0TOTvFwgA==
X-Google-Smtp-Source: AGHT+IHH64FPWLP7dwb0cvJBxNV1LwwEmg0J0E290OTPDV6i+bOLDQPczv8vMl9+dDlOFL9QrqvOrQ==
X-Received: by 2002:a05:620a:170a:b0:7db:93f9:b031 with SMTP id af79cd13be357-7e63bf6493bmr186705385a.17.1753443901871;
        Fri, 25 Jul 2025 04:45:01 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632e1b858sm241292885a.57.2025.07.25.04.45.01
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:45:01 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-7072628404dso1930436d6.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:45:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnrHdvBvv6349L6FPgJj+z5zlqDrrLWqAlVT04EimLDGHE7qLcxbJjxvklXDoYFJsmT7A7nlZy04AFIQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4a8f:b0:4e9:a2bd:b456 with SMTP id
 ada2fe7eead31-4fa3feb1976mr334393137.12.1753439957846; Fri, 25 Jul 2025
 03:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:38:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
X-Gm-Features: Ac12FXzORC58mPF_B982fHDjnhtiL_-5O2nAq5PI4bkUJDNwvq8vw0VlaVEnRW8
Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
Subject: Re: [PATCH 38/38] arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible
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

On Thu, Jul 24, 2025 at 5:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This devicetree contained only the SoC compatible but lacked the
> machine specific one: add a "mediatek,mt8516-pumpkin" compatible
> to the list to fix dtbs_check warnings.
>
> Fixes: 9983822c8cf9 ("arm64: dts: mediatek: add pumpkin board dts")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts b/arch/arm64=
/boot/dts/mediatek/mt8516-pumpkin.dts
> index cce642c53812..3d3db33a64dc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> @@ -11,7 +11,7 @@
>
>  / {
>         model =3D "Pumpkin MT8516";
> -       compatible =3D "mediatek,mt8516";
> +       compatible =3D "mediatek,mt8516-pumpkin", "mediatek,mt8516";
>
>         memory@40000000 {
>                 device_type =3D "memory";
> --
> 2.50.1
>
>
