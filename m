Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAED315E214;
	Thu, 18 Apr 2024 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713439167; cv=none; b=qV2g4TQmymLWSB472fMAhkt4cS1z3gxy0FljgfGG5yM3CRucghH+Rlicz+PdA4rQQrTUAEcNiktkMZrUywPMOYbmvcD6o5DVdQ+QbWMbpCBoHq3uCzbys+lICAE6L/1g8M4Qal0PwCXKG1jt7yBw7j0sM6TQhOcejUWX1zp9+fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713439167; c=relaxed/simple;
	bh=lfgiUVfdfFtYYnbry1n8+JxXXsIYCYkmc2J1JwkNnRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nMqwtA7QL+S2SFZKLd91MTZxaGWDTt930LyGcV3F5r7utDnHOAhEhie4yZf8h+Exewl9yUG1DETb4671DBdvmj8uIxpMZs6ldY/dQ7WUW0rk3nTA/ZOrhFSAk+9e9xGiocxx5QM1KzX7sFGiP/RVSeS1ck2Kgk8B7QbG6uW7/x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFuLhO+7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFuLhO+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713439164; x=1744975164;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=lfgiUVfdfFtYYnbry1n8+JxXXsIYCYkmc2J1JwkNnRo=;
  b=eFuLhO+7MWOwf3Be2FHhxYsGNnAtf8CSaPsJs0mEjKknFjM3s2tlZfN8
   M9t13Wmk1krWAwEcbd5Cf9/VBFvahywr/i6O3DgiKoctwtcnlxS6WwJ6N
   Qq1YHyabY+g/dHUM7e+zESHW03uhhhFjbfDP74Daqwugv1JaujCp6qi7b
   pTb3ReldG1dY4bWBnKlt+9cwYZLyuOzeFYgj68tcjaH+oZBr4btPcDlg1
   20nhkz4cSQScZX/7k5FURmZ2l4CwvHil2qGyj2kn5SbxkZ7sbK11M7+XA
   3mEyocxHSdzmq6CBKX/md9xrS0WHS7Tze6TU/osZyn/JimvSIFkacFeJa
   w==;
X-CSE-ConnectionGUID: PA78uK40SkWGt96jKujomw==
X-CSE-MsgGUID: BxG7aSLKT7yrNw/L4QtuTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9097483"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="9097483"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 04:19:24 -0700
X-CSE-ConnectionGUID: isirGcN4S1iK1h9wO2dd9g==
X-CSE-MsgGUID: 7OZ/fhyhQZOwpp+2HQcdxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="23008225"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 04:19:14 -0700
Message-ID: <481d5755-ac70-4a01-899d-9d39f5075350@linux.intel.com>
Date: Thu, 18 Apr 2024 13:19:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/23] ASoC: Intel: Replace playback/capture_only to
 playback/capture_assertion
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
 <87plun71db.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87plun71db.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/2024 6:15 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal
> comprehensively for playback/capture stream in same code.
> This patch converts xxx_only flag to xxx_assertion.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/intel/boards/bdw-rt5677.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
> index 54e3c5d3c251..9170b1d509e2 100644
> --- a/sound/soc/intel/boards/bdw-rt5677.c
> +++ b/sound/soc/intel/boards/bdw-rt5677.c
> @@ -339,7 +339,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>   	{
>   		.name = "Codec DSP",
>   		.stream_name = "Wake on Voice",
> -		.capture_only = 1,
> +		.capture_assertion = 1,
>   		.ops = &bdw_rt5677_dsp_ops,
>   		SND_SOC_DAILINK_REG(dsp),
>   	},

Should this have been part of patch 8?
