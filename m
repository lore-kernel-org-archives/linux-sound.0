Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE2021D3CA;
	Tue, 25 Nov 2025 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764050830; cv=none; b=fIei+ufVcd61FkWjMaXbYwq8HdeDjtJwQ0wLxFy8MiwTCPNP1tUBwFbg8XDDbwCyKW44LgFO+KHZk+BP47kiMmXy0QN7eoaVLldBvaJLmOSjNBT/w6aaAkUzo56aHbsxHCXZJ73rtHVWJ4w3iD6lGuy5XGiCKpgrIfQ2bGg4Odg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764050830; c=relaxed/simple;
	bh=qcv5N1awSwui9F9TYSGEUitF9AMrcphLglUWATqNIcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mujQU4FDD+3bSlUXl4Rt9q1OP3UTCGIHVtH1biBNxGhptA1yAkR7V9fsOR+okSZ5oXOLXqNHarZx0Zy0VCWPZGXIXii4BxuAnTCYVsKQzmyKvDKigNhNGtR6ApAoLU4w/l0h/PIDgdfGHZdbfyN148X2kCZ4js1bpmHf/1MKcjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/xm1GSs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/xm1GSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764050830; x=1795586830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qcv5N1awSwui9F9TYSGEUitF9AMrcphLglUWATqNIcI=;
  b=X/xm1GSs4kfozRjTVS+iLqWsOFOebKa/DoRo7QNzCypRN1dYsGHHwnF3
   Ag5eIRDCSkA7EBiBG3ReCiYbJhR+prZ5hsXU54OtFe3AfjLOmVpyTonfY
   1ShyjEF4Xkup+ZB9CymOSh8GV7pU2NtZ4gNh8xJwxbPvx6v7aXAqpUl5Z
   ftXHwCUattYw8jTyzgruqNNejV4W4UQe4a8nGuT5HUoUFvL4B8mwH5s74
   TsjXYZ0QUmeAmTJcnwwDwWxMiqL/VvLnk5i7JX6T52WEqfBg7qqr5jQZW
   nVTELJkGJ7QUvDcpZIG45GqhdkvMp0zXiVb5qBpNP3RhRtBzCT1Jd0M20
   g==;
X-CSE-ConnectionGUID: fqVSWJfQQ8K4hlltoCr/Eg==
X-CSE-MsgGUID: I/4DUan7SuOYLBRxhRjGcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66094085"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="66094085"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 22:07:09 -0800
X-CSE-ConnectionGUID: TpvA0i3cTFy8PZoyBvqO1Q==
X-CSE-MsgGUID: H/78aEs3SlerwTwOiwkbVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192355687"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Nov 2025 22:07:07 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNmCe-000000001Pl-08IE;
	Tue, 25 Nov 2025 06:07:04 +0000
Date: Tue, 25 Nov 2025 14:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] soundwire: stream: Prepare ports in parallel to reduce
 stream start latency
Message-ID: <202511251336.5gGRd3hJ-lkp@intel.com>
References: <20251124152956.2293218-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124152956.2293218-1-rf@opensource.cirrus.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc7 next-20251124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/soundwire-stream-Prepare-ports-in-parallel-to-reduce-stream-start-latency/20251124-233421
base:   linus/master
patch link:    https://lore.kernel.org/r/20251124152956.2293218-1-rf%40opensource.cirrus.com
patch subject: [PATCH] soundwire: stream: Prepare ports in parallel to reduce stream start latency
config: arm-randconfig-r052-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251336.5gGRd3hJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251336.5gGRd3hJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251336.5gGRd3hJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/stream.c:553:21: warning: variable 'dp0_prop' is uninitialized when used here [-Wuninitialized]
     553 |                 ch_prep_timeout = dp0_prop->ch_prep_timeout;
         |                                   ^~~~~~~~
   drivers/soundwire/stream.c:541:31: note: initialize the variable 'dp0_prop' to silence this warning
     541 |         struct sdw_dp0_prop *dp0_prop;
         |                                      ^
         |                                       = NULL
   1 warning generated.


vim +/dp0_prop +553 drivers/soundwire/stream.c

   534	
   535	static int sdw_wait_prep_slave_ports(struct sdw_bus *bus,
   536					     struct sdw_slave_runtime *s_rt,
   537					     struct sdw_port_runtime *p_rt)
   538	{
   539		struct completion *port_ready;
   540		struct sdw_dpn_prop *dpn_prop;
   541		struct sdw_dp0_prop *dp0_prop;
   542		struct sdw_prepare_ch prep_ch;
   543		bool simple_ch_prep_sm;
   544		u32 ch_prep_timeout;
   545		int ret, val;
   546	
   547		if (p_rt->num) {
   548			dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave, s_rt->direction, p_rt->num);
   549			simple_ch_prep_sm = dpn_prop->simple_ch_prep_sm;
   550			ch_prep_timeout = dpn_prop->ch_prep_timeout;
   551		} else {
   552			simple_ch_prep_sm = s_rt->slave->prop.dp0_prop->simple_ch_prep_sm;
 > 553			ch_prep_timeout = dp0_prop->ch_prep_timeout;
   554		}
   555	
   556		if (simple_ch_prep_sm)
   557			return 0;
   558	
   559		/*
   560		 * Check if already prepared. Avoid overhead of waiting for interrupt
   561		 * and port_ready completion if we don't need to.
   562		 */
   563		val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
   564		if (val < 0) {
   565			ret = val;
   566			goto err;
   567		}
   568	
   569		if (val & p_rt->ch_mask) {
   570			/* Wait for completion on port ready */
   571			port_ready = &s_rt->slave->port_ready[p_rt->num];
   572			wait_for_completion_timeout(port_ready, msecs_to_jiffies(ch_prep_timeout));
   573			val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
   574			if ((val < 0) || (val & p_rt->ch_mask)) {
   575				ret = (val < 0) ? val : -ETIMEDOUT;
   576				goto err;
   577			}
   578		}
   579	
   580		/* Inform slaves about ports prepared */
   581		prep_ch.num = p_rt->num;
   582		prep_ch.ch_mask = p_rt->ch_mask;
   583		prep_ch.prepare = true;
   584		prep_ch.bank = bus->params.next_bank;
   585		sdw_do_port_prep(s_rt, prep_ch, SDW_OPS_PORT_POST_PREP);
   586	
   587		return 0;
   588	
   589	err:
   590		dev_err(&s_rt->slave->dev, "Chn prep failed for port %d: %d\n", p_rt->num, ret);
   591	
   592		return ret;
   593	}
   594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
