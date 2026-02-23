Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451EB33B6FA;
	Mon, 23 Feb 2026 18:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870143; cv=none; b=rVVz8ZFSUOTzDrngYA5g8TNIYgpKXzXGYkFznbiMpOfvxT1rGDu67EGPSQpiathSPKrF9zt025WnzIY3k+rQupwZX4Id28yEb50OUCA1K5sqQx7k+25VH80mUo5ym6z61AhYVNRal366BLGzDS0Msbjl/8NLsDksnztcb6EkeJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870143; c=relaxed/simple;
	bh=n5A2otkqY3X5ev25wBxCVE3Dc42I3URG4V9iekg0W80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oorrvF/Q52LLDmKbmkMRd/uIKi0one+GuGf9scRQuEVg0qofnLzm4bk5nGT+kDd4gemPV53MAxWHZp5ch2dhxI3cf2FFlSXMjNjpkUzRYN5g9VPYn7SiEFpZ+e09Ujb2A3I3i6T1wA905AQTjN7et4nxOeZoMhUAA51t1k8Ha5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pl6ao+q+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pl6ao+q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771870142; x=1803406142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n5A2otkqY3X5ev25wBxCVE3Dc42I3URG4V9iekg0W80=;
  b=Pl6ao+q+8LrWxgEQzHnMTm9EhHT4kKgMwvDf5jnqAbpj9xFbVVpB+Gvj
   rg5uxIxtehmr5yNnPUUQX4xsx3R7wNev1uVu/bPGZzMGcSs6T12yxItK+
   VBBz7nVryav+yuqM1j0oUF+qHA33gESF5AH+yoPDc0NcoOH3RJTmGIVqv
   7asuP9WlfcUV/JhvMwafNgMXkdyFzSaSxb/RsUiaTGCePL+mmWEmBJy7V
   mGgxdyQGp3LFJwLpUoQ4iQ5fC788LWkPOeqCnAovDXFPOmMB1UUOCm5Mb
   h485ELLavKtbovdbwlcv3WZGNrpOKvkD+RAPshA7YeHSmheTPYwa/uCoy
   A==;
X-CSE-ConnectionGUID: ldlGudgaSPquLksnkRxMXw==
X-CSE-MsgGUID: QKl9xfcoQdihybF3sHYuYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="98337399"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="98337399"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 10:05:50 -0800
X-CSE-ConnectionGUID: 8r6fIfEzTn63eK+nh6GMuA==
X-CSE-MsgGUID: VDU/xa9CS6CX/SopIFHPRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="220638348"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Feb 2026 10:05:49 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuaJK-000000000dZ-1ILc;
	Mon, 23 Feb 2026 18:05:36 +0000
Date: Tue, 24 Feb 2026 02:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1 1/3] firmware: cs_dsp: Add API to hibernate the DSP
Message-ID: <202602240126.0DhinYkl-lkp@intel.com>
References: <20260223160614.754934-2-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223160614.754934-2-sbinding@opensource.cirrus.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v7.0-rc1 next-20260220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/firmware-cs_dsp-Add-API-to-hibernate-the-DSP/20260224-002158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260223160614.754934-2-sbinding%40opensource.cirrus.com
patch subject: [PATCH v1 1/3] firmware: cs_dsp: Add API to hibernate the DSP
config: loongarch-randconfig-r071-20260224 (https://download.01.org/0day-ci/archive/20260224/202602240126.0DhinYkl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240126.0DhinYkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602240126.0DhinYkl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/firmware/cirrus/cs_dsp.c:1124 function parameter 'hibernate' not described in 'cs_dsp_hibernate'
>> Warning: drivers/firmware/cirrus/cs_dsp.c:1124 function parameter 'hibernate' not described in 'cs_dsp_hibernate'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
