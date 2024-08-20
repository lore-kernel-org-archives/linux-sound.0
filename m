Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226518E34F
	for <linux-sound@vger.kernel.org>; Tue, 20 Aug 2024 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724140095; cv=none; b=RB9XGJOvtUIx0K6yocC40MdFypcsgMDmKg647ImN7NrEItrDhvUBTQHVQqmu8Ik9+IsUXtpF5/FQhE1jCtCKoextyOMAls1XtRW6hQPfpLIbizuZtYVnSO/lPn087Cm/x7pff1ZKxGk6Kl+H1UZePHEnJvSWnOE7o+wckIgfNC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724140095; c=relaxed/simple;
	bh=OrDJAbkTDtrWTESQ58o7M5iBYBRfzxIlIs8+nm7F7Nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDG+PHX5of51WKrjpdqxJNhK8HymgSEwci1O/09OtO/5FE76Uhrjtov3ql3hdBHPlBsTz0VbXDzLEGPBCRhkDDhflkt/4LkwYMCXK1twRVYMNuceUEpWoagL9Iv0rf4zqu1Q1uxe53L+UQYOhHkE1BLY6ta8gKaRrksbOj86FB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+xyxRZu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+xyxRZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724140094; x=1755676094;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OrDJAbkTDtrWTESQ58o7M5iBYBRfzxIlIs8+nm7F7Nk=;
  b=L+xyxRZuCN/Yit53n0UiOA9vHwgoSfzKwlYoB6qthp587s94/VGcTWl7
   qoCUHV9a+KTqdxlZcu28FC+d2Jm7hIKUTz6SJuXkfVVz4sTvaGn7l3r17
   nDoGdYe4/4Vnl6n8Vq/VE+UL6mvq3QuoKu+34w6yYSAZT9kaiVnxRzdgP
   f9BBdxGfDmIkAEjBDi4l/5qtHGWwHQa6v6NbFh8/bjI8v6l5M2QYQW5H7
   jFx4SPjGk/jybuNW1/ocIxscE0jhYXcQOfh5tezyZc2yW92+qO1smAi81
   P+j0EwYo/DTZ3cAabr90CBXLXNEvySenAFnD/hx+dondJZt5g6rAuTwVH
   Q==;
X-CSE-ConnectionGUID: UiOhd6CiQD2tLUi4t4zF5g==
X-CSE-MsgGUID: ZJK9PIujTbaiKQIJHsDOQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22391446"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="22391446"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 00:48:13 -0700
X-CSE-ConnectionGUID: kINnNrznQD6lCWNpUohnSQ==
X-CSE-MsgGUID: lmiC27YGQ4+EW+cNKkgN/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="65467328"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.176]) ([10.245.246.176])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 00:48:08 -0700
Message-ID: <be277abb-af6c-470f-8237-17f45bd990b8@linux.intel.com>
Date: Tue, 20 Aug 2024 09:48:05 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

>> +One possible strategy to speed-up all initialization tasks would be to
>> +start a BRA transfer for firmware download, then deal with all the
>> +"regular" read/writes in parallel with the command channel, and last
>> +to wait for the BRA transfers to complete. This would allow for a
>> +degree of overlap instead of a purely sequential solution. As a
>> +results, the BRA API must support async transfers and expose a
>> +separate wait function.
> 
> This feels a lot like it could map onto the regmap async interface, it
> would need a bit of a rework (mainly that currently they provide
> ordering guarantees with respect to both each other and sync I/O) but
> those could be removed with some care) but it's got the "here's a list
> of I/O, here's another call to ensure it's all actually happened" thing.
> It sounds very much like how I was thinking of the async API when I was
> writing it and the initial users.
> 
> It's this bit that really got me thinking it could fit well into regmap.

I am now revisiting this entire patchset to try to enable firmware
downloads with this SoundWire BPT/BRA protocol. I re-looked at
regmap_raw_write_async()/regmap_async_complete() and they seem to map
well with my initial write/wait_async proposal.

Do I get this right that these async capabilities could be used to
enable this faster SoundWire protocol, but the regular regmap_write()
could still happen in parallel with these async transfers? This could be
useful if e.g. there's a jack detection while downloading firmware for
another function.

I don't see any locking that would prevent such a dual operation - with
the caveat that it would be up to the codec driver to make sure they
don't try to access the same register with the two modes of operation.

The only thing that would need to be extended is that we'd need
additional callbacks to check if the protocol is supported on a given
hardware/firmware platform, and if there's no audio stream. In these
cases the async writes would be demoted to regular writes. Otherwise the
bus would be locked to make sure no reconfiguration takes place while
the firmware download happens, and unlocked when the transfer ends.

Thanks for your help on all this,
-Pierre
