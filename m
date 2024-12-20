Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3831C4A34;
	Fri, 20 Dec 2024 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689834; cv=none; b=VOlvJGILJRpRL2yHsdYgKfQkoq3Whia8Xrh4AOSw0FCXoFTebhzJTlsWsCWz+9GOV9RpRVlumJyclUx/ERckRm6m7GU1PYWU9zg85W4Y/h6BrYZbqh34dGB/LN09XTQtezuU4dgihZIohkZttfzw+LffWz0R8lEky2ugN2DZv/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689834; c=relaxed/simple;
	bh=J4+DE+ytXna4c/lGuTqvaPFNwdWpZeeaGNTmlEpZr1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saMaHz6biycLyRHc5JQ9qaNSHweRQ7s4gwPL8weaJ8ISzNLiewEbxaUd6XXzsBeCfi+fBHS+Mv+mgazuPbfRtuGjbb1pJVIXvVcowLbHoq5Z+WPNjy8OgiBhbw5jVOwmbiy56WGJY33ohfkRDslADT1EBa8mYfEv6IJV6WbDlpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFQWcV3i; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFQWcV3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734689833; x=1766225833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J4+DE+ytXna4c/lGuTqvaPFNwdWpZeeaGNTmlEpZr1c=;
  b=CFQWcV3iBuE6aiJlL9foijxlztWHwB2hG1t8TRVOi6R+CrHKNUJdVIFQ
   GpyjFMIO5RWE+Dzb4ciLg9xBcd3DvK7NX9n+BVWQ0ePlGjX/6S6+LX4NI
   x7EBgWrULmqu81sHwnFmyIPXKMv6EoUGqA1t48VpDeDHlb3He46qwjQL9
   S1JbQX0LPVt7jtogZ5NVJzi4QskLf01kg+rl3tm/0rrqj6UZItr/qNlnm
   oazVGMGD02M1UrB+nuJqUoFkksRMw5TPrW/Udvrm01WLcsJiEutQ9YOJz
   weDjWs09hg8rrEm4uhD2KmSzBrjHk4zPf3e9sKJdaER9swCNLteQMkBsR
   A==;
X-CSE-ConnectionGUID: wc25caVQQdO8jM6D37ai+A==
X-CSE-MsgGUID: K4b0ekbqRbOSS7cTresfqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46244140"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="46244140"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 02:17:12 -0800
X-CSE-ConnectionGUID: qvtwB8niQJKNCwAW228hNQ==
X-CSE-MsgGUID: 3JhIfnHXRTS7jy2ZLzABnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="129294318"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Dec 2024 02:17:06 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOa48-00012x-1C;
	Fri, 20 Dec 2024 10:17:04 +0000
Date: Fri, 20 Dec 2024 18:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, ivprusov@salutedevices.com,
	neil.armstrong@linaro.org, jack.yu@realtek.com,
	rf@opensource.cirrus.com, zhoubinbin@loongson.cn,
	quic_pkumpatl@quicinc.com, herve.codina@bootlin.com,
	masahiroy@kernel.org, nuno.sa@analog.com, yesanishhere@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, yijiangtao@awinic.com
Subject: Re: [PATCH V2 2/2] ASoC: codecs: Add aw88083 amplifier driver
Message-ID: <202412201745.fBpf3Ui5-lkp@intel.com>
References: <20241219123047.33330-3-wangweidong.a@awinic.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219123047.33330-3-wangweidong.a@awinic.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on eabcdba3ad4098460a376538df2ae36500223c1e]

url:    https://github.com/intel-lab-lkp/linux/commits/wangweidong-a-awinic-com/ASoC-dt-bindings-Add-schema-for-awinic-aw88083/20241219-203933
base:   eabcdba3ad4098460a376538df2ae36500223c1e
patch link:    https://lore.kernel.org/r/20241219123047.33330-3-wangweidong.a%40awinic.com
patch subject: [PATCH V2 2/2] ASoC: codecs: Add aw88083 amplifier driver
config: arc-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201745.fBpf3Ui5-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201745.fBpf3Ui5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201745.fBpf3Ui5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from sound/soc/codecs/aw88081.c:11:
   sound/soc/codecs/aw88081.c: In function 'aw8808x_reg_value_check':
>> sound/soc/codecs/aw88081.c:407:25: error: passing argument 1 of '_dev_err' from incompatible pointer type [-Werror=incompatible-pointer-types]
     407 |                 dev_err(aw_dev, "unsupported this device\n");
         |                         ^~~~~~
         |                         |
         |                         struct aw_device *
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/codecs/aw88081.c:407:17: note: in expansion of macro 'dev_err'
     407 |                 dev_err(aw_dev, "unsupported this device\n");
         |                 ^~~~~~~
   include/linux/dev_printk.h:50:36: note: expected 'const struct device *' but argument is of type 'struct aw_device *'
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |               ~~~~~~~~~~~~~~~~~~~~~^~~
   sound/soc/codecs/aw88081.c: In function 'aw88081_dev_reg_update':
>> sound/soc/codecs/aw88081.c:442:66: error: passing argument 3 of 'aw8808x_reg_value_check' from incompatible pointer type [-Werror=incompatible-pointer-types]
     442 |                 ret = aw8808x_reg_value_check(aw88081, reg_addr, &reg_val);
         |                                                                  ^~~~~~~~
         |                                                                  |
         |                                                                  u16 * {aka short unsigned int *}
   sound/soc/codecs/aw88081.c:394:78: note: expected 'unsigned int *' but argument is of type 'u16 *' {aka 'short unsigned int *'}
     394 |                                         unsigned int reg_addr, unsigned int *reg_val)
         |                                                                ~~~~~~~~~~~~~~^~~~~~~
   cc1: some warnings being treated as errors


vim +/_dev_err +407 sound/soc/codecs/aw88081.c

   392	
   393	static int aw8808x_reg_value_check(struct aw88081 *aw88081,
   394						unsigned int reg_addr, unsigned int *reg_val)
   395	{
   396		struct aw_device *aw_dev = aw88081->aw_pa;
   397		int ret;
   398	
   399		switch (aw88081->devtype) {
   400		case AW88081:
   401			ret = aw88081_dev_reg_value_check(aw_dev, reg_addr, reg_val);
   402			break;
   403		case AW88083:
   404			ret = aw88083_dev_reg_value_check(aw_dev, reg_addr, reg_val);
   405			break;
   406		default:
 > 407			dev_err(aw_dev, "unsupported this device\n");
   408			ret = -EINVAL;
   409			break;
   410		}
   411	
   412		return ret;
   413	}
   414	
   415	static int aw88081_dev_reg_update(struct aw88081 *aw88081,
   416						unsigned char *data, unsigned int len)
   417	{
   418		struct aw_device *aw_dev = aw88081->aw_pa;
   419		struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
   420		int data_len, i, ret;
   421		int16_t *reg_data;
   422		u16 reg_val;
   423		u8 reg_addr;
   424	
   425		if (!len || !data) {
   426			dev_err(aw_dev->dev, "reg data is null or len is 0");
   427			return -EINVAL;
   428		}
   429	
   430		reg_data = (int16_t *)data;
   431		data_len = len >> 1;
   432	
   433		if (data_len & 0x1) {
   434			dev_err(aw_dev->dev, "data len:%d unsupported",	data_len);
   435			return -EINVAL;
   436		}
   437	
   438		for (i = 0; i < data_len; i += 2) {
   439			reg_addr = reg_data[i];
   440			reg_val = reg_data[i + 1];
   441	
 > 442			ret = aw8808x_reg_value_check(aw88081, reg_addr, &reg_val);
   443			if (ret)
   444				return ret;
   445	
   446			ret = regmap_write(aw_dev->regmap, reg_addr, reg_val);
   447			if (ret)
   448				return ret;
   449		}
   450	
   451		if (aw_dev->prof_cur != aw_dev->prof_index)
   452			vol_desc->ctl_volume = 0;
   453	
   454		/* keep min volume */
   455		aw88081_dev_set_volume(aw_dev, vol_desc->mute_volume);
   456	
   457		return 0;
   458	}
   459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
