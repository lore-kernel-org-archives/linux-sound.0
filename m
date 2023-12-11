Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZOyfTjeW"
X-Greylist: delayed 574 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 11 Dec 2023 01:58:31 PST
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17772BD;
	Mon, 11 Dec 2023 01:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702288136;
	bh=6mxzECBrYAAv88Or/VmuYFmoaCjMKUWyx5lJyKf47Rg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ZOyfTjeWI75SumpYHrJJp3tpnNbregMBpz6DYPBko3jqkrqUVZIIKilCA2wvPCDmF
	 ko75vYXWrMKcmLVqcRtnuP7fwh6mFje5roaPrHqyRZy/yEvdee3SRlJ895KZOPuvTz
	 ch3rLBmYcqzM22MP/xXNoCohbQCB+dkubsUls2EjCj8sF7/TbUh4nEUiaTMgnx0Ina
	 VA+s4nyZeZu9o17UPBsUnNjBZrBE1jOeb8RaVZdNcMEFOY1YFJsDMcPlW/gN9DxU2D
	 cdtpMKJ1GKl0vjxrH70xRVPZ83Uqp0vmZXCTcZs50uUu9S67Pu8DX2he1OekWYv3jC
	 lwcL/q7eCSHng==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4827F378140E;
	Mon, 11 Dec 2023 09:48:55 +0000 (UTC)
Message-ID: <1db19550-99c2-4094-95d9-9db1c384519f@collabora.com>
Date: Mon, 11 Dec 2023 10:48:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt7986: silence error in case of
 -EPROBE_DEFER
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maso Huang <maso.huang@mediatek.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <98491ec78ab671f5a14fce42d10f9745ebddb112.1702258360.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <98491ec78ab671f5a14fce42d10f9745ebddb112.1702258360.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/12/23 02:33, Daniel Golle ha scritto:
> If probe is defered no error should be printed. Mute it.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   sound/soc/mediatek/mt7986/mt7986-wm8960.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> index c1390b3734101..24a4b943030d7 100644
> --- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> +++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> @@ -144,7 +144,9 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
>   
>   	ret = devm_snd_soc_register_card(&pdev->dev, card);
>   	if (ret) {
> -		dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n", __func__, ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n", __func__, ret);

This is *exactly* what dev_err_probe() does! :-)

dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail: %d\n", __func__);

Regards,
Angelo


