Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF4E19F13F;
	Tue,  2 Dec 2025 00:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764636291; cv=none; b=CfZyO5nEKd3drKK1yXSjRCIUmi2zm7MH2xVrHSVg0hp+wnbr4CbQosRFxJaVeQNuZA/FcewwtiPvEMfrEexupLAQmq95EB1yDbaSi6hVq7Bo53P6qeKGajtZT4a6QvT2NLLTevj0qB9tCl4/SHJUI+bKiYFHpeedziWLCNYdY5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764636291; c=relaxed/simple;
	bh=ahYHoAHLy/S529n0IMKuiDKbU4uic7IDh42n+XLJVbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHv25Gd+Lu01vXi5v9aeIoy14ACOhObA4TOynjrso3Wo8IjIG6OsWkrJgQbqAyDqEkScAXRqtjz1FVqukkxuZpKSGeEPHdLbCN4UJ6A88OAhYTcEGYP0l+JD2iFgOHG/CWokESfFCf1p9TniQk5kS1k5MsUyBbVOY0USgpeOjlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFZqFZ/j; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFZqFZ/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764636290; x=1796172290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ahYHoAHLy/S529n0IMKuiDKbU4uic7IDh42n+XLJVbk=;
  b=UFZqFZ/jZRD41lIDUfSxK3t/hU7vzqJ/a45AF9Z+cRc84IHu1ujHU4m7
   WGKIN3htEZgnYmUdA3VOT/aRWz3ID28n7ZLBQ7nXpSPDM173cW/FJyHG1
   vd9kgiZpZ+ilSwyyO5uncdrBB8ZZbZ6sQT8/MCYLqnglkNHC+nquhLrXs
   lO7h6K5Dr4XFYy6vDscFwhrmUwLXua2xxh1JS/jv5YV68h1yb5w7z7U9b
   Glq1YHA68C+NfMcsLHXvl4BqOl5OBN9kgCM+wWx5dnNIecS5UW7Q7a4Ha
   enXaoj6NIQ4hqC344niM4fEaXTEReQYi7rVvXyToadn4/cP+5uTeqElz5
   w==;
X-CSE-ConnectionGUID: O9YJbj30R3+XRdTcT4NktQ==
X-CSE-MsgGUID: eJ0DoiUsRJiWclelWgFRxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76912580"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="76912580"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 16:44:49 -0800
X-CSE-ConnectionGUID: zZIUSAGtTW2e7IOt8s8cdg==
X-CSE-MsgGUID: mVThrixTRBqXdkx7IN+Xrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193498844"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Dec 2025 16:44:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQEVX-000000009GT-1zK7;
	Tue, 02 Dec 2025 00:44:43 +0000
Date: Tue, 2 Dec 2025 08:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: Re: [PATCH v3 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Message-ID: <202512020810.KrwjSbJ9-lkp@intel.com>
References: <20251201105700.832715-4-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201105700.832715-4-joakim.zhang@cixtech.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.18 next-20251201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/joakim-zhang-cixtech-com/ALSA-hda-dt-bindings-add-CIX-IPBLOQ-HDA-controller-support/20251201-185859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20251201105700.832715-4-joakim.zhang%40cixtech.com
patch subject: [PATCH v3 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512020810.KrwjSbJ9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020810.KrwjSbJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020810.KrwjSbJ9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/hda/controllers/cix-ipbloq.c: In function 'cix_ipbloq_hda_create':
>> sound/hda/controllers/cix-ipbloq.c:23:57: warning: conversion from 'long long unsigned int' to 'dma_addr_t' {aka 'unsigned int'} changes value from '18446744071293632512' to '1879048192' [-Woverflow]
      23 | #define CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET        (-0x90000000ULL)
         |                                                         ^
   sound/hda/controllers/cix-ipbloq.c:224:38: note: in expansion of macro 'CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET'
     224 |         chip->bus.core.addr_offset = CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET;
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +23 sound/hda/controllers/cix-ipbloq.c

    22	
  > 23	#define CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET	(-0x90000000ULL)
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
