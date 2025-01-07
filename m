Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD33192598;
	Tue,  7 Jan 2025 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736235621; cv=none; b=UHOHC09wMXYQCRdpkkulmr2psMOQo1WsbG8Ri/qDQ1o0Pa1376Rp8+dYG2ps58oHeFRtc7Xz9c1GmzeJMLBPSNVTf1Md2CK1Uc3r6zVHy3ogkVpk49GynnHzo04bTIu5F39YvqU9rdx0EPgeSsYh68YbIWq1cvbJYkLVjPa8wPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736235621; c=relaxed/simple;
	bh=3JjAFVFRbXwuyLvXfM+2gtbMFEhlrEWhviQRtfgGLPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgJ6t4/612xNk/EJQo9jjA3Mnuh1xcY9K2MgX/7pomCjfbOt61pr0b068QPhGytTH0lWkP1LCOq/oUkdH7qi4Xj2Wby4cLBimW3wsLV7QoT96/+5eWgdxDmexAHprlMGf37tW8YcIl+tDfX8om3fqpk/Yi12SeLnApQrkL3DQ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXE6kCXI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXE6kCXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736235617; x=1767771617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3JjAFVFRbXwuyLvXfM+2gtbMFEhlrEWhviQRtfgGLPk=;
  b=NXE6kCXIXo60Sqgra8HqNjuxigZi32rZ1ykHZPwbx/10IZ1LFHMtCUJS
   EZL5IhzMLgIOS1eMTs3wyv9zUNfIvZaKrBIjEj1pELUCTGgrSbOjXDLks
   IkS7EKivuD005/598RGOPwcG/G/KQvW9xjhR4jUSRVfJcYe2FMRUM6bVj
   Dmn5sY8hoOtECG2JV5wYxyWEVZvbIj8hzLTIpdy9OsjK0J1xcHjMenZ+w
   +LNt03MjKvrij7pB7ldiZyZPYJQ6h38sjy677hIAmRamUkg9vGwNmwfWD
   taMNTuXHjDEGcWVArUeb9QjjDzD/YbeUKm+2zwUNgmsHlieDp2CzhrGn5
   g==;
X-CSE-ConnectionGUID: S7A1gVBrS/OAnkKCcMZmdw==
X-CSE-MsgGUID: Ji3ytScgR9e+YYKptdVyEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="35637721"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="35637721"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 23:40:16 -0800
X-CSE-ConnectionGUID: fG3QCjKSR5iFmwNA8sn1Rw==
X-CSE-MsgGUID: GgeRfoaeRVy5SejxEYruNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="103202463"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jan 2025 23:40:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV4CC-000ENL-2Y;
	Tue, 07 Jan 2025 07:40:12 +0000
Date: Tue, 7 Jan 2025 15:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: wm8994: Add depends on MFD core
Message-ID: <202501071530.UwIXs7OL-lkp@intel.com>
References: <20250106154639.3999553-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106154639.3999553-1-ckeepax@opensource.cirrus.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.13-rc6 next-20250106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/ASoC-wm8994-Add-depends-on-MFD-core/20250106-235153
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250106154639.3999553-1-ckeepax%40opensource.cirrus.com
patch subject: [PATCH] ASoC: wm8994: Add depends on MFD core
config: alpha-kismet-CONFIG_SND_SOC_WM8994-CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811-0-0 (https://download.01.org/0day-ci/archive/20250107/202501071530.UwIXs7OL-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250107/202501071530.UwIXs7OL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071530.UwIXs7OL-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_WM8994 when selected by SND_SOC_SAMSUNG_MIDAS_WM1811
   WARNING: unmet direct dependencies detected for SND_SOC_WM8994
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && MFD_WM8994 [=n]
     Selected by [y]:
     - SND_SOC_SAMSUNG_MIDAS_WM1811 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && IIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
