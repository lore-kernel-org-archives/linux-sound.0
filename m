Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5102732AAAC
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134444; cv=none; b=tK9WgY1hYJqfmcIXMpbJTGf37Ic+a0xDBZrgcdrIU7tRKT7r1XO612fAI89hBvqlKHBseMuX9uqhkbvXEF3Ps1vCYwL/EPTjZ8LZy4DclKoDO+k35lVWPgETRbLHJtWXYFm0kHWflFSHqU9IDE6/1Mw9MuBlVzh9btWK2pTdSmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134444; c=relaxed/simple;
	bh=97a8tZjKqwRtHNr6BZl+meSJb3s8o64hqDASwzxbu5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbSAx3Xo3HuCMAcTg0YE/csSotp9xGiMAvCJtt/pBmtGpSSvdIr4yqYZjNjMhJYjGmtTWSEuN0wEFUfDhpxFjPhUby5nuTz4T0T7qT3jIE/IWS9ngZx833/ut8t1wcSCmcA2B9H2Y3FcizYiv416FFdnFhuZvHl/qZeA6e/ovEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZU0fnZtG; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZU0fnZtG"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7836853a0d6so17724217b3.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 05:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761134440; x=1761739240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6uhgqipKW89TbAKSJ0VsiSw+i7Bc0BvME8dlqiNOkU=;
        b=ZU0fnZtGUkFNuLa8Ca6e43Ct9sxzfOOMFNaD/PsOrrOIveuOY7JsxWvOuqyz8EarfA
         TooN8WmQWzEWlnMScJOSM9H4gtWDzlxtj2bqLSlXnMxv0gtZQWk19KaRQ6tm6BgZcxaw
         Qb3DRFQZDjD4/xKWBl9AaBFWNUCPir1scC3exaxZbF8lDVV5NpArwYWzo11fwi5ii4F1
         Pfr1ZMmDhOrTvcm2Z57Zj4GIAHL1RIexvGC6RgHQaUCD25y23vjfBen9k2VukcKern18
         AvQL9FnGDL790sKs1WsCuE7JW3o3X4bA5UfnYJLtpa36JrSFOmKfMUKlPZxJAj+Hn42y
         AQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134440; x=1761739240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6uhgqipKW89TbAKSJ0VsiSw+i7Bc0BvME8dlqiNOkU=;
        b=n7w3u650rhMHfCAEbaiAfv+c/yX7Dte9VwVnSK6sy8qkJlC+SaembngaezV1oh/JG4
         uPBo8NawuglpcfpgsQl4BsvQDEOsfQLVxxIZ0UxZcekziaybOCibWN4xGK1kdyCQ5Thg
         /hPe9W2soioWIbVJh+WpQD3GcsH3SYfyequqcSw534oQfp2tVi8tmiifmfxpCdw9jgDX
         zYFI9XUcFp1mJ0beq8ENMGt3xpZqtRsLcpLzcyV/ilh1cuMlEYFwbq48TbKYZohvVhee
         C1kPKEn9WhHfll3ri265bw2OJj9xw6fp5eURBU2bu4yowPuaa2f78cB3kHbdx4MwzmjW
         Uz6A==
X-Forwarded-Encrypted: i=1; AJvYcCWnRq3we0KqMXlgchqJKbuF6Z8tNoXOcKmy4EEcxJrPrOTPhcaRbxXUql0thhV1MGJuHtFCJLIDF9bRLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/xU6UTQeFkJuHUKd549vZLqZlI2mWD9UifveFeTU5BJAd7tJH
	I2ZyCWIOhN/OrOef08bjRkiImTYx7X6Z0ZyYPu9pb3NKpWZw6uool5xWnvtQpjXynYymYwEQrY6
	TNBOUOUz4L/V89Rs4gRjx69RkhoeOGR0=
X-Gm-Gg: ASbGncsk+TQ5Bb3+niRXGAuq03/bXz+la3mNEt/jlK2xR7FPvDlYIi/9tAAkx8p7f4r
	kf8WpYyMcvqTSWj0iEjrxHWRwawtG5SuQ/ODLzK57T5bUV+I2p78ssMRoO9kyvBP4JCHmh3z92t
	DVQFcsoOQy3h3qa3XG+I0dKv5LxYZPZdo+yCgHdOkFcGTzj4UBB1D8yEfjD/nDvZnC5LvaXSwER
	62jxlXwu1q7wzbiQW2wFBRaEBUC4Sk8U4v8q62wIQcxI9fPkwljJBKfLwQ4pw==
X-Google-Smtp-Source: AGHT+IHe7HPf6WFvrCRkjbNGAn3hqNruzzhDGzkeQpPjDeNqpVAuLbWf1eiEYp5Q7LepTL72CtjhjX2Ia5Crn9kuh08=
X-Received: by 2002:a05:690e:1a8d:b0:63b:a941:90c1 with SMTP id
 956f58d0204a3-63f2f5b4e47mr755807d50.12.1761134440040; Wed, 22 Oct 2025
 05:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021104002.249745-2-srinivas.kandagatla@oss.qualcomm.com>
 <20251022003429.4445-1-threeway@gmail.com> <76567559-4cac-467f-9740-e8a539a445f7@oss.qualcomm.com>
In-Reply-To: <76567559-4cac-467f-9740-e8a539a445f7@oss.qualcomm.com>
From: Steev Klimaszewski <threeway@gmail.com>
Date: Wed, 22 Oct 2025 07:00:29 -0500
X-Gm-Features: AS18NWAgMZIyWSBaRtc28HmRupfvFkfndCADg6zxwcxhZ5F7Sr-vfM6vIit3CAM
Message-ID: <CAOvMTZjjCn5gDgOrf_2++QjfdCxz2PXTey5Nh_-=caB4wX1g5Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: qcom: sdw: fix memory leak
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Stable@vger.kernel.org, alexey.klimov@linaro.org, broonie@kernel.org, 
	krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	srini@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srini,

On Wed, Oct 22, 2025 at 4:52=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> On 10/22/25 1:34 AM, Steev Klimaszewski wrote:
> > Hi Srini,
> >
> > On the Thinkpad X13s, with this patchset applied, we end up seeing a NU=
LL
> > pointer dereference:
> >
>
> Thanks Steev,
> I think I know the issue, There was a silly typo in 3/4 patch.
> Could you please try this change, I will send this in v3 anyway;
>
>
> -------------------------->cut<------------------------
> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
> index 16bf09db29f5..6576b47a4c8c 100644
> --- a/sound/soc/qcom/sdw.c
> +++ b/sound/soc/qcom/sdw.c
> @@ -31,6 +31,7 @@ static bool qcom_snd_is_sdw_dai(int id)
>         case RX_CODEC_DMA_RX_6:
>         case RX_CODEC_DMA_RX_7:
>         case SLIMBUS_0_RX...SLIMBUS_6_TX:
> +               return true;
>         default:
>                 break;
>         }
>
> -------------------------->cut<------------------------
>
> thanks,
> Srini>

Yep, that does it :)  Thanks for the quick fix.

Tested-by: Steev Klimaszewski <threeway@gmail.com> # Thinkpad X13s

-- steev
