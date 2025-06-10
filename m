Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08962820D0
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545504; cv=none; b=umBWQnFMybpBoQfBzmZtFfWj1CNDFcoBTLrw2kMHNJGH0kw1BLd1a/uUIlLgpxU+KINrIYzm+1B6AxaoluoKCfZbGXcDDkVKF2bE01PSlTHZ8tsVCpVgCQfK6UxY6LbCcujVH4RbebXMi/Ip8NILrxT8+KNbnlRUqLUReC1zdcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545504; c=relaxed/simple;
	bh=qDMHR4QRPS6NXDTE/9aHA6ffsXMTp3aiv/uZSa5wAtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYIjAgXEG71B5Yb7FIsPiqtu2w/IqmzfZjbOyoG7vi3eQu6EF1LGJ2D+r0XrfhyHoa0pOEmlmzkiRhkEbNEFOiYmtBGT61fYjxRR0Dh3BIy6zrFdIar2o+WmOpXbB+hzoDBy1psUQXyw2QD/uEeTdgxZQ71GeTdsBlZbEMdECRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyAqfuuS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyAqfuuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749545502; x=1781081502;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qDMHR4QRPS6NXDTE/9aHA6ffsXMTp3aiv/uZSa5wAtg=;
  b=QyAqfuuSsdWlr+BTAQAJ7kQEbam8aQxCbG0+Elyl6qeGfIYZJOF7Gpqc
   wsDiOJCp9Wfz96DXEmpQK0aCBoX2uGvoZ8WR8YZ0Oj2arzuf/TDNgrY+E
   81YVXzcnOSKsyT6Vb1WhwUJAw5T1GDVtm693EH3BTYcDpQMu4qkg2c6A/
   Vq4dKsJGwbg3fB6dih/7Z2SqlC04V6RRPtyIcIjubmKuB1xzVwm/GxG/q
   y6aLZjP5B4pIrnHGN8UUt2lOW/mysRjQEZTMUWQQuuBkMHuj7VIfHT89e
   /7GUxXVzD7fEQjrvqdLcLJIktysrx4XICCi7dyiCdaAhf8gm+g4Sdhy99
   A==;
X-CSE-ConnectionGUID: fRzdElLzS562MHjiXHobRA==
X-CSE-MsgGUID: ZYN+t3pEQD6rXkGoGAbNfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69208910"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="69208910"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 01:51:41 -0700
X-CSE-ConnectionGUID: XuqEkoeeQeWJNYwV8WhapQ==
X-CSE-MsgGUID: jNGAcnpKSx2uO6s4zgTR3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="151782474"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.170]) ([10.245.246.170])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 01:51:39 -0700
Message-ID: <5835adae-5dc6-4896-ae04-690ac6893f02@linux.intel.com>
Date: Tue, 10 Jun 2025 11:51:41 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Morimoto-san,

(reduced To list to core maintainers)
On 10/06/2025 03:43, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.

I think the effort is good, however I think this still needs some work.

>     
> Let's standardize ASoC menu, like below
>     
> 	ASoC support for Analog Devices  --->
> 	ASoC support for AMD  --->
> 	ASoC support for Apple  --->
> 	ASoC support for Atmel  --->
> 	ASoC support for Au1x  ----
> 	ASoC support for Broadcom  --->
> 	ASoC support for Cirrus  --->
> 	ASoC support for DesignWare  --->
> 	ASoC support for Freescale  --->
> 	ASoC support for Google  --->
> 	ASoC support for Hisilicon  --->
> 	...

This is how the menu looks like after applying this series on x64:

--- ALSA for SoC audio support
      ASoC support for Analog Devices  --->
      ASoC support for AMD  --->
      ASoC support for Apple  ----
      ASoC support for Atmel  --->
      ASoC support for Au1x  ----
      ASoC support for Broadcom  --->
      ASoC support for Cirrus  ----
      ASoC support for DesignWare  --->
      ASoC support for Freescale  --->
      ASoC support for Generic drivers  --->
      ASoC support for Google  --->
      ASoC support for Hisilicon  --->
      ASoC support for JZ4740  ----
      ASoC support for Kirkwood  ----
      ASoC support for Loongson  ----
      ASoC support for Imagination  --->
      ASoC support for Intel  --->
      ASoC support for Mediatek  --->
      ASoC support for PXA  ----
      ASoC support for SoundWire (SDCA)  ----
      ASoC support for SoundWire (Utils)  ----
[*]   ASoC support for Sound Open Firmware  --->
      ASoC support for spear  ----
      ASoC support for Spreadtrum  ----
      ASoC support for STMicroelectronics STM32  ----
      ASoC support for Tegra  ----
      ASoC support for Xilinx  --->
      ASoC support for Xtensa  --->
      CODEC drivers  --->

We have quite menu empty sub-menus, partially because they would include
something which would not be select-able in this arch (Apple, Au1x, etc)
and things that does not even have select-able options (SoundWire things
for example).

I personally would prefer to keep the 'Sound Open Firmware Support' as
it was, probably moved above the CODEC drivers. SOF is more like a small
subsystem within ASoC and the stack supports various vendors (Intel,
NXP, AMD, Mediatek atm).

The other awkward thing with this change (which was awkward before, but
going to be double awkwarded) is that the Intel Machine drivers will be
quite detached from SOF, not visible of hinted that they are now under
"ASoC support for Intel"

I guess one would figure this out eventually if needed, it is juts a bit
odd.
Note: I'm not sure where you can select AMD/NXP/MTK machine drivers,
they might be of a distance as well.

The other thing which made me wonder is the 'ASoC support for' repeated,
would not be simpler:

--- ALSA for SoC audio support
      Analog Devices  --->
      AMD  --->
      Apple  ----
...

The title already tells that this menu is for ASoC.

-- 
Péter

> 
> Kuninori Morimoto (37):
>   ASoC: ti: Standardize ASoC menu
>   ASoC: adi: Standardize ASoC menu
>   ASoC: amd: Standardize ASoC menu
>   ASoC: bcm: Standardize ASoC menu
>   ASoC: dwc: Standardize ASoC menu
>   ASoC: fsl: Standardize ASoC menu
>   ASoC: img: Standardize ASoC menu
>   ASoC: mxs: Standardize ASoC menu
>   ASoC: pxa: Standardize ASoC menu
>   ASoC: sof: Standardize ASoC menu
>   ASoC: sti: Standardize ASoC menu
>   ASoC: stm: Standardize ASoC menu
>   ASoC: au1x: Standardize ASoC menu
>   ASoC: sdca: Standardize ASoC menu
>   ASoC: sprd: Standardize ASoC menu
>   ASoC: apple: Standardize ASoC menu
>   ASoC: atmel: Standardize ASoC menu
>   ASoC: intel: Standardize ASoC menu
>   ASoC: spear: Standardize ASoC menu
>   ASoC: sunxi: Standardize ASoC menu
>   ASoC: tegra: Standardize ASoC menu
>   ASoC: ux500: Standardize ASoC menu
>   ASoC: cirrus: Standardize ASoC menu
>   ASoC: google: Standardize ASoC menu
>   ASoC: jz4740: Standardize ASoC menu
>   ASoC: xilinx: Standardize ASoC menu
>   ASoC: xtensa: Standardize ASoC menu
>   ASoC: renesas: Standardize ASoC menu
>   ASoC: generic: Standardize ASoC menu
>   ASoC: kirkwood: Standardize ASoC menu
>   ASoC: loongson: Standardize ASoC menu
>   ASoC: mediatek: Standardize ASoC menu
>   ASoC: rockchip: Standardize ASoC menu
>   ASoC: starfive: Standardize ASoC menu
>   ASoC: uniphier: Standardize ASoC menu
>   ASoC: hisilicon: Standardize ASoC menu
>   ASoC: sdw_utils: Standardize ASoC menu
> 
>  sound/soc/Kconfig           |  7 ++-----
>  sound/soc/adi/Kconfig       |  9 +++------
>  sound/soc/amd/Kconfig       |  3 +++
>  sound/soc/apple/Kconfig     |  4 ++++
>  sound/soc/atmel/Kconfig     | 11 ++---------
>  sound/soc/au1x/Kconfig      |  4 ++++
>  sound/soc/bcm/Kconfig       |  4 ++++
>  sound/soc/cirrus/Kconfig    |  3 +++
>  sound/soc/dwc/Kconfig       |  3 +++
>  sound/soc/fsl/Kconfig       |  2 +-
>  sound/soc/generic/Kconfig   |  4 ++++
>  sound/soc/google/Kconfig    |  3 +++
>  sound/soc/hisilicon/Kconfig |  4 ++++
>  sound/soc/img/Kconfig       | 13 +++----------
>  sound/soc/intel/Kconfig     |  4 ++++
>  sound/soc/jz4740/Kconfig    |  4 ++++
>  sound/soc/kirkwood/Kconfig  |  3 +++
>  sound/soc/loongson/Kconfig  |  2 +-
>  sound/soc/mediatek/Kconfig  |  4 ++++
>  sound/soc/mxs/Kconfig       |  2 +-
>  sound/soc/pxa/Kconfig       |  4 ++++
>  sound/soc/renesas/Kconfig   |  2 +-
>  sound/soc/rockchip/Kconfig  | 23 ++++++++---------------
>  sound/soc/sdca/Kconfig      |  3 +++
>  sound/soc/sdw_utils/Kconfig |  4 ++++
>  sound/soc/sof/Kconfig       |  2 +-
>  sound/soc/spear/Kconfig     |  4 ++++
>  sound/soc/sprd/Kconfig      |  4 ++++
>  sound/soc/starfive/Kconfig  | 12 ++++--------
>  sound/soc/sti/Kconfig       |  2 +-
>  sound/soc/stm/Kconfig       |  2 +-
>  sound/soc/sunxi/Kconfig     |  2 +-
>  sound/soc/tegra/Kconfig     |  4 ++++
>  sound/soc/ti/Kconfig        |  2 +-
>  sound/soc/uniphier/Kconfig  | 14 +++-----------
>  sound/soc/ux500/Kconfig     |  2 +-
>  sound/soc/xilinx/Kconfig    |  4 ++++
>  sound/soc/xtensa/Kconfig    |  4 ++++
>  38 files changed, 113 insertions(+), 74 deletions(-)
> 


