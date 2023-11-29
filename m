Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MweIP0Yo"
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B879B2
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 14:35:27 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bc4fe8158so537418e87.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 14:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701297325; x=1701902125; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hRE/ZeKeoYNX6Vf/61W7vqKcLPREr2ot/tRo97pnCMA=;
        b=MweIP0YoU1/Tgb9Tf669S8H//xmLQvlDpijpg6Btv9YGWE/p+KTodGEHJ3eNcG/PT1
         R2FWKXNLA482t4cEKVccwjL/UXuqz7TCCg/IyqNkuaZTuiCk+rDWbGiA+inUKbVNamK/
         PTaPEmfcuklsaeO4FkHWGwVp6tnyl5Sv9PrA/kXVt1eNBOOBBP1YySTRaakv9buuhzZV
         EDNX3Ft+0KiVNJAnk9G9KcimNlno/CePHu+MvQb8YbVOc89bI0CZv94tRT9uT2V81qcx
         /DdjVkas4dGq1MsNiipblWocUs65Io0FV0u7jSUtiY9Mh4D6aJRSKesCuYOMDRbEWVMB
         0slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701297325; x=1701902125;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRE/ZeKeoYNX6Vf/61W7vqKcLPREr2ot/tRo97pnCMA=;
        b=JmpzaRYk5KLBi5POn/S4NAN9QDcQUWhebvYhwPlwKPYs2GOePPDQPOApr2RB4zI5J+
         XyX+uf/IDtK/0RPRPG02sSHXEZjMVzgoyN/9uJL8rIdrUS3UNkAv6pdIvzLfOCDDsL9U
         vG81XpGpNXUVm7b/Cvc/hUoFyVTPddZxY9dXmmwp9cuGRFH/lzaDThsqgdf+m14u5Va4
         ElLc6wkz+1i/B1jNbyAns/Qv3ZgNT/j2rhs+sRpfOaKgjxBpkQnP9MpE+vYr4JS/4f82
         GgqBqIWUNIxcs+7ESXNWi8ugMRrSMlAn95g0gwTEUcVeeQrsHtpFMWBFMULOQmSFaQuH
         mGtQ==
X-Gm-Message-State: AOJu0YyiAfrjxkLOK5Vdj2czzVIGHVqCXC6T1ZO3DV4PuGzMAMs3+Phf
	nJl5Q24csVowNkHvvBkcfUs=
X-Google-Smtp-Source: AGHT+IHMTtewj1OpKKrv9w8dlqrbUmKXuKo1rZmXlkmDpu59ZY+dRugABrqRKS87dzEHJMDpaTHD+g==
X-Received: by 2002:a2e:8691:0:b0:2c9:bc5b:4694 with SMTP id l17-20020a2e8691000000b002c9bc5b4694mr2604639lji.1.1701297325288;
        Wed, 29 Nov 2023 14:35:25 -0800 (PST)
Received: from giga-mm-2.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id j8-20020a1709062a0800b00a0185ccedcasm8372160eje.223.2023.11.29.14.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 14:35:25 -0800 (PST)
Message-ID: <8d6a9317cd45f2841020e091000344f5683c11a4.camel@gmail.com>
Subject: Re: [PATCH 07/10] ASoC: cirrus: edb93xx: Drop legacy include
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Paul Handrigan
 <Paul.Handrigan@cirrus.com>, James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Hartley Sweeten <hsweeten@visionengravers.com>, Nikita
 Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 29 Nov 2023 23:35:24 +0100
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-7-31aa74425ff8@linaro.org>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
	 <20231129-descriptors-sound-cirrus-v1-7-31aa74425ff8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Linus,

On Wed, 2023-11-29 at 22:28 +0100, Linus Walleij wrote:
> This driver includes the legacy GPIO API <linux/gpio.h> but
> does not use any symbols from it.
>=20
> Drop the include.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

This file is going away as well at some point,
Link: https://patchwork.kernel.org/project/alsa-devel/patch/20231122-ep93xx=
-v5-38-d59a76d5df29@maquefel.me/

> ---
> =C2=A0sound/soc/cirrus/edb93xx.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
> index 6b6817256331..8bb67d7d2b4b 100644
> --- a/sound/soc/cirrus/edb93xx.c
> +++ b/sound/soc/cirrus/edb93xx.c
> @@ -11,7 +11,6 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/platform_device.h>
> -#include <linux/gpio.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/soc/cirrus/ep93xx.h>
> =C2=A0#include <sound/core.h>

--=20
Alexander Sverdlin.

