Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB4B3F9C5
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753445243; cv=none; b=pxnFv+d4oXlPASDb1KyscIQfyIkknxhMDA2/E/nKldrrqcG9K0Rbj9OIUbfu+7rusee3IEOFBDshYyQ+IGvlfrZb2LdZnC1BIa9bydaRLGK94hfOEIQbayPNAC1wJJYEu8WD7+zZNv34QIogz/q0bim/W9bbR4vXdE8YAApSygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753445243; c=relaxed/simple;
	bh=V8hirrUVOWBBWHrhJ7nvVXSHaacevucbhSLPMWQvrV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RnJ/atXPbAF7b8NFzovHX5AyOdTJAECZhilDPZpVrFAdbRlVogqZ4iMatJx4P6VSKayGeQ56+f9z2fMwdLi+jtJuaV7oLoe0kU2FNgMtLO1wk9DXTraapnUWd52SR1zoLnTeKW9K0Y4fOm478Oed7QtIt4mXPHS7KfMpVTLaKqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TzG6uouP; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TzG6uouP"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e9a109035bso1461307137.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 05:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753445238; x=1754050038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
        b=TzG6uouP2qcNmjEr7Rceme9R8wKj/aINlqEdcevRnJQuKUaAOjjaF1FDU/lqt6mO6W
         lU8/DA7AnmYFcSU5pajFJCerCzPj0Q9aYtvbNxS3ZV4GoR1OJj6kfizHHrRiu9uOu5xo
         gVD1d/A+XIOxsMxff2q33ze8l8nQBL2NEZ1MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753445238; x=1754050038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
        b=H0gS8OAkDTdHqosgUcHd2IBwYz0IbRknlZ65+uRwBGlTHBHNG6xfpEAQZhnYJp8zXg
         ipxeju+v9SWxhqkUn/zINJqgYFq3loOy8nq/QeXcQJTQPjWNiP9um4IDSUBULuhy+aBM
         qlXz0kDzX33MinZOlIWfx8Jxa7zrw/IK1Zr0spWliUb24VILlIjtkEPP4+2qXGQGAO8b
         /X1KunzTDF/seG4tHcL7Uve813hOdGtQmELVZnn3VLOuajtDfDrj2wmohYJFWousU1Q9
         wt/PPXOQOuCiJOixdwKV3/iDdDDdu5onr2zdCtufjyfPsEX0oiLRuulUETWsQwjf1/4j
         PmBg==
X-Forwarded-Encrypted: i=1; AJvYcCXECM83gzvIflEp25hpTZJvvqGMBswXUONs0OaXhol3vPJNJaIomv/2rQZjNSvQIz6MkhQ+X9OVp+Rd/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iDnG8Gw3FIU6hR2CmD8OchAUtcrZLisBlTITgaEPRglipltM
	gpD3idQr0vh14y1bc8jQSTLEfB6n1yYkLXtmUq+Kk45MuvB0QjJ7WuWwknpsHnf1wZbst8M8Q4Q
	rSQk=
X-Gm-Gg: ASbGncsBGNP/6j5oYe8PIOQ+q57eoLiP/PSNeoa+5Mg9f10bcT0A8e1gE3KAfsUa1Ef
	ObwhHmOV+9X/ae6gCNbkkC6QUfKnNeinGS2zAVc6UenN16zQTiaqjurTJyxT5CmCgqaEYW/48BX
	k/Qm7b1uI/qPHEqAUeXqiKf9rUOCimr3P+7y4uEWhqstaNSSQkH5u2hoTHsF9sez54SyngWgnz+
	hHyYGN40jIgnLrga7YANsKWdpP97OeujX5DbEOvH2mJl86okdSmIq/D19v8w475lmMAJEOKmveZ
	jpTVToRs4Yx5MNBmVpMCSuGQlasRTAxexr5axoQSyAWcnVtSqDLPWupr5RGrYvjqfQ7mv0zwoUu
	CmGcNmBbhIJGmnAZtpNZ9vs3T/Ckzehqk8TiMkmN4t904uoPNPoyKAPc+SQ==
X-Google-Smtp-Source: AGHT+IHKs1L1jo82XZ9GS0WL5RCtY2D0arY2pP7DXyZ42ZA7N8Z3Yhn5/2/ayU0vu9pLph3+xet3iA==
X-Received: by 2002:a05:6102:6897:b0:4e7:bc41:a9ab with SMTP id ada2fe7eead31-4fa3fda8ef5mr454568137.23.1753445238101;
        Fri, 25 Jul 2025 05:07:18 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fa2aa1344fsm696861137.19.2025.07.25.05.07.17
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:07:18 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e9a109035bso1461299137.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 05:07:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1Farm8SJw+EdbprXK4O+tMpMJg7TisFuzmTRF0KgPQ7OPh9z3hpHwaoAOSxbm5bgbMUgNE5wOYAe+rw==@vger.kernel.org
X-Received: by 2002:a05:6102:358c:b0:4e4:5df7:a10a with SMTP id
 ada2fe7eead31-4fa3fc6be93mr374132137.16.1753440996607; Fri, 25 Jul 2025
 03:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:55:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
X-Gm-Features: Ac12FXy6b-EYxcfTGxWYM-OfSnpWrsOFjS6YFWPk3kTV_ZIdvcSVvNebJ1JSwHk
Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
Subject: Re: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators,
 rtc, keys node names
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

On Thu, Jul 24, 2025 at 5:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The node names for "pmic", "regulators", "rtc", and "keys" are
> dictated by the PMIC MFD binding: change those to adhere to it.
>
> Fixes: aef783f3e0ca ("arm64: dts: mediatek: Add MT6331 PMIC devicetree")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6331.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6331.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6331.dtsi
> index d89858c73ab1..243afbffa21f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> @@ -6,12 +6,12 @@
>  #include <dt-bindings/input/input.h>
>
>  &pwrap {
> -       pmic: mt6331 {
> +       pmic: pmic {
>                 compatible =3D "mediatek,mt6331";
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> -               mt6331regulator: mt6331regulator {
> +               mt6331regulator: regulators {
>                         compatible =3D "mediatek,mt6331-regulator";
>
>                         mt6331_vdvfs11_reg: buck-vdvfs11 {
> @@ -258,7 +258,7 @@ mt6331_vrtc_reg: ldo-vrtc {
>                         };
>
>                         mt6331_vdig18_reg: ldo-vdig18 {
> -                               regulator-name =3D "dvdd18_dig";
> +                               regulator-name =3D "vdig18";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
>                                 regulator-ramp-delay =3D <0>;
> @@ -266,11 +266,11 @@ mt6331_vdig18_reg: ldo-vdig18 {
>                         };
>                 };
>
> -               mt6331rtc: mt6331rtc {
> +               mt6331rtc: rtc {
>                         compatible =3D "mediatek,mt6331-rtc";
>                 };
>
> -               mt6331keys: mt6331keys {
> +               mt6331keys: keys {
>                         compatible =3D "mediatek,mt6331-keys";
>                         power {
>                                 linux,keycodes =3D <KEY_POWER>;
> --
> 2.50.1
>
>
