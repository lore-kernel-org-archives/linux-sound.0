Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965612857DE
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 13:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757423721; cv=none; b=S9kpSVnUMsdPMVhr0xIO3PgIYvXtHsyQQApxr92tCTv4nWLTAivbU5YsCmaUIcOT6WaJ3vLVAnp8HgPqbIqQ9yxwWlCS4j4NdkOrsaGjoH55msJz1Wyk1SRLKuYBGBQw3rcbsTxoKP+ZbJ4bubj9OrgBLUAxmERXkSCI+gqthqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757423721; c=relaxed/simple;
	bh=pIGmbJv6gFA7rG2ven1FIHMGi2BMcfd4Q6i4RuLR7Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tF+30cECHjzWqiMJ0XaAZd0NUYlpsNux18pNFNsj5Pd4br0/7AOUX0HCpiFuZAGwXvv1qlTKX3vprxlQSy0GcM/xkxGQhQHBwL8FTrlnipSuRrk3HEAzyof6AY4uPVOj8VHnJjz25/f4+eUew0yu52wJNJhZI5y3romdrD7faO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nC5ph3yu; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nC5ph3yu"
Message-ID: <2a069e04-8f72-48b2-af5c-6b45a0ea8e5e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757423717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eOBa3ZjVy2OK9A1AVwFHNCbdylOBXvm1tGl0rxiqgOI=;
	b=nC5ph3yulHhRFsvh7o42jmQLJiQ40GWBqT+Yg3LftYlMWUCsTYUPU8Nn0jjhNO2WSFvGBl
	dQ6CMVKPYoCjvhiDfrc7dmP878OVbKx1tZa/NxOaFQP23b/uinWmI1fneyGGaCOiMqD9iy
	zasOCImJESIOQSqS73GfokNBLbMQtOU=
Date: Tue, 9 Sep 2025 15:14:00 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 09/15] ASoC: SDCA: Add UMP buffer helper functions
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-10-ckeepax@opensource.cirrus.com>
 <e85fa12d-727c-402b-a7c1-493d2224f228@linux.dev>
 <aL7W3iS1YxGfk/AP@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aL7W3iS1YxGfk/AP@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/8/25 15:15, Charles Keepax wrote:
> On Mon, Sep 08, 2025 at 02:02:09PM +0200, Pierre-Louis Bossart wrote:
>> On 9/5/25 16:31, Charles Keepax wrote:
>>> Add helper functions for handling Universal Message Passing (UMP)
>>> buffers on SDCA devices. These are generic mechanisms to pass blocks of
>>> binary data between the host and the device, in both directions. They
>>> are used for things like passing HID descriptors and the File Download
>>> process.
>>
>> Humm, these helpers are very host-centric and don't seem to cover the basic
>> UMP message passing, e.g. for host to device:
>>
>> 1. host puts information in a buffer.
> 
> by calling sdca_ump_write_message

ok
>> 2. host sets ownership to device and waits for ownership to be returned.
> 
> by calling sdca_ump_set_owner_device

sdca_ump_set_owner_device does the ownership change only, there's no wait.

>> 3. device does a bunch of things and returns the ownership to the host.
>> 4. host detects ownership change or times out with a failed transfer error message.
> 
> by receiving an IRQ on the owner control.

but that IRQ may never come, in which case the entire protocol would fail.
>> What am I missing?
> 
> You might need to elaborate a little more on what you think is
> missing. The four functions implement the four operations that
> power a UMP buffer, checking you have ownership, passing
> ownership back to the device, reading data, and writing data.
> 
> One could combine more of the functionality into a single helper,
> but then you start to hit problems where you need to do extra
> bits.
> 
> For example HID, very simple just: check you own the buffer,
> read the message, and pass the buffer back.

I remember one of the early implementations of HID support in a Realtek driver needed some sort of timeout to reset the communication in case the ownership change interrupt never came. It's reasonable to expect that things will go wrong at some point in the communication between host and device, isn't it?

> FDL, has extra steps: check you own the buffer, check the FDL
> status, then write the buffer, then write the FDL response,
> and only then pass the buffer back.

Right, my feedback was only related to the basic UMP support and what happens if the expected ownership isn't signaled. 
I do think we need some sort of software timeout to make sure we don't wait forever on an ownership change. I did see the use of wait_for_completion/complete for the FDL stuff but it should be used at a lower UMP level IMHO.

