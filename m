Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220D14A1E01
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856881; cv=none; b=qhfbACDN6lhIXr5YQ2KwDwQ5ePyRYs/4jyrhIBSYVUczVA3D7s8toanFBKXHcqz9/aQPg7KtQUWrOSknVxMWxOtw3LLOf4Gn2N9wgv3p65rsogfJI28tVmsmatLATeS1+z5hKLTXKFhe45v9/Swmp7g8PM19d7+dsN5x4pFBCX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856881; c=relaxed/simple;
	bh=aGPNM1IMYwOo1yU1AIQobFuOA8eeMVM3ktEakuzui/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWCxfG7kESUT0KWw0vlwErGXtUsClOav+ntJNSQAc9ZnPJm8rNHHRjTToz6v/YaT1RmdWHc/Vx/DOphyNhjYY5d/zq0kWR27Vc2iNIu69FvkmiETrxIw5wlY2EOwPsqV4/ePjGLUfwVBor46K9izBO4c1j2mT8YwjRRvr1qPj6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oy2TIJql; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oy2TIJql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788856879; x=1820392879;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aGPNM1IMYwOo1yU1AIQobFuOA8eeMVM3ktEakuzui/A=;
  b=Oy2TIJqlABTiShm4Ifb0AWyaR9IVqh4FQx3c4u3KIOs6i83VpbQSkjY+
   HVsfckzs1KeXh9exrO9ba0VFVw3ogIan6+yv8lTZYjghPKiOxYI/ieMN/
   a+7lD57N71vpCxsJx9a4B5eI5qYW4bq+BcXa9O7N1CFw5TlE02If+P73Q
   aGHBzn5aURI4J0Ymkq1E62cealO3yf7aUKBn9wMaWtGNtZVUouC+/hMYZ
   Ipd60xX9zXjqI8xnkT5o7EDO3F7xPzGD6PBl3c1+orM2+JeuCsESn6CPe
   zOVbTy4GZPvG4x454GOhbIt+fZV2rNW1OIPh/gXzATLMc+hvu5PLzrsJ4
   A==;
X-CSE-ConnectionGUID: iB6x6EvISDKf1g89X2mnjg==
X-CSE-MsgGUID: yHBZVocKTcaQOytaAjEc2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89124794"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89124794"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:41:18 -0700
X-CSE-ConnectionGUID: tgQ6jTPsTQGXG6m3EiD3eA==
X-CSE-MsgGUID: O0JYaB+jTWWajg+ZLiGpiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="275069864"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.108]) ([10.245.244.108])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:41:15 -0700
Message-ID: <003c3998-5b46-4532-9d48-dd47b98d544e@linux.intel.com>
Date: Tue, 8 Sep 2026 11:41:25 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
To: Vinod Koul <vkoul@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, perex@perex.cz, tiwai@suse.com,
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
 <7af0b170-dd4a-4aef-b4d8-7e87d72d11f0@linux.intel.com>
 <ap-yDQotxJpw_jHr@parshuram>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <ap-yDQotxJpw_jHr@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/09/2026 09:58, Vinod Koul wrote:
>> The only 'documentation' for the gapless (next_track + partial_drain)
>> that I could find was the fcplay (and that could not have been worked
>> (metadata and next_track was in wrong order).
> 
> Please see Documentation/sound/designs/compress-offload.rst, it has a
> section on gapless with SM as well.

Thanks, for some reason I missed this, looks pretty well defined and
written!

> 
>> But, reading the code it implies that gapless must support anything
>> thrown at it in any order as for consecutive files:
>> metadata
>> next_track
>> set_codec_params
>> partial_drain
> 
> It was supposed to be in a specific sequence. See the sequence in the
> documentation.

The documentation confirms that the fcplay was incorrect:
https://github.com/alsa-project/tinycompress/commit/7d41dc4bcd39a1b2c449a6f87e827bdbd84d1213

>> With IPC4 the NOP strategy works (just streaming the files without
>> stopping, but they mus be of same format and property), but then you
>> loose the position, so not so great.
>>
>>> Note that the NEXT_TRACK only works if the two consecutive tracks have
>>> the same format, if the platform wants 'perceived' gapless playback with
>>> a x-fade then two devices are required.
> 
> Yes, same format always. Codec can skip the trailing and leading zeros
> in that case. two different formats would need code switch/code setting
> params, so it wont work and we would need two devices to x-fade as you
> rightly pointed out

gapless looks to be straight forward fort he first look. What made me
delay the implementation was the fact that I could not find any way in
firmware to support the metadata as one - OK, I can just ignore it.
second: in kernel and in firmware I could not figure out _where_
actually is the end of the current file in the buffer. In kernel we have
circular buffer for the DMA and userspace just fills it and since for
the kernel it is just data, it looks continuous.
The firmware can detect the end of a compressed file, so I can sort of
support the drain and partial_drain but to get this whole thing working
was just not something I could do blindly.
Also: I have assorted ogg/mp3/flac in my music library and I tend to
play them in random, which defeats the gapless.

The gapless support is not covered in this initial version, but can be
added later.

-- 
Péter

