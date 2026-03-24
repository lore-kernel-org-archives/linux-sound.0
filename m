Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE5B339863;
	Tue, 24 Mar 2026 01:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774316436; cv=none; b=u0bqJFvOFLuhMOPCerLfdWlhOVrB+zWrI9K1ePWgOn/aHNA5ftmgzfTdmw7q5pMZbI1WhAHAKVxgNSYRyzqDomGdJePhjtfxrlHEhmP3ti0crdEbEekaKRIQhA4pP3Q67aTjHThMPuciPRKNwiSEbqj+8IpThfO40Y+cqCbt8QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774316436; c=relaxed/simple;
	bh=48AIzwwxH5mMxQb9tFNUE7IGqpd3G+otAJODXR3lSSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGuKipfdgN3ncwLY28JG2NYaltEvWzKY1578EYnA0727Hm6iVaSyHcqGYQeoOC2c7jCyUQVjZBP2xxASLeEOXF+bzjjzPwdlYhZFEcAjSH5PLbzREKZ2UzgUkqv/P4MECSYK2UP/d6o9DIlWekZbaAt4M++W8St0urcQeBCM2Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjddbKhK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjddbKhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774316435; x=1805852435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=48AIzwwxH5mMxQb9tFNUE7IGqpd3G+otAJODXR3lSSs=;
  b=HjddbKhKYXXtcVd0C2rvK0rxTViyDFw85AnAkkAiWKPoRBQJ7QVufm/G
   CwTwE+fs7hVQDR8nZwBsvAaepwCxmf8DcJVsGrgVLhKMlZ+0riK2tgEsn
   2vDMXHIOuTU6SEBnL2nOjQOH9Y5cxP0o6qBrGJPseZXgxQcyo9SQqNI3v
   +ctO5UsSxdASiWPbxlt250rMILy8tFvfC5RaXWo5NedQ/W/ZAZdrK6Lsa
   QQorxE9EulapbIPvMtcOjcEaUiQhdqwz3Yz6QtQiUmQlJBQ/c0fTxT9dD
   kwwmAH0rVUESxEwubZBWN1xXRuOdoS7TQceCJD9pIdTp6O1ZcIlihc5kN
   A==;
X-CSE-ConnectionGUID: 2G6hj0quSDOV6HplxqkNfw==
X-CSE-MsgGUID: hLGvfHmdTC2SYNnM3D99Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74510937"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74510937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:40:34 -0700
X-CSE-ConnectionGUID: GEuNEo5PS7SPhr6QqN+LyA==
X-CSE-MsgGUID: z/JLghFdTUq+YV3GX/G8cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228690706"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Mar 2026 18:40:32 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4qkv-000000003W5-1kUP;
	Tue, 24 Mar 2026 01:40:29 +0000
Date: Tue, 24 Mar 2026 09:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: songxiebing <songxiebing@kylinos.cn>, tiwai@suse.com
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, songxiebing@kylinos.cn,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: core/seq: Optimize the return logic in
 cc_ev_to_ump_midi2
Message-ID: <202603240928.I9EN2k7j-lkp@intel.com>
References: <20260323024742.220707-1-songxiebing@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323024742.220707-1-songxiebing@kylinos.cn>

Hi songxiebing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v7.0-rc5 next-20260323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/songxiebing/ALSA-core-seq-Optimize-the-return-logic-in-cc_ev_to_ump_midi2/20260324-013342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20260323024742.220707-1-songxiebing%40kylinos.cn
patch subject: [PATCH] ALSA: core/seq: Optimize the return logic in cc_ev_to_ump_midi2
config: arc-randconfig-002-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240928.I9EN2k7j-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240928.I9EN2k7j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240928.I9EN2k7j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/seq/seq_ump_convert.c: In function 'cc_ev_to_ump_midi2':
>> sound/core/seq/seq_ump_convert.c:880:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
      ret = 0; // skip
      ~~~~^~~
   sound/core/seq/seq_ump_convert.c:881:2: note: here
     case UMP_CC_BANK_SELECT_LSB:
     ^~~~
   sound/core/seq/seq_ump_convert.c:884:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
      ret = 0; // skip
      ~~~~^~~
   sound/core/seq/seq_ump_convert.c:885:2: note: here
     case UMP_CC_DATA_LSB:
     ^~~~


vim +880 sound/core/seq/seq_ump_convert.c

   833	
   834	/* convert CC event to MIDI 2.0 UMP */
   835	static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
   836				      struct snd_seq_client_port *dest_port,
   837				      union snd_ump_midi2_msg *data,
   838				      unsigned char status)
   839	{
   840		unsigned char channel = event->data.control.channel & 0x0f;
   841		unsigned char index = event->data.control.param & 0x7f;
   842		unsigned char val = event->data.control.value & 0x7f;
   843		struct ump_cvt_to_ump_bank *cc = &dest_port->midi2_bank[channel];
   844		int ret = 0;
   845	
   846		/* process special CC's (bank/rpn/nrpn) */
   847		switch (index) {
   848		case UMP_CC_RPN_MSB:
   849			ret = fill_rpn(cc, data, channel, true);
   850			cc->rpn_set = 1;
   851			cc->cc_rpn_msb = val;
   852			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
   853				reset_rpn(cc);
   854			break;
   855		case UMP_CC_RPN_LSB:
   856			ret = fill_rpn(cc, data, channel, true);
   857			cc->rpn_set = 1;
   858			cc->cc_rpn_lsb = val;
   859			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
   860				reset_rpn(cc);
   861			break;
   862		case UMP_CC_NRPN_MSB:
   863			ret = fill_rpn(cc, data, channel, true);
   864			cc->nrpn_set = 1;
   865			cc->cc_nrpn_msb = val;
   866			break;
   867		case UMP_CC_NRPN_LSB:
   868			ret = fill_rpn(cc, data, channel, true);
   869			cc->nrpn_set = 1;
   870			cc->cc_nrpn_lsb = val;
   871			break;
   872		case UMP_CC_DATA:
   873			cc->cc_data_msb_set = 1;
   874			cc->cc_data_msb = val;
   875			ret = fill_rpn(cc, data, channel, false);
   876			break;
   877		case UMP_CC_BANK_SELECT:
   878			cc->bank_set = 1;
   879			cc->cc_bank_msb = val;
 > 880			ret = 0; // skip
   881		case UMP_CC_BANK_SELECT_LSB:
   882			cc->bank_set = 1;
   883			cc->cc_bank_lsb = val;
   884			ret = 0; // skip
   885		case UMP_CC_DATA_LSB:
   886			cc->cc_data_lsb_set = 1;
   887			cc->cc_data_lsb = val;
   888			ret = fill_rpn(cc, data, channel, false);
   889			break;
   890		default:
   891			data->cc.status = status;
   892			data->cc.channel = channel;
   893			data->cc.index = index;
   894			data->cc.data = upscale_7_to_32bit(event->data.control.value & 0x7f);
   895			ret = 1;
   896			break;
   897		}
   898	
   899		return ret;
   900	}
   901	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
