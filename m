Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC12208D90
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085383; cv=none; b=XsTP2Bp1MqOBVhWE0CN0Cw8B4ylSCuIw4C8ITixrOgPyjYb/H76taUJ2lWIRuNrUJQHeOkII9Sv4ix9rhQJcRgJ+Z8MBzLy0ejw6Px1vRMAtJV4MHMetHlWZwpFpz8GyXOAjsz5Cq5so+cfAYq3oGnnezP6mVZt/HBmd7Q8ls48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085383; c=relaxed/simple;
	bh=WMLp3ibLyOJcLC/ifWr/Z8db7Di2ZqCSFehFqiXjvfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMnzEMaSsETmLaB8nSEWA4I2keWBEl7H3/c5Erb4PDmZteqibUQoIj1dATCrbJBBSrtZMjpu3xfZiC7hGdbpghxFlzjDklJWuwAN+Z59ANuVJp8/Ey69xtZvM9qmbQzFHMUSm8/yvo80dBnjfA406zu1LHw/epS2YYHXyJcnrEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4fZNqRV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4fZNqRV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729085382; x=1760621382;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WMLp3ibLyOJcLC/ifWr/Z8db7Di2ZqCSFehFqiXjvfg=;
  b=g4fZNqRVJACO+VnmKT55YIS73nfEptghpbg9o0ocYITE0V3Osxt8rmtb
   Qs6clIlTY4m/YEqzMHpjMvGhnK5FtjDyF9ZPINqxWs7dcVB6Ww7WaRIUW
   pNO1447ha+rmvCZckZXaq6VpInb84uNykFrJ8GVjyv+5hxBPWdjXy9mmP
   z78rQiWmxrhMIbpCLZQjCxONz6BMYJGAf/ampdiss2f/Hr3QgrjGCaSYH
   VGYbtvPi33qBtgbZYNQgghBwpk/38TBOBwbVvXAxzktMzkmXS3Et3a4fu
   dNyQ7L9sHchDXT3ISFrY0TEHaUBaSdG3JtFG7gSMAVs5qOonWVhYXSDDp
   Q==;
X-CSE-ConnectionGUID: SB0vwizDQkKNM7KKuIgCCg==
X-CSE-MsgGUID: vm4uqyRMRUqqyh9Vsrac/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39902853"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="39902853"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:29:41 -0700
X-CSE-ConnectionGUID: j8EEWVxKR6iyHU+ik8nvGQ==
X-CSE-MsgGUID: qkhbpHqGQryuYfYQRwUR5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83040748"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:29:38 -0700
Message-ID: <51db28da-7eb8-401a-b86e-98d95f896643@linux.intel.com>
Date: Wed, 16 Oct 2024 15:29:35 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] Add support for detection
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Cezary Rojewski
 <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
References: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
 <87y12ory4x.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87y12ory4x.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/2024 3:11 PM, Takashi Iwai wrote:
> On Wed, 16 Oct 2024 15:02:24 +0200,
> Amadeusz Sławiński wrote:
>>
>> There are some scenarios when using DSP where one may want to have
>> partially active stream and fully enable it after some event occurs.
>>
>> Following patchset adds new "detect" state to ALSA state machine to
>> allow waiting for condition to occur before fully starting a stream. In
>> further patches the state is propagated through ASoC components to allow
>> them to handling the state as necessary.
>>
>> Main goal of this patchset is to allow handling scenarios like keyphrase
>> detection - where DSP analyses incoming signal and wakes userspace to
>> consume stream only when keyphrase is detected.
>>
>> I'm sending this as RFC so we can discuss if this is the way to go or if
>> there is perhaps another preferred way of adding such interface.
>> Userspace part of implementation is available at
>> https://github.com/amadeuszslawinski-intel/alsa-lib/tree/rfc_detect
>>
>> Amadeusz Sławiński (4):
>>    ALSA: core: Add support for running detect on capture stream
>>    ALSA: core: Allow polling for detection
>>    ASoC: pcm: Add support for running detect on capture stream
>>    ASoC: Propagate DETECT trigger
> 
> Generally speaking, the addition of a new PCM state should be avoided.
> It'll influence too badly on all user-space programs.  e.g. if an old
> user-space program receives such a new state, what should it do?
> How can it know it's a fatal error or it can be ignored / skipped?

In this case it should not get into new state unless specifically 
requested from userspace, unless I'm missing something?

Goal is to allow something along the lines of following in arecord or 
similar:

         ret = snd_pcm_detect(handle); // here only parts of DSP FW 
needed for detection are running
         c = snd_pcm_poll_descriptors_count(handle);

         pfds = malloc(sizeof(struct pollfd) * c);

         snd_pcm_poll_descriptors(handle, pfds, c); // polling for 
detect event to happen

         while (!detected) {
                 ret = poll(pfds, c, -1);
                 snd_pcm_poll_descriptors_revents(handle, pfds, c, 
&revents);

                 if (revents == POLLERR) {
                         error(_("poll, revents == |POLLERR"));
                 }
                 if (revents == POLLIN) {
                         error(_("poll, revents == |POLLIN"));
                         detected = 1;
                 }
         }
         ret = snd_pcm_start(handle); // starts whatever else is needed 
for PCM to work

> 
> And, if it's about the synchronization of the DSP readiness, can't it
> be rather synced in each PCM open or prepare instead?
> 

It's too early. We need to do it after hw_params as it needs to create 
all paths needed for full stream. During detection it just activates 
ones needed for detection and only after receiving detection event we 
want to start ones needed for draining.
