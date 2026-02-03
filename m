Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579D4346AD7
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125777; cv=none; b=Z4h9dBQuC+ApAyuCWgZcT2+fPZtKKnCSx41Jp06zY+MdsM+Awoi22inQhFv4d2IyaBMsx4ew3br74j/TWoiTku4ZbutsfJfWITf5KrAH1yv1m3S2WquKOVUTNCdUj5phe9glsVNhTFqkXWNG73W9tjehygL/YYbjcdsIsltvtLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125777; c=relaxed/simple;
	bh=mKurPSrJp035uMCY/IL1SczBvCi0a9Fto7ajYUQGMk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BrPXWuH3GncMu+V9vEJFRmVYU+k8iwPqh4zDNU2WjKrh284o6D0/ZYRq3EhpkoWIM8sS7t29cuYaeBOekSdm2mfwf7zYxC5G8xnPggZrb+5MQQGZzGZ0sknB/+83dLXotIuyJ7KLP5WwCR3SC/EXUt+yXhGj/g+E8qtTE/KaqMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KFp2EZpb; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KFp2EZpb"
Message-ID: <e3b8302c-c12a-4507-b554-d996763187d7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770125774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKurPSrJp035uMCY/IL1SczBvCi0a9Fto7ajYUQGMk8=;
	b=KFp2EZpb4ptjOZ5hhlOGyzZB+8LHoQ7HzCMYwdyGMr5nMOfOr9vrUrbIDKXTv4xHNm63Oz
	6RZpS8rDyt1XZHZ1WMVV5GRo8jChWDta2plTn5XSpPkW//4ihQFzXxdffwcyIL1tdwU1SB
	uU3SMxZ7lqDQTkKD722KISe5IVy2B4o=
Date: Tue, 3 Feb 2026 14:21:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] soundwire: amd: refactor bandwidth calculation
 logic
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260129061517.38985-1-Vijendar.Mukunda@amd.com>
 <20260129061517.38985-3-Vijendar.Mukunda@amd.com>
 <a3605fc2-8080-46b9-8c30-a5c38a4f70a1@linux.dev>
 <5c12f4d8-e518-45fd-b4f7-12fe6f81e0ec@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <5c12f4d8-e518-45fd-b4f7-12fe6f81e0ec@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2/2/26 18:25, Mukunda,Vijendar wrote:
> On 02/02/26 22:35, Pierre-Louis Bossart wrote:
>> On 1/29/26 07:14, Vijendar Mukunda wrote:
>>> For current platforms(ACP6.3/ACP7.0/ACP7.1/ACP7.2), AMD SoundWire manager
>>> doesn't have banked registers for data port programming on Manager's side.
>>> Need to use fixed block offsets, hstart & hstop for manager ports.
>>> Earlier amd manager driver has support for 12MHz as a bus clock frequency
>>> with frame size as 50 x 10 with fixed block offset mapping based on port
>>> number. Got a requirement to support 6MHz bus clock frequency with
>>> different frame shapes 50 x 10 and 125 x 2.
>> the two frame shapes don't carry the same number of bits (500 v. 250). There's probably an additional variable at play, maybe frame rate? Or is 50x10 for 12 MHz and 125x2 for 6 MHz?
> We need to support 12Mhz as bus clock frequency where frame rate is 48000
> and number of bits is 500, frame shape as 50 x 10.
> For 6Mhz bus clock frequency we need to support two different frame shapes
> i.e number of bits as 250 with frame rate as 48000 and frame shape as
> 125 x 2 and For second combination number of bits as 500 where frame rate
> as 24000 and frame size as 50 x10.
> Few SoundWire peripherals doesn't support 125 x2 frame shape for 6Mhz
> bus clock frequency.   They have explicit requirement for the frame shape.
> In this scenario, we will use 50 x 10 as frame shape where frame rate as 
> 24000. Based on the platform and SoundWire topology for 6Mhz support
> frame shape will be decided which is part of SoundWire manager DisCo
> tables.

Makes sense, all of the above should be added to the commit message or the code comment, specifically the 125x2 issue with non-conformant devices.
