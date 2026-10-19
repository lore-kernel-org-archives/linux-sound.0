Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287B4F7CD7
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417029; cv=none; b=KszgSrmBZJbwxRZeCj5uI2P4VWQWCD4RyzKfu27Unt2p6Sv2rDBl07e6Pd47Ftfp1/PCyriPe5n7RpjI0WcspXTj6OCvL2S6bf+4TXc6rDfkFoIkyuOl/wdkeKPmL9/DgE0Tcd4D/TTBag+NBYVDG4cQQnjhq/Nniy39sOKK7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417029; c=relaxed/simple;
	bh=fwAYS3zcXGkdd+Ibq1n5HFY65n1XJA1GPMTC7CY2epw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UApiJr8QMKM5CkeZMN+HJ2eXjmNEibwwlNprhSpb3tOIxOo4UfoEhigzNsxRLGG3p8NR2sNvurXeHzgFhAvnNaqHD81ZDKiy4ZUADFkKdKxbN8SittjmG069zMhDmjLNXvNWetDPy6R2SR3otGzEswixjaNbAZdI06jy9FJc9Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GRMVerAw; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GRMVerAw"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so2827493a12.2
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792417024; x=1793021824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kc0HBa20pNgTgn9A/dNG9MRjR4EzrI7cz68avvggZvk=;
        b=GRMVerAwcSlBgQLJXCczlnCC2hPazNifPPo54m81DGcuQY7ikPldj5xjQXhXfjH3v+
         gSlmDnn2zVjexWn4H4KBbX2biJ0jf/GMVqK+YDwDvBHum+y4JdRyz8NQg1IJJK2npq5A
         uo+VHQYI/8/Y3Xe5TzKEMo/w/Iare/9WPQViP61JiVsVZTbco5GqofgHnH+ItR4OfnQp
         o6LRnLB0mI0Lfwq5FhL0fx7S/PS1SHb/p4abXOSlUM80UQqLjh9UBkKIBx4d6njqOHeg
         gZn/VJNZMu0J6SWhymnd6dtLLn0VBtCD6CDDVOND1YD1cr9PFG4tJJpGXNYclrUfvCd7
         L22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417024; x=1793021824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kc0HBa20pNgTgn9A/dNG9MRjR4EzrI7cz68avvggZvk=;
        b=OhqL+DL5KBVEznf54bgajNCefvyoJVxEzOCsbvUsql4gMH4riYVpuIrqKaWnE9Ni8O
         8enQ2jtVa7WC1xMFMMeH33hUp/ijuq0xLuxI3p6QhFxgdjk86poxxH2gAPg1zuw30mXS
         Lmd3mTMGggeAf0fLoNPUyg09+u3cfTbmxy4XjigzGPHt78Ofevo4cgaewu0n6KhYEtRZ
         i5LwqFKYxaWyEYDjIxNF/jzKshhxwIGuf8oWAkXazs120LWK1ZkhQDqdTZbCgzliWYZ5
         QFU5+ha+LVeBPS+TCO2zqPbg8PjoA6naOnxOgooecdlSE51bUPNZceuBayL77mXt8MYg
         Li/g==
X-Forwarded-Encrypted: i=1; AKwUvBwSulKPIogdNR44ACrNJYp/BF3x5fMgAoLnsikLA0XOjBGnMR5v4oqrG3JBwXBXSdTJuRUrUnEAIDKIXQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKBCMO+CIcQEYgqp5A7ea0dMOXnJO4JOavaJyAkMnD4reOHVy9M
	bPr2aOqsY5FeDDcgcVvxlmBgnssRh/XN0ycE92RWW/b362+WfW8plinoUzdycl7Hyrw=
X-Gm-Gg: AYBFou3feWisMmO85kdo8zT0zx2QW8KCppzHY2/rjFPcbKHlaBZii87aoVFeD58aj0s
	Y/ZxPXYK+5xi/BvPKtB+t7TTbb1CfLRpV045xcsHhLLAkXc739lQ9u0cD6Bnx3v/Kb4D0PcdpxI
	Vxv4X5bw26hbdzR/by/ta4SQ5KUG9ldrj4VB2T6CkXaCNQQ10zs6Lrj1sOB6gzLhbGhu9xLIBal
	rkSGL1aI50eAzhZ+WuJYlxPedfIkJ77KULKCmZ27BkYstQO39OGeJXXk+85sUlGZRaQ4evIujRs
	xJCb1nypAyVO72wri3JTQGauFAvU0NWqLGz4hiEM6Ytbx1N3eDdBCmAnVJiCWdzf/c9TZX/d4GX
	25Uvo1FPa3tL4qhYYb3snAbyNQAV7PYbybpoMF01MWEpo4Q0EFzB23GCj2zBPbZ/SohjEXdLAiV
	97dyK5x9j0sEOUfjXx5QdCu8EjD031ysVx2d/E5zqPPaGI1ZuNR1fReco2DhWjgLzcwMAt9p251
	bFFIh4=
X-Received: by 2002:a05:6402:5489:b0:6af:8a4b:7aad with SMTP id 4fb4d7f45d1cf-6b3a81a6d00mr4333695a12.28.1792417023411;
        Mon, 19 Oct 2026 06:37:03 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm22897379f8f.30.2026.10.19.06.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:37:01 -0700 (PDT)
Message-ID: <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
Date: Mon, 19 Oct 2026 16:36:57 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component
 open callback
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>,
 wangdicheng <wangdicheng@kylinos.cn>,
 Chris Bainbridge <chris.bainbridge@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Neo Chang <YLCHANG2@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Hemanth Selam <hemanth.selam@gmail.com>,
 Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Zain Aboobacker <zainaboobacker33@gmail.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>, Bo Shen <voice.shen@atmel.com>,
 Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-11-phucduc.bui@gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261016040946.521195-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 07:09, phucduc.bui@gmail.com wrote:
> From: bui duc phuc<phucduc.bui@gmail.com>
> 
> In DMA mode, the generic dmaengine PCM component already applies
> the integer PERIODS constraint in snd_dmaengine_pcm_open().
> 
> Since rz_ssi_pcm_open_dma() only applies this constraint, remove
> the redundant component .open callback.
> 
> Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>

FTR:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

