Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC7EC197A0
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 07:05:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjKPHFm (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 02:05:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjKPHFl (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 02:05:41 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29541AC
        for <linux-sound@vger.kernel.org>; Wed, 15 Nov 2023 23:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700118337; x=1731654337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iccyYLx60+kSDjnII5GF2rxDscXXNDcHqPGFIfB7nyk=;
  b=Gq3/tydk+os63sgM9EsIO8/32D6X8FBZK9B6L0n8T/83gkpIKBxysWLb
   HijCeXxsMw+DAJKPx76CqTPFCJxNuUPez/1tR1i0Kji4MoYJ2iyjXB+/2
   YnBCROeNANofXM9hvvZ9pl/NkUOa6pyIj+U1aiQW5e0zAXCLwrRmtj4eq
   nbUGJ5G6ESsFsOWvlesRJjGzenxnA8L9Xne/xA2nExZdHYrhsdzTZbzsY
   vG9P/iV12tjj9lIeLhu4A1O2S9VIIdNXM1RGmIQWFkzVfjLO78WzZ6sD1
   ntpLCgzzltQxupnTPRWZ0TFV11BEhY0/JQpiFTufvhWNBS5SX2pZ8UKEm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477247195"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="477247195"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 23:05:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096702607"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="1096702607"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2023 23:05:34 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r3WRQ-0001R2-0C;
        Thu, 16 Nov 2023 07:05:32 +0000
Date:   Thu, 16 Nov 2023 15:04:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
        tiwai@suse.com, perex@perex.cz
Cc:     oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        linux-sound@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 01/16] ALSA: pcm: Introduce MSBITS subformat interface
Message-ID: <202311161421.XWUhngXI-lkp@intel.com>
References: <20231114201317.1348066-2-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114201317.1348066-2-cezary.rojewski@intel.com>
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Hi Cezary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.7-rc1 next-20231116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-pcm-Introduce-MSBITS-subformat-interface/20231115-041959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20231114201317.1348066-2-cezary.rojewski%40intel.com
patch subject: [PATCH v3 01/16] ALSA: pcm: Introduce MSBITS subformat interface
config: i386-randconfig-062-20231116 (https://download.01.org/0day-ci/archive/20231116/202311161421.XWUhngXI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161421.XWUhngXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161421.XWUhngXI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/core/pcm_native.c:2517:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int val @@     got restricted snd_pcm_format_t [assigned] [usertype] f @@
   sound/core/pcm_native.c:2517:43: sparse:     expected unsigned int val
   sound/core/pcm_native.c:2517:43: sparse:     got restricted snd_pcm_format_t [assigned] [usertype] f
   sound/core/pcm_native.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   sound/core/pcm_native.c:95:1: sparse: sparse: context imbalance in 'snd_pcm_group_lock' - different lock contexts for basic block
   sound/core/pcm_native.c:96:1: sparse: sparse: context imbalance in 'snd_pcm_group_unlock' - unexpected unlock
   sound/core/pcm_native.c:97:1: sparse: sparse: context imbalance in 'snd_pcm_group_lock_irq' - different lock contexts for basic block
   sound/core/pcm_native.c:98:1: sparse: sparse: context imbalance in 'snd_pcm_group_unlock_irq' - unexpected unlock
   sound/core/pcm_native.c:145:9: sparse: sparse: context imbalance in 'snd_pcm_stream_lock_nested' - different lock contexts for basic block
   sound/core/pcm_native.c:171:9: sparse: sparse: context imbalance in '_snd_pcm_stream_lock_irqsave' - different lock contexts for basic block
   sound/core/pcm_native.c:184:9: sparse: sparse: context imbalance in '_snd_pcm_stream_lock_irqsave_nested' - different lock contexts for basic block
   sound/core/pcm_native.c:201:39: sparse: sparse: context imbalance in 'snd_pcm_stream_unlock_irqrestore' - unexpected unlock
   sound/core/pcm_native.c:1278:44: sparse: sparse: context imbalance in 'snd_pcm_action_group' - unexpected unlock
   sound/core/pcm_native.c:1348:37: sparse: sparse: context imbalance in 'snd_pcm_stream_group_ref' - different lock contexts for basic block

vim +2517 sound/core/pcm_native.c

  2502	
  2503	static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
  2504					      struct snd_pcm_hw_rule *rule)
  2505	{
  2506		struct snd_mask *sfmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
  2507		struct snd_mask *fmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
  2508		u32 *subformats = rule->private;
  2509		snd_pcm_format_t f;
  2510		struct snd_mask m;
  2511	
  2512		snd_mask_none(&m);
  2513		/* All PCMs support at least the default STD subformat. */
  2514		snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
  2515	
  2516		pcm_for_each_format(f) {
> 2517			if (!snd_mask_test(fmask, f))
  2518				continue;
  2519	
  2520			if (f == SNDRV_PCM_FORMAT_S32_LE)
  2521				m.bits[0] |= *subformats;
  2522			else if (snd_pcm_format_linear(f))
  2523				snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
  2524		}
  2525	
  2526		return snd_mask_refine(sfmask, &m);
  2527	}
  2528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
