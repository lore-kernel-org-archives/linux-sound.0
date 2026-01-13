Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D7838170F;
	Tue, 13 Jan 2026 10:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300010; cv=none; b=WWEq1O+nskobZqU4U9qTo5ILKvMBIZLePyGqsc80e6ke71osHYNY8vkEgUHQkE/kSMDsurFTsINIumSaCKUpX95+M/6j9P1rjSdEi+FZOgQp5nZX2jm3uMFv7dTkVoARbhA9dJOXJ436GK/U/FJufMhcHokEIzVgs6LF5tKFNOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300010; c=relaxed/simple;
	bh=L03h2gpK9PrBWkWHVwlCcFgNsiTqhpYrjmjQsxgLzrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8yFld54UQBNhVyr7jfualiLGX82wgVF7SUh8rf6kUwrQ4UFCu3JY2lvpe0HE7VN7v5J5kDICMEyH65ludTeKkSTODes+Ck/mPq8WFARwA9V7Z8T3JC1uZcorr6SHxW7xP7FUeu1UDpSSLc55iOIQbbRATPNu7hqQivqrCn8gmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSeBTN/E; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSeBTN/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768300009; x=1799836009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L03h2gpK9PrBWkWHVwlCcFgNsiTqhpYrjmjQsxgLzrU=;
  b=LSeBTN/EROCOccd2wn+0I4e+1Bx/iPeMR0g0UBK3h6DG7In7vYbShm8d
   riyUsgA/Y0hfXi//NS1mpUyYDicQrP1nnraAib4JZ190hxtfJzuB7ffNS
   5BEaTm2VQvIEX+crU3I9bu5AHkyDoCnjr/YiUEKmO4qU83YV/iTjlAKHg
   NBcKWYJmvzMUQOuhjKbX8pmkO3/bqf03nJCsWwTDz+ZPz/LuibKotJvxn
   c32P8dFUPuWfETYb0TRH3TFGb2uq6L/tJU+DdMMRzM5uVigS/uLNxBha2
   ZelutrzK2DMEm+EMqntxkt9NkSpEQ1nAysvDrS09fIi7ko2qmtyHksuzD
   g==;
X-CSE-ConnectionGUID: agAQVm/ZQoa1WEMY5m8tDA==
X-CSE-MsgGUID: BR02NkFVRLa22WQpkRKm8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69564574"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69564574"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:26:49 -0800
X-CSE-ConnectionGUID: Ma2498XvSt2EEHpnji4w2w==
X-CSE-MsgGUID: LigmJqi8Tkifoedb7juyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209185836"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jan 2026 02:26:45 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfbbn-0000000017h-0mLj;
	Tue, 13 Jan 2026 10:26:43 +0000
Date: Tue, 13 Jan 2026 11:25:49 +0100
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	yung-chuan.liao@linux.intel.com, simont@opensource.cirrus.com,
	Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
Message-ID: <202601131155.RXGj4KHv-lkp@intel.com>
References: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>

Hi Vijendar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20260113]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vijendar-Mukunda/ASoC-amd-acp-soc-acpi-add-is_device_rt712_vb-helper/20260110-144723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260110064505.1485927-1-Vijendar.Mukunda%40amd.com
patch subject: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
config: x86_64-kismet-CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS-CONFIG_SND_SOC_ACPI_AMD_MATCH-0-0 (https://download.01.org/0day-ci/archive/20260113/202601131155.RXGj4KHv-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260113/202601131155.RXGj4KHv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131155.RXGj4KHv-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_ACPI_AMD_SDCA_QUIRKS when selected by SND_SOC_ACPI_AMD_MATCH
   WARNING: unmet direct dependencies detected for SND_SOC_ACPI_AMD_SDCA_QUIRKS
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && ACPI [=y] && SND_SOC_SDCA [=n]
     Selected by [y]:
     - SND_SOC_ACPI_AMD_MATCH [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
