Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D2C13D504
	for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712739367; cv=none; b=lQvJGTj8heY3Wtqeny3zybjpuDEMsEIYQwlWMtb6Pss78Zp5u2PpuFZKvTqcGIs624oFMEkiVCuXxyviT0+/PydYl8v1+6Kg0dpvRA7MbEvXkH/BMClv32M7ULi+jt3syAGs1xPsDbcTVn9M44iZjGrYlHrRBkW9FJua2Ei5mAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712739367; c=relaxed/simple;
	bh=k7E5js5nsahHbfadgGyTWzrhHeuRPfKiRU5hE/fkCXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJMoiZNcJYoJkKAfTZMKZFo7n8nIbg5BtAa43r8hGdZ+2k8t3KCjnbNjP+/7dV6raID2ybyDErtmqIk9sKWoqzxAlbkmKeKUqv2Rf8JyCp5iB0uH6maKxeprmSfdaYNlifxgrh1bnpkBl+Wp01pcXX4n6rgir9Lx49q0O2R3N/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bouDEDok; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bouDEDok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712739366; x=1744275366;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=k7E5js5nsahHbfadgGyTWzrhHeuRPfKiRU5hE/fkCXA=;
  b=bouDEDokwSplUGrfu5HBjjeNEBP3uvJQ2OUy9yUi+AlJG5WDiItq4YKZ
   meiS+23e0yKdcweJygOwYL9RL4ITk0h6k67l+8bjWhGEv/cdgs2b/Ukff
   tbAT7oLu1ZpxHM6gBUkFAe3s6RkNhEf+fwpVTMUNtd5BKB9AoPAvC0Bxi
   HwAAkzmTBiKG67p0XkWSfMKvmMQC4DfvfIAAHQD3le5aKzK3o6FPsM3DT
   gAPHFg1twk87PJWrei4QHhen6lC+IztH7V34p82quDj+2Gt0PoU3v2YJV
   UBJ3uzAoUWLe3+Bc3kqy/54EFs3klZ6hm5EwaqdEH4CXtQvo8FLTZ6WzP
   g==;
X-CSE-ConnectionGUID: Li+Ec6r8TkK+ApZ+JBb84Q==
X-CSE-MsgGUID: eb5qjid1Qnic2zNfnO7Isg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="30571179"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="30571179"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 01:56:05 -0700
X-CSE-ConnectionGUID: epc6rSWwSZe2LLRwd1TXQg==
X-CSE-MsgGUID: E2EOwVS3QBu0D1vZIVSkeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="21061842"
Received: from bfernan1-mobl.ger.corp.intel.com (HELO [10.249.37.122]) ([10.249.37.122])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 01:56:03 -0700
Message-ID: <61fd0ebb-fe75-460a-a85c-e7c346be6113@linux.intel.com>
Date: Wed, 10 Apr 2024 11:56:01 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] ALSA: hda / ASoC: SOF: Add support for PIO command
 mode
To: Jaroslav Kysela <perex@perex.cz>, lgirdwood@gmail.com,
 broonie@kernel.org, tiwai@suse.de
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 liam.r.girdwood@intel.com, ranjani.sridharan@linux.intel.com
References: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
 <1a9b4e05-9314-432b-a52e-133b0e5719c7@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <1a9b4e05-9314-432b-a52e-133b0e5719c7@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jaroslav,

On 09/04/2024 11:53, Jaroslav Kysela wrote:
> On 09. 04. 24 10:38, Peter Ujfalusi wrote:
>> Hi,
>>
>> This series will introduce support for using PIO for commands (immediate
>> commands) instead of CORB while retaining the use of RIRB for unsolicited
>> responses (notifications).
> 
> Hi,
> 
> Could you elaborate, how this affects CPU usage (busy loops for I/O)? Do
> the bus read operation wait until the data transfer on bus is finished?
> 
>> This mode of operation is the recommended one for Lunar Lake family.
> 
> A bit more explanation, please. It looks like a step back.

LunarLake is a different architecture compared to previous solutions, so
some things are improved with e.g. all audio interfaces using the
HDaudio DMA, and others are done differently (commands, wakes, etc).
In practice, we have not found any cases where performance would be
significantly impacted by the use of PIO v. DMA. The number of 'verbs'
sent is usually fairly limited.

The major concern we had initially was firmware download for Cirrus/TI
amps behind an HDaudio bridge, but all of those solutions rely on a side
I2C/SPI bus so the firmware does not rely on the HDaudio commands.
Hope this answers to your questions

-- 
Péter
