Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9E6F50F
	for <linux-sound@vger.kernel.org>; Wed, 18 Dec 2024 20:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734555094; cv=none; b=YW0/r5kcZFNp+Q++BliI1VlaIBXvfCVcLcuacWWiIBgDAYaclSVKrhJgh1P9j/Uef7gI/cFwy6pMEUPalGGMkX770EsOS2iZ8ghiSIN7PRqx6RnjDAZaIvLj6VIz5z/QVIABkMrPNysR9C8TZF7f0EGWgUNggfng2rIHjOGv9GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734555094; c=relaxed/simple;
	bh=Ge2ySWf/dVgXjqc+YxRITcgU0t2a4uKfPnkd8EEpm+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZ496KzzkN1KYrPt93M5SvGfE/KqVDfbcixcq9R9h7xgKWuoST96ZGT3Kb8WbkxoHEOMYdodhh2qaXSIKIQsf2NyMgBlZy8gwcX8GP/xoz8uY1TED0ALTqneYtQ6tVg7K6nsMAtEPfK7Dcc75BobEkwF/ViUngclNzsYs4zxrB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nBSAmSE+; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nBSAmSE+"
Message-ID: <7479a25e-6729-4aa0-b67e-7781bf8232da@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734555089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AwpkZWD1BYK0Aotoxrp007HTIXzRtHYAUgnGyr+0KB4=;
	b=nBSAmSE+baYX1wP4Q6vcZx/GyfvQ/fLqc6k8LIgd2HZqNG2PhZ2LX5NRyRZbQbiH4Vnywj
	IV/tJSAUmOClPG2aMHLy3zmAfoANnFtBx6bJFt9+iDxaxAzgMfUqxsILY3k6rUc/jIHGTZ
	26Yo8/v5R4/i/77o6Nw9bBBF+tLIR9Q=
Date: Wed, 18 Dec 2024 15:45:35 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: intel_auxdevice: Don't disable IRQs before
 removing children
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20241212110221.1509163-1-ckeepax@opensource.cirrus.com>
 <3eb98099-75da-4464-97d1-9e8538375e34@linux.dev>
 <da4a16f1-0bf6-4597-b1de-55386db85254@opensource.cirrus.com>
 <e6dd9fc3-de55-47d2-a1b5-10884418a66d@linux.dev>
 <Z2KbELGGjeH3NQdY@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <Z2KbELGGjeH3NQdY@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 12/18/24 4:51 AM, Charles Keepax wrote:
> On Tue, Dec 17, 2024 at 05:49:17PM -0600, Pierre-Louis Bossart wrote:
>> On 12/17/24 4:49 AM, Richard Fitzgerald wrote:
>>> On 16/12/2024 5:35 pm, Pierre-Louis Bossart wrote:
>>>> On 12/12/24 5:02 AM, Charles Keepax wrote:
>>> For example, if the bus driver module is unloaded, the kernel will call
>>> remove() on all the child drivers. The bus should remain functional
>>> while the child drivers deal with this unexpected unload. This could
>>> for example be writing some registers to put the peripheral into a
>>> low-power state. On ACPI systems the drivers don't have control of
>>> regulators so can't just pull power from the peripheral.
>>
>> Answering to the two replies at once:
>>
>> If the bus driver is unloaded, then the SoundWire clock will stop
>> toggling. That's a rather large piece of information for the device
>> to change states -
> 
> The clock should only stop toggling after the drivers have been
> removed, anything else is a bug.
> 
>> I am pretty sure the SDCA spec even mandates that
>> the state changes to at least PS_2.
> 
> This code applies to more than just SDCA devices.
> 
>> But to some extent one could argue that a remove() should be more
>> aggressive than a suspend() and the driver could use PS_4 as the
>> lower power state - there is no real requirement to restart
>> interaction with the device with a simple procedure.
>>
> 
> Not really sure I follow this bit, none of this has anything to do
> with when one restarts interacting with the device. It is about
> leaving the device in a nice state when you stop interacting with
> it.
> 
>> The other problem I have with the notion of 'link_lock' is that
>> we already have a notion of 'bus_lock'. And in everything we did so
>> far the terms manager, link and bus are interoperable. So adding a
>> new concept that looks very similar to the existing one shouldn't
>> be done with an explanation of what lock is used for what.
> 
> I don't see much confusion here, the two locks are at different
> levels in the stack. If is fairly normal for a framework to have
> a lock and drivers to have individual locks under that. And the
> comment with the lock states it is protecting the list.
> 
> That said I am not attached to this way of solving the problem
> either, all I am attached to is allowing devices to communicate in
> their remove functions. I think perhaps the important questions
> here are do you object to my assertion that a device should be
> able to communicate in its remove function? Or do you object to
> the way I have solved that problem? I am certainly open to other
> solutions, if you have any suggestions?

I agree that the device should be reachable during the remove(), but I 
believe the scope of expected interaction should be limited to a strict 
minimum. To be clearer, so far not a single device had a requirement for 
any sort of interaction on remove. You would need to clarify which codec 
driver needs this.

I don't see how the 'link_lock' and 'bus_lock' are at different levels 
of the stack, the 'master' device and the 'auxiliary' device are both 
quite thin and I don't quite see what's different between the two.


