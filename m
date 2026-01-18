Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012EF30BF77;
	Sun, 18 Jan 2026 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732241; cv=none; b=kv0fRodFmmGod/PkBV7aT48v5yyeKEugp5Gm+u2wgByXQjQxF3vr5bZQo2SEC61rtT+nB0ks1/IZ+48SEjjKM1z3v82sIQdGxSo2Ra6XKxgHz331y5mOji7YUmSjiikavX2N7FlCHCqkjHLK6XDxAf5XP6XmZ4HDblWsyHL1gsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732241; c=relaxed/simple;
	bh=lE0Idn8pkia/IapT6Q2BfKM2ThtZ58Etwt09O7KpUGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1brDNDh5R6olSzhc3hpIgjlkUn7XYvwvceoghJnNwQQKp89rGBPC/JkAASZMtQbG3gnl8uLMIM9bftRnlN9ZXh04YyD4WF98xtLW3+FQ+9AtDYZ6cw8Yta9vccXq3Og9r1MTbQs3O3Q9AuLDjqBZitDUiW6qGzhOQrz0S5Bn7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYScTlqC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYScTlqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768732239; x=1800268239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lE0Idn8pkia/IapT6Q2BfKM2ThtZ58Etwt09O7KpUGQ=;
  b=cYScTlqCccN2f3vEh7LnZK0SN5lqqdpS2OMnH+irNNnATbvLcCfiebU+
   +3JWckx38Yxr2oRGD7+0wHRkYqa5MQVrPyqQgQtZqWLqIKtmdvsgP+XVW
   dxm+OmYIgQ8ZnlRkf0cDVc3UGK42bZN2Ir/dBba3xfY0WKCvCAr6DPj8A
   +sHmmcBdLDNdIrllEwtx4JmTkhbDGVP7auNewYgaxiktUXFu6A49O0Dx5
   NK3Of5EVIVTAdrjSPEcKHRtmkLNWVjW8Q5QsoJ8on4HnmDc+3b7J+RuEV
   D6jXnFrQPmCFPBtHHZ0BScV6QHrrBeu3fieETFbzuvEPPr9S0K16P2vdK
   g==;
X-CSE-ConnectionGUID: JVm6iItITdiZhLTeSyBcBQ==
X-CSE-MsgGUID: vI4w8ye7QxmHUeRF8xaZIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73604340"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="73604340"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 02:30:38 -0800
X-CSE-ConnectionGUID: BalDwksESQiH5w6LbxBSSg==
X-CSE-MsgGUID: njV5JZY2SqK9zLzqw9duhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205412261"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jan 2026 02:30:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhQ3D-00000000Msq-0IKI;
	Sun, 18 Jan 2026 10:30:31 +0000
Date: Sun, 18 Jan 2026 18:29:36 +0800
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
Subject: Re: [PATCH v2 2/7] ASoC: sophgo: add CV1800B I2S/TDM controller
 driver
Message-ID: <202601181833.qtNEcTd8-lkp@intel.com>
References: <20260118-cv1800b-i2s-driver-v2-2-d10055f68368@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-2-d10055f68368@gmail.com>

Hi Anton,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7a52965b6976c936f413eebeee3f78c6faf09012]

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-D-Stavinskii/dt-bindings-sound-sophgo-add-CV1800B-I2S-TDM-controller-binding/20260118-042514
base:   7a52965b6976c936f413eebeee3f78c6faf09012
patch link:    https://lore.kernel.org/r/20260118-cv1800b-i2s-driver-v2-2-d10055f68368%40gmail.com
patch subject: [PATCH v2 2/7] ASoC: sophgo: add CV1800B I2S/TDM controller driver
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260118/202601181833.qtNEcTd8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181833.qtNEcTd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181833.qtNEcTd8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [sound/soc/sophgo/cv1800b-tdm.ko] undefined!
ERROR: modpost: "__udivdi3" [sound/soc/sophgo/cv1800b-tdm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
