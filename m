Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05536576EB1
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962990; cv=none; b=MeKwGO/vZtrqo+2Kfl1guoBoibC2bntVSLck/UXbLErh2WA0F0Ss9GYWSTMCzz2kaYr1wzKZLx61IRKj32jLrwbmIA81QLHQ70nPhg7eRxVk8HOmVm6WhyQe/DYzevNvEAnAGDIwotl0JAf7tVuz0RTPd/F61eC2i/IaPmRxi94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962990; c=relaxed/simple;
	bh=lNJE6/tTEe2VB8znb87r8MN/CLn4bsqUyDoiDSIc/b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJORqYsUCrOrOz4Jtacl/Oh/m57fZWaUzO9pkmoKd1mcX3MhwZD+fQ4nXYCzM5Y+JGYpC35o/MwjN7V2BSuKJQhqp4vxuJQAmm9SEWTepTis3en5F5eRHPhBvXPTqzzmomMUJbN1VcECTCgkXcFn/tLMtoIt4SN11EStylNAm6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=digJOD3n; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="digJOD3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788962989; x=1820498989;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lNJE6/tTEe2VB8znb87r8MN/CLn4bsqUyDoiDSIc/b0=;
  b=digJOD3n0X+qU49wHBkE/j3PQvMpHsVmWVfyyHZH/++TyFJxKudxrUxE
   oOj0ipbLfGX181HEO47K+6G+gl6SdW1M/WpeyK330/PV3s3xQd0MZ9iP4
   7f3b/zlZkNaUJxgP5Z7Jfz72gvXMjEMWuRHKMG3IO6sdU4tpNMJ+8bCeW
   K8QV3+hCGvqqx1zwpk52Lzs8KHVMXKShRNgRGLV98JYS6vlCYKV05Zbcz
   tB0sTfkMDQFMNo0hG23DNF53UYj9XdgsyngqEJXH/mYjz1FEykr49ZxbL
   DtrPyRRzkURhWfwBFhrAYlYVCuMq9SNNnaPLB/8groW7on8iUR68Twm8n
   A==;
X-CSE-ConnectionGUID: V7TEx7j3S8ihTGov3KLdcw==
X-CSE-MsgGUID: Lmird9Z8RR2BZpZMsKUOiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89420952"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89420952"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:09:48 -0700
X-CSE-ConnectionGUID: OVKvjtiiR3SApqdj6b6XIg==
X-CSE-MsgGUID: aNUnsUbwS0ehEtICc/vlFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="273306505"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.252]) ([10.245.244.252])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:09:45 -0700
Message-ID: <94b6a3e0-129d-4a94-b43f-798326bda62d@linux.intel.com>
Date: Wed, 9 Sep 2026 17:09:56 +0300
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
References: <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
 <ap7sF6dOY0Pl0c46@parshuram> <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
 <7af0b170-dd4a-4aef-b4d8-7e87d72d11f0@linux.intel.com>
 <ap-yDQotxJpw_jHr@parshuram>
 <003c3998-5b46-4532-9d48-dd47b98d544e@linux.intel.com>
 <aqABhbYne6RIree6@parshuram>
 <7f5625fa-d391-406c-ba75-4df526af903c@linux.intel.com>
 <aqBCDphiKQVzt-Hl@parshuram>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <aqBCDphiKQVzt-Hl@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/09/2026 20:12, Vinod Koul wrote:
>> SOF supports 2 major IPC mode, IPC3 which was used up to TGL family (and
>> by NXP, AMD and MediaTek) and IPC4 which is from MTL onward (with
>> unofficial support for TGL).
>>
>> They have different operating principles and we just got the compress
>> support for IPC4 (so TGL and up) only on Intel platforms.
>>
>> NXP is using the compressed with IPC3.
> 
> aha, joy of changing IPC with SoC! I dont envy you Peter :-)

:D Thanks!

>> Also I'm not sure how the fw could get any idea where one
>> flac/vorbis/aac/mp3 ends and where it starts, the black box does not
>> seam to be able to detect this or if it does, it will not emit this
>> information to outside.
> 
> It is supposed to be filled by media frameworks that parse the file and
> send it down to kernel. That is why in fcplay chose to use libav for
> getting information for few formats I had... I might have some fork in
> my old pc, I will check if I had something more that could help you.
> 
> Feel free to extend it, if this is not working and use something else to
> get the metadata.

I think that part is sort of clear, but my hold up atm is that I have
not yet figured out how this can be handled in FW, what it should do.

>>>> Also: I have assorted ogg/mp3/flac in my music library and I tend
>>>> to play them in random, which defeats the gapless.
>>>
>>> You are a non typical users :-) To test this, we would same track in
>>> album. A typical user would be running spotify with same format :-)
>>
>> Yes, Spotify will shuffle, but use the same format mostly for the
>> random 'files', true.
>>
>>>> The gapless support is not covered in this initial version, but can
>>>> be added later.
>> I will likely need to do this at some point, but again, w/o the
>> ability to test it, it is hard to declare victory ;)
> 
> I was testing on few formats on Qualcomm platforms and this seemed
> to work for them... It is not elegant but got the work done for me back
> then.

And this as well, I have 0 platform where I can see this one working in
real life, none of my Android devices support compress, none of my non
Intel Chromebook does, I don't think the QC firmware is open source...

I'm sure it can be done as the design is clear, but the decoder library
that SOF is using (from Cadence) primarily is not written to support the
features of ALSA compress.
It takes time to figure this out to be of a quality that I can put my
SoB on the patch/feature.

-- 
Péter

