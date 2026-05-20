Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB0D21773D;
	Wed, 20 May 2026 23:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779318775; cv=none; b=FmmcbtPFPY8F6zWoPIVjb5SjfmY0hJF3wR1Ekqd7gAp7Cok5zaMRSrgtL5fgK6szqv4ad7XyK9Qocd6QwTwEJWt9M7mutnX5xjf+5IK98g/AZCEK6cGCbZ2SQ3X99mmXRxvOeNZO5Lsqktr4R7yta/BajvQZ9rzMZXZJmZ5o0t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779318775; c=relaxed/simple;
	bh=Sxvvufs2Ec+0ep9xlt+slYUDEx/V5xfFBWwd9vLO+vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmmuwmsYuGX9j2gkhlqGH/YrCKRHIKlzsmYcVPRy2VT4VMYhYDoGIi4azF7ETQFNmpVR9piQlCklBnXZO6bCeY+5fSMUY2ESE8e7lou7zbwjyG4UjoacopJPSMsxi6RpCN7sRK9qVa0kzqnZ/x2Kd8W09LkDEsCu8B6Ok49b0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgGXFCm2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgGXFCm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779318773; x=1810854773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sxvvufs2Ec+0ep9xlt+slYUDEx/V5xfFBWwd9vLO+vs=;
  b=lgGXFCm21ywcyVXMrYn0RvDQLa2Y5+5ul2qGwUCaTSpZA2VxmL8Bkilx
   ISdVHuuQ72EhveTR4us2IYHjlONTBO4fpbqQDxwStVPR+WsGrD6EgvQLV
   PTNxlce5oCXiO8lg56zjJwcBxx8pN0NhEM+Qfb2X36zvC51XTA9KmSx3c
   xnl9VV/Uc4Ik2JSN4TX9jacbi6rjQXiMQajqKo9pShMrvPLrPTIEQSAsH
   UCY9S0D6p8b2Tu8QOk3kzSTsKtgIH6t3QU+pde78QKkMVBF7oLTAoM2FJ
   Kfok+IFMJyc8Nh1himi7Js87LFbmKbicT9Vt3AaFx21kSfKqdBbutbYpe
   w==;
X-CSE-ConnectionGUID: STGzipVyRrqHMwpbojYyqg==
X-CSE-MsgGUID: 4OjBbYGJSyK9qWofKrzsWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91623227"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91623227"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 16:12:50 -0700
X-CSE-ConnectionGUID: qwMb1zaLS0iVTfvtUG609g==
X-CSE-MsgGUID: rEK3q4mgSRGwi38bI7S5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="270701254"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 20 May 2026 16:12:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPq5i-00000000AfZ-2YHm;
	Wed, 20 May 2026 23:12:42 +0000
Date: Thu, 21 May 2026 01:12:04 +0200
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sharq0406@gmail.com,
	kuninori.morimoto.gx@renesas.com, ckeepax@opensource.cirrus.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set
 jack
Message-ID: <202605210132.USry3Haw-lkp@intel.com>
References: <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>

Hi Srinivas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v7.1-rc4 next-20260520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-codecs-max98090-use-component-set_jack-callback/20260520-213646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260520132930.54333-3-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set jack
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260521/202605210132.USry3Haw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210132.USry3Haw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210132.USry3Haw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/codecs/max98090.c:2353 function parameter 'data' not described in 'max98090_set_jack'
>> Warning: sound/soc/codecs/max98090.c:2353 function parameter 'data' not described in 'max98090_set_jack'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
