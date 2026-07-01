Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAFA3C8C49
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 12:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907238; cv=none; b=fNe61yB3gJbmAZPAtGkszv5o9MeypzTjxMZSCqjeL+4sRbOkYgG1HIlgUAhBRxNN1Xev380Vhb/kHYFMqFtPG7MlfdIJZYT+RytSldGE5hO3gylM9OcSvijzQV/kW9NXNaX76HgzYnL6dR/V5lpL7H3JNPizeA9E5WWRxMK6QBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907238; c=relaxed/simple;
	bh=KfQJkFdIWuH56FfvdvvoedGEs1vEw9u0dARLgvBDO40=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GQ+9FlsRPXoeHdNXXiegFyTjiGD+YjmokY+m3Ack+Bg1N8PdQRUEjAPS9epSoS7EGb3kykR1sO06sdjUk76O1uuQ4B39AS9ZTCSanCMx56UVZahBcIUlnUU6+q7RHmmSqIwYn/sbMkcXhDLvXjfBECIhTBSKcJXzFHyFIuh1gys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GnwpUc8y; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GnwpUc8y"
Message-ID: <7c8e8242-8850-4664-b3ad-1099ac83c8c1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782907234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t3x3erSB55COq311rSjtEdd3AoCyqFJrxEAWva2yG0o=;
	b=GnwpUc8ymzuCjDGozOWOm+/16GwXCwegnrmQN8FbdjzrajK4Q84Kaqa/TPcf4pNLhfNyJ2
	BDTRhGYAvBXkUut8CfNH1pIEIs7Hi4dG+rH8XmPTIT64moFbGvnf7zu3Twf4JOwPhk6bnq
	OXpXhS81eLvvRpSfd2Ds3LZ8+rChOcI=
Date: Wed, 1 Jul 2026 14:00:31 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 "Liao, Bard" <bard.liao@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
 Richard Fitzgerald <Richard.Fitzgerald@cirrus.com>
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
 <20260629144450.2096823-3-yung-chuan.liao@linux.intel.com>
 <11f8d158-9ddc-46fc-9cd5-11a696d3413f@linux.dev>
 <SJ2PR11MB842410EE22537B0673173EECFFF72@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <520f67ca-941b-4e08-8985-03f0e09b0313@opensource.cirrus.com>
 <46af3cdf-d704-4cd2-bb24-cbe9fb1303db@linux.dev>
 <e326c51a-4690-44c4-bf3d-0870591b1eed@opensource.cirrus.com>
 <74bb6575-7d92-43af-98fd-dd46a83b2fac@linux.dev>
Content-Language: en-US
In-Reply-To: <74bb6575-7d92-43af-98fd-dd46a83b2fac@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/1/26 13:55, Pierre-Louis Bossart wrote:
> 
>> If the Manager doesn't send a clock-stop, the peripherals don't get a
>> notification that they can enter a lower-power mode. The clock suddenly
>> disappears without warning and without the peripherals being notified
>> why, so they don't have any information to know what is happening.
> 
> that's not quite right, see below.
> 
>> The Manager should send a clock-stop notification before stopping the
>> clock.
> 
> That's exactly the existing logic in drivers/soundwire/bus.c, the core does notify all peripheral drivers of a clock stop transition.
> 
> sdw_slave_clk_stop_callback(slave, SDW_CLK_PRE_PREPARE);
> sdw_slave_clk_stop_callback(slave, SDW_CLK_POST_PREPARE);
> 
> These pre- and post callback that can be used by the peripheral for imp-def actions.
> 
> I am not sure if the POST_PREPARE makes sense, since the clock is already stopped the peripheral cannot be programmed. IIRC it was added for symmetry.
> The PRE_PREPARE is most likely what you are looking for in the implementation of the drv->ops->clk_stop callback.
> 
> Hope this helps!

Oh and in the case of a system suspend, then you also get the notification in the driver suspend callback. In that case no need to be notified of the implicit bus teardown, you can program the peripheral to enter lower power. You do not need any clock stop mechanisms to deal with system suspend optimizations.
