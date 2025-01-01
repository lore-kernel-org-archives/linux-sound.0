Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D063D;
	Wed,  1 Jan 2025 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735751401; cv=none; b=d0tAnFp2pyIXRrvz2he7pg9JdQqmeoocsjLolAJhSFwBkW8aJWdYhQ7+kJtxZM/C34wYXJGTzy73KAd1fWl61h4VMyK/1+YkYtNg03Tt5n1CD75/U3jKPSmws9SLay6N8W+beg3DVjPfqm05oRTFVhkXhANqb1wVRr7qMdK931Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735751401; c=relaxed/simple;
	bh=ncCTEn+jRSChtA9jVyhQe/bfK3AMg+bm0JrhjTsbosk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qv3lg5ox/BBT7mFU27JkaVck/RUK1tsmQw3D9awUgS7VrxIQRGY1VQdW5q9FqxPgshsRzcYH2OqduDQc7om3jkxA92wC+f/WhUMrpi1iFgt4LEE+QTL9yfPpB5/0TYwFB2YffGUBoK0gHBNIb+NTVBax5Igp3FjbvupfiwuP288=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrRabiw8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrRabiw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735751400; x=1767287400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ncCTEn+jRSChtA9jVyhQe/bfK3AMg+bm0JrhjTsbosk=;
  b=SrRabiw8b4UqKn0KNCv5qXEmHU3cc1iNYC8w/7HDOhr11AXUX4ayHnQy
   Bp7oUzcl78IgZ6hT8H3+yF79z10SukrR9KoXEGxNFN3A6F669YKi/AUYk
   ZUB5tLemjwC6RyK7Nx5N4znPcgf6Ik7xVPwUX23BYmFzrZliti8lQO7nK
   TwPp8rVWU44cAb+KCbgjWUAaw/OrHycy5f2K+vQL8RSI15T4B62CeYiiG
   nzSN4Y6qlbKP5psVSyzDEKxIKlDcNigAMs/FXGyAOKuPfgj2e5Vs4Y4Dy
   NGokczoOxq12Vwg96FOtHg/nDvlh7uekW0OImJkiQWb8KrJSMs8GxcCos
   Q==;
X-CSE-ConnectionGUID: yugOOwi6RUeuz9f4XA+DVw==
X-CSE-MsgGUID: pM7L38uZR4Ozv+VQmApfqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="38830072"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="38830072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 09:09:58 -0800
X-CSE-ConnectionGUID: aSkTSNPTTqukQQxmS+5Dig==
X-CSE-MsgGUID: MdZfwNGNQlG0bdcXOl/zOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132237853"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jan 2025 09:09:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tT2EC-0007y1-1f;
	Wed, 01 Jan 2025 17:09:52 +0000
Date: Thu, 2 Jan 2025 01:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kailang Yang <kailang@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming Fan <shumingf@realtek.com>,
	Qiu Wenbo <qiuwenbo@kylinos.com.cn>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable PC beep passthrough for HP
 EliteBook 855 G7
Message-ID: <202501020006.7acBeOeY-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-001-20250101 (https://download.01.org/0day-ci/archive/20250102/202501020006.7acBeOeY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501020006.7acBeOeY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501020006.7acBeOeY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/pci/hda/patch_realtek.c:18:
   In file included from include/linux/pci.h:1644:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/pci/hda/patch_realtek.c:6943:68: error: expected ';' after expression
    6943 |                 codec_warn(codec, "enable CONFIG_INPUT_PCSPKR to get PC beeps\n")
         |                                                                                  ^
         |                                                                                  ;
   1 warning and 1 error generated.


vim +6943 sound/pci/hda/patch_realtek.c

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
> 6943			codec_warn(codec, "enable CONFIG_INPUT_PCSPKR to get PC beeps\n")
  6944	#endif
  6945	#endif
  6946		}
  6947	}
  6948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
