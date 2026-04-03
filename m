Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5168934D3B5;
	Fri,  3 Apr 2026 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205602; cv=none; b=R135ZL7AlgL25aDExAuOxtVdmVm1ucNfM9ywvxNsOvpmO0icU31CwgGs2EJCo+Dag1aVRnSHBI4dKc7PFG6okL0I/vi9qOvcHxBu9fHNNajkc2EFYFQhuMuHEq0tn1TtSnRTRDeR8HY6qxQpoMfeROHpuW//6hLeIU4XtjA3SnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205602; c=relaxed/simple;
	bh=ElNpd+lXu8JPA3g/kKwOmAy3bLeT31zcflfK7jGxD6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjk1gx3CwlrixybhxaEH7v+Zp7YuJiHbFORvExEODXYYJZOgOWxa8W1Wap8T7+iO2TNVcZ0DYhwMEsqYTS2Iq1rVUh6dDXnxD5q/Xu02e1Z5enqzypp38l4Nq9SpUnJ9Lful9Ce6c4lP1A/QaRIUI742mChgqfxLqiiD5Zzf5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VA+SSpOZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VA+SSpOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205602; x=1806741602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ElNpd+lXu8JPA3g/kKwOmAy3bLeT31zcflfK7jGxD6c=;
  b=VA+SSpOZ0DJVMItSRPjikpeh6FaoXcRBcUwkKkl9D5InJmyRR0RhRzir
   nFs6CvaqHixRi+vDkYeYEalgVV7gKthmmI+MLbwDSU46GykhiDFuPEhy2
   BHgVcSSKuwJGKHOmioVyj44ofA9pltFpMl7rMH+IpgPAs6RVIPgn8DVQC
   fhmqH5RIl9HTfWqMm6WOkaRVSSPL82TClcb47NxIH2QQN+b5BajPMeX6+
   YibRzZaANVC+DBnFMzPsxDZyakBmKc9uFdAtuLHtrW+qq4pV/wxe4Fntn
   fMsGBwwCdBruLO4zf+gfreUyFRrABK2OoL2LaokoPs1MOAjgm2yiL4M1A
   Q==;
X-CSE-ConnectionGUID: LaSTbO1FSka/q2fDZGnm3w==
X-CSE-MsgGUID: S033pVOXSuy8mv1qdKaAQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76156549"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76156549"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:40:01 -0700
X-CSE-ConnectionGUID: NfV8f5AeTCyc347C+2QeyQ==
X-CSE-MsgGUID: 7VtTE+WxT0a0R78vzmEFNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="220570281"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2026 01:39:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a4H-0000000011V-39FD;
	Fri, 03 Apr 2026 08:39:53 +0000
Date: Fri, 3 Apr 2026 16:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sen Wang <sen@ti.com>, linux-sound@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, broonie@kernel.org, lgirdwood@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
	shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
	niranjan.hy@ti.com, l-badrinarayanan@ti.com, devarsht@ti.com,
	v-singh1@ti.com, linux-kernel@vger.kernel.org,
	Sen Wang <sen@ti.com>
Subject: Re: [PATCH 2/4] ASoC: codecs: Add TAS675x quad-channel audio
 amplifier driver
Message-ID: <202604021838.DCOggoRo-lkp@intel.com>
References: <20260401024210.28542-3-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401024210.28542-3-sen@ti.com>

Hi Sen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus robh/for-next linus/master v7.0-rc6 next-20260401]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sen-Wang/dt-bindings-sound-Add-ti-tas675x/20260401-114532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260401024210.28542-3-sen%40ti.com
patch subject: [PATCH 2/4] ASoC: codecs: Add TAS675x quad-channel audio amplifier driver
config: arc-randconfig-001-20260402 (https://download.01.org/0day-ci/archive/20260402/202604021838.DCOggoRo-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604021838.DCOggoRo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604021838.DCOggoRo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/codecs/tas675x.c:1473 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Hardware power sequencing
   Warning: sound/soc/codecs/tas675x.c:1551 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Device start-up defaults
   Warning: sound/soc/codecs/tas675x.c:1790 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Read and log all latched fault registers

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
