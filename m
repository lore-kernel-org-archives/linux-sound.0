Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00F1482ED;
	Tue, 21 May 2024 19:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319380; cv=none; b=ZgduNOz0p4dcS4voArk1XQeh+/OobDzpPtqVyW3NwisAnoQ2LL0389jq+RM+wBhTQAUaQarr85cekP545cAc448/Fhdln8tnfMuJqIvbivnN7G/XLAT3TCs1pLkFbdOniwBmYwpjCxw/4fDfPdo+SRbrnMB+t+hbaOqpWZ4Vocw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319380; c=relaxed/simple;
	bh=4N/74mraQC7VEhtz55ALD01JAGltOePrtVxMK+VGzi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXvuTOQlL1IoTCmwFi46ecIghRoot/5Krpoe0sWaC02seMaLzKkKijOXFNR3vyQmSVdb0WnfANiAaZokVce3q7YfIYk+L7oaFiA4MDXku0mahBRNXJ+AdDkssYt4s7CpdG1H/6LC83eFKNEw5uxdtw0JKBAKDFji1P+EPElAWfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIuXqJoi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIuXqJoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716319379; x=1747855379;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4N/74mraQC7VEhtz55ALD01JAGltOePrtVxMK+VGzi8=;
  b=kIuXqJoiaX5AUPSKLJW/u3cTobJitaquN2CsFhhCBeVqsfro3vxXpcEI
   kBiMN0Kt2escb0gsVATYG7MuA635pU4PGlmFGPRzQH5utAmjO7qvR4MWl
   JvJ+bEO65a0VweOZ+2lJBMXS2SKcLCqWkqf6geyfca1o4VCR6E+N9gTnI
   LkjpLWh6RjzIEId1EuVbzsn7dEBq3YBZ1vkMkIYVcebrag5HsgYDDLBzY
   YFQ6ezcBB9qXg7gmw6pMsvZWiLlXvTT+h/Iw2qNHuicdHeyXPO3vGDBQ2
   JLz6ziWiSlPvvWCsVVZDPvFZUMIHXgD4ClDzGEhM81eMp9o4MjNVJom/s
   Q==;
X-CSE-ConnectionGUID: iryZr+VARmG04ai20cjsEA==
X-CSE-MsgGUID: a2F4AGVGRzi+LEZQvtyxKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12767849"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="12767849"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 12:22:57 -0700
X-CSE-ConnectionGUID: xkUvcTuCT9eN3cXu1ftmOA==
X-CSE-MsgGUID: HPJ2dTZTQQOdy5EU5YOyow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="37980785"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [10.125.109.138]) ([10.125.109.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 12:22:55 -0700
Message-ID: <ec063ea9-3d72-457a-9c73-46c5f5b1f6e4@linux.intel.com>
Date: Tue, 21 May 2024 11:03:41 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Jiawei Wang <me@jwang.link>, Jonathan Corbet <corbet@lwn.net>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
 <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
 <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
 <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
 <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
 <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
 <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
 <1f8e6e3c-a116-48d8-991f-4184d1eebc79@sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1f8e6e3c-a116-48d8-991f-4184d1eebc79@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/21/24 10:12, Mark Brown wrote:
> On Tue, May 21, 2024 at 08:43:09AM -0500, Pierre-Louis Bossart wrote:
> 
>> allow me to give you another counter example, beyond the AEC reference I
>> mentioned earlier. It's not uncommon for CPU DAIs to have loopback
>> capabilities, which are used for tests on boards where the codec has no
>> capture capabilities. I think it's a feature that needs to be allowed,
>> not a 'wrong setting'.
> 
> This is something we could do properly if we had full digital routing
> rather than bolting things on the side of the CPU<->CODEC model - having
> these things where we have to take a CODEC into account even though
> we're not actually using it is one of the big issues with DPCM.

No disagreement here, these echo references and loopbacks are ugly to
support with the dependency between playback and capture directions that
isn't well handled, e.g. if someone starts to capture before playback
started.

For now we're kind of stuck, what I would suggest is just to remove the
extra check that both CPU and codec dai can support a direction, and
move on with the other cleanups suggested by Morimoto-san.
