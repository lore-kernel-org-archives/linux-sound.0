Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF7A18EFD4
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330550; cv=none; b=F19MltfnNdCl+h0zQp3rOZubvioy2+nI6YjfmyuwoGlu8YpJN1c1wQLwk195Gvk46MoywtFmWPVHMJgh87P/dE6UUtToCHRLgCQ2ihQv3U12dV2bs8KkBXiFNcyBBghbbulZEogpvSYGr0DEsFLnfY/Tq3MPXu025UjgmzFjrHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330550; c=relaxed/simple;
	bh=FtiAVlmy4Atb3gU86qfMdSS9fxMkvgUn9UgAb9eHjWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONlcQIfAwQBQtdz18VitoQ2TwylX0rK6rSdzV1aqrX+Xxji5DnsgHMe8yJe5eAecWc02geNCph48rix+q/+oT6+mVPLkoWifTsP0LqWGWeUL3jO+hpqRj7DSJWjn1J/y21ihPQxbCrWujAG2xFf3dfSwtYDeJGtHhwY4V3RqJ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.149])
	by gateway (Coremail) with SMTP id _____8AxbeKx7FNo1ccZAQ--.20717S3;
	Thu, 19 Jun 2025 18:55:45 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.68.149])
	by front1 (Coremail) with SMTP id qMiowMAxjhuj7FNoAwEhAQ--.33126S2;
	Thu, 19 Jun 2025 18:55:39 +0800 (CST)
Message-ID: <9e905818-60c4-4d45-a3a1-e61ef7bd2e46@loongson.cn>
Date: Thu, 19 Jun 2025 18:55:31 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 34/39] ASoC: loongson: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Martin_Povifff=C5=A1er?= <povik+lin@cutebit.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Paul Cercueil <paul@crapouillou.net>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Srinivas Kandagatla <srini@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Michal Simek <michal.simek@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
 <87sek5ybr0.wl-kuninori.morimoto.gx@renesas.com>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <87sek5ybr0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMAxjhuj7FNoAwEhAQ--.33126S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKryxtFyUCF4xGF4fKF1UXFc_yoWDJwb_ta
	s2gw48WrWUGry7G34YqF48ZryDX3Wfu3W5Cr15tr1rX3W7trsaq3WDC34fC3W2g34UZFs8
	ua9Y9rZ7Aa47tosvyTuYvTs0mTUanT9S1TB71UUUUeJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbf8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r4a6rW5M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	CjxVAaw2AFwI0_Wrv_ZF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5-18PUUUUU==


On 2025/6/12 09:44, Kuninori Morimoto wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
>
> Let's standardize ASoC menu
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

LGTM.

Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>


> ---
>   sound/soc/loongson/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/loongson/Kconfig b/sound/soc/loongson/Kconfig
> index 1a3c28816e7ad..2e06670e4d7e8 100644
> --- a/sound/soc/loongson/Kconfig
> +++ b/sound/soc/loongson/Kconfig
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> -menu "SoC Audio for Loongson CPUs"
> +menu "Loongson"
>   
>   config SND_SOC_LOONGSON_CARD
>   	tristate "Loongson Sound Card Driver"
Thanks.
Binbin

