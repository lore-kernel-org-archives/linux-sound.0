Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017F02253A7
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755768060; cv=none; b=sjaD1PiZJCTD7Ockn1oRcLTuyouE9ihVdU+vw7P9Q7EKgLicjsC0gDVsfIrcedGDVq8q4xkJqtRlLOwVSPwhA8CA+SV5VBYoqjUlKdj/JUF3lgrR9osNUPAtshRQUnN0CD0lR9tS1nEPCrSgqfmkqNwEaT3sF/tDOBm85FVQV1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755768060; c=relaxed/simple;
	bh=pY5RDlpsVcczuRRN0X/oppac2hovD8tG3/IVrc4OM5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YtUNRPoRuxbL2lzVzEenpJ8s7mweB/gbbWj7clLIQWyYpoo5HcuNBqCb0+m3768Ryz+kPaJLFJJFTQbw0A6FvnrghBEIvbXqBmNZX78KyDZsEmlmO/njL1ZRJW4xTfiBSyEyRALQwRf5/VvCEiTLNygJdXRcWyHW+NWoJvCtrHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JU0NQwwY; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JU0NQwwY"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-435de7d6d05so485332b6e.2
        for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 02:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755768058; x=1756372858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdwGiEWkgU15r/K0wtAmVMJlPasaOb9O6WsVm5AyGnQ=;
        b=JU0NQwwYG/tzRSYn8UUXSuB4xo6NElLT8/pnLlJIxOc4RMZotTF/Ci31zR8aKl4xUn
         B35y5P3CUs8OoZG3ipbnOlIJLgCPyTcKD7s6YlgNltMJGy/ZaY1VSB8GZmYpMQHp+bux
         yT6HVj3ZGxc+ixf+wZcPp1vQnNn4Mj+YjMVund3ipxGaJ0ajgxHOXlrxntzibIas04co
         XrpCFOQT0CB1rUOoss1h4PJYtMtHb5sTGqS506tHou7eO6LxwXvsaC+nRNeULVd5UWg9
         ah/Rjp5G7AYiL0kyo4tjwY9bsHRgUyTu1qAGxuD20c8/SIDrDKn3B7TNpEpwTe3fL2Vo
         Gexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755768058; x=1756372858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdwGiEWkgU15r/K0wtAmVMJlPasaOb9O6WsVm5AyGnQ=;
        b=rro14nUlAWTQDMb5JMeMTNqRTD1TfFmOrAkiZ6uq9Dp97UGsh9ZmQpdwFnAh33xIqP
         pwBVUMWEM5bEdm/HBYNatk1uyflxhj5y5Og8iwx40wE2iraiDPyvHCi7u2IwmsqO8zwT
         /okDWifbdKQy8NYA7UxgmdYQs/Z8VGckUwWU8pduUDru67Cvkr8d7JOWYBeTwu1azG6z
         SKBN9ucWLpgt+kAZr6k9fixU+2xwDCmNIErhNx3tfdHXoyxB5miadDLAewaOlkuIPJny
         +/TSPrq62iGRBs1uWvhArnZze8PUC/DT+i53CvNhfH1UvGJMQDXO42XoFZ3TJPobepZS
         LYPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcIe0djF0LAyZqXEUfkIwLD1pnFxBeeWTEmuT008D91E+XuWgTvJBn/ik4OLpFO5luHxgaj5wq2GSecg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQbN0hvrwBxwrBR7NHXTuJMK15O+ggnCAkpgAh0H5yhSMCWzN
	2JPQReu0G6/UrTFdzeT5BobD8WRc4sVPvUFhrHeJg1lWYuw9XGj2en4XykGCy+g80p0lO+G+4Ei
	aR9J/VbzKdq82wUmNm2VU9s0SqjQ/AF8=
X-Gm-Gg: ASbGncsYc8HbR2QZ+E1Z62hjWpq6qBE8F7TINAEmw/TSC6b7lSoo2LQVxJs/HLFUwW0
	YfQgPpwFvKFwnQDQs4xjB5CRQsBr3dWoDkk318tB270IireBiJLqARgi7v59aDAuNRj+RiBpLya
	Yisg1tZhkq+afAnQwa1hoBYZxYgmJOv2CKO4FRNhUg7n/DTF6gt48y0xwtBzet7fM4e3otZxPTk
	zEUcwN3F+/Me5fjxiQ=
X-Google-Smtp-Source: AGHT+IGh1Eh2P0gozdvzc0uxCXP2Wa1I03qt2EqN4HLMFPdOo1OK+wDJ9nE8eKJ29zMa5XHbWO31iEn1Z9uCQ7nO3Uw=
X-Received: by 2002:a05:6808:688e:20b0:435:f353:a648 with SMTP id
 5614622812f47-4377d6c5f7bmr495393b6e.2.1755768057981; Thu, 21 Aug 2025
 02:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821082639.1301453-1-ckeepax@opensource.cirrus.com> <20250821082639.1301453-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20250821082639.1301453-2-ckeepax@opensource.cirrus.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 21 Aug 2025 21:20:46 +1200
X-Gm-Features: Ac12FXyPe1NBR2J3Jvx5XscH8ZDTgAWYBOLUSRQaWYCm0L9ouAW5pcME463nkDs
Message-ID: <CADySD0Gc51oUqM=kbWgH7XN1XV+Xf=xo9tjBgCGMKhhYv1kEUw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ASoC: wm8940: Correct PLL rate rounding
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, lukma@denx.de, mans@mansr.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Ankur Tyagi <ankur.tyagi85@gmail.com>

On Thu, Aug 21, 2025 at 8:26=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Using a single value of 22500000 for both 48000Hz and 44100Hz audio
> will sometimes result in returning wrong dividers due to rounding.
> Update the code to use the actual value for both.
>
> Fixes: 294833fc9eb4 ("ASoC: wm8940: Rewrite code to set proper clocks")
> Reported-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>
> No change since v1.
>
>  sound/soc/codecs/wm8940.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
> index 401ee20897b1b..46c16c9bc17a8 100644
> --- a/sound/soc/codecs/wm8940.c
> +++ b/sound/soc/codecs/wm8940.c
> @@ -693,7 +693,12 @@ static int wm8940_update_clocks(struct snd_soc_dai *=
dai)
>         f =3D wm8940_get_mclkdiv(priv->mclk, fs256, &mclkdiv);
>         if (f !=3D priv->mclk) {
>                 /* The PLL performs best around 90MHz */
> -               fpll =3D wm8940_get_mclkdiv(22500000, fs256, &mclkdiv);
> +               if (fs256 % 8000)
> +                       f =3D 22579200;
> +               else
> +                       f =3D 24576000;
> +
> +               fpll =3D wm8940_get_mclkdiv(f, fs256, &mclkdiv);
>         }
>
>         wm8940_set_dai_pll(dai, 0, 0, priv->mclk, fpll);
> --
> 2.47.2
>
