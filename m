Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C40819CD0A;
	Sat, 24 Jan 2026 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769254260; cv=none; b=rEEPhykaFIl5lx5JcgPwuMo9LZ53VnQqqIAbMpOMhk9abp/TsC+RJ6fVBpuTYT55PXbe70Puj32X4i5UTSSKPyDJJZ1CtUH4uXmJU2A3Chdz++drOOm9mnS9cQS2tF4/g4uknLhslRsDxmYkZhmp8kFp0v27hhOMaoNah6S/AKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769254260; c=relaxed/simple;
	bh=MxftCT9lwj/syJ+vCAJXqSs8uPclBKOjVgTC9IvftSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ST53Aoq6Gg2AMHbIyCIch1gF2Xza21QbTAvwAxA5acKdzEszu6oCTcffoj6AbYd5GUXMFHL1HKGhXvyP2ioLyEdHaeE6mYiY8Lgj8rWp6e5R4givDJyc/y7cRA0vJi1cpBWD12Lxjp3XAMBndufolmHl5x8otfvg2x2/k/lcemI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnQ2ZU47; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnQ2ZU47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769254258; x=1800790258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MxftCT9lwj/syJ+vCAJXqSs8uPclBKOjVgTC9IvftSM=;
  b=FnQ2ZU47qBQgQFHV3MsCTDiQa/6ySKv3tJgZN8mBWd0dmz92ccHVSwhf
   4LOnxvTP5yihqdjN0sg8FGXcWzmSfmwV2ihayvgQLCzdyHnTMSy9OCYmz
   6H4TJWfTULAfy86FVA1cHN7qYN+xl5kr1B/XwswwlSlIPqKuqijfE7tMS
   IngIQz6frryrgexa7I9Ir3TItJ4yYGKQyb81QaXjMhN1UuKqd2A+NjRv4
   8fDdY22Fdmrheyl4tDXqPmRjpL7tk35JVpRAWjrHFYyGp0P1RxOykz56Y
   JwWrGNSuBLOPzS6NeEhpPkMFAvCOEaxbWtQ5+LODGAMr/L6+r+rotRYh5
   w==;
X-CSE-ConnectionGUID: oJxLfKVKRWyC9a7VW7SakQ==
X-CSE-MsgGUID: a9MHSjVrR3iI6VytZm7RTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74120350"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="74120350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 03:30:58 -0800
X-CSE-ConnectionGUID: 3m0h9fHoTlWoIUvOEUdr6g==
X-CSE-MsgGUID: rEXQuIxyQCybRxaipjDYzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="238503100"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jan 2026 03:30:55 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjbqu-000000000xh-2sPL;
	Sat, 24 Jan 2026 11:30:52 +0000
Date: Sat, 24 Jan 2026 12:30:32 +0100
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Shuming Fan <shumingf@realtek.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: codecs: rt1320-sdw: Refactor to reduce
 stack frames
Message-ID: <202601241204.I1I5GjxT-lkp@intel.com>
References: <20260123235050.2837942-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123235050.2837942-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20260123]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ASoC-codecs-rt1320-sdw-Refactor-to-reduce-stack-frames/20260124-075303
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260123235050.2837942-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] ASoC: codecs: rt1320-sdw: Refactor to reduce stack frames
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260124/202601241204.I1I5GjxT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241204.I1I5GjxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601241204.I1I5GjxT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_rae_load':
>> sound/soc/codecs/rt1320-sdw.c:1448:55: warning: field precision specifier '.*' expects argument of type 'int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
    1448 |                          "realtek/rt1320/rt1320_RAE_%.*s_%.*s_%.*s.dat",
         |                                                     ~~^~
         |                                                       |
         |                                                       int
    1449 |                          len_vendor, dmi_vendor, len_product, dmi_product, len_sku, dmi_sku);
         |                          ~~~~~~~~~~                    
         |                          |
         |                          size_t {aka long unsigned int}
   sound/soc/codecs/rt1320-sdw.c:1448:60: warning: field precision specifier '.*' expects argument of type 'int', but argument 6 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
    1448 |                          "realtek/rt1320/rt1320_RAE_%.*s_%.*s_%.*s.dat",
         |                                                          ~~^~
         |                                                            |
         |                                                            int
    1449 |                          len_vendor, dmi_vendor, len_product, dmi_product, len_sku, dmi_sku);
         |                                                  ~~~~~~~~~~~
         |                                                  |
         |                                                  size_t {aka long unsigned int}
   sound/soc/codecs/rt1320-sdw.c:1448:65: warning: field precision specifier '.*' expects argument of type 'int', but argument 8 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
    1448 |                          "realtek/rt1320/rt1320_RAE_%.*s_%.*s_%.*s.dat",
         |                                                               ~~^~
         |                                                                 |
         |                                                                 int
    1449 |                          len_vendor, dmi_vendor, len_product, dmi_product, len_sku, dmi_sku);
         |                                                                            ~~~~~~~
         |                                                                            |
         |                                                                            size_t {aka long unsigned int}
   sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_dspfw_load_code':
   sound/soc/codecs/rt1320-sdw.c:1614:51: warning: field precision specifier '.*' expects argument of type 'int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
    1614 |                          "realtek/rt1320/rt1320_%.*s_%.*s_%.*s.dat",
         |                                                 ~~^~
         |                                                   |
         |                                                   int
    1615 |                          len_vendor, dmi_vendor, len_product, dmi_product, len_sku, dmi_sku);
         |                          ~~~~~~~~~~                
         |                          |
         |                          size_t {aka long unsigned int}
   sound/soc/codecs/rt1320-sdw.c:1614:56: warning: field precision specifier '.*' expects argument of type 'int', but argument 6 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
    1614 |                          "realtek/rt1320/rt1320_%.*s_%.*s_%.*s.dat",
         |                                                      ~~^~
         |                                                        |
         |                                                        int
    1615 |                          len_vendor, dmi_vendor, len_product, dmi_product, len_sku, dmi_sku);
         |                                                  ~~~~~~~~~~~
         |                                                  |
         |                                                  size_t {aka long unsigned int}
   sound/soc/codecs/rt1320-sdw.c:1614:61: warning: field precision specifier '.*' expects argument of type 'int', but argument 8 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
    1614 |                          "realtek/rt1320/rt1320_%.*s_%.*s_%.*s.dat",
         |                                                           ~~^~
         |                                                             |
         |                                                             int
    1615 |                          len_vendor, dmi_vendor, len_product, dmi_product, len_sku, dmi_sku);
         |                                                                            ~~~~~~~
         |                                                                            |
         |                                                                            size_t {aka long unsigned int}


vim +1448 sound/soc/codecs/rt1320-sdw.c

  1419	
  1420	static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
  1421	{
  1422		struct device *dev = &rt1320->sdw_slave->dev;
  1423		static const char func_tag[] = "FUNC";
  1424		static const char xu_tag[] = "XU";
  1425		const struct firmware *rae_fw = NULL;
  1426		unsigned int fw_offset;
  1427		unsigned char *fw_data;
  1428		unsigned char *param_data;
  1429		unsigned int addr, size;
  1430		unsigned int func, value;
  1431		const char *dmi_vendor, *dmi_product, *dmi_sku;
  1432		size_t len_vendor, len_product, len_sku;
  1433		char rae_filename[512];
  1434		char tag[5];
  1435		int ret = 0;
  1436		int retry = 200;
  1437	
  1438		dmi_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
  1439		dmi_product = dmi_get_system_info(DMI_PRODUCT_NAME);
  1440		dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
  1441	
  1442		if (dmi_vendor && dmi_product && dmi_sku) {
  1443			len_vendor = strchrnul(dmi_vendor, ' ') - dmi_vendor;
  1444			len_product = strchrnul(dmi_product, ' ') - dmi_product;
  1445			len_sku = strchrnul(dmi_sku, ' ') - dmi_sku;
  1446	
  1447			snprintf(rae_filename, sizeof(rae_filename),
> 1448				 "realtek/rt1320/rt1320_RAE_%.*s_%.*s_%.*s.dat",
  1449				 len_vendor, dmi_vendor, len_product, dmi_product, len_sku, dmi_sku);
  1450			dev_dbg(dev, "%s: try to load RAE file %s\n", __func__, rae_filename);
  1451		} else {
  1452			dev_warn(dev, "%s: Can't find proper RAE file name\n", __func__);
  1453			return -EINVAL;
  1454		}
  1455	
  1456		regmap_write(rt1320->regmap,
  1457				SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
  1458					RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
  1459		rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
  1460	
  1461		request_firmware(&rae_fw, rae_filename, dev);
  1462		if (rae_fw) {
  1463	
  1464			/* RAE CRC clear */
  1465			regmap_write(rt1320->regmap, 0xe80b, 0x0f);
  1466	
  1467			/* RAE stop & CRC disable */
  1468			regmap_update_bits(rt1320->regmap, 0xe803, 0xbc, 0x00);
  1469	
  1470			while (--retry) {
  1471				regmap_read(rt1320->regmap, 0xe83f, &value);
  1472				if (value & 0x40)
  1473					break;
  1474				usleep_range(1000, 1100);
  1475			}
  1476			if (!retry && !(value & 0x40)) {
  1477				dev_err(dev, "%s: RAE is not ready to load\n", __func__);
  1478				return -ETIMEDOUT;
  1479			}
  1480	
  1481			dev_dbg(dev, "%s, rae_fw size=0x%zx\n", __func__, rae_fw->size);
  1482			regcache_cache_bypass(rt1320->regmap, true);
  1483			for (fw_offset = 0; fw_offset < rae_fw->size;) {
  1484	
  1485				dev_dbg(dev, "%s, fw_offset=0x%x\n", __func__, fw_offset);
  1486	
  1487				fw_data = (unsigned char *)&rae_fw->data[fw_offset];
  1488	
  1489				memcpy(tag, fw_data, 4);
  1490				tag[4] = '\0';
  1491				dev_dbg(dev, "%s, tag=%s\n", __func__, tag);
  1492				if (strcmp(tag, xu_tag) == 0) {
  1493					dev_dbg(dev, "%s: This is a XU tag", __func__);
  1494					memcpy(&addr, (fw_data + 4), 4);
  1495					memcpy(&size, (fw_data + 8), 4);
  1496					param_data = (unsigned char *)(fw_data + 12);
  1497	
  1498					dev_dbg(dev, "%s: addr=0x%x, size=0x%x\n", __func__, addr, size);
  1499	
  1500					/*
  1501					 * UI register ranges from 0x1000d000 to 0x1000d7ff
  1502					 * UI registers should be accessed by tuning tool.
  1503					 * So, there registers should be cached.
  1504					 */
  1505					if (addr <= 0x1000d7ff && addr >= 0x1000d000)
  1506						regcache_cache_bypass(rt1320->regmap, false);
  1507	
  1508					rt1320_data_rw(rt1320, addr, param_data, size, RT1320_PARAM_WRITE);
  1509	
  1510					regcache_cache_bypass(rt1320->regmap, true);
  1511	
  1512					fw_offset += (size + 12);
  1513				} else if (strcmp(tag, func_tag) == 0) {
  1514					dev_err(dev, "%s: This is a FUNC tag", __func__);
  1515	
  1516					memcpy(&func, (fw_data + 4), 4);
  1517					memcpy(&value, (fw_data + 8), 4);
  1518	
  1519					dev_dbg(dev, "%s: func=0x%x, value=0x%x\n", __func__, func, value);
  1520					if (func == 1)  //DelayMs
  1521						msleep(value);
  1522	
  1523					fw_offset += 12;
  1524				} else {
  1525					dev_err(dev, "%s: This is NOT a XU file (wrong tag)", __func__);
  1526					break;
  1527				}
  1528			}
  1529	
  1530			regcache_cache_bypass(rt1320->regmap, false);
  1531			release_firmware(rae_fw);
  1532	
  1533		} else {
  1534			dev_err(dev, "%s: Failed to load %s firmware\n", __func__, rae_filename);
  1535			ret = -EINVAL;
  1536			goto _exit_;
  1537		}
  1538	
  1539		/* RAE CRC enable */
  1540		regmap_update_bits(rt1320->regmap, 0xe803, 0x0c, 0x0c);
  1541	
  1542		/* RAE update */
  1543		regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x00);
  1544		regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x80);
  1545	
  1546		/* RAE run */
  1547		regmap_update_bits(rt1320->regmap, 0xe803, 0x80, 0x80);
  1548	
  1549		regmap_read(rt1320->regmap, 0xe80b, &value);
  1550		dev_dbg(dev, "%s: CAE run => 0xe80b reg = 0x%x\n", __func__, value);
  1551	
  1552		rt1320->rae_update_done = true;
  1553	
  1554	_exit_:
  1555		regmap_write(rt1320->regmap,
  1556				SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
  1557					RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
  1558		rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
  1559	
  1560		return ret;
  1561	}
  1562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
