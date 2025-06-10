Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5177127A13A
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 06:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749538221; cv=none; b=IDmzhWqSzeStayfP7YUahDTE57d5LphFrkuY88Ybgyl+5ldrF9Vtw4Yt0cgZMtES9I3cjv6xbXYrOY/FlsbQCFN5XDwruz1q8uHGpNVw6147LHa21IBeIe3BFWUy++4JTbmw0MN7OMlF13A1lyQet96qIE7hMifTxi3TZZRbgzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749538221; c=relaxed/simple;
	bh=2eUt2DdpMby0ZZc576GlqAl9DSOt2G2OW1vGnfYuEOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnfY0+t50jfDTQzfY5vN2YJhTUCCABc4g4Gv+1diJlglHOsLKQXGC4iHaNyaYu9nZBAQMo2sR61Pbzm72MUQDLhcI+otWWXZhIsnQOvDn3YpxBt/yMX+kse2NcAC0r05LZWcH4EvRtz8/wa+x2ko46iBT8+lS0IogNxQn4/fA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOXPHey1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOXPHey1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749538221; x=1781074221;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2eUt2DdpMby0ZZc576GlqAl9DSOt2G2OW1vGnfYuEOI=;
  b=KOXPHey1uYnaQmc61vID9dS18gQcVQtNXLp0F4qgFtnY7w0CwuQHh4J3
   nk87EBdx0HWT7K9o9fgjukvzRcCFnBogV2FjFIvuPLg30e/smbV+C1lhF
   GGegnVLOnTCxpw6mF2kzo3aRJRFSOmxkC6G14h845K6KDRT6eCOo4Iy4J
   UbBdWU2GgYx4lvFJa84SMTVYcBeIp3uQ/J8KRA8U5B4Ensn+x0nFTeFkP
   lA8MNto2OoXeXFqK2XlZRayRa1TuTC1GvhIaln+TIKB0RJCwYveFGJEEE
   oLk+88M19LIUUWiMWoVI1/j19BlcuNZ4iabkIyDKrlD3Rkwc9p7arvFnp
   g==;
X-CSE-ConnectionGUID: QSM+4YZUSnOqv+9D3QRBAA==
X-CSE-MsgGUID: 8zcB/3pSQ16rL3w24dSvUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51510343"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51510343"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:50:20 -0700
X-CSE-ConnectionGUID: 8cgGfmNTTLiZYqiQhFwlAA==
X-CSE-MsgGUID: ZZ0dUkGxRjWLpNc2AQyNZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146718770"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.170]) ([10.245.246.170])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:50:05 -0700
Message-ID: <8d4a0e16-1c0f-4c75-b948-24aa6d6aa92b@linux.intel.com>
Date: Tue, 10 Jun 2025 09:50:06 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/37] ASoC: sdw_utils: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Paul Cercueil <paul@crapouillou.net>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>,
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
 Mario Limonciello <mario.limonciello@amd.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Keguang Zhang
 <keguang.zhang@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Sameer Pujar <spujar@nvidia.com>
Cc: linux-sound@vger.kernel.org
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
 <87tt4o5ink.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87tt4o5ink.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/06/2025 07:23, Kuninori Morimoto wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
> 
> Let's standardize ASoC menu
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/Kconfig           | 3 +--
>  sound/soc/sdw_utils/Kconfig | 4 ++++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
> index b6a1f6fa26a99..d2934022344d9 100644
> --- a/sound/soc/Kconfig
> +++ b/sound/soc/Kconfig
> @@ -128,6 +128,7 @@ source "sound/soc/renesas/Kconfig"
>  source "sound/soc/rockchip/Kconfig"
>  source "sound/soc/samsung/Kconfig"
>  source "sound/soc/sdca/Kconfig"
> +source "sound/soc/sdw_utils/Kconfig"
>  source "sound/soc/sof/Kconfig"
>  source "sound/soc/spear/Kconfig"
>  source "sound/soc/sprd/Kconfig"
> @@ -145,7 +146,5 @@ source "sound/soc/xtensa/Kconfig"
>  # Supported codecs
>  source "sound/soc/codecs/Kconfig"
>  
> -source "sound/soc/sdw_utils/Kconfig"
> -
>  endif	# SND_SOC
>  
> diff --git a/sound/soc/sdw_utils/Kconfig b/sound/soc/sdw_utils/Kconfig
> index d915083c38895..a3e0f660fe2ec 100644
> --- a/sound/soc/sdw_utils/Kconfig
> +++ b/sound/soc/sdw_utils/Kconfig
> @@ -1,6 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +menu "ASoC support for SoundWire (Utils)"
> +
>  config SND_SOC_SDW_UTILS
>  	tristate
>  	help
>  	  This option enables to use SoundWire common helper functions and
>  	  SoundWire codec helper functions in machine driver.
> +
> +endmenu

There is no reason to add a menu entry for a single option which does
not even have prompt.


-- 
Péter

