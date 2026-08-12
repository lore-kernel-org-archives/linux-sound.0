Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA78C33936B;
	Wed, 12 Aug 2026 23:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786576949; cv=none; b=qmf+jDKjZXXgod3u6Z2onPcaoIozoIKqN0Qbr8DN6enO1+ZbAFrG3aW4nXx1sbNcVZzu+BkOV5AYACvjq8iRc6sq4twAljuxAHdf8J1odj0QYQArdDUpHVBhknyPAPLm6sF6H7MCqs+96cT8bucbhU5irNxK/gp5KEUD/E5it5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786576949; c=relaxed/simple;
	bh=HrOweiJQuCeaQJsPlDUtj+c6qRKO32NL8UiWXaciyCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcDZr+kmtzc9zl+v9Rwh36qateprNg3tJ93+M+dOhihampuCopSjSkvsIDfpSkMbSn7fuQA/IP/rpZcfINiG4sT4soj3h4aLfNd61adBpn4hejPGW1y9owloi/CtLPrICEzfqeSamdzlFLfMpBgcoi4kWIiSBRm5yvSOl1uRb6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3Kfod5V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3Kfod5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786576946; x=1818112946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HrOweiJQuCeaQJsPlDUtj+c6qRKO32NL8UiWXaciyCw=;
  b=Q3Kfod5VqcT7cdIYrMy6/II04Adl/67qVmH7PME6qC79onFLeL21gk6V
   9tn1teczG+quxzKBCzMDIzITvy5gMWtXhCAC9WXPfmhs9szDcRYImxM0m
   sGKlItebbaI1FRwFvmhQz4O3t3Rb3WyIFWGPCCHk4FfmMLESdou/bvcq3
   iAEy1ev/hKYHnpx2pkBcTsADyPd3UICHPctevUXtqdoBvgqsl6GY+OKur
   3ecd1zxUIH8+VfFpOYgYvRkHbHGkrltj/ZJrlNMEJU5q+Syc1ekAFtSGJ
   tsdDAQhrdnFoZrshVIEZ9WKm6VliQnnfJKr+Yeg2DzFedC28SeEOgeXmP
   w==;
X-CSE-ConnectionGUID: O2V9sEDPStS3jzsmCj3CwQ==
X-CSE-MsgGUID: 81rpiFhwQei3bZVN6GOVCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97809952"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97809952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 16:22:26 -0700
X-CSE-ConnectionGUID: Fyxh9ubzTkKxFfsWQc+85A==
X-CSE-MsgGUID: zFmBj/mKRRKxelWqDwd5Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="267282898"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2026 16:22:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuIH8-00000000S34-2Fg5;
	Wed, 12 Aug 2026 23:22:22 +0000
Date: Thu, 13 Aug 2026 07:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: dengxiang <os_dengxiang82@126.com>, tiwai@suse.com,
	bo.liu@senarytech.com
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	dengxiang <os_dengxiang82@126.com>
Subject: Re: [PATCH] ALSA: hda/conexant: Fix microphone mute after power-on
 reboot
Message-ID: <202608130757.AUMlBDHD-lkp@intel.com>
References: <20260701065533.72517-1-os_dengxiang82@126.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701065533.72517-1-os_dengxiang82@126.com>

Hi dengxiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v7.2-rc7 next-20260811]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/dengxiang/ALSA-hda-conexant-Fix-microphone-mute-after-power-on-reboot/20260813-035114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20260701065533.72517-1-os_dengxiang82%40126.com
patch subject: [PATCH] ALSA: hda/conexant: Fix microphone mute after power-on reboot
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130757.AUMlBDHD-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130757.AUMlBDHD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130757.AUMlBDHD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/hda/codecs/conexant.c: In function 'cxt_fixed_mic_boost':
>> sound/hda/codecs/conexant.c:1198:31: warning: unused variable 'spec' [-Wunused-variable]
    1198 |         struct conexant_spec *spec = codec->spec;
         |                               ^~~~


vim +/spec +1198 sound/hda/codecs/conexant.c

  1195	
  1196	static void cxt_fixed_mic_boost(struct hda_codec *codec, hda_nid_t node_id)
  1197	{
> 1198		struct conexant_spec *spec = codec->spec;
  1199		unsigned int value = 0;
  1200	
  1201		value = snd_hda_codec_read(codec, node_id, 0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
  1202		snd_hda_codec_amp_stereo(codec, node_id, HDA_INPUT, 0, HDA_AMP_VOLMASK, value);
  1203	}
  1204	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
