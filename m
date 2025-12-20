Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF946284674
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 11:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766231287; cv=none; b=q4l1YMuidIcpSenHGyiBhuSvi1Gzbdc4Kn6SdwEEevCkW72f8AwJs9BLi7lXHjp0V7+6E2KcRtfc2Gk9I5ekV21/MTO7hoLYYKFc+cUSu7pxfHdAzJH3NLbqgq7XhPbStMKMpkJ/e+JrrPVagVPkIRa9aqzDVPfKqUODZ0xOJQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766231287; c=relaxed/simple;
	bh=GVcw1fWH5vE2h65tGC5n+fZ8OPfO4si4RdSlmyb6WpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fY284x53TPmUJZBiCfJWUlxMIk1fdRO3tuKKXi3M1Yfh0C6AD/U+BE9ATesxFf3PIKjMvm/6XGJxj1vudJTTaQwaTgtT8tYNR/kEHeph7KJ0Ej3Yg6O9bi0GtIf8Ihl9s/6HSvTVpa+m/BwkMJshKRgW1ZxgauBUhL1Wsbb+Z4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xVk64zDS; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xVk64zDS"
Message-ID: <0acbd48b-77b1-4857-a50e-02a7dd46c3ac@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766231282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0y3Po3g9EtFsAjc6MS+0l9xs6odRTvrjRy+hh3qNmY=;
	b=xVk64zDS949+dPtLta4Y/R7a4BTOTqi4sDtH0Ls4dyTcmdaBkJBQAh1iFSEMJRBJe0bzpX
	sl6FFpUrbZA4oJ7mV1rdt30B0++gWLl4HPbpFx/Uajh6hI8iB+6LphZHXqBNvT1jhA8sLq
	vkT3a4pp38CawJeRGOkKN9bMr6Idbpc=
Date: Sat, 20 Dec 2025 12:21:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] ASoC: SDCA: Add lock to serialise the Function
 initialisation
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com, vkoul@kernel.org,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-8-ckeepax@opensource.cirrus.com>
 <9e306719-a954-4ff4-b2a7-5fbf4268929f@linux.dev>
 <aTmRXjrJceokKJoi@opensource.cirrus.com>
 <b884881f-7329-4d9c-9886-821468ea1be0@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <b884881f-7329-4d9c-9886-821468ea1be0@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/11/25 11:26, Richard Fitzgerald wrote:
> On 10/12/2025 3:27 pm, Charles Keepax wrote:
>> On Tue, Dec 09, 2025 at 12:20:41PM +0000, Pierre-Louis Bossart wrote:
>>> On 11/25/25 15:21, Charles Keepax wrote:
>>>> To avoid issues on some devices serialise the boot of each SDCA Function
>>>> from the others.
>>>
>>> In theory all SDCA functions are independent, can you elaborate
>>> on what the problems might be?
>>
>> How do I put this... hardware and firmware teams are really good
>> at always considering all the implications of the spec.
>>
>>> I can certainly see that it's not efficient to try and
>>> download multiple firmware blobs over the same limited command
>>> or BPT/BRA channels, but I am not sure I see the dependencies
>>> between functions?
>>
>> Generally the dependencies tend to come in from the implementation
>> not the specification. Whilst logically the functions are all
>> entirely independent, that is not necessarily how the hardware
>> will be implemented. I would guess it will be quite common for
>> the functions to be implemented on a shared back end.
>>
> 
> IOW: SDCA assumes all functions are independent, but it is not
> always feasible to implement real devices that way. And SDCA does
> not tell you whether functions might have dependencies. So the only
> safe option is to be pessimistic and assume there might be dependencies.

Fair enough, but then how would we model these dependencies if there are independent child drivers, one per function? How would we know FunctionA needs to be probed first and do things so that FunctionB becomes operational. Or that FunctionA needs to remain powered so that FunctionB is usable.
I am not pushing back on the existence of such dependencies, just stating the obvious that the current model with child devices/drivers does not provide any hooks to model such real-world dependencies. And it's not even clear if any ACPI information provides such information...
