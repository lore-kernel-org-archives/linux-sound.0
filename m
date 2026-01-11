Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CD433D4EA;
	Sun, 11 Jan 2026 14:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768140885; cv=none; b=EB0UPlH/qcSMjwxw3MrvttSJQt/F/TXU8MWcMqfMa9uHiWtkqFh5N0lYc9E8wbvCyCaTnRd0OxvwxHcUckZjHXr1u48ybIilC1Q9unj9ixFm6KGKY1d2f8UKhh+jO1WLYIAb4FezmUoqQxhAhvTLHqyYibmsdfeanfFTX9K5SOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768140885; c=relaxed/simple;
	bh=IdKSb7U5L9VjNm0AfwaIov8/g6vk6LX/eFr07xEJsaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQyspRoSdFJK6/WlgwgGyAji6QQsFXV97Jc1oC4aHKZsROQV+DiT3fY49De7g0z44nFp4fHI5ljM8Jvu+wHFyCNDIF5DF5FVUwawJec83NQkcfTH34++YjRmjNaRLeWblD/rKGyFsnUjvFkMOncPhFqTXQpSEQ9HfJK8SBOWBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYD97ZWt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYD97ZWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768140883; x=1799676883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IdKSb7U5L9VjNm0AfwaIov8/g6vk6LX/eFr07xEJsaE=;
  b=ZYD97ZWtx8Vf682UoeoMYnIdq0oSZA7TfSFDrtfBI6Z8VEvPykYcnwIN
   53oKKxsWoIwBphuWOLAKG/0RC4kZyGjZ5w2tRcf6SKmS8B62HGkDUfmGy
   0hh3gZDKng2yUwQhWhvMnq8NPpC4cqHL7f43sgF5H6PLFYXx4T6daIdhx
   JGiq6tweZ7butsLkXBBBA8NgHTzab714mIshDd+2wwsHvRvxti5uFLHnJ
   M4SWckT3sDLmwIT2o6T5E4aN6QJtOuiB5uaKiBHgm3cr1zmjMoCdXPM5i
   2Ba0PlIrw9Mb1ihB6E0CG7iH9+EaFefFwB/uyO/YHJXKZSywj9gCd5j9A
   Q==;
X-CSE-ConnectionGUID: uKZlWSkWRQeo0KoO1DYRoA==
X-CSE-MsgGUID: 9xFSO8oWQpCA7H9TbZx9pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80159928"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="80159928"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 06:14:43 -0800
X-CSE-ConnectionGUID: BYZbI5xASIuO0cGEUgXivQ==
X-CSE-MsgGUID: 9WKx7FSzQ0W9YY5oDD2CKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="208410595"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2026 06:14:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vewDG-00000000A92-2y82;
	Sun, 11 Jan 2026 14:14:38 +0000
Date: Sun, 11 Jan 2026 22:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: fenugrec via B4 Relay <devnull+fenugrec.mail.com@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, roy.vegard.ovesen@gmail.com,
	fenugrec <fenugrec@mail.com>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: clean up presonus s1810 consts
Message-ID: <202601112158.zMc5ZyZt-lkp@intel.com>
References: <20260110-preso_clean1-v1-2-ce2dd3ea4506@mail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110-preso_clean1-v1-2-ce2dd3ea4506@mail.com>

Hi fenugrec,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7d0a66e4bb9081d75c82ec4957c50034cb0ea449]

url:    https://github.com/intel-lab-lkp/linux/commits/fenugrec-via-B4-Relay/ALSA-usb-audio-presonus-s18xx-uses-little-endian/20260111-080634
base:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
patch link:    https://lore.kernel.org/r/20260110-preso_clean1-v1-2-ce2dd3ea4506%40mail.com
patch subject: [PATCH 2/2] ALSA: usb-audio: clean up presonus s1810 consts
config: i386-randconfig-r134-20260111 (https://download.01.org/0day-ci/archive/20260111/202601112158.zMc5ZyZt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601112158.zMc5ZyZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112158.zMc5ZyZt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/usb/mixer_s1810c.c:182:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] tag @@     got int @@
   sound/usb/mixer_s1810c.c:182:17: sparse:     expected restricted __le32 [usertype] tag
   sound/usb/mixer_s1810c.c:182:17: sparse:     got int
>> sound/usb/mixer_s1810c.c:183:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] len @@     got int @@
   sound/usb/mixer_s1810c.c:183:17: sparse:     expected restricted __le32 [usertype] len
   sound/usb/mixer_s1810c.c:183:17: sparse:     got int

vim +182 sound/usb/mixer_s1810c.c

   174	
   175	static int
   176	snd_s1810c_send_ctl_packet(struct usb_device *dev, u32 sel,
   177				   u32 b, u32 c, u32 d, u32 e)
   178	{
   179		struct s1810c_ctl_packet pkt = { 0 };
   180		int ret = 0;
   181	
 > 182		pkt.tag = SC1810C_CMD_TAG;
 > 183		pkt.len = SC1810C_CMD_LEN;
   184	
   185		pkt.selector = __cpu_to_le32(sel);
   186		pkt.b = __cpu_to_le32(b);
   187		pkt.c = __cpu_to_le32(c);
   188		pkt.d = __cpu_to_le32(d);
   189		pkt.e = __cpu_to_le32(e);
   190	
   191		ret = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
   192				      SC1810C_CMD_REQ,
   193				      SC1810C_CMD_REQTYPE, 0, 0, &pkt, sizeof(pkt));
   194		if (ret < 0) {
   195			dev_warn(&dev->dev, "could not send ctl packet\n");
   196			return ret;
   197		}
   198		return 0;
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
