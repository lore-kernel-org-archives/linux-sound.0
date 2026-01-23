Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD8C2A1BA;
	Fri, 23 Jan 2026 23:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769211219; cv=none; b=OR0NyjH62HkiGNvchi74WFIvuJ5sxsvZPQd1laEiSji/umF6G8r9wP4cv/TwIMZznmElSLUuyXBNEsEeJ42F1eOwgKl5pbFt7xuLBz84VNqyM9rFQwKCWbzFq57lNtwUgOOgkPjU47BfpFxTuf3jAYGw5DI4DkWrDtJQ+HlinZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769211219; c=relaxed/simple;
	bh=reUZ85mIM0YeUkTXhTEEzwHSMG5GYiNxw3QVNickOW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cf9krlEW5/gRBXr2tKfFT4BGmQ5FJQHKS4ZkKzWGO2/9YilEhZTtA4b2qZsdavzrFTCi4oJpCqL3zV5aw+ZmT0Q4MgUAHNIrm+AhlKdUfoDhvIOToO0BXtpjDEepq7HsT0ozByQmZAUddHGXTIkN9D/XkpkT2mTHJEABkl7tDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NT30J9ZW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NT30J9ZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769211216; x=1800747216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=reUZ85mIM0YeUkTXhTEEzwHSMG5GYiNxw3QVNickOW4=;
  b=NT30J9ZW6/p1QkGPnyjqdoAZw5L5ouBiyglBGvPzdm20wMrxk7njelZC
   d8vmtRTeDNmsvck/VGkray8B6LJJ/4XI58vUIqJNpAje0QSz/gCdut1Ub
   T4JRhZ4Xzifm4pyf44HTDaMN4Ud2stCkhOHK9fbO+2NpzCQKoSi9rjdfI
   qo0KgRO9eBoC9FcY2VMheqD+GMFfH/Qn/kj/rs4Dkwu/Ffor0U1YNj3KI
   uGNhAR+f+2Xhyc5bsVTgbXv2nSzLwIpvXNsAU8rUQ3hyYtCeXd0irc5i9
   CgxbZV1uarJ4Nc7OIzlgxC01OADD0tsskYnbbNS9D7mvhUWGmlsKi+zxm
   Q==;
X-CSE-ConnectionGUID: UqS/rDJ6QfaE3F/73HzFxA==
X-CSE-MsgGUID: 9mge1XAvQvSH4IYbijx2CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="58038437"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="58038437"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 15:33:35 -0800
X-CSE-ConnectionGUID: +MtizwCRQ0+2zO2rv6dqGg==
X-CSE-MsgGUID: +UCBjV75Q6aI6uv4TNSCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207057724"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2026 15:33:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjQef-00000000Uae-2hil;
	Fri, 23 Jan 2026 23:33:29 +0000
Date: Sat, 24 Jan 2026 07:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v3 3/4] mfd: cs42l43: Add support for the B variant
Message-ID: <202601240733.dRK7iaPT-lkp@intel.com>
References: <20260123150945.100038-4-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123150945.100038-4-mstrozek@opensource.cirrus.com>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes broonie-sound/for-next lee-leds/for-leds-next linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Strozek/ASoC-sdw_utils-Add-CS42L43B-codec-info/20260123-233105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260123150945.100038-4-mstrozek%40opensource.cirrus.com
patch subject: [PATCH v3 3/4] mfd: cs42l43: Add support for the B variant
config: s390-randconfig-r072-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240733.dRK7iaPT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240733.dRK7iaPT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240733.dRK7iaPT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/cs42l43-i2c.c: In function 'cs42l43_i2c_probe':
>> drivers/mfd/cs42l43-i2c.c:50:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      50 |  cs42l43->variant_id = (int)device_get_match_data(cs42l43->dev);
         |                        ^


vim +50 drivers/mfd/cs42l43-i2c.c

    37	
    38	static int cs42l43_i2c_probe(struct i2c_client *i2c)
    39	{
    40		struct cs42l43 *cs42l43;
    41	
    42		cs42l43 = devm_kzalloc(&i2c->dev, sizeof(*cs42l43), GFP_KERNEL);
    43		if (!cs42l43)
    44			return -ENOMEM;
    45	
    46		cs42l43->dev = &i2c->dev;
    47		cs42l43->irq = i2c->irq;
    48		/* A device on an I2C is always attached by definition. */
    49		cs42l43->attached = true;
  > 50		cs42l43->variant_id = (int)device_get_match_data(cs42l43->dev);
    51	
    52		cs42l43->regmap = devm_regmap_init_i2c(i2c, &cs42l43_i2c_regmap);
    53		if (IS_ERR(cs42l43->regmap))
    54			return dev_err_probe(cs42l43->dev, PTR_ERR(cs42l43->regmap),
    55					     "Failed to allocate regmap\n");
    56	
    57		return cs42l43_dev_probe(cs42l43);
    58	}
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
