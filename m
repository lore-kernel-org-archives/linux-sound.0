Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2070C3043AD
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765449186; cv=none; b=Oz6vUplsXms1YSwzdqhMjkz6KzD5qZgWvvFjmWaUN+1ixIKaAKm/mYqACnABb5jX5D9+JIjmlGpf7FpH7Wo9yQW52MVqAh6GiTCT+p9hZGJ+lC+l49mMZin71y2z3+FjBgcb1rNhus3j9me55hC2JIDJkHzKL7PX7gvTyJC0xxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765449186; c=relaxed/simple;
	bh=IodMGFVHz5yTmisJzHHdwG3fVyiIgeLerhAmjZunY5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHLWZJ4/ucM/V3JHIcu/w9hufL2bPq92olMRTFpf2JzoHoTSGKplM+Qrjh2XFZquRWRvIOWfcbJrQrn87N/06Sv4GEXEKZsevPC+WnvzGdIL5WvCxNXNI9IrJhLPeAworH3PWly5sSpe2FoRHlu9sH+Y5NDNtiJhRrhKQosZYdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBBTZtZd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBBTZtZd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325A6C4CEF7;
	Thu, 11 Dec 2025 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765449185;
	bh=IodMGFVHz5yTmisJzHHdwG3fVyiIgeLerhAmjZunY5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QBBTZtZdLi7CL5fSmoKSaAM458tJJBEJmIblzbEopGuMK7ICclqzT7vzQ/Tpq1PCk
	 Cu4DTPU7YpZeBUKaPeMlQtW+Y3YiqStQLE533VOKGQoYFCrcY5/Ej0qqz8848LHupJ
	 V8W6XezT/P7EMY+6IGjKyF3jDbpMCrZAsRuUx60BXqqyjk2czsRCpaZdds/ciImmYd
	 d98vVNAnoQ/QegGHmduWysberFa/9CQx0hnnnhtl8H5no3rPLNwQU9hj/c+yguFGkt
	 mdNdagQ6rSH4eM40xA+p09KQxwHcSYRq529FAs/M3FRTNETg+6UEF78Pl2CFCjNUDg
	 J+btizSr2cFzg==
Date: Thu, 11 Dec 2025 16:03:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	broonie@kernel.org, yung-chuan.liao@linux.intel.com,
	lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
	shumingf@realtek.com, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 5/7] ASoC: SDCA: Add basic system suspend support
Message-ID: <aTqd3omCzmFuTJ7l@vaman>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-6-ckeepax@opensource.cirrus.com>
 <02bc8d1b-ae25-4398-acc5-e5779c245a3c@linux.dev>
 <aTmHBbS22GyoH+RB@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTmHBbS22GyoH+RB@opensource.cirrus.com>

On 10-12-25, 14:43, Charles Keepax wrote:
> On Tue, Dec 09, 2025 at 12:11:27PM +0000, Pierre-Louis Bossart wrote:
> > On 11/25/25 15:21, Charles Keepax wrote:
> 
> This is definitely up for debate, my primary issue with allowing
> firmware download at the runtime level is that SDCA gives you no
> way to tell that the device is ready to rock. The only way I have
> been able to divine to do this is to wait for an FDL irq and if
> one doesn't come within a reasonable time out move on. However,
> that waiting would add a considerable delay to runtime resume
> even if no firmware was downloaded, which feels problematic.

What is the typical time to have firmware downloaded and get the irq?

> I guess my two questions would be:
> 1) Do we really want to support downloading firmware on runtime
>    suspend? I am doubtful it is really usable due to latency.

I feel there is no way around. We cant do this async
Best is to speed up loading by having firmware cached in the kernel so
userspace delays can be avoided (unless ofcourse it is humongous size)
If device needs firmware, we have to download, dont see a choice here

> 2) If we do, do you have any ideas about how to determine if the
>    device needs firmware?

Driver should know and first thing in resume, download the firmware,
maybe a flag in device properties?

-- 
~Vinod
