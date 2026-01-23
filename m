Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65E62DC76B;
	Fri, 23 Jan 2026 23:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769211221; cv=none; b=ZsdOe907Ucg080y3zy5H8PmFIwt0NlWFBs2RMK6GIYI1nOeq/4IaozZztQ5awvJQB2pNPvbvYHbwg1KkOVJn7ibq2yj5kIiZ/Q9687Zzr3AjqfffWrYOysoa3u2FfGyly6DTfGVLkM//RyacgFkScceTd1SBVNLuQ9/PFHOgAlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769211221; c=relaxed/simple;
	bh=f4iO3AM4NYVY9xUt7EwoIYKJRgPi87b+tYMS2wMLNS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7hs/p3/bt6X3AUX9k7ojF2VSR3M+tTYMAfAg2J26LeTFCWMDTha4KB+GmT60LzNRwxOTitbpILNRLWMMhZ5WhADzuqBcvg6wf2lXOi0Dtlv9Lmo/b2XjwJZ22PX9uxoI5Z58VTwwt4yzyYCXgoPorj/eJUaOiFmJiSW/e+J76o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2vDVrca; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2vDVrca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769211220; x=1800747220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f4iO3AM4NYVY9xUt7EwoIYKJRgPi87b+tYMS2wMLNS8=;
  b=R2vDVrcaRIwpfa8yolstFlkXjm1UD3j9s4QubXFWs8qpcVku3QQtbD4R
   kHubk/2qNNWwENATjQ+JLLJl742OHs56zfi2fVgpJfp298eICLtc03yBI
   fzrXBmBnxxK/JU7lOB12UNwIspson4QOMwYDwXq01id4CUIho6xTcLcZb
   vsiAIQR0lTaYMqV6DSzqJGV0OM+1ciG7mB8niU0fLfXag364PjAbamzLY
   pmafmPPz92FK0l5FpyJTR+E3H6IK07Z47S5f/c7J2OCZs6mIwABXQhYHK
   xZzwjOD4Zc4GvW32A2dpzbvF7YFkfBQKiYdfKwrL/qVwUclTrmcQSU/rA
   w==;
X-CSE-ConnectionGUID: niWsw7zpTuW7W++rj26Ujw==
X-CSE-MsgGUID: zr/MYnvsTAGNdhhJ5oe6sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="58038439"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="58038439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 15:33:35 -0800
X-CSE-ConnectionGUID: XW8al9wlT4y6xIqgnrZSlw==
X-CSE-MsgGUID: JLUi+jIeT3iU5yL7b7QH9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207057723"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2026 15:33:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjQef-00000000Uac-2ajU;
	Fri, 23 Jan 2026 23:33:29 +0000
Date: Sat, 24 Jan 2026 07:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Morgan <macroalpha82@gmail.com>, linux-sound@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, wangweidong.a@awinic.com,
	tiwai@suse.com, perex@perex.cz, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, broonie@kernel.org,
	lgirdwood@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 2/2] ASoC: codecs: aw87390: Add Anbernic RG-DS amplifier
 driver
Message-ID: <202601240757.gYdQGsXp-lkp@intel.com>
References: <20260123154731.130649-3-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123154731.130649-3-macroalpha82@gmail.com>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/ASoC-dt-bindings-aw87390-Add-Anbernic-RG-DS-Amplifier/20260123-235216
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260123154731.130649-3-macroalpha82%40gmail.com
patch subject: [PATCH 2/2] ASoC: codecs: aw87390: Add Anbernic RG-DS amplifier driver
config: sparc64-randconfig-001-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240757.gYdQGsXp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240757.gYdQGsXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240757.gYdQGsXp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/aw87390.c:343:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     343 |         case SND_SOC_DAPM_POST_PMD:
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/sound/soc-dapm.h:388:32: note: expanded from macro 'SND_SOC_DAPM_POST_PMD'
     388 | #define SND_SOC_DAPM_POST_PMD           0x8     /* after  widget power down */
         |                                         ^~~
   sound/soc/codecs/aw87390.c:354:9: note: uninitialized use occurs here
     354 |         return ret;
         |                ^~~
   sound/soc/codecs/aw87390.c:339:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     339 |         case SND_SOC_DAPM_PRE_PMD:
         |              ^~~~~~~~~~~~~~~~~~~~
   include/sound/soc-dapm.h:387:31: note: expanded from macro 'SND_SOC_DAPM_PRE_PMD'
     387 | #define SND_SOC_DAPM_PRE_PMD            0x4     /* before widget power down */
         |                                         ^~~
   sound/soc/codecs/aw87390.c:354:9: note: uninitialized use occurs here
     354 |         return ret;
         |                ^~~
   sound/soc/codecs/aw87390.c:332:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     332 |         case SND_SOC_DAPM_POST_PMU:
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/sound/soc-dapm.h:386:32: note: expanded from macro 'SND_SOC_DAPM_POST_PMU'
     386 | #define SND_SOC_DAPM_POST_PMU           0x2     /* after  widget power up */
         |                                         ^~~
   sound/soc/codecs/aw87390.c:354:9: note: uninitialized use occurs here
     354 |         return ret;
         |                ^~~
   sound/soc/codecs/aw87390.c:326:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     326 |         case SND_SOC_DAPM_PRE_PMU:
         |              ^~~~~~~~~~~~~~~~~~~~
   include/sound/soc-dapm.h:385:31: note: expanded from macro 'SND_SOC_DAPM_PRE_PMU'
     385 | #define SND_SOC_DAPM_PRE_PMU            0x1     /* before widget power up */
         |                                         ^~~
   sound/soc/codecs/aw87390.c:354:9: note: uninitialized use occurs here
     354 |         return ret;
         |                ^~~
   sound/soc/codecs/aw87390.c:323:9: note: initialize the variable 'ret' to silence this warning
     323 |         int ret;
         |                ^
         |                 = 0
   4 warnings generated.


vim +/ret +343 sound/soc/codecs/aw87390.c

   316	
   317	static int aw87391_rgds_drv_event(struct snd_soc_dapm_widget *w,
   318					struct snd_kcontrol *kcontrol, int event)
   319	{
   320		struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
   321		struct aw87390 *aw87390 = snd_soc_component_get_drvdata(component);
   322		struct aw_device *aw_dev = aw87390->aw_pa;
   323		int ret;
   324	
   325		switch (event) {
   326		case SND_SOC_DAPM_PRE_PMU:
   327			if (!IS_ERR(aw87390->vdd_reg)) {
   328				if (regulator_enable(aw87390->vdd_reg))
   329					dev_err(aw_dev->dev, "Failed to enable vdd\n");
   330		}
   331			break;
   332		case SND_SOC_DAPM_POST_PMU:
   333			regmap_write(aw_dev->regmap, AW87391_SYSCTRL_REG,
   334				     AW87391_REG_VER_SEL_LOW | AW87391_REG_EN_ADAP |
   335				     AW87391_REG_EN_2X | AW87391_EN_SPK |
   336				     AW87391_EN_PA | AW87391_REG_EN_CP |
   337				     AW87391_EN_SW);
   338			break;
   339		case SND_SOC_DAPM_PRE_PMD:
   340			regmap_write(aw_dev->regmap, AW87390_SYSCTRL_REG,
   341				     AW87390_POWER_DOWN_VALUE);
   342			break;
 > 343		case SND_SOC_DAPM_POST_PMD:
   344			if (!IS_ERR(aw87390->vdd_reg)) {
   345				if (regulator_disable(aw87390->vdd_reg))
   346					dev_err(aw_dev->dev, "Failed to disable vdd\n");
   347		}
   348			break;
   349		default:
   350			dev_err(aw_dev->dev, "%s: invalid event %d\n", __func__, event);
   351			ret = -EINVAL;
   352		}
   353	
   354		return ret;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
