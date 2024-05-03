Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98CD363
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 00:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714694889; cv=none; b=gF2rBknszpVBO4GP3xfXct7sUkQ++u+y+422ldZ3EvZTeq7DXPXS6v0jhXvnLIoaaag95ZDjah08zhfBzU16Ml+NoYM0bPH6luwv9ZCj1hCi/+AJZl9xB19OUqtVV33gAdajsLpBRdr8ctchk36eGYvhAsVoUlPZi7gDkmIh85o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714694889; c=relaxed/simple;
	bh=yib5xUMqQQofyMxpPpDzCOp2cfPhO1yno98M6Ju0fmo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e211i8LSihbdo5R453dd4AdFmOXwjKGeu9TURxFYXLjFTaTlYJFtSIOk3g5fK+Aq2NMoRWMwZzj5iCcDv2/h7jOnmkUjEyIZK+JQPtLVrT0u1KoElfCI4vyKioUJk9C08bptpzQiqd88TWFAUxSR/mCDoICRmZdrgx9uJL7EVU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mF73EXzs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mF73EXzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714694888; x=1746230888;
  h=date:from:to:cc:subject:message-id;
  bh=yib5xUMqQQofyMxpPpDzCOp2cfPhO1yno98M6Ju0fmo=;
  b=mF73EXzshJxiR5dg5XCTUetE0c7mUmMfeAzU6eXAxwR5rnYjm4+/a4MA
   BM+AGlj6fJffDdeG9XW7Dr1mtO3BFbJJpqMZuM5dBu4KP/TM4KaqMJ1fV
   CVCvDKLOXIGBdM3BTiYmcFjbkuLHD2bTmhcf57Ps38R0ATXHt4Bc+/DD6
   F9kaX20au8cMUzpGptFnvbrsqIEoHlwqlGfR7eaZ7Mp6oy38vThVtf+Yd
   PQxlt+Cweo3Ft6z5RYcS1ac5+KqFWqWp1ciK3exKEPHuRkBpRyxv03Hl1
   cPwYFCHYk01ieHUktZOOl9WpcLD2ZyIYw4JbJiqWr06PUdw2BMgnaG8sE
   w==;
X-CSE-ConnectionGUID: uIaxtRmbQR+FFwQt6varLQ==
X-CSE-MsgGUID: GjWSNB/fQ2mSYM/qxy0x1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21049436"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="21049436"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 17:08:08 -0700
X-CSE-ConnectionGUID: txVyS3NPQPC73TF8/th/EA==
X-CSE-MsgGUID: 5d23RkBoTo2476aGeJCK7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27372836"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2024 17:08:06 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2gT5-000B9S-2K;
	Fri, 03 May 2024 00:08:03 +0000
Date: Fri, 03 May 2024 08:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 linux-sound@vger.kernel.org
Subject: [linux-next:pending-fixes] BUILD SUCCESS WITH WARNING
 609939ebb81cc404d3b90ce94838f6edb5c599ed
Message-ID: <202405030814.sXQGwbr7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
branch HEAD: 609939ebb81cc404d3b90ce94838f6edb5c599ed  Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202405021426.kd3Wut93-lkp@intel.com

Warning: (recently discovered and may have been fixed)

sound/pci/hda/patch_realtek.c:7207:13: warning: 'alc287_s4_power_gpio3_default' defined but not used [-Wunused-function]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
|-- csky-allmodconfig
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
|-- csky-allyesconfig
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
|-- m68k-allyesconfig
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
|-- nios2-randconfig-001-20240503
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
|-- openrisc-allyesconfig
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
|-- parisc-allmodconfig
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
|-- parisc-allyesconfig
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
|-- parisc-randconfig-002-20240503
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
|-- s390-allyesconfig
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
|-- s390-randconfig-001-20240503
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
|-- sparc-randconfig-001-20240503
|   `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used
`-- xtensa-randconfig-001-20240503
    `-- sound-pci-hda-patch_realtek.c:warning:alc287_s4_power_gpio3_default-defined-but-not-used

elapsed time: 1459m

configs tested: 161
configs skipped: 4

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240503   gcc  
arc                   randconfig-002-20240503   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240503   clang
arm                   randconfig-002-20240503   clang
arm                   randconfig-003-20240503   clang
arm                   randconfig-004-20240503   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240503   clang
arm64                 randconfig-002-20240503   gcc  
arm64                 randconfig-003-20240503   clang
arm64                 randconfig-004-20240503   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240503   gcc  
csky                  randconfig-002-20240503   gcc  
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240503   clang
hexagon               randconfig-002-20240503   clang
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240502   gcc  
i386         buildonly-randconfig-002-20240502   gcc  
i386         buildonly-randconfig-003-20240502   clang
i386         buildonly-randconfig-004-20240502   gcc  
i386         buildonly-randconfig-005-20240502   clang
i386         buildonly-randconfig-006-20240502   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240502   gcc  
i386                  randconfig-002-20240502   clang
i386                  randconfig-003-20240502   clang
i386                  randconfig-004-20240502   gcc  
i386                  randconfig-005-20240502   gcc  
i386                  randconfig-006-20240502   clang
i386                  randconfig-011-20240502   gcc  
i386                  randconfig-012-20240502   clang
i386                  randconfig-013-20240502   clang
i386                  randconfig-014-20240502   gcc  
i386                  randconfig-015-20240502   clang
i386                  randconfig-016-20240502   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240503   gcc  
loongarch             randconfig-002-20240503   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240503   gcc  
nios2                 randconfig-002-20240503   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240503   gcc  
parisc                randconfig-002-20240503   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240503   clang
powerpc               randconfig-002-20240503   clang
powerpc               randconfig-003-20240503   gcc  
powerpc64             randconfig-001-20240503   clang
powerpc64             randconfig-002-20240503   clang
powerpc64             randconfig-003-20240503   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240503   gcc  
riscv                 randconfig-002-20240503   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240503   gcc  
s390                  randconfig-002-20240503   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240503   gcc  
sh                    randconfig-002-20240503   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240503   gcc  
sparc64               randconfig-002-20240503   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240503   clang
um                    randconfig-002-20240503   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240502   gcc  
x86_64       buildonly-randconfig-002-20240502   gcc  
x86_64       buildonly-randconfig-003-20240502   clang
x86_64       buildonly-randconfig-004-20240502   gcc  
x86_64       buildonly-randconfig-005-20240502   gcc  
x86_64       buildonly-randconfig-006-20240502   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240502   gcc  
x86_64                randconfig-002-20240502   clang
x86_64                randconfig-003-20240502   clang
x86_64                randconfig-004-20240502   gcc  
x86_64                randconfig-005-20240502   clang
x86_64                randconfig-006-20240502   clang
x86_64                randconfig-011-20240502   clang
x86_64                randconfig-012-20240502   clang
x86_64                randconfig-013-20240502   gcc  
x86_64                randconfig-014-20240502   gcc  
x86_64                randconfig-015-20240502   gcc  
x86_64                randconfig-016-20240502   clang
x86_64                randconfig-071-20240502   gcc  
x86_64                randconfig-072-20240502   gcc  
x86_64                randconfig-073-20240502   gcc  
x86_64                randconfig-074-20240502   clang
x86_64                randconfig-075-20240502   clang
x86_64                randconfig-076-20240502   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240503   gcc  
xtensa                randconfig-002-20240503   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
