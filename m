Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F56337AA70
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 06:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849428; cv=none; b=ModC4FB33hAO3WmHBZEto/YGvj0QlicDWZ7J0Pkkl4S9XD/71Ck88sVpwn9eZ8p0Khw3EMw/pjJ7mLxg0y6IiK3Sjac4lWaEACEZI+29bwEAuhumLxA4iWA1tEnqaMBndzvuilBQ5ODT2/fFhHvzwItGZKoKgBBxo7Y7kXxn1qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849428; c=relaxed/simple;
	bh=Cj0/4eFbxQFEbivXS9MjzJ5VttyIv4+J2uDpeIG80ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pY4mLvmFDrkP15rLQdD9tWCYtnVy4MmHRZlW6M5ZVZjTb0yL6UigpCyF3K6FxZGckCYmCU9BVrmJWk2B536n254enT9JvKcQqIqF2LUQKk90XJ6nv5juN9qlMeAiy7FQvaAPf81uxTYcijyVg2TsvUoNnr7vwoh4t8k1XLxY9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XM42FRxL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XM42FRxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788849426; x=1820385426;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Cj0/4eFbxQFEbivXS9MjzJ5VttyIv4+J2uDpeIG80ns=;
  b=XM42FRxL4GPhXBiQIe7Ju8WkwTedQEKLPTS0In44/jVAuApzu0xZ15yu
   9UwMmOA6aSEXsUIFMWwwP+LuPbr33ZN72/SddViCxQQo/JQQYIoFJx6yc
   FD2q9p7MNxPpJ8Go369ZhQH7dBCnVv+LNdaQvCiLJH2yhxBLUNvx1jknL
   8d4dSZ1iqUGVuUsu7ytbpLraxhtFcmAt2rAIhMrXQOpkER6WhIf2TBTjh
   LL98H7L9Mc/YTuSxkEz7wQUKcZxmNBShz1T33KzMuDF627B7oMXNsWgJ6
   401M8DZbFeqOvI/fryiGLNbV8/jV7m65D05gVHHwKaJX3CYSa+GuFaJyA
   w==;
X-CSE-ConnectionGUID: c8ZXKlgSSkeP7SQltTGAdg==
X-CSE-MsgGUID: aD3FCs0+QEGzfo11tiWYKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89115729"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89115729"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 23:37:05 -0700
X-CSE-ConnectionGUID: FNDBza9mRh62b0Xdh3UupA==
X-CSE-MsgGUID: PQgbyGq7S7e8MnEd1neW6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269171217"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.108]) ([10.245.244.108])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 23:37:01 -0700
Message-ID: <7af0b170-dd4a-4aef-b4d8-7e87d72d11f0@linux.intel.com>
Date: Tue, 8 Sep 2026 09:37:11 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vinod Koul <vkoul@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@oss.qualcomm.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com,
 Vijendar.Mukunda@amd.com
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
 <ap7sF6dOY0Pl0c46@parshuram> <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/09/2026 22:55, Pierre-Louis Bossart wrote:
> On 9/7/26 18:53, Vinod Koul wrote:
>> On 07-09-26, 17:03, Péter Ujfalusi wrote:
>>>
>>>
>>> On 07/09/2026 14:26, Pierre-Louis Bossart wrote:
>>>>>> ...otherwise it'll end up with -EINVAL instead of getting passed
>>>>>> through.  Also a switch statement would be a bit more idiomatic.
>>>>>
>>>>> OK, I will add the NEXT_TRACK and convert the if to switch.
>>>>
>>>> ICYMI for testing, NEXT_TRACK and PARTIAL_DRAIN are only enabled in the
>>>> 'fcplay' application with the '-p 1' argument for gapless playback, not
>>>> in the initial cplay application.
>>>
>>> With SOF/Intel/IPC4 we can only support DRAIN, NEXT_TRACK and
>>> PARTIAL_DRAIN are not supported, but there were mismatch between fcplay
>>
>> Those should be optional always. Gapless support should not be mandatory
> well in practice it's a non-negotiable requirement from users... We had
> to add this as the request of the Android team, and it's a standard
> feature on most players, not a nice-to-have.

The only 'documentation' for the gapless (next_track + partial_drain)
that I could find was the fcplay (and that could not have been worked
(metadata and next_track was in wrong order).

But, reading the code it implies that gapless must support anything
thrown at it in any order as for consecutive files:
metadata
next_track
set_codec_params
partial_drain

With IPC4 the NOP strategy works (just streaming the files without
stopping, but they mus be of same format and property), but then you
loose the position, so not so great.

> Note that the NEXT_TRACK only works if the two consecutive tracks have
> the same format, if the platform wants 'perceived' gapless playback with
> a x-fade then two devices are required.

If I can ever test this I might add support for it, it is not clear how
the pointer should behave after partial_drain, we won't stop the DMAs in
this case.
With the cadence module (compress support in fw) the metadata is not
supported, so true gapless is really something which needs more work.

This has not been planned for the initial IPC4 compress support, it is
unclear how it can be done to me atm.

-- 
Péter

