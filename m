Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FF5132122
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 04:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722484906; cv=none; b=YV0cIdr9sFn/RF+fPmnw6wjhOQelGIniSCsv61kGFB4Aehp3Ld0l3tZbKN6T627+uExC1tdaPQoMOvYY+AbtVkbwElllw/zDMWttw8gBVvPij6JYhyMp2GA6m7jm999ovAjI5jwZfJvfZ5PowKQfdVS1sm0G9JFb211hc2urGi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722484906; c=relaxed/simple;
	bh=QJ3afN6yfO4Nhj/2k39dSxyb7w1Xy4bYsyPhJGKXyzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZIpeqaocb6SkD4Burkdu1I0hypzD7NDqDtIJAKr7t4o4iC1AC26mvv6aGrPhb2Gqmj0cfzqQI9pYIO0BaZ60abpLrw/WEj4kD4L+4AEa++8P+7asuY6JHhclYW+vw3chUlCqILaHDVr5LzcfZQkfVYAvvXnmHdqaigfXH9UHDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WkqHzhPK; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WkqHzhPK"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f008aa351so9452653e87.0
        for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 21:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722484901; x=1723089701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZhzJQ+a9Kym4MWHHdIYItKXwrHniaEz0NXbkAmGBpk=;
        b=WkqHzhPKLhKOKEh6rrlXOfZCmF9DdVAJAfYaXMfjzf9EIiXtBdI+aemFX+QeanpykE
         TbpzWcJHqTLthnfaIEw9MC8B3srWF0ACHWHlpaYoSVQuU6nYXH3EznnU/wmAL4qHWvQY
         bkoYCU/EPq4RRndII293+XoozZsKcy/qNeIPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722484901; x=1723089701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZhzJQ+a9Kym4MWHHdIYItKXwrHniaEz0NXbkAmGBpk=;
        b=t+KUgWBRyjS0OY7bVad6i3Svu2oKCVV9vmaeGKzjDl6Sz5N2wNfYXWWj5MRX+BEGgW
         xvcyT73Welh5QC+Po80E3GYD58mmDIMmKH00J6ETlXJaDVziQVyyY0wuI6qHVHP7/379
         C3wtEXKOCm9/mOokv+jVkNU21U/FFNLGtlfBV6Ho2c11/avBVgjkxLxrFJisMwPn0AnJ
         HKYMrrHC1tMJOeziFNhf0jelp5d1N2dslkUcDp/On0LoZg4ucok2OZrwli7UUyF19llc
         9HFJH1nnVZpYpqEImYTo93s0N+EttLjXodI+++A1ORbQ6vx6Y/hWQ6ATsrd5tO1+yzLh
         uPHA==
X-Forwarded-Encrypted: i=1; AJvYcCUxdO6g0ao+cRzvDIVh51UC87lU1Q72XiGqfwi0EI19Ghb2Ct9S5AHvXEXFi3sAc72WDTdWxWQnUwni6qbWtuQSCTqUc9tDMsISmF8=
X-Gm-Message-State: AOJu0Yy/wzarjq5qw/NkCRaILvW18gzbWimyUOVIutY1NpCV8PJGZXpJ
	VVFEi8F1U3Ev8QNL0ZHYJINslNVvkEPnvD4w7VLCfvo9DFEJbhTxCSkOQsXyljcCRAVCp/hmlEk
	CVau3JAxpbLFKEZN4fCstetm5wf4JyWJARGWl
X-Google-Smtp-Source: AGHT+IFbtjXGKr6OpFxpL2naXVX3atufbKENiq30EYD5eQDXV5YXSmf+M0f6uFAMeZOGG4Sdlo5YmT711IgA5wFEMPY=
X-Received: by 2002:a05:6512:251f:b0:52e:a60e:3a08 with SMTP id
 2adb3069b0e04-530b61a607fmr640260e87.11.1722484901244; Wed, 31 Jul 2024
 21:01:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801031030.31114-1-yr.yang@mediatek.com>
In-Reply-To: <20240801031030.31114-1-yr.yang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Aug 2024 12:01:30 +0800
Message-ID: <CAGXv+5EYMgeNnQ3BU8cxy0a5aH8e+GbO=-OFVysU2MqBy+yQFQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: mediatek: mt8188: add register to volatile_register
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

Hi,

On Thu, Aug 1, 2024 at 11:11=E2=80=AFAM yr.yang <yr.yang@mediatek.com> wrot=
e:
>
> From: YR Yang <yr.yang@mediatek.com>
>
> Add AFE Control Register 0 to volatile_register.
> AFE_DAC_CON0 can be modified by both SOF and ALSA driver.
> If this register read & write by cache mode,
> the cached value may be not the real value
> when the register modified by other side.
> It will cause playback or capture fail.
> Need add AFE_DAC_CON0 to volatile register.

You should mention this specific register in the patch subject.
Something like:

ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as volatile


ChenYu

> Signed-off-by: YR Yang <yr.yang@mediatek.com>
>
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
