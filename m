Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC2B2882D2
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752602322; cv=none; b=JaAvyeH/YJgyWcz1ToezhbKMH2PBi6n7O4LRPbXspAtzZEdstk6d8QbUa4bLU4IRT/B8FIoumpZspF2vasiW+yWkOGjpc+x8Rn82LUDPzUhH0mG2UnIw/00PkaBbq4hZH/eaGB+X67sCcpXY6kTeIAid/zGllfc5m5ip7QZ45zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752602322; c=relaxed/simple;
	bh=TrD3Ym8R5itG0YjpPT/UdEzpOcDh6QUYG5sDdBbX8GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvKwIpcTG46gwvrkn0iFGTs5tSfge5qcwuV9RQgcFWMO3U+8gDn/kDChSwQbeMiX76Xa+gfK6dr+CW8H/dNmBeZy/wl/QhL88FALoKm+Wmw5hLfBhn+kE0BqB60/zhFmpeZ1d3xJAZxHNJlM37TWwMCt9FnRZbg4ST36UFEY5lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rTFCbM2h; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rTFCbM2h"
Message-ID: <4336e9c1-e05c-46d6-939a-53fefb8f9a14@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752602317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrD3Ym8R5itG0YjpPT/UdEzpOcDh6QUYG5sDdBbX8GY=;
	b=rTFCbM2hM7PCsDr5w9WQgt9wqxkYG3quZtbZfmpiVzW+M3NTjbbPwV+DpN4rOs4v4F48eZ
	YvfuUwPRcpKHN8ynV7sPczD77505R4u2ol4u1BF0CMFY8Lq4pxVFQC9kiEq8ljUllAijJA
	RBaB9bhdYgxx+jxWkxr5kMDCZ1NKIVM=
Date: Tue, 15 Jul 2025 19:58:32 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] Add SDCA DAI ops helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org
References: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/7/25 14:41, Charles Keepax wrote:
> First, a couple of minor code fixups to already submitted code. Then
> some patches to add new DAI ops helpers for the SDCA stuff, these allow
> configuring things like the sample rate and finding out which SoundWire
> port should be used for a specific SDCA streaming input/output terminal.
> Still a few bits of outstanding work here (propogation of Cluster
> information particularly) but his should be good enough to get some
> basic use-cases working.

For the patchset:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> Hopefully we are getting fairly close to completing a first version of
> the SDCA work now. Should be one more series to add FDL (firmware
> downloading), then we should be able to send a first version of the
> actual SDCA class driver itself.

FDL is a very desirable feature, but shouldn't there be an UMP (Universal Message Passing) layer first? HID and FDL rely on UMP.
I would have expected the ownership changes to be handled in a shared UMP library or set of helpers, no?

