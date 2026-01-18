Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE63396E0;
	Sun, 18 Jan 2026 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768749303; cv=none; b=k+w+KDCzV1xcd6GCCDzx7s3L4CNwkfLjZLbzrWMF4w//54I3Lo1UAxzGO9SJ6RSrFuqBuhv6+NUFtqA/7WOXcJEBHCtK0Eg69Fi5B9VdumX/oXdN0ioLNQl+VMLGpVFuPg4HnQojX4nBKSE83pqDO3aPNsHo4wi9LD1lqHmZBC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768749303; c=relaxed/simple;
	bh=wd0hxPRgTFjESBflv8yPBw6SVFbTZYXiBUpxr4B3BTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUEtADp2DW+Qz/gEN4rATTer8zIZvBDCtfS8V2/ZeWrTsxeUqHH6tIk4FRFcZnOx7gqChRVL9RRlSuHpm5iqESE3s9ToCXj2BmSmcr4K1aroVxuP7NmX3YhPfh5Ra/3Lg/n9h+hAdl/QIBjYVbQ+FHUbS47iWVk1la0B5x0prGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgvaO/25; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgvaO/25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768749303; x=1800285303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wd0hxPRgTFjESBflv8yPBw6SVFbTZYXiBUpxr4B3BTs=;
  b=fgvaO/25bF28Gf1slDX6xf0Kbkgqlzvl8k2BnA5h03POl0ODtomN3gwS
   kmGAFOO8uU0iray6QQKt6yOk2xjMpM3ysXmj4JzZTgdIAffIBvYtBJlfs
   MFFlGvhBV78pGtL/YLG0N82TdlgE0txLch6GV5ygpD4Hy64ot6RkScXwd
   0dxYmZw3wFkDzFtL2m5Q2MNgpFViw+xY7cUfPIZcJvzFLm5GqLwsNRT7P
   tN/8qg2k96GA6MJS1jSjGimmaLhKwuWW0oagQFMYCC8oLof/cJkATfQhq
   FnqSqFv5H+OmMShc+yswvqdyPgqJNdVLrflbU14j9lqNp12qis0Mxu8+Q
   g==;
X-CSE-ConnectionGUID: T/idH8STQ0GA937Z0fEH8w==
X-CSE-MsgGUID: 9X4i9tPWTK+CE0ON2I+daw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81425918"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="81425918"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 07:15:02 -0800
X-CSE-ConnectionGUID: Jv9U4AjLSb+BqYTyvHnzSw==
X-CSE-MsgGUID: z9icjzhyTjes6I3HWeq40Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="205270596"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Jan 2026 07:14:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhUUQ-00000000N24-3wfI;
	Sun, 18 Jan 2026 15:14:54 +0000
Date: Sun, 18 Jan 2026 23:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: Re: [PATCH v2 4/7] ASoC: sophgo: add CV1800B internal ADC codec
 driver
Message-ID: <202601182222.84y7fGks-lkp@intel.com>
References: <20260118-cv1800b-i2s-driver-v2-4-d10055f68368@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-4-d10055f68368@gmail.com>

Hi Anton,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7a52965b6976c936f413eebeee3f78c6faf09012]

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-D-Stavinskii/dt-bindings-sound-sophgo-add-CV1800B-I2S-TDM-controller-binding/20260118-042514
base:   7a52965b6976c936f413eebeee3f78c6faf09012
patch link:    https://lore.kernel.org/r/20260118-cv1800b-i2s-driver-v2-4-d10055f68368%40gmail.com
patch subject: [PATCH v2 4/7] ASoC: sophgo: add CV1800B internal ADC codec driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260118/202601182222.84y7fGks-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601182222.84y7fGks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601182222.84y7fGks-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__udivdi3" [sound/soc/sophgo/cv1800b-tdm.ko] undefined!
>> ERROR: modpost: "__udivdi3" [sound/soc/sophgo/cv1800b-sound-adc.ko] undefined!
>> ERROR: modpost: "__divdi3" [sound/soc/sophgo/cv1800b-sound-adc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
