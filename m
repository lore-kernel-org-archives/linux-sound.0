Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303501898E6;
	Tue,  3 Sep 2024 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725379040; cv=none; b=j8yHzcDcpU7AuduWCqdQP3LZenCH78uEk+aydi5wASYy/m0v4T1TmzGt2uQW01fDONdW7xA0ybQXmitxfZWcn6KIxn/YepHn1cdeyfGI2DZAziCWcqZ79kw0vYuFiua07diFIp68lVBWVKA+g/mOaqjgursBzEx1nO4bNh+Z3oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725379040; c=relaxed/simple;
	bh=dqTzY8p3sHUzU8UjqwSvZd4CiJ8xkwss1UPetyRjYQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRnvgczk+nVPQSvLBJmlUTYRO2k4vuPDN2mB180RPpq9KtNe5hwP/q1WLbEQ0WCMB8d8mPwii3dVeMqcD/x+aQAbCLnOgmMZXhnXZ0/zV8yuXYNYh1Wtdc6ZtN7aKU5rE8yHkkGz+gN2dUQjxvJpDn/CSmby2U9RNjLuT8lUlg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lo6QQz0I; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lo6QQz0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725379039; x=1756915039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dqTzY8p3sHUzU8UjqwSvZd4CiJ8xkwss1UPetyRjYQo=;
  b=lo6QQz0IYIBdmgL1ecYnPlsqMVrrPEHh67eq6sgvbWQsmij0Ok5QQ2d7
   oHWwVEqoSwAmBRcxcB6TWtM0A/UWQ9jsjmAy37Bf5BwlaDR20aidjsTaE
   Oe+BM1k4C5Y7SW93Iv/NYXh5lF4ByvzNkZq8kTDvNY0hb3nLhRNHDPmDj
   I3TzBzGm2/H72IRpCIK1tD/rliJ/ORZfb3sTko0/UsKttp7FYKEaz0NZl
   tFiwUxzF3pkNqS/Qu6Z0RHCGgjBo6nM4H4HZL4Ue50VqlZ1AzZC0dc8gG
   NOyfMNJ/3WL2pBJHR07YhhfcX65UxYtlg9zi7dZWBuqY/Dc75ZHERhgfb
   w==;
X-CSE-ConnectionGUID: +mf2H8pQQpCysJrzxWe2zQ==
X-CSE-MsgGUID: XdxjBe6sQYG9eNGnOe7ztA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46514795"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="46514795"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:57:19 -0700
X-CSE-ConnectionGUID: zX3m1XBpSGaLYYwc8K/arQ==
X-CSE-MsgGUID: 8WfA5OuMR2aagxB/eZ7EgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="64949427"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Sep 2024 08:57:16 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slVu5-0006rW-1T;
	Tue, 03 Sep 2024 15:57:13 +0000
Date: Tue, 3 Sep 2024 23:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	application@irondevice.com, Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <202409032357.hPIdG9kb-lkp@intel.com>
References: <20240903054435.2659-2-kiseok.jo@irondevice.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903054435.2659-2-kiseok.jo@irondevice.com>

Hi Kiseok,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next linus/master v6.11-rc6 next-20240903]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiseok-Jo/ASoC-sma1307-Add-driver-for-Iron-Device-SMA1307/20240903-134558
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240903054435.2659-2-kiseok.jo%40irondevice.com
patch subject: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240903/202409032357.hPIdG9kb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032357.hPIdG9kb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032357.hPIdG9kb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/sma1307.c: In function 'sma1307_setting_loaded':
>> sound/soc/codecs/sma1307.c:1772:44: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1772 |         int *data, size, offset, num_mode, ret;
         |                                            ^~~


vim +/ret +1772 sound/soc/codecs/sma1307.c

  1768	
  1769	static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *file)
  1770	{
  1771		const struct firmware *fw;
> 1772		int *data, size, offset, num_mode, ret;
  1773	
  1774		ret = request_firmware(&fw, file, sma1307->dev);
  1775	
  1776		if (!fw) {
  1777			dev_err(sma1307->dev, "%s: failed to read \"%s\"\n",
  1778				__func__, setting_file);
  1779			release_firmware(fw);
  1780			sma1307->set.status = false;
  1781			return;
  1782		} else if ((fw->size) < SMA1307_SETTING_HEADER_SIZE) {
  1783			dev_err(sma1307->dev, "%s: Invalid file\n", __func__);
  1784			release_firmware(fw);
  1785			sma1307->set.status = false;
  1786			return;
  1787		}
  1788	
  1789		data = kzalloc(fw->size, GFP_KERNEL);
  1790		size = fw->size >> 2;
  1791		memcpy(data, fw->data, fw->size);
  1792	
  1793		release_firmware(fw);
  1794	
  1795		/* HEADER */
  1796		sma1307->set.header_size = SMA1307_SETTING_HEADER_SIZE;
  1797		sma1307->set.checksum = data[sma1307->set.header_size - 2];
  1798		sma1307->set.num_mode = data[sma1307->set.header_size - 1];
  1799		num_mode = sma1307->set.num_mode;
  1800		sma1307->set.header = devm_kzalloc(sma1307->dev,
  1801						   sma1307->set.header_size,
  1802						   GFP_KERNEL);
  1803		memcpy(sma1307->set.header, data,
  1804		       sma1307->set.header_size * sizeof(int));
  1805	
  1806		if ((sma1307->set.checksum >> 8) != SMA1307_SETTING_CHECKSUM) {
  1807			dev_err(sma1307->dev, "%s: failed by dismatch \"%s\"\n",
  1808				__func__, setting_file);
  1809			sma1307->set.status = false;
  1810			return;
  1811		}
  1812	
  1813		/* DEFAULT */
  1814		sma1307->set.def_size = SMA1307_SETTING_DEFAULT_SIZE;
  1815		sma1307->set.def
  1816		    = devm_kzalloc(sma1307->dev,
  1817				   sma1307->set.def_size * sizeof(int), GFP_KERNEL);
  1818		memcpy(sma1307->set.def,
  1819		       &data[sma1307->set.header_size],
  1820		       sma1307->set.def_size * sizeof(int));
  1821	
  1822		/* MODE */
  1823		offset = sma1307->set.header_size + sma1307->set.def_size;
  1824		sma1307->set.mode_size = DIV_ROUND_CLOSEST(size - offset, num_mode + 1);
  1825		for (int i = 0; i < num_mode; i++) {
  1826			sma1307->set.mode_set[i]
  1827			    = devm_kzalloc(sma1307->dev,
  1828					   sma1307->set.mode_size * 2 * sizeof(int),
  1829					   GFP_KERNEL);
  1830			for (int j = 0; j < sma1307->set.mode_size; j++) {
  1831				sma1307->set.mode_set[i][2 * j]
  1832				    = data[offset + ((num_mode + 1) * j)];
  1833				sma1307->set.mode_set[i][2 * j + 1]
  1834				    = data[offset + ((num_mode + 1) * j + i + 1)];
  1835			}
  1836		}
  1837	
  1838		kfree(data);
  1839		sma1307->set.status = true;
  1840	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
