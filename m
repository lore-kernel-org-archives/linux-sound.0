Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DA4C2BB3F
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 03:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235675AbjKPDhR (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 15 Nov 2023 22:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbjKPDhQ (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Wed, 15 Nov 2023 22:37:16 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D74983
        for <linux-sound@vger.kernel.org>; Wed, 15 Nov 2023 19:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700105833; x=1731641833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7AyLsMjUoSNJQ59baXaZemUaL8riPE32/6cbF2IbqLA=;
  b=KO9vzNp8PZ2NrNVRcz22SYNMmcCFVm2HNGFVQbGPKwFana2tHix6jHtI
   cOSBUHDbmgScnsp389eStF5pXr6DQQqbfSRK4/CczrWNU8UaHlz/yu+Ta
   descKEzF4j/EfdSpRdfhZo3ipnYVT3XncMTcBR8/rGjL/oUOXi6uN1Svs
   Tfm6Ew4Os7Od+SzgVRTDrQ3dQj7XzV/286Ifilozz6gMCqVt37R/XkGzz
   45gEcw9bS1AzEGdN6VDghS74DCRAOALBJGD546vDq3WxVrhw+fq1X5CYY
   gg2p9FZ/CrLJmTYKjn1IdmGtdVRXZSrq7NsM2pWkb8s2QV3+gPYLH0HpW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4083593"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="4083593"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 19:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="835609913"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="835609913"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2023 19:37:10 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r3TBj-0001FP-2u;
        Thu, 16 Nov 2023 03:37:07 +0000
Date:   Thu, 16 Nov 2023 11:37:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
        tiwai@suse.com, perex@perex.cz
Cc:     oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        linux-sound@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 14/16] ALSA: hda: Drop snd_hdac_calc_stream_format()
Message-ID: <202311161157.L2mvHx68-lkp@intel.com>
References: <20231114201317.1348066-15-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114201317.1348066-15-cezary.rojewski@intel.com>
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Hi Cezary,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-pcm-Introduce-MSBITS-subformat-interface/20231115-041959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20231114201317.1348066-15-cezary.rojewski%40intel.com
patch subject: [PATCH v3 14/16] ALSA: hda: Drop snd_hdac_calc_stream_format()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231116/202311161157.L2mvHx68-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161157.L2mvHx68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161157.L2mvHx68-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/intel/hda-dai-ops.c: In function 'generic_calc_stream_format':
>> sound/soc/sof/intel/hda-dai-ops.c:243:22: error: implicit declaration of function 'snd_hdac_calc_stream_format'; did you mean 'hda_calc_stream_format'? [-Werror=implicit-function-declaration]
     243 |         format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      hda_calc_stream_format
   cc1: some warnings being treated as errors


vim +243 sound/soc/sof/intel/hda-dai-ops.c

d1bf58474d17a77a Pierre-Louis Bossart 2023-06-02  236  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  237  static unsigned int generic_calc_stream_format(struct snd_sof_dev *sdev,
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  238  					       struct snd_pcm_substream *substream,
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  239  					       struct snd_pcm_hw_params *params)
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  240  {
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  241  	unsigned int format_val;
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  242  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07 @243  	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  244  						 params_format(params),
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  245  						 params_physical_width(params),
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  246  						 0);
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  247  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  248  	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  249  		params_rate(params), params_channels(params), params_format(params));
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  250  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  251  	return format_val;
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  252  }
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
