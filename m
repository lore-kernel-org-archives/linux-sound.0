Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD0E47D95C
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977977; cv=pass; b=pm1BbDp6iuXrHGPlJmOdk8pGHkUiIRaZNZsFkEvKsxKDpU3Meq4z6NnGmEiPhlqLMhG07Sovd0xS8yrNyFr/9s44irDopjpE3OcP6BF5fjjdLiKT6mGxlSP9YSQuiYQImXCm0bRl62uk1cDlFM1e+QDHQSmHXIrRqf4dbRdEr2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977977; c=relaxed/simple;
	bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtiCcr0vSqS+hb7hyJMAN2QjyMcEE2S9KiwlJ270/kfvuhmIAQX7PyjEEG3L+77c8oaaa573UrvgY2k1t2Z7GeNWr4XnTkxnVQy5z2mJEeumpMkOd2Z/KmQbd46fX2vApnFAE/xttKAdcZbthhP4nUWbDl0bAGiXIyfciJh/kqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+sQR5c8; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+sQR5c8"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e5378b281aso21591435ad.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977975; cv=none;
        d=google.com; s=arc-20260327;
        b=RgUiP1Jdputcn/cjFgtZj28QEVIYJNxFGjHsa4cpr31wqYM++TWR9eWVT2do9PjlwT
         2apehVeVZK2SvpmBBpGBiN9Nmu0Ulkbhw7DT8PSiKYUGE8QHvLFBGehNDp3WteyaxIOZ
         5lKM5l6JffUNnsyepGAO/OLXX1m0rvNtG0mrAT/b+oktjBgPMwbrS784FvoPBT655ZCs
         u3YSmVu/OS3iJ5B4lH8BE+CISYhvJ7zKYDxZEPq/6hr9SolMYAY1P9hHhoGiDdwTHG6K
         QBa2+1A3XlQBET21wg20H5Dj2SxaJHjuphnEKkI3Vbx2kUJhLbzlLBHernnhjWvdF2IG
         ASAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        fh=cft4Tk8X/ZhI3hwEfVyco4rxkoZmcD+b17YXcJvuIxw=;
        b=miICWp3X+0HflxHvfTdv6rV3RnXNik+VpVpktUW5n1IJrTwP18y9LKFd1pTjYJeawq
         NIZepX1axhb7VeinyNkiC3LiKgFdpA8TBwAqCMs7fnLM2F8Twbv3kqhmtjGrVSHqTm7+
         X5X0PzRCujVT5P1AbslFneCUDYCwIGMn1r7b1PeNNTftmPHy3xaq8mr6boZK3dHKGi7l
         aFbabeVQ1/5bqVADSYkkYlQreWJhMbQ3+w0Y1yT8o8z8r5LEkkOT0xBHm6nEv5ufrO3q
         e32rUCsxiiiK4NUtoyvTRL6jwIH3mIHqYNSOwXeRKPa6oWEB2R3KZoEnCJheIXXQW+gP
         ONDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977975; x=1792582775; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        b=A+sQR5c8D4G5VxHcInTcqcfMRvjDjawE0dD5GndIvxUePkoZ9zfSmrNnRh0ZI7vgxD
         aYegV040fT7ti495IHM4LWCoJ2gPyoY9Srgzo05GnVqf0Z89TuoxoXTaLJgtHT7OkKwi
         FOLF7m29ruhHQZFjNUAQ8SI1O7svvgEOUWp3IMMhhfB/jwKzqP1QxcgXiMCuQPJgifaB
         3q60br17NTrdyynUVqu/BfAXc3/0dRgI/B3XlpgjLew5XpDnm23u59ohtCEOzd2yDUTP
         Xmb78cbtMN4NOngzKlZfZKj8UNxgajndmLDj9mOAXvRWBHDk5cpCe0mXRdDblQVDL1iu
         H4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977975; x=1792582775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        b=LqbBgegds6DivZ5RqKVKxY4amwiFF8s7s8i3s8esfVnR3QwJHwDd4BVNOCHSnmoQJX
         So1MJOd3Je+j6LC+5LYQTppkBtUuFX0u/ep1YcoHVHaXl6O/JMLojesIu8idHFmk3uu+
         gBv8UvgZOp5K5AmlsHVQhVa5Q354qCXocPgiMuwK3ztegFmDcXermCaXnqcc0ZRsmoF8
         f4HqttEjWO5MWKxyYRCM6gtSZxkO05esDzane+Lk4m81GtnLed5IxUV7mBaMQukREviP
         FuT+OJChRdWHrZyKcxfqQs/kSn6CS+qp3+JEvcBcDxW+img+1kCWPoSzXHulRvSnML4h
         UxHg==
X-Forwarded-Encrypted: i=1; AKwUvByjv/6S6f2y9tsqfKAVAd11kOLLIrBfB20NXR4+OlkGxtxoWEyL0oOCo0Ft6wjwGwi5IqYopjluZKBXiQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLlGSdZ19XT/t7yjPlE7iYHCjdSrN4iOsDMCKMCgN7DMjM7IWV3
	Ox+rEHvH14Dh0NprP8LEkKOt8wyhzJDSQOg1pww+Js2OukvC16zo2CiZfQ2VAeGVgeYBPGtmZ5l
	Qih07vSiFCagMtaXMgDfvmn+6iGW1dAg=
X-Gm-Gg: AYBFou1eGYU2rTqhkkQnct+6MceWTjw0YpbqzejpfgiMp9uALqdnUDoHZ0+NmXPOMbj
	8yN1oclP1X47FBhQOS7BGnkJBRi35U/rPo8gRFnBlAb5UE6a8J70AteSCWBZd81Z7AfGKtaMIn4
	EJ/VkuJwt7bEDhZlXOcXcUj+r6Qb7T5p0iba5z2v75pCgcs53TUQlzZ2imkarcIubHBTyhYAS34
	0kZkY0x4opKZ/7yhhUY/+gzMBmLJRhGOUfaRBTOMbYis03n6b55A67DW+xyjl1xFPIxMjjmUtOe
	njBa8JmTqTcTnt8TwbS38tspYfQH/S/+vnbV4c4AzRhSayNwpw+CrD7Jb4G9XcOUIfUBZ7F6hkb
	yDepeqS0o4HstliY9KXlt1o0QbUNsQCdVi+y39udD0ox8ueb9woVrKA7ZoSOJ2Ot/De8=
X-Received: by 2002:a17:902:c946:b0:2e7:e73e:7091 with SMTP id
 d9443c01a7336-2e842bc6d99mr145871485ad.31.1791977975265; Wed, 14 Oct 2026
 04:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com> <fc30ea4e-3c2f-4ba4-9ae2-054db9b49fd5@amd.com>
In-Reply-To: <fc30ea4e-3c2f-4ba4-9ae2-054db9b49fd5@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:39:23 +0700
X-Gm-Features: AclHuK9jgQVtz3xDN60LQFsNWM2GDbLorSH_eG4NihFn39vhGI4sDgE_b4KgxkY
Message-ID: <CAABR9nGbO1tBOL=fN90ZrYPkv767qh_sJG_UHP-FW5C7sBPpmw@mail.gmail.com>
Subject: Re: [PATCH 00/24] ASoC: Fix constraint return value handling
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, 
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, Bo Shen <voice.shen@atmel.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mukunda,

Thanks for the review.

> > Found by manual code inspection.
> For AMD patches:
>
> Reviewed-By: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

 I'll send v2 shortly with your Reviewed-by tag.

Best regards,
Phuc
