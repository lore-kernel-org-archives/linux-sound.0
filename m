Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5EC1BDAB8
	for <linux-sound@vger.kernel.org>; Tue,  6 Aug 2024 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722945641; cv=none; b=nfLYxaDM3vzFIMv1EXv6RHyaGBaBizR3AgV8R2Rw+LdTZ1umpGPH48DpYJMz9ak0ybNAIZs6jzdI2eiB+rHN4LgoNba5QBs8+++y3mj8cyT+KtYBlP3s89FrkleFyTiUqFF5ba6PVUiCvwj4r+d9lIkcxNzssNFuP2bILCJ9NVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722945641; c=relaxed/simple;
	bh=RJDDfvMiOEoXePnZA9Ms3FvFMFt5VD82QTI13DNz0nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+E5KajpyE6npU+Ng9D4ppkiPar3WIfe5N7jIfWq0vEH0a1T4IE0+qb2KBhnm6/aE/Hhbw6GYJWoPYC5k90JvrybKx/W/xqmFE3zpwBFnJXjiM0/19wT7kZYpWONpasWUIOjGSb0ZPxav7BsH4clj8tIgUdWzqPH/y+We5ufrs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X3Q+fDSJ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X3Q+fDSJ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7aa4bf4d1eso56159266b.0
        for <linux-sound@vger.kernel.org>; Tue, 06 Aug 2024 05:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722945638; x=1723550438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFalGrV5LPuH5m9MtaZapm5ai3Cg5stQHsN8KCx3+Xs=;
        b=X3Q+fDSJvs1p4Xx6+DZ84a5H4w8hxSgg3re/Qo3RGVXw29dJmuP47f1B8I9THZ/BBH
         zxt0gzU9/ZGS3V9KBYvdsh+Q6vooWgrTRbrEffd0X5Gu8AB/UsW8E2mGQGEdFl4jZwWz
         Pp9gXi8PM3BvYIM9Ai24XYJp+EbJXH4AC+evQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722945638; x=1723550438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFalGrV5LPuH5m9MtaZapm5ai3Cg5stQHsN8KCx3+Xs=;
        b=ZQTrQqT3LuWq5D85rdL2CdOVKmYlxrraggWCmc59ZG2KSLDuMrrLPlpHo8NYy4jEfW
         CVauab6l9J4df6sAYz8Cg3flTcILo4glg3wlavcJb0foQawWyxh7rDtm3Ar8V+LsfZOQ
         EampGchaXN2J/j4a4E4XuLK3FF89hkgEjY5kCGOwjHy4VdMO/0yyO3+1JC/kpv1XlZoQ
         FSDKf9+BpPc1vG07Nith9q37Q8Q0JsrGb4VFtAu7KNdcNHbTXttkJ5h4KLiDKiJZ5wgF
         plqmfMwk7/INVbWb05bVHlfSWjj2jsKKednq1IHDAB1hESDZlE/xzwsv9MNForcr3k3L
         Hw7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNe/A4sFnrVH/HfeQKUu1rPhT/xEICZfOwxMCm5XNtIUGriB9w6VUdYAM7lD+9z/nyaxigEeAWiSlUQYe1nQlUZqooRGvuMCdzPyo=
X-Gm-Message-State: AOJu0YxXITdwMaBVRGKLZxSqN6eIIUhJ52yBVQJAEfvOQo4pQtoy0KG0
	KZX0lAcCfJds2QG/nnkirM5I4EQ9wlQRWNy+3fFafmENoeLnmjv2aPhESChj0Gq3l3xAJt+Aw4M
	=
X-Google-Smtp-Source: AGHT+IEtl5cDvpCTGkeftSm+vt7/khTfLoc/Sf3FOfbsN/6OIJRD+bq8p5EhMnBpR2+HAtbQx0S7AQ==
X-Received: by 2002:a17:906:d262:b0:a7a:9f78:fef with SMTP id a640c23a62f3a-a7dc5179f86mr1152216566b.45.1722945637493;
        Tue, 06 Aug 2024 05:00:37 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e54sm541665566b.167.2024.08.06.05.00.36
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 05:00:36 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a94aa5080so58412866b.3
        for <linux-sound@vger.kernel.org>; Tue, 06 Aug 2024 05:00:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTO12o9FNiAJpwYzTSTQTSwdK9TCak+zxMu/QRjKi/GDYRQJiVEAX+Yk76hT6TIjxkt7o9LJPQHtmzhiy7A8oecAfyziITRJXF3h8=
X-Received: by 2002:a17:906:6a1c:b0:a7a:9ca6:524 with SMTP id
 a640c23a62f3a-a7dc4fe2dd4mr1109632666b.14.1722945635971; Tue, 06 Aug 2024
 05:00:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801084326.1472-1-yr.yang@mediatek.com>
In-Reply-To: <20240801084326.1472-1-yr.yang@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 6 Aug 2024 19:59:57 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngP9WvLBmbr6S2C5zs+47ap_FZqCJOJZxZnKOTapJ71eQ@mail.gmail.com>
Message-ID: <CAC=S1ngP9WvLBmbr6S2C5zs+47ap_FZqCJOJZxZnKOTapJ71eQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as volatile
To: "yr.yang" <yr.yang@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi YR,

On Thu, Aug 1, 2024 at 4:43=E2=80=AFPM yr.yang <yr.yang@mediatek.com> wrote=
:
>
> From: YR Yang <yr.yang@mediatek.com>
>
> Add AFE Control Register 0 to the volatile_register.
> AFE_DAC_CON0 can be modified by both the SOF and ALSA drivers.
> If this register is read and written in cache mode, the cached value
> might not reflect the actual value when the register is modified by
> another driver. It can cause playback or capture failures. Therefore,
> it is necessary to add AFE_DAC_CON0 to the list of volatile registers.
>
> Signed-off-by: YR Yang <yr.yang@mediatek.com>

For this patch for MT8188:
Reviewed-by: Fei Shao <fshao@chromium.org>

And a side question: is the same also required in mt8195-afe-pcm.c?
Their volatile register sets look almost identical (except MT8195 has
some extra lines).

Regards,
Fei


> ---
> Changes in v2:
> - Modify commit message.
> - Link to v1: https://patchwork.kernel.org/project/linux-mediatek/patch/2=
0240801031030.31114-1-yr.yang@mediatek.com/
> ---
>  sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/media=
tek/mt8188/mt8188-afe-pcm.c
> index ccb6c1f3adc7..73e5c63aeec8 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> @@ -2748,6 +2748,7 @@ static bool mt8188_is_volatile_reg(struct device *d=
ev, unsigned int reg)
>         case AFE_ASRC12_NEW_CON9:
>         case AFE_LRCK_CNT:
>         case AFE_DAC_MON0:
> +       case AFE_DAC_CON0:
>         case AFE_DL2_CUR:
>         case AFE_DL3_CUR:
>         case AFE_DL6_CUR:
> --
> 2.34.1
>
>
