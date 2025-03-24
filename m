Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB981662E9
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742802384; cv=none; b=DdCBzx5eoyWkffIO0W1DFK8QVtgmBGejnCtcRgf/UYBj9oE+xI4lWnLOe4p+5ZLmOy43h8uZ8jt+d7Xwx8zVmAgqqbXMzPD9W76LT8tK3F1pJHSrxAkgypZLtPCKaOc2BgbIevJo49ehreIYEsnu5IGKzVFjCRd1MFcH3ksYKUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742802384; c=relaxed/simple;
	bh=TfODWm1M0ZXJmeY4LnW3qCr7DVndKYh/sG0G7/aLfkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7+mL/s1Ek3/vGSEO9o0YyeApzRkfodrBiov7M+5mU+4TBVtmbm6SFEXwHn1D37Paqk+nK/wNQMz5bKWkWsOx1IQBRESB8OmDHx3CylnpcCDNjtyUCFfNgRtENjJqK7k2VV70mCl/fRNegrb3YmcmqxS2QfZLgsu2nUyJG8TQIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZOKWWML; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZOKWWML"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so52868861fa.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802379; x=1743407179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMUWST69DWBxdXQICnizeifSpfvf4a4EPHYJz2w7L2o=;
        b=UZOKWWMLbFESlQNxJVDLDc8jAvBy+ZFkkMuLV7bfl8MRWOYIaV8vO1eiPPZfT/am8x
         SFkeSeC9WehpbjP+3tlFe6XOdYi/sJOZ/RPn8HUzVaKlxin3SIIPcxGwR8BGktVLkadP
         1CQ3U/Jf4k7DMTV53wB6pFIlutR456nexuCp9AVggaiYjOfBbPVMdHLKeZwQY8VKZCow
         O6ghBKCOZBIKRgNWF2F6R2b/aTHhdF/vih884BPfPpkR+HJ+9/BsFLei8vDaUKIMrxNF
         IFUiZcRVh3SeqNH24Mqj3N3A1wRYIb8MTDfmPqtwqhifeCkU8P4NKx3K1k0Tto9lR88P
         H8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802379; x=1743407179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMUWST69DWBxdXQICnizeifSpfvf4a4EPHYJz2w7L2o=;
        b=xScXqVmFBklKlDw582ne1mFqLtN35ssw91T9rXAWrDamedglqQFYRu4DtRAq0Ee5uq
         gTg4ZPIf9O/v7Q2IduLh3VxNedvXFz3ncEcOjqclczJFPqqfQOfLoBKmy5zGF3x322js
         Tz/DZHiAIXCGzxY/NWw+SfwAgWnvBvwftXviyTSZpxlKLfhxl1FXWpPc5WgGnCe5ks+3
         mpk1xud6cPaIuHzUmbIOU6DB1nw8sa/xTpuTTf8nFVD/LT6OrVWZIeOLGwKo3zyYEgwt
         dG+dTpcYHAf2yGXoFU7jFksX0TOb5zkcGZLMH7Pd/1fpVS1DHgfy2TEGQ7eU2/mNyfDO
         gjHg==
X-Forwarded-Encrypted: i=1; AJvYcCUhfKR+veh49QVFAw4YS4EvdApbAMEB9TaHtmNpmUmRhkQRNY4VFpZpJZ5iP13E5FTn/vM/NpOi31G+kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjDKWeCt7lfYQ3dInjfNSEwyzjoCUV/Bx4W8HPWI8hrK9wpddb
	H7uS1E2/Zd6jFKwpDZlJseyyOL3pDir7CnUJ88hueVb2P6dxsLQ7d+jBkBSb3SOc4QNyCEbRLvl
	1ERMaTf6dVGrHy10BWWjtfa54x8xn/mQwXjIqxQ==
X-Gm-Gg: ASbGnctmcMOwdqZd9k8msea5C8zNEAfzfE2QgVkfm+G46d0sq2LtL3CBMdYouBiY+Su
	jqRNOyFhgscwet6tKFEkEIIg6QDZuWlXq9AtMeiooihtBofkuxqWsxqQMlmSsdpIDUs5N2mg/B3
	o/p2UtMSBfrhvcYO6dnz8iVDtPP3ecOyQ86Q==
X-Google-Smtp-Source: AGHT+IHWv/VboFhXNK2XpXps/bxwKIcYKOMez6LLCx8aPGa5SQF6NbUgEgHeVW4eBz5VO9FuBCLn09W/ZghHhKDVfRE=
X-Received: by 2002:a05:6512:b83:b0:549:744c:fffb with SMTP id
 2adb3069b0e04-54ad609d72dmr3944521e87.23.1742802379177; Mon, 24 Mar 2025
 00:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com> <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:46:07 +0100
X-Gm-Features: AQ5f1JrbrVSW1XDO8yz8UbRJofr062hFHRQi78f3pNkQKYxPx9YmO_59Oy_iH1I
Message-ID: <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: Peng Fan <peng.fan@nxp.com>
Cc: Steev Klimaszewski <steev@kali.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 8:33=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> > With this patchset applied, the wcd938x codec used in the Thinkpad
> > X13s stops working:
> >
> > wcd938x_codec audio-codec: soundwire device init timeout
> > wcd938x_codec audio-codec: ASoC: error at
> > snd_soc_component_probe on
> > audio-codec: -110
> > snd-sc8280xp sound: ASoC: failed to instantiate card -110 snd-
> > sc8280xp sound: probe with driver snd-sc8280xp failed with error -110
>
> Thanks for help testing. But per current in-tree DTS, the reset is using
> GPIO_ACTIVE_LOW, so it should work.
>
> I am not sure whether you are using firmware published DTS,
> if yes, could you please help check the codec node to dump
> the reset-gpios property under /sys/firmware/devicetree/xx ?

I'm also a bit puzzled.

I think maybe this device has some DTB that comes from the vendor
with the wrong polarity :/

If this is the case we need to add a quirk to gpiolib to force this
GPIO into active low,  something like this:

From dfe3d2a12a63135e917abacd0d3a29ce347a6cf9 Mon Sep 17 00:00:00 2001
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:44:45 +0100
Subject: [PATCH] Fix WCD938x polarity

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2e537ee979f3..3baaddedb7b6 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -220,6 +220,15 @@ static void of_gpio_try_fixup_polarity(const
struct device_node *np,
                 * treats it as "active low".
                 */
                { "ti,tsc2005",         "reset-gpios",  false },
+#endif
+#if IS_ENABLED(SND_SOC_WCD938X)
+               /*
+                * This codec is used in laptops with deployed devicetrees
+                * that fail to specify the correct active low property for
+                * the reset line.
+                */
+               { "qcom,wcd9380-codec", "reset-gpios",  false },
+               { "qcom,wcd9385-codec", "reset-gpios",  false },
 #endif
        };
        unsigned int i;
--=20
2.48.1

Maybe you can fold this into your patch if it helps. And if there are more
of the codecs with this problem, we need a similar patch in each one
of them.

Yours,
Linus Walleij
