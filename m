Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6D227FB35;
	Wed, 28 Jan 2026 03:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769572515; cv=none; b=KyK3RSjImXzm+/1OJRw7u1UF5AvQKDp1U5OjdU7h3QsVfDqzvsxlmgU4EankCZdilqrl2GgbHvll39x1oS7jj+Bq5QhiCmoeCBy6Mi5U035T+mIvt4n+I8WD+TC4FQk8UMu89fJ64UgkRw3TTbw9sHp0V8xEejCbnxyn1T7mU4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769572515; c=relaxed/simple;
	bh=gnHA1NlQw1mcHorufZdTT4X1PTF99NxQ5Mrf5GGTJ/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahLQtfSPZaqh0QlLvKreZ0k99sEuyU+IJA8Z2qsCGlnKcyC1xEpVVB3hC0ILvZnSoj3MQkF/nUlkACGkX7xBXht26drKk9DnTqe/6zCkmMpkSZ9ya7AxeSo7pUzmbAO26NXBcU0e2I83kz0/XVGZTff9PC9Ds3DKgvkkuYkmcUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hECn2+c2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hECn2+c2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769572514; x=1801108514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gnHA1NlQw1mcHorufZdTT4X1PTF99NxQ5Mrf5GGTJ/I=;
  b=hECn2+c27RwYmlgmnsk5MaT4GCV5kvEY15qPumh/5g34uvpcBsTkaRcU
   dFoby/+CQcwISbscPrtakq/v5yys/6fWiWJ5n3doWCr/lAGKhYy60knZs
   zYw8cpoKbmR3F6dQk4AYaC9u4P3cDueyTIQ6RX+/THjrH//GbJI9XIU7O
   ECRY3U2HkfptZuhPZPXnMWdbjfD0jq88D05fCGNUdC7AChOeOPGWAZRcD
   pHT3R8vhrvRKALgeCerHN4CjbxTF4ZAXHMYLMCikXTzJKgS6dVr5f31P4
   l4BCQd9bmyncpZ1IKL8V9d6vXmXM3k1jHWEotnYzeJSfrC/Utyt9HyLmc
   A==;
X-CSE-ConnectionGUID: qarMm3eqRkSiHfXP5jrjIg==
X-CSE-MsgGUID: 9Ub22pRzSrazW/ZQfD8lZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88355690"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="88355690"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 19:55:13 -0800
X-CSE-ConnectionGUID: 0hTreD+IT2aSiZskovpb/A==
X-CSE-MsgGUID: XDqaFL56QMCgaXcPcW3djQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208390434"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2026 19:55:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkwe4-00000000ZCy-12Kc;
	Wed, 28 Jan 2026 03:55:08 +0000
Date: Wed, 28 Jan 2026 11:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev, Alexey Charkov <alchark@gmail.com>,
	Sjoerd Simons <sjoerd.simons@collabora.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
Message-ID: <202601281116.z12yhNfr-lkp@intel.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/ASoC-rockchip-spdif-Use-device_get_match_data/20260128-001701
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb%40collabora.com
patch subject: [PATCH 10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260128/202601281116.z12yhNfr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281116.z12yhNfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281116.z12yhNfr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/rockchip/rockchip_spdif.c:22:
   sound/soc/rockchip/rockchip_spdif.c: In function 'rk_spdif_hw_params':
>> sound/soc/rockchip/rockchip_spdif.h:33:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      33 | #define SPDIF_CFGR_HALFWORD_ENABLE      FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 1)
         |                                         ^~~~~~~~~~
   sound/soc/rockchip/rockchip_spdif.c:109:28: note: in expansion of macro 'SPDIF_CFGR_HALFWORD_ENABLE'
     109 |         unsigned int val = SPDIF_CFGR_HALFWORD_ENABLE;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/FIELD_PREP +33 sound/soc/rockchip/rockchip_spdif.h

    30	
    31	#define SPDIF_CFGR_HALFWORD_MASK	BIT(2)
    32	#define SPDIF_CFGR_HALFWORD_DISABLE	FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 0)
  > 33	#define SPDIF_CFGR_HALFWORD_ENABLE	FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 1)
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
