Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F7254CF7A
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876817; cv=none; b=C4IhZEsr2YoygTeoezae294XV3s/ARbZXiMsiRGRvt56ovO2IDz1ERWVGo2JlLeJKcPXPPz+1zLxImECteWh46jK8rUAkuJ3ss4BTNKTTWZ3QC55DDyKOfi+y321BZf4tZz1sSFeQOwHOIwbS7QxbjhEAujIzNRqfOqz3ZW80LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876817; c=relaxed/simple;
	bh=6X+ZkZ9V9uQkjlYX6Ly6wRM/T8R81wVgIXoZhpU/ynE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HH1OpRsg3R72t5fAvMbvEm6G94uSviQUpkvXts7VqhHnjCF56omvo2poAelCUIquTCmp1O//w2UVw93PA6Aj3+Z6OTsktwRTfWtFX8KzKJ1bqKlNYE0naneNrlitZ8xykTbUB20ePlMFeFSq/TvROAGMwmUNPjXLpbb1NPleY9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxcGTFi8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxcGTFi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788876814; x=1820412814;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6X+ZkZ9V9uQkjlYX6Ly6wRM/T8R81wVgIXoZhpU/ynE=;
  b=BxcGTFi8Pcg8ZWli59+aQDrNoELyncuIwxoyYkSTJenUMdAiizhDmjQ1
   O/Mp6mtFnW1EZOtfs68Z604S+ANG4PNUfcOOHI8+cV5qk4phhdUw+92sI
   1Ulm6oSa3JsygIdUjDkVuQ37kJ7sApVIAbIVrepSsK6ZXcfsuHlmULosg
   MMPU/SR/7r+iBSnwa/YLuJ1Guj1YiCbTqUkASB6QCyQTK1DW3iraIqh+E
   9YWrYAtGNwL+QMlJcgCqrD8MHBmASqSMu4d5DQHra92/V76JvUyBb/bEn
   UjtRXf0DwZ3iELImS8PAm6+YKi+nsvBW5xWFEeeEfsmvF6F1jN4KZ/yYd
   g==;
X-CSE-ConnectionGUID: UUC7U8o1RHSOrWBXRXyeMw==
X-CSE-MsgGUID: I6Fya/hESFy0ehx2W9Ho2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89037619"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="89037619"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 07:13:27 -0700
X-CSE-ConnectionGUID: n8vnFyVjQOCaPARaCp5ZMA==
X-CSE-MsgGUID: LwzvFmUmQ9mbNbaUZkxSvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="295933782"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.108]) ([10.245.244.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 07:13:24 -0700
Message-ID: <7f5625fa-d391-406c-ba75-4df526af903c@linux.intel.com>
Date: Tue, 8 Sep 2026 17:13:34 +0300
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
References: <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
 <ap7sF6dOY0Pl0c46@parshuram> <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
 <7af0b170-dd4a-4aef-b4d8-7e87d72d11f0@linux.intel.com>
 <ap-yDQotxJpw_jHr@parshuram>
 <003c3998-5b46-4532-9d48-dd47b98d544e@linux.intel.com>
 <aqABhbYne6RIree6@parshuram>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <aqABhbYne6RIree6@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/09/2026 15:37, Vinod Koul wrote:
>>> It was supposed to be in a specific sequence. See the sequence in the
>>> documentation.
>>
>> The documentation confirms that the fcplay was incorrect:
>> https://github.com/alsa-project/tinycompress/commit/7d41dc4bcd39a1b2c449a6f87e827bdbd84d1213
> 
> OKay, feel free to send a patch, we should be consistent with above
> documented behaviour

It is already applied.

>>>> With IPC4 the NOP strategy works (just streaming the files without
>>>> stopping, but they mus be of same format and property), but then you
>>>> loose the position, so not so great.
> 
> I wanted to ask earlier, whats IPC4?

SOF supports 2 major IPC mode, IPC3 which was used up to TGL family (and
by NXP, AMD and MediaTek) and IPC4 which is from MTL onward (with
unofficial support for TGL).

They have different operating principles and we just got the compress
support for IPC4 (so TGL and up) only on Intel platforms.

NXP is using the compressed with IPC3.

> The kernel should view this as a continuous bit stream and wont know
> EOF. Only firmware will know about it and with metadata, able to skip
> those.

I see, the issue is that I cannot find any way to give the metadata to
the decoder module, it is a black box to us.

Also I'm not sure how the fw could get any idea where one
flac/vorbis/aac/mp3 ends and where it starts, the black box does not
seam to be able to detect this or if it does, it will not emit this
information to outside.

>> Also: I have assorted ogg/mp3/flac in my music library and I tend to
>> play them in random, which defeats the gapless.
> 
> You are a non typical users :-) To test this, we would same track in
> album. A typical user would be running spotify with same format :-)

Yes, Spotify will shuffle, but use the same format mostly for the random
'files', true.

>> The gapless support is not covered in this initial version, but can be
>> added later.
I will likely need to do this at some point, but again, w/o the ability
to test it, it is hard to declare victory ;)

-- 
Péter

