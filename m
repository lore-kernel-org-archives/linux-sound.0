Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C79938422E
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416972; cv=none; b=lT77oTW/gxe36vIKGI8h26WA5+JNzyZr5FD8DGibFKa19MSNAeceBC8Z9N2cfSY0fQp9dwY5jKNCV16Oz1VmK811nGH/PYvQS9omEypDTv9EC6U10s5t/O8oxUab+ylkLRom5GzK4BzqOdvO3ObtYbE/rY/HPQRWSMrpC1KPd80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416972; c=relaxed/simple;
	bh=0YRsJG0zikzQGyPZCwNj3fX9FQhaRP08kplHGzoklOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRCDrMrceJZncRD/fvHtMQIPwNIXYfL2ZFBOI6Erh4ZatfNEPGhrsITtdMGUIiU0pZOljYGar30ZlOl/C+PY4BdUA516SEsLHtvJ5m0kJ9FxUDMLBJN9Tsn45BVuDlTAu2phhcPTEL/Nkdx/P54rfm0nEXmJ2wwcxxwb9ChhyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YsGlnA1t; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YsGlnA1t"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c45111bebso1305108f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792416968; x=1793021768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7QI1RqFBazH73cHjUm3bJRQ468s8YNQSYzETjY7O2I=;
        b=YsGlnA1tkkMkyfgl+1EjIKdeVt42ERpVq32kDtbsL4AQzF3AKBAGt4plfMadWyUg3w
         QS53/OD/qWkvgb9tJMAY3gJqqygFYV/W3Uidq42AXc/wn6aMEFGkFv7whkNPA3Qc1KFH
         RAngo3ihvgB9c0YLxVa9j3O6KABwzqpCgYVLvoHzSLcu1olVNHyDELClMccU2zO/20Vp
         Eln5hlyaHuDTsyn56R+JHRFnKpYDwPK5ZbIBVFGlu3p1jvF8h8uMTGtWWUO2wy42YAcp
         td49/Dbe4i8u10buM5zcthSmGumEc0B8Sq0mqlNCnLIwxh+Brno5ouw3Ah8aaiV5D6x5
         Po1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416968; x=1793021768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7QI1RqFBazH73cHjUm3bJRQ468s8YNQSYzETjY7O2I=;
        b=D45+MWyg96VLbU7JIDL4VL/1s7SqcgrFOcdVwxioOfntvdODSsv8oD0VlqfXtvsw/i
         sxZwiEXDvsrSV/2TEP+ntxlVy74/Os61zgdcZMG6ylFDrf17nkc5yKM4lOypEc6qrFhZ
         reiF+7K35TwlUPz8EwIV7HuLtOXFAaK+qHAfA6h4OGH/iaqjztJhbcNXZfU7MfzeSHNj
         FYbzM1DB8zqb0yU4S9571vvsw2o+B5Q30ghconZbN02Niiu6yYHze4VMRxdmifQY1WJ5
         D4NdSkUfNYtOH0nU1arXuM3hFEm6qvMOWn+mt8MwAcumBqVsHgQq3LQaw6ge+aFC/7cJ
         A8sw==
X-Forwarded-Encrypted: i=1; AKwUvByGwJOT9DRojbxHkHVQCA9WsaT61wVvwWfUvTH+VWCgowqkdimGDKHKCz4dRFh+jVXPaftemxUdl8crkw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKzqVDJHwLXCQx679Ee9x/PFJ7UM2jarWUie8f2pyApjVr1+PXg
	osImJGRL/pSSJW+fw9lyK+DkOwLv0Vsx3pC6XKXxpqks7JpGMcPDBpWz9++JGY0AgDI=
X-Gm-Gg: AYBFou2IJ/uDCw8bXOuJn95S6GTeMsvpCXJvUjrO9DJYrPrN8heHpduniu2u+JKe2MN
	l8Zrsy1eFc16dyHWbgoFXAKPcnG3zwY5L5VF/wM5IP24PhRscEheaNPxADd2QMRuFNSkUTCxyFD
	QomcxOvNJsXg1wF8H1C2i647Fbs2rwSuUyLx9y0brazZEKvTfl+rTsg3plaLBr9Y9aphWFzvpA8
	EK/fgWSc+bYa/Gc5xm/w9AGxXbXAODShh0dgxsf5bis2fzkN1WZn13fVnRWro/WKCU0PtisP5Ga
	QXjbASpi/mwbHN6IbK0D/xgR5iMxkZ5rtgPYxALK3Zznl/7EGPbw2/4dKl49ye2YNs1lW+n+EZx
	+yuPg/EcUgUeD2SNJhv4KdjzXnbkfEEVSEjhs7/bN7eQ1Jc1BczReRre8pCWyP8m+8YNKxupNq4
	HFwD9o1Me2hBfyuvcL2l+Q0d8RrbEuxD2CU8nhv+MJw9S2lR78s1Llg3arnCJW6oXDSTtmNOaN9
	SaN/IT1
X-Received: by 2002:a05:600c:c168:b0:4a1:ed0c:f051 with SMTP id 5b1f17b1804b1-4a1ed0cf21dmr30497355e9.5.1792416967770;
        Mon, 19 Oct 2026 06:36:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8cfesm20387473f8f.37.2026.10.19.06.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:36:03 -0700 (PDT)
Message-ID: <0cf7bef8-42fd-475d-b47a-9cb8629644ed@tuxon.dev>
Date: Mon, 19 Oct 2026 16:35:59 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] ASoC: renesas: rz-ssi: Explain component open
 return value handling
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
 <20261016040946.521195-10-phucduc.bui@gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261016040946.521195-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 07:09, phucduc.bui@gmail.com wrote:
> From: bui duc phuc<phucduc.bui@gmail.com>
> 
> Add a comment explaining why .open() must return 0 on success
> to ensure the component is correctly marked as opened and
> prevent future changes from reintroducing the issue.
> 
> Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>

FTR:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
