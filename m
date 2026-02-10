Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D4F3254AC
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743143; cv=none; b=kpz7ksHARUYDOsBfy8ra+ivsGnQGVRJgOGjWBE3VQ57apmdxOSKwpuSiS/ErlhGBdctsA8uQ8khxeb/yUrn4nXaDCvupsqe4825ik1u9Bt51tuviF3XBvr4WGcmUzZjREfKBrDy6UON9VWWdjz8LvOXEYEXWCysw5K/gjcJgr4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743143; c=relaxed/simple;
	bh=IjJ8sW8n4XmdqcsV0Z8KWK3mx06vY4U7yql0hRCyQl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GD8lmufM44H6iaJBMuVsEK3VQ0juijmmP7rufOdtDNYdHQnRQRLOyVRZ2+l/f0lHsJpixDPkpgHVa17a2e2Ky/oEKIEXJTxziz+FdFWwHK6gdgSVrzhhCS7CJBWtEPX4u8+ORaFa1nHjfw7AC+1zjgmu9U7Mm1Z/Wx0vsLFi2zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <e9e27355-a3d1-4ae2-aa6a-da47c6bced1f@linux.dev>
Date: Tue, 10 Feb 2026 18:04:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare command for
 Simplified_CP_SM
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "Ding, Shenghao"
 <shenghao-ding@ti.com>, "Xu, Baojun" <baojun.xu@ti.com>,
 "Kasargod, Sandeep" <sandeepk@ti.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
References: <20260209070905.10749-1-niranjan.hy@ti.com>
 <97872c17-73c9-4484-9f8e-373ed9a59a25@linux.dev>
 <87773927e37c4d70862c5f047431c7b0@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <87773927e37c4d70862c5f047431c7b0@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2/10/26 12:08, Holalu Yogendra, Niranjan wrote:
>> On 2/9/26 20:13, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev> wrote:
>> Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare
>> command for Simplified_CP_SM
>>
>> On 2/9/26 08: 09, Niranjan H Y wrote: 
>>> In TI device implementations, we've found that some devices with
>>> Simplified_CP_SM still benefit from receiving the Prepare command.
>> It would also be good to clarify when the device is actually prepared after the
>> bits are set, if the implementation cannot guarantee that the prepared status is
>> reached by the end of the frame where the write occurs, then it's definitively
>> NOT a Simplified_CP_SM.
>>
>> What happens is the simple_ch_prep_sm bit is not set for those devices, and
>> the regular state machine is used instead? Is anything broken?
> 
> We need to use the same BIOS between Windows and Linux. The BIOS configures
> the device as Simplified_CP_SM. The device also expects the Prepare bits to be
> set. If the device is configured as generic CP_SM, the status "Port Ready" 
> bits will not be updated and we end up with port prepare fail errors.

Are you referring to the DPN_IntStat::PortReady bit? IOW do the errors during prepare happen because the interrupt is not generated?

If that is the case, then you should be aware of the thread "soundwire: stream: Prepare ports in parallel to reduce stream start latency", where it was agreed that the use of the PortReady interrupt is broken. We do need to move to a different code where we have a polling loop on the DPN_PrepareStatus::NotFinished bits.

So is the problem in the interrupt generation, or is the problem with the 'Not Finished' bits?

> So, setting the device to simplified CP_SM and ignoring the "port ready" bits is the
> best option we have.
> 
> The TI's HW is implemented referring to the "Figure 141 Channel Prepare State 
> Machine" for Simplified_CP_SM of the spec. where Prepare0 OR Prepare1 are shown in the
> image interpreting it as setting prepare/de-prepare bits.

right, but are the 'Not Finished' bits updated after the write when the transition to the prepared state is complete?
If that works then an alternate solution to this patch would be to quirk all TI devices to use the regular state machine, and use the polling loop as suggested by Richard Fitzgerald.

>>> +	} else {
>>> +		/* Some device return error for the prepare command,
>>> +		 * ignore the error for Simplified CP_SM
>>
>> that comment is misleading anyways, it's not 'some device' it's ALL the
>> conformant devices that will return Command_Ignored when trying to write
>> read-only bits. You haven't described what the TI devices would return in this
>> case.
> TI device doesn't return any error code while setting the  prepare bits command while
> in Simplified_CP_SM mode. It accepts the write to the register without complaint.
> 
> I agree that the comment could  be updated. We should indicate that we're 
> deliberately sending writes to what should be write-ignored bits for compatibility 
> reasons, while ensuring any potential errors from fully spec-compliant devices are 
> handled gracefully.
I think it's worth exploring what happens if the PortReady interrupt is not used. If that's broken as well, then your solution would work but needs more/better comments indeed.
