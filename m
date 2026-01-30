Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045772DF6E3;
	Fri, 30 Jan 2026 06:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769754940; cv=none; b=FOXeczA6VpyICTnl0Dc96cEhmmm6dH5VNaqoQzzPaDacorUWJPRrSeuWiSBrb8bmhYEU4m29vSPAWdpfbfgS7xv1ae5WdYFZbGwogwBkP25aqUVsIfE12ypSgIgMhBS4ePpuh6vevLVBOaCqfeIYTlfGuXv/mgCwISk3WbbYSXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769754940; c=relaxed/simple;
	bh=Sb2WU//u4SF4h5cOKPWNwwJrlAs7F8kiap7N72HjsJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQyuNUC7HJ8UCNaTHoaDiOqzFa3yToFmGHaw5RhCuyemIG3UdXMDk2i+DSdVKneqYljYTOGq28QIrLnJ4dEOX3oX+JxPxw42MwQyzafb57r6hqJQlc6A/WyL+OqBZo2523hvuOn+p6OZPmjqLx0Cr9xHQshueCqoK6H/BAqiYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsEPDLIY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsEPDLIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769754939; x=1801290939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sb2WU//u4SF4h5cOKPWNwwJrlAs7F8kiap7N72HjsJo=;
  b=HsEPDLIY65ZiBlIeKvnhAyqYzAR6i1AU1ZkP788YYcWq4MNUa6+tw3YA
   OxXl96bKBUeLiwmkqJo2IEbr8dSwSswoYPPcsSQrG4XBgHTSHWWQG+2aU
   CpxLfRv6TLzEtTfsIWRofLXT8/ugloeeI3o+ahhtOTJtLix49dERupcCd
   v+Jt6PiDSbuCtQ5RHdx3UPSajtWneg/4G7NgunbeImqddfHgsnKHN2YDc
   WnwuOS0IDkEXHhXQxhivQqZ744tHDaatPzjg37OkRFJyIKLoqr4hhFyW7
   0FaYeobZ0P1C1udDCWmsYr9/fBdVZhgqLU7d3R+Cx5JlUaaDeomb2VkUn
   A==;
X-CSE-ConnectionGUID: oHrxmcZMQOuoObt+RV03vg==
X-CSE-MsgGUID: D5OsjBi2SHGmk+R1CyBBzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74629555"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="74629555"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 22:35:39 -0800
X-CSE-ConnectionGUID: wjQWB7pyTy+QAcYvlvDfNg==
X-CSE-MsgGUID: tL1/o47kQBCLajUCKYUnsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="213682333"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jan 2026 22:35:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vli6P-00000000cHE-2CuX;
	Fri, 30 Jan 2026 06:35:33 +0000
Date: Fri, 30 Jan 2026 14:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Takashi Iwai <tiwai@suse.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
Message-ID: <202601301436.qPUffKmd-lkp@intel.com>
References: <20260129172315.3871602-3-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129172315.3871602-3-sean.anderson@linux.dev>

Hi Sean,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on broonie-spi/for-next linus/master v6.19-rc7 next-20260129]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-sound-xlnx-i2s-Make-discoverable-parameters-optional/20260130-012955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260129172315.3871602-3-sean.anderson%40linux.dev
patch subject: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from registers
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260130/202601301436.qPUffKmd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301436.qPUffKmd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301436.qPUffKmd-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/xilinx/xlnx_i2s.c: In function 'xlnx_i2s_probe':
>> sound/soc/xilinx/xlnx_i2s.c:191:30: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     191 |         drv_data->channels = FIELD_GET(I2S_CORE_CFG_CHANNELS, cfg);
         |                              ^~~~~~~~~


vim +/FIELD_GET +191 sound/soc/xilinx/xlnx_i2s.c

   173	
   174	static int xlnx_i2s_probe(struct platform_device *pdev)
   175	{
   176		struct xlnx_i2s_drv_data *drv_data;
   177		int ret;
   178		u32 format, cfg;
   179		struct device *dev = &pdev->dev;
   180		struct device_node *node = dev->of_node;
   181	
   182		drv_data = devm_kzalloc(&pdev->dev, sizeof(*drv_data), GFP_KERNEL);
   183		if (!drv_data)
   184			return -ENOMEM;
   185	
   186		drv_data->base = devm_platform_ioremap_resource(pdev, 0);
   187		if (IS_ERR(drv_data->base))
   188			return PTR_ERR(drv_data->base);
   189	
   190		cfg = readl(drv_data->base + I2S_CORE_CFG);
 > 191		drv_data->channels = FIELD_GET(I2S_CORE_CFG_CHANNELS, cfg);
   192		if (cfg & I2S_CORE_CFG_DATA_24BIT) {
   193			drv_data->data_width = 24;
   194			format = SNDRV_PCM_FMTBIT_S24_LE;
   195		} else {
   196			drv_data->data_width = 16;
   197			format = SNDRV_PCM_FMTBIT_S16_LE;
   198		}
   199	
   200		if (of_device_is_compatible(node, "xlnx,i2s-transmitter-1.0")) {
   201			drv_data->dai_drv.name = "xlnx_i2s_playback";
   202			drv_data->dai_drv.playback.stream_name = "Playback";
   203			drv_data->dai_drv.playback.formats = format;
   204			drv_data->dai_drv.playback.channels_min = drv_data->channels;
   205			drv_data->dai_drv.playback.channels_max = drv_data->channels;
   206			drv_data->dai_drv.playback.rates	= SNDRV_PCM_RATE_8000_192000;
   207			drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
   208		} else if (of_device_is_compatible(node, "xlnx,i2s-receiver-1.0")) {
   209			drv_data->dai_drv.name = "xlnx_i2s_capture";
   210			drv_data->dai_drv.capture.stream_name = "Capture";
   211			drv_data->dai_drv.capture.formats = format;
   212			drv_data->dai_drv.capture.channels_min = drv_data->channels;
   213			drv_data->dai_drv.capture.channels_max = drv_data->channels;
   214			drv_data->dai_drv.capture.rates = SNDRV_PCM_RATE_8000_192000;
   215			drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
   216		} else {
   217			return -ENODEV;
   218		}
   219		drv_data->is_32bit_lrclk = readl(drv_data->base + I2S_CORE_CTRL_OFFSET) &
   220					   I2S_CORE_CTRL_32BIT_LRCLK;
   221	
   222		dev_set_drvdata(&pdev->dev, drv_data);
   223	
   224		ret = devm_snd_soc_register_component(&pdev->dev, &xlnx_i2s_component,
   225						      &drv_data->dai_drv, 1);
   226		if (ret) {
   227			dev_err(&pdev->dev, "i2s component registration failed\n");
   228			return ret;
   229		}
   230	
   231		dev_info(&pdev->dev, "%s DAI registered\n", drv_data->dai_drv.name);
   232	
   233		return ret;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
