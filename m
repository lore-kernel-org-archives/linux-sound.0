Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435075;
	b=ituAjNLD2CzDPan02A6z9erK/O74KRyTUJByQWnPFgZKVI7qIL/pVB0aC+ifKA9Us3EV
	 gSjwrTjoRi7+KxNqAZY/WiwpwLAhn2wP+NvzzAZ9oRGanKkm9lqMyJZVJmbusNcFifX4d
	 oV3Wk4KzOyXTe1kZ+prXNFXOp3lVJiEA8UuLHd5mTn4D4x0TU1l7l2UaTFf6VvLHjM17r
	 odrsxrr06c4DtyiBoaX3I5xYoCvWu6QFiKaRbYR241Dl85NwaGCY+jIQvM0JdaYpV3bu5
	 Mfi6L4uJ7i/d4DOdkN/B9Rja/ZsGFP7UH1RveQPjUsobOAFqt7QztmA2WTGmoBsDPwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435075;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=J9s4YB0te+iruy/wVNcGfymLgbtK2drxxWmB8bqBGSY=;
	b=Lm2y35caX+oi2y4hEf/aRXZKkOnuNvH+xwAO4bJMf2R9hF/h4rSSfwHE4TtOSJ+k/VC8
	 Bi387Jci/XCg0+0m0G6ity4gagT0o1nwZJidZvwrQ52U+jTZAf1JqvxYVvhpgek8FG+W/
	 HRVCOUAzAyUx+swqyJv4WxXvCvwLAGuH0wSscn/woZ0pVUP0xwQjBRPbuT134fs7v3VuQ
	 gfngGrDmIl/RRtH2EERxocfAPOw6pkSVNrB40vk4cQ6+KtIV6wgbZCvhuVjzNJog8CCDQ
	 JlGuIsRIwBl3lqcfZkzo6a4mTXdpIT6Bj+WH0kK6jUxJxZx8TXiD5hqYmobKZxpmk2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RuQFGF7c;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082E5606A31A;
	Mon, 23 Nov 2026 11:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082E5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RuQFGF7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795435076; x=1826971076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v11WKePUXYL3l5EclC+cgotk0pbHuje43KxeZURTgMw=;
  b=RuQFGF7cOei5kuBHfJOaWb/ZHjpTivZVLmLwm6jvjmGGnAOoAudKaZIh
   LUS4hyIT3rHo+tfkbxXHb+LdEz9VAsk5P3XOG3t1fQMqqCgYwleEN4ihX
   4Cb7tFNNRGuPNVD+Ho/6Y1JUW5O5MiqQjWpKM+ZxzTN6jScumECy4Pqky
   dU6NKd8h4MX9TtscAoOppre2++AGOORnEHCN7L0oYcNU5MOAULwP6E5nr
   8VBC2+BxHyylGUz5hhELeosS7wfX/6A9qXjm4JRqzsxm8i9ngcffGH47p
   x4R3uIXtKV/hi9PLkvUkMMXqevSnNqytwhZTWtHOs6FGZ9JAV8i31/TUa
   A==;
X-CSE-ConnectionGUID: lZfQZdLKT+ekQOGhgUMkvQ==
X-CSE-MsgGUID: MEl7Qb6uQEehuF0aBVpFFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4131062"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4131062"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:57:55 -0800
X-CSE-ConnectionGUID: VHzlQ88YSKO+iVzROnpoSg==
X-CSE-MsgGUID: 32n6Y0yoQd6GT8U4Sphzvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11180639"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Nov 2026 03:57:51 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVSg7-00000001N78-2MTw;
	Mon, 23 Nov 2026 11:57:47 +0000
Date: Mon, 23 Nov 2026 19:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/24] ASoC: qcom: audioreach: add live speaker
 temperature (T0) readback
Message-ID: <202611231947.lq10qE2P-lkp@intel.com>
References: <20261122161437.5994-19-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122161437.5994-19-srinivas.kandagatla@oss.qualcomm.com>

Hi Srinivas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20261120]
[cannot apply to broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus robh/for-next v7.4-rc3 v7.4-rc2 v7.4-rc1 linus/master v7.4-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-soc-pcm-add-multi_direction_codecs-link-flag/20261122-161415
base:   next-20261120
patch link:    https://lore.kernel.org/r/20261122161437.5994-19-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH v2 18/24] ASoC: qcom: audioreach: add live speaker temperature (T0) readback
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261123/202611231947.lq10qE2P-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/202611231947.lq10qE2P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611231947.lq10qE2P-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: sound/soc/qcom/qdsp6/snd-q6apm.ko: symbol '__divdi3' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
