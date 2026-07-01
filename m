Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54D448096F
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907071; cv=none; b=d4fpoB3DTh1BFfUJbZpwrHbb5X0sH9IZt+tb6XLn5c5Lg6lHQrNWZLXWZ3BeYFisoHmcqySd4Wtz/Jxgs1bALGRFMwgtszfUjq0sqbUvgoYzNq3xw1KgGtAJb4roZa2Ek64aMNqHc+zLoMj8OaYLKooaFhidYbnvmGBU37toZaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907071; c=relaxed/simple;
	bh=agWTOqYQFeVMxpuTePasPYOR/Yfz06h5htSGKbV/Tak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALT2JE/kXnMsYSBlBoR4qMWEfJlh2Y34p6xUoYzpDz0y2B9eViIrvTgo/+0Q9egsHyj2BJ8FE7W+cMwuSBFOOF4sfKSmgfCWAKO4/nDUhETjy0vTGmZBv1ZEnD8qg0UdEUYTMud7NNpHBwe2FSExdIwnu38C2cf9OpYqFdVRPLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YyGlhqDX; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YyGlhqDX"
Message-ID: <74bb6575-7d92-43af-98fd-dd46a83b2fac@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782907067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=agWTOqYQFeVMxpuTePasPYOR/Yfz06h5htSGKbV/Tak=;
	b=YyGlhqDX/gGe5BRl3L8gHuzqP88bhFxmMouM3XNITp7KXzE+KuMDeXWgKYIbVqGnWJB6s7
	FmawNEXudszuFjo/cR9PBLtL8lf/qnGlLMNS2D0DZQ/u7g/iJ3GdTVRZXzBI/V5YCud6FN
	PSyHPlZiNJf3y8gAAxwMcVarz1gp94Q=
Date: Wed, 1 Jul 2026 13:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <e326c51a-4690-44c4-bf3d-0870591b1eed@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> If the Manager doesn't send a clock-stop, the peripherals don't get a
> notification that they can enter a lower-power mode. The clock suddenly
> disappears without warning and without the peripherals being notified
> why, so they don't have any information to know what is happening.

that's not quite right, see below.

> The Manager should send a clock-stop notification before stopping the
> clock.

That's exactly the existing logic in drivers/soundwire/bus.c, the core does notify all peripheral drivers of a clock stop transition.

sdw_slave_clk_stop_callback(slave, SDW_CLK_PRE_PREPARE);
sdw_slave_clk_stop_callback(slave, SDW_CLK_POST_PREPARE);

These pre- and post callback that can be used by the peripheral for imp-def actions.

I am not sure if the POST_PREPARE makes sense, since the clock is already stopped the peripheral cannot be programmed. IIRC it was added for symmetry.
The PRE_PREPARE is most likely what you are looking for in the implementation of the drv->ops->clk_stop callback.

Hope this helps!









