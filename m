Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADAE31B81C;
	Wed, 11 Feb 2026 17:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770830029; cv=none; b=pcDAQH0czZOf2UXrMLjpW3rh3Q9g96Rk9EoqnD1iE5qGJdMXIV/K/zG5IjJv1L/7f67833dmd1fV7eRSAyuh5H39LvSQOiKPnzCdp0FXXQ/8uXh9lgyAUsip40XgxTvFkDvH9ataF8i5o+JNBJ7t9Iq1U24qZ6h/3EU1S69LZrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770830029; c=relaxed/simple;
	bh=QjwlKs2xQSRK1utWvls9c9WLNv2DAfLyv6moOK2FkIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmQKRXI2sOwgSCq0K1yh1wYtTpG+ZTdR1pywIMKXl7TdxQHR1sOtaYBTyy9ssBYvYEOApFh1VvOa7Ei5lwpLT2PJTGZhlqHoKACETEIW1Wr5lxYcqGiNe+t3SepgfSGRyXlD/ho8rD42a7t20HrNG4T/Si5KZx1PtOnB6iGDE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKomcLqr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKomcLqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770830028; x=1802366028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QjwlKs2xQSRK1utWvls9c9WLNv2DAfLyv6moOK2FkIo=;
  b=fKomcLqrqiKhY1ZloGTB3A7ThuIowzqnzgQE/dVZQ4GByg89IT4yc2fH
   AnpqiCaBy32XPazNVm8DYpUVHmFqMRppl8B+kV2l/1pYEuw2X2bBXfS1u
   /PgO7jPwM0/NkI+nNJpKhbI/5uTubyGMAImtuBCuLzeR0kEtxguPYsGBE
   iSMj8Ql6dy1GXT/O2mMUmWyXLN0dWclGSJpLdVexr2du6OWbW1RdJa/ES
   qV7sy+/dbfPt/aVkLXavt33PzcU7TdQ+8v1Z6EYZaZ1nVCbEE0QRTaXuL
   S7zWlkpX0k22RtGSF/F8jjSWoy0UJdHmALy6KA2P6jXijhkEZgk0fNdln
   w==;
X-CSE-ConnectionGUID: N2bCysXlQ+C2ti9rn5g3aQ==
X-CSE-MsgGUID: O8LNUvpJT9GZAh6vNiBJOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72054937"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="72054937"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 09:13:44 -0800
X-CSE-ConnectionGUID: JiYx1NvHRHiU7hfpHcjsfA==
X-CSE-MsgGUID: 0B8o6Y8MRFSGcL8k7mXYJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="242054302"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Feb 2026 09:13:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqDmU-00000000qCK-2mzh;
	Wed, 11 Feb 2026 17:13:38 +0000
Date: Thu, 12 Feb 2026 01:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mingyou Chen <qby140326@gmail.com>, vijendar.mukunda@amd.com
Cc: oe-kbuild-all@lists.linux.dev, broonie@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, mario.limonciello@amd.com,
	venkataprasad.potturu@amd.com, Sunil-kumar.Dommati@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>
Subject: Re: [PATCH v2] ASoC: amd: add DMIC support for RPL platform
Message-ID: <202602120150.0yxjhYKZ-lkp@intel.com>
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
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260212/202602120150.0yxjhYKZ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120150.0yxjhYKZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120150.0yxjhYKZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.clean:12: sound/soc/amd/rpl/Makefile: No such file or directory
>> make[7]: *** No rule to make target 'sound/soc/amd/rpl/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'sound/soc/amd/rpl/Makefile'.
   make[6]: *** [scripts/Makefile.clean:61: sound/soc/amd/rpl] Error 2
   make[6]: Target '__clean' not remade because of errors.
   make[5]: *** [scripts/Makefile.clean:61: sound/soc/amd] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [scripts/Makefile.clean:61: sound/soc] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [scripts/Makefile.clean:61: sound] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [Makefile:2059: _clean_.] Error 2
   make[2]: Target 'distclean' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.


vim +12 scripts/Makefile.clean

^1da177e4c3f41 Linus Torvalds  2005-04-16   7  
4f1933620f5714 Paul Smith      2006-03-05   8  PHONY := __clean
^1da177e4c3f41 Linus Torvalds  2005-04-16   9  __clean:
^1da177e4c3f41 Linus Torvalds  2005-04-16  10  
3204a7fb98a3bc Masahiro Yamada 2021-02-28  11  include $(srctree)/scripts/Kbuild.include
a2430b25c31840 Masahiro Yamada 2022-11-19 @12  include $(kbuild-file)
^1da177e4c3f41 Linus Torvalds  2005-04-16  13  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
