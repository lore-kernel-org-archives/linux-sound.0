Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5663563C4;
	Wed, 11 Feb 2026 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770849417; cv=none; b=ZbIvyy+9Vb3n/2T9AgPPkTfx1tJq50wPc0OiLN9BI0mgtRqReZt0LjacoIDV7qhGxFeZH58/d4A1roKPRo27HvhhC1BAfCIAFxmz++nJKTEs5USHqTngBoPEWRCt1gilKGJjwbNYpb4qn9pBcUyoAF+qu9odEVp8pfcpcCyHntQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770849417; c=relaxed/simple;
	bh=n7fUx0E2PVVqeB1ASPBsRy5KF4CM6lvLAYOZVYJuxmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbpB+Tj3BoZ7xgd4+7XXmxf9zLHbBi+/0C90GqzcEr7T5R5+KH+pE+cDiHz7rXRg4k3Cmqf60K/3kNolhEXJCmBJFify/JyMU47oJDAzz6Q/SDR+gO2c7+H2t0LjjfCXqq8rJb8ElV5mjZSGCSbOiDsEJYXYGSPGIkEGJwF2q2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXYv41ui; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXYv41ui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770849416; x=1802385416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n7fUx0E2PVVqeB1ASPBsRy5KF4CM6lvLAYOZVYJuxmU=;
  b=EXYv41uiXHOrihCdmP//qMZsNR5Ib+r73zj0/hbdNDnBg597VCtPjnc7
   QM2tEwrl7zYKkh0hwbdnYQ/LslVzqhZf5NIm8lku1q0e5Oz1ue7JxQNcq
   ya8ZX02SZ/fClbfhQHgLdU6Czr656+S17BDo5NPoCzYcZseQ9xHr+douq
   5quoV4CjxLjUEHX1O7mfmNWACzKK5BIlI+TAeqzAA7cFbzuFTlaIWFC4a
   oqQOQnkUfNaL8IwkwXGXGmMJktwKdXXeAik6gDzUYzIL4hhnrHST4nQwR
   YPcsrRUAVBqhQsuaSiDHaObNQNvh2ME3sD18xIuwcqFIHg5s32B0l8bFx
   Q==;
X-CSE-ConnectionGUID: mMk+tFDIQuOxurnsoO/MFw==
X-CSE-MsgGUID: OgNgA8PNT6mXyDYRZRAw4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="82335093"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="82335093"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 14:36:56 -0800
X-CSE-ConnectionGUID: Is7Ne3/IT7eI95B1AfbZqQ==
X-CSE-MsgGUID: 7c24DlciRA6UpT4F4/ksag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="212211729"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2026 14:36:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqIpH-00000000qRg-0axJ;
	Wed, 11 Feb 2026 22:36:51 +0000
Date: Thu, 12 Feb 2026 06:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mingyou Chen <qby140326@gmail.com>, vijendar.mukunda@amd.com
Cc: oe-kbuild-all@lists.linux.dev, broonie@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, mario.limonciello@amd.com,
	venkataprasad.potturu@amd.com, Sunil-kumar.Dommati@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>
Subject: Re: [PATCH v2] ASoC: amd: add DMIC support for RPL platform
Message-ID: <202602120639.za1Vo64M-lkp@intel.com>
References: <20260211115008.100239-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211115008.100239-1-qby140326@gmail.com>

Hi Mingyou,

kernel test robot noticed the following build errors:

[auto build test ERROR on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingyou-Chen/ASoC-amd-add-DMIC-support-for-RPL-platform/20260211-195242
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260211115008.100239-1-qby140326%40gmail.com
patch subject: [PATCH v2] ASoC: amd: add DMIC support for RPL platform
config: x86_64-buildonly-randconfig-002-20260211 (https://download.01.org/0day-ci/archive/20260212/202602120639.za1Vo64M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120639.za1Vo64M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120639.za1Vo64M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.build:37: sound/soc/amd/rpl/Makefile: No such file or directory
   make[7]: *** No rule to make target 'sound/soc/amd/rpl/Makefile'.
   scripts/Makefile.build:37: Failed to remake makefile 'sound/soc/amd/rpl/Makefile'.


vim +37 scripts/Makefile.build

^1da177e4c3f41 Linus Torvalds  2005-04-16  34  
3204a7fb98a3bc Masahiro Yamada 2021-02-28  35  include $(srctree)/scripts/Kbuild.include
57fd251c789647 Masahiro Yamada 2021-02-28  36  include $(srctree)/scripts/Makefile.compiler
a2430b25c31840 Masahiro Yamada 2022-11-19 @37  include $(kbuild-file)
3204a7fb98a3bc Masahiro Yamada 2021-02-28  38  include $(srctree)/scripts/Makefile.lib
^1da177e4c3f41 Linus Torvalds  2005-04-16  39  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
