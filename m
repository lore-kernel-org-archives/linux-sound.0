Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848682E9EBB
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755768148; cv=none; b=OBY/q9k6vwLye3P6QKq8AWSOZOcFH64By126yIpzAaDIvkM5OIIVRQqMMGOG4PSXR92H34Mf3XbQW/87MVLTaLIOkqBYrciEVon4f02Wp2zMfX5jzslXzY6w5G/vfzK+WVWNfsN/K6Mzy99XUlnkKL/8I5V2McpysUUEFNad0GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755768148; c=relaxed/simple;
	bh=HsZamS/rSvKeU1mW3uSKVvFtOhX8tT9L0tOV6LUabno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLyZtSe3qO3vNEuA8kckVrputUeLmiZd3J2c1G3fx9NFao4834uNmyK/kzYKgh0OUbxbNvagPOLMoaZ3ipxCOofIC7TnW9SsyXhI+FVbCYryYgGhiDRzcOFv5j9llu8zUMFO8qdRZU7qwKdLgZmm5GBAByNC6bhYKXdaIQ2+EWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHGnWNRE; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHGnWNRE"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-74374a65f35so1036342a34.1
        for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 02:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755768145; x=1756372945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUNnIA5LJfH2mLFr2pGbmlN3J1pRI/AcSQxLyTn59sI=;
        b=EHGnWNREOr58c+zcACVYFaO9LV7Jj31B14edBkurxF4gNpnDH1H3t5DwSj2DggXM+T
         dVJScQGSeoyZlVaZ72x0hg8MGRtlXIM4ezDPVTS8w+xuu3S3Y3SFxc7FYNvM7x5EZNra
         1zZc6QJjPRrQdaqbF/m70fUFV4+6TTPE+TqQBN4fI2eNOJQIOzV7l+D88/78HpuFbkxv
         GoRkK7MuCAXfJ+lrOg2PUrzdZAnb7G3S/pwnHIjqmIl2sW+Wv3iuyuC6VnG9vDBTbQiW
         9YvfP+lRlgagqqTogTy9oIfXPu+7faXlzs/DMbf2bUHBAifvhJHVlIn6LtoLcXtVkKyA
         o0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755768145; x=1756372945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUNnIA5LJfH2mLFr2pGbmlN3J1pRI/AcSQxLyTn59sI=;
        b=a4YYHHjAGNwnH5sYFyYOpBjJMBNg22nw3TKzE4BtsyHuhAwyEIOGGDGABxElZv2HbO
         JGSyleGmqZdjc8gOmn/8VRSbl4Iu8ZzwjeE/QTUn3xzDvrcBnY2HNstIRmtwLSIv/HeW
         NBFHvE052+WXqQ+jIbuLY0LdW2xJW46vFF5wLFI4Vkug4FhrRXoPRs88FuT1/pqKDtqG
         5vmgQj2LtZW3HzkqGoAAkjg4gVbcpQZbLO2wAiTEht8tm25BAOxwYLoGZU5+9gOZo1r0
         w7zJpu156Bg6ERz0ipW4f5i3FiAS4iHU/IYamaRaimrX49wlaF4op08lBwE2gEALM6PR
         eZqA==
X-Forwarded-Encrypted: i=1; AJvYcCWXr/Un2CIaux5S1fyElNZRjzYU5OBYyX+ukpX9vT5ltctgSIRZdCB5ZsWOPfs1ZdOK7ZVzwTaqtGxtZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+oP4KTCAplWxHUm8KXlic0UJheqUCmiAdj6yrI+N1Iy/M7pTu
	MM+iakX8zUGYOWbFlZcaueFj3CR/tE0GBu4ipJI84FmsweK2dUPnYP5quvrJlnhYU0sqjkpYVE8
	jCMegrU9v3bTskB12Ra1dSeQ+4kjxAkg=
X-Gm-Gg: ASbGncvA6dkrkGLluY9a43mnTqif7L4MxSNjrT+YWKmClpmMJt08HTb/OFgHdAuM6cR
	qKHboHbPnu8AMCuoY+hmFru7KgIqAPHm1ZQSLG2jZ4xDNHvB5o/JMGmGm8g7bqAPqP2L+T6ViuP
	WSxq/Leimr+UQILIOA4pkABYT5wFSvhFQx0/72XK7QKCegQ/NUD314/148GOKam1r3pSB9rg35Y
	uoL/wgS
X-Google-Smtp-Source: AGHT+IG+OKwnvaEyIjdYBGJ44opPxNBTRZHoVlcPa3R/NZO/Xe8PFrjRzD/6JPLLuhEuaViYBBegE3bQclXBTygW8+0=
X-Received: by 2002:a05:6808:67c4:b0:437:75ea:6c74 with SMTP id
 5614622812f47-4377db572demr663430b6e.23.1755768145491; Thu, 21 Aug 2025
 02:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821082639.1301453-1-ckeepax@opensource.cirrus.com> <20250821082639.1301453-3-ckeepax@opensource.cirrus.com>
In-Reply-To: <20250821082639.1301453-3-ckeepax@opensource.cirrus.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 21 Aug 2025 21:22:14 +1200
X-Gm-Features: Ac12FXznwYW44anjF4mhoTG-qleSlXkyMJnkjAYJHUUEtP5l2G2oGwNsg-pkp2s
Message-ID: <CADySD0FFhfPp7cSAGVfofMq7gC2mW1L=AjMgt0TaNxaKzMZk=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: wm8940: Correct typo in control name
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, lukma@denx.de, mans@mansr.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Ankur Tyagi <ankur.tyagi85@gmail.com>

On Thu, Aug 21, 2025 at 8:26=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Fixes: 0b5e92c5e020 ("ASoC WM8940 Driver")
> Reported-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>
> No change since v1.
>
>  sound/soc/codecs/wm8940.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
> index 46c16c9bc17a8..94873ea630146 100644
> --- a/sound/soc/codecs/wm8940.c
> +++ b/sound/soc/codecs/wm8940.c
> @@ -220,7 +220,7 @@ static const struct snd_kcontrol_new wm8940_snd_contr=
ols[] =3D {
>         SOC_SINGLE_TLV("Digital Capture Volume", WM8940_ADCVOL,
>                        0, 255, 0, wm8940_adc_tlv),
>         SOC_ENUM("Mic Bias Level", wm8940_mic_bias_level_enum),
> -       SOC_SINGLE_TLV("Capture Boost Volue", WM8940_ADCBOOST,
> +       SOC_SINGLE_TLV("Capture Boost Volume", WM8940_ADCBOOST,
>                        8, 1, 0, wm8940_capture_boost_vol_tlv),
>         SOC_SINGLE_TLV("Speaker Playback Volume", WM8940_SPKVOL,
>                        0, 63, 0, wm8940_spk_vol_tlv),
> --
> 2.47.2
>
