Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B1C1E22E6;
	Wed,  1 Jan 2025 17:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735752120; cv=none; b=UcxbtFzZ1FN/7QvdgQ5JxCQvFpbKsgdHCDET0VhrK7fP9FnsE/LkSd6UhkH8cLc9D5psyf9ueX5iKaZaqLIC+RmIb15f6ytCK8w+vH84EDYSkHfMi7nUurC60cVgCGhcXtoFWdQRGhoY3yXUs7XtBPNUWsiPYnpVd1uPDiLys7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735752120; c=relaxed/simple;
	bh=Jm9TJ5PGc368E6M4ZEF4JFrrvX6PNNUTjqYdzeouJpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IY5tkk9ZpngcN3BNk6GNkbO6D6pufjyuUKO/mH34ExId05dWR3UAQrJGXyQmvZAXv8S8Lvcn4Px0JKJgR4mJ6d2tlVdPAKYlPJEH8/KVOEjY3B12ojlG+01RloDE4fdA9bB3ZP6froNGNGzVa2vec4twbdCZjXaNbVJ0TB8+wKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhH2ytc+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhH2ytc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735752119; x=1767288119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jm9TJ5PGc368E6M4ZEF4JFrrvX6PNNUTjqYdzeouJpY=;
  b=AhH2ytc+PVec3lQfPz3+mtP4gOEHn23rn/Cj9fXjAmnaLK3epOWMCMWE
   xX0910UAO9t7XjFw/allRtL3xS9l44k4nDk4xppqwddXM13psg5M4fBff
   DNUu3Wp3ODzVL7OIHKwnVyxCfzGSmM6tWiTHc0yGGE/xgfdKYzj8aNDcM
   rqJ6cf+prbw9jo+cM5jjw0Zc1z87qNX/hB8S0TJfMVL9YVj/cSa5s9a2K
   7GJK4vrquCfsaWkp1zSlstkhQ+GA7jxDLu1JaBXYfHr3y20RM+llmau8t
   xV6rpDxViYDOwzxujzgSwMGnw28l2PKivo9z+Db7SAlWM5eXd9gNAYF3P
   A==;
X-CSE-ConnectionGUID: ZQt6mln0Q/mdhyQpth3F6g==
X-CSE-MsgGUID: PU1fBs7RRRC7ctXujO9FUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35901086"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="35901086"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 09:21:59 -0800
X-CSE-ConnectionGUID: 5TC7sk1OQDiHgdpnoEgu3w==
X-CSE-MsgGUID: o8cwI/Q1QNWllFaJhT0/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102149919"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jan 2025 09:21:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tT2Pp-0007yJ-33;
	Wed, 01 Jan 2025 17:21:53 +0000
Date: Thu, 2 Jan 2025 01:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Kailang Yang <kailang@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming Fan <shumingf@realtek.com>,
	Qiu Wenbo <qiuwenbo@kylinos.com.cn>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable PC beep passthrough for HP
 EliteBook 855 G7
Message-ID: <202501020133.m4CnVfKi-lkp@intel.com>
References: <8be5018af1d2b26b495719b122eff0eaa1333561.1735737289.git.mail@maciej.szmigiero.name>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8be5018af1d2b26b495719b122eff0eaa1333561.1735737289.git.mail@maciej.szmigiero.name>

Hi Maciej,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-S-Szmigiero/ALSA-hda-realtek-Enable-PC-beep-passthrough-for-HP-EliteBook-855-G7/20250101-211902
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/8be5018af1d2b26b495719b122eff0eaa1333561.1735737289.git.mail%40maciej.szmigiero.name
patch subject: [PATCH] ALSA: hda/realtek: Enable PC beep passthrough for HP EliteBook 855 G7
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250102/202501020133.m4CnVfKi-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501020133.m4CnVfKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501020133.m4CnVfKi-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/hda/patch_realtek.c: In function 'alc285_fixup_hp_beep':
>> sound/pci/hda/patch_realtek.c:6946:9: error: expected ';' before '}' token
    6946 |         }
         |         ^


vim +6946 sound/pci/hda/patch_realtek.c

  6925	
  6926	static void alc285_fixup_hp_beep(struct hda_codec *codec,
  6927					 const struct hda_fixup *fix, int action)
  6928	{
  6929		if (action == HDA_FIXUP_ACT_PRE_PROBE) {
  6930			codec->beep_just_power_on = true;
  6931		} else  if (action == HDA_FIXUP_ACT_INIT) {
  6932	#ifdef CONFIG_SND_HDA_INPUT_BEEP
  6933			/*
  6934			 * Just enable loopback to internal speaker and headphone jack.
  6935			 * Disable amplification to get about the same beep volume as
  6936			 * was on pure BIOS setup before loading the driver.
  6937			 */
  6938			alc_update_coef_idx(codec, 0x36, 0x7070, BIT(13));
  6939	
  6940			snd_hda_enable_beep_device(codec, 1);
  6941	
  6942	#if !IS_ENABLED(CONFIG_INPUT_PCSPKR)
  6943			codec_warn(codec, "enable CONFIG_INPUT_PCSPKR to get PC beeps\n")
  6944	#endif
  6945	#endif
> 6946		}
  6947	}
  6948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
