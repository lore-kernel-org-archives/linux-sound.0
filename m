Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD6C54B1C0
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991350; cv=none; b=CK/OtU8x1W5nTdirGK9EMNdkqYizZ9O0CHhf+m8f0QPunE6OB0OahjJFPQEL0qqVFFKuUyfZRwKO5wdOMyKfEXnSS73oo9DrchSVwU9JzzJGTDWKd+SqluZ93fDADDIIVIknEzWncWlqSIHuLPy+xBmWu9mjYwx1g/do6XazU4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991350; c=relaxed/simple;
	bh=OJYOG4YSV0pLaaOPEwxxy35lIjjZKUEA7jwt74Dr43o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p63UC9igGbGQmw0Pm6y3hRs6CZs2As3Scpoy4uWnKpSoUSUc6H+69/JAXoIVSw76EBQrH+HdVHRhRpoKQAg4qMBlKx1UFNcF2b0+u9NH2qJf6EmAJ8lwTO48SiLk1x8AHkHGNtOEJheTa19QGojFbl9eFX7aUnkI9VNSn6d9Tpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=C96xXxk/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="C96xXxk/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so41219595e9.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791991346; x=1792596146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Js2yXAKJLVFgb+YsCYrtsAgVcbxI+5CvJwak5knEqR8=;
        b=C96xXxk/84vzF3EfzCUuCljDOFx5esb7HRrDI+a7QeuB6T5LI/2JZ6fqtHZBskFRJQ
         ZQPfolcT+V84DFB7gc7MMb7fBjyJZZibOalRi2USNZjto3Xs/x/kMW9QyJ5BZNfqka1N
         JREiwkJ4UXKEIHlpClrLZ2lyic+giBI/tRi4nuld/TH+PKyzFQhcLnmWHpFCBTAb+0B1
         MHK6TlEcEJjxZrVFwO3nl6ufsit1daG1LxAJYuZ5I481bFuAdtkg5RnT1W6IdoVwKaVu
         zDpm4iKEJXIQGvJx9tn2CdoMEiP6QrMK+c7983spn7S9QcE2zyNOJwVhLczZsQBk3pks
         NNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991346; x=1792596146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Js2yXAKJLVFgb+YsCYrtsAgVcbxI+5CvJwak5knEqR8=;
        b=p7ytCOt5wgeWGpxZk94/hi1T4ylDy2UA+HvOKuRhtID30TuewQ4EXkIjSN7kueKOxJ
         K7o0DoCTlRrAw9dsPFP6ekVN3XHcQkiSketXdl4gsBCCnI+TZT/RZ2GCC//RQ3ByQNJi
         rLyT01/FQGfh4XXESJ/lm7B12Yr+wZmxaGj0nFj7dbjctEw5lmrWNDTn8iFUsVIzgtjR
         DlTyIrrmoHEG52GIXFulvb0mk6IDGYq4Ilkan/g6OjCGdjXcAJUu5WKspjmEFKeK1LTc
         OIzbTmpFeK2LOmLYnXjnpZH8J5Gr3kWx9ckaiikXQpN2kw4W58aU9FZdI+dfEVNfBP+4
         XYww==
X-Forwarded-Encrypted: i=1; AKwUvBzUXDQAv3yFKSzpgpv/7Ycoa+L7UU/xZgVTP12b5QW8gTu3ghmpQ8qRGuPEH+PEOUUyJKN0Khs4D27kvg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLiA3bjtnl/PYTUB3n7lE6zjmW9cjdONZe2fPhlJ17foxo69USy
	mIENv/UK5629iaLh8vwf7cKQ36lCDf0F0JQQl3Q5aJS1a/u0OfWypwJQSc2OeJMujGY=
X-Gm-Gg: AYBFou2T2c5dyVSXVqbeDB61GofMWZC7j5glMtFTpRcUGgzJhqHZq8FGCD68Zcg2X5+
	bshV7bSW0AkvPJZGGyp6niNQIQoeoEAAIB2DwdOFYv7ZqYu/SwUIEpZqcEe7f8jrczePCvEDfCA
	lxzitcGDb4HOv2gXwRpXHdseieYIok3FEX9fVi1Fev99R7BmZ7trGqsr9R7NzPUXB4L1WDm518A
	UYSAHsIBUYTiKAGR9t+YEyKjLSzsoZ3MYr+7feNB8swvvA5hL8gogYFHU1s5C5hXtXS4aDE8BMF
	IwqX3uz68qLM2+jzrapOSJefW/IYe03rwKzeZC8+IBrH/bXMJGDc52ATGvk2oGrIGS70xZV5Uyp
	vM+WCoSLz9TQoy3QyAAgE1b9QdfrVf9gWAmpsF5CWnLi86wd9GR2wGi0EAZIohWJG34pE6gFtpq
	m1FitNlikvGAkmwSskPOQ0U+k0UeUlSI/w3KEVZFi3hG4Ld26WqrGyEGj29plSDJy1SfljIw2V/
	1qyyRs=
X-Received: by 2002:a05:600c:3507:b0:4a1:afcd:3919 with SMTP id 5b1f17b1804b1-4a1afcd393emr93408495e9.7.1791991346614;
        Wed, 14 Oct 2026 08:22:26 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67502asm974715e9.3.2026.10.14.08.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:22:25 -0700 (PDT)
Message-ID: <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
Date: Wed, 14 Oct 2026 18:22:21 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bui Duc Phuc <phucduc.bui@gmail.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
 Syed Saba Kareem <syed.sabakareem@amd.com>,
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
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>,
 linux-sound@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com>
 <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
 <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
 <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Morimoto-san, Bui,

On 10/14/26 02:38, Kuninori Morimoto wrote:
> 
> Hi Bui, Claudiu
> 
>> For rz-ssi: in DMA mode, the driver registers the generic dmaengine
>> PCM component, whose .open callback already applies the integer
>> PERIODS constraint via snd_dmaengine_pcm_open().
>>
>> Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
>> value fix only for rz_ssi_pcm_open_pio()?
> 
> It seems fine, but I don't know detail of rz-ssi.
> Claudiu, what do you think ?

That should work. I'll test v2 once it's out.

Thank you,
Claudiu
