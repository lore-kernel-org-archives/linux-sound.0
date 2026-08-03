Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B449F377574
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753363; cv=none; b=IXBlMmkml1UqJq2ETuEuwfPzQZEIdc8harm07fxrKSCLhAT0lhPTddQGxJNkTDxtiQgPAlXqxkz6NZXb6XXQ+BG6dJryzI66QyRASNFeZcJVIFYukLmdEJgH/vMQ2qFa1dA+BgwGOhliG5eBAUOevJttSrawC7nkW++1e6O1rFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753363; c=relaxed/simple;
	bh=jL2WYUn1qRZswwsMYSTi+yqj33OwzmCVAYiEfy2TKSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/SFMvIGWxOp6ietJae51dd5dJbemrS9WA0EFWEwDWvBSESbY2B+wM310avB6Xc/ZAE8JhK1LpErPb/Pej5BpdmM42YsR/mpDiWXjsCTtWMGpliCjli5ByLU2HE9tvve8WaoVAy3G4W/tpJzCgAn4hcpYp+EFWQlfr9+ilv2+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WhfiX9xG; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WhfiX9xG"
Message-ID: <dceba070-0304-4d08-bf11-acafd63270ae@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785753358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kFZ334nDjz62DX8KsVS4q8jzQu/MSj4ba0hWYezNZC8=;
	b=WhfiX9xGlCPDaKP2fATYmaktqrt8GpDZ5ZBxQFlQIFmq2SiRxLl06fSYeD+PmfM0NQSu2a
	hDKQ16KNHmnzHoOqtbIbfLHKRXnH1Xtq7PrL/WZw5lOlDaDGoRxsmWz3N3xAsmRenrreI1
	K+xuRiNifc+I/bYR5TovRZBXj2wm5dE=
Date: Mon, 3 Aug 2026 12:13:18 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: SOF: Use high-priority workqueue for PCM period
 elapsed
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, yuhsuan@google.com
References: <20260730130445.8277-1-peter.ujfalusi@linux.intel.com>
 <c1ed5264-9a03-4436-b17c-8c1f59289b5e@linux.dev>
 <f51125d2-b961-4224-81d0-86e622c00ace@linux.intel.com>
 <d8e791ba-ed68-4c42-8ce6-fecf7af4c699@linux.dev>
 <ff12793e-1afa-449b-a19b-5c6f0cfbdb94@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <ff12793e-1afa-449b-a19b-5c6f0cfbdb94@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


>> Could it be that the level of priority should be configurable (Kconfig,
>> sysfs, kernel parameter) to let distros pick what they need?
> 
> I guess, it could, but what about the graphic, network, touchscreen,
> etc? Should they all have the same way to select?
> 
> I think audio is a bit special among devices, if there is a slight
> scheduling delay it will be noticeable.
> 
> Not saying that we should not look for other cases where it would make
> noticeable difference, but using high_pri workqueue is not uncommon
> among audio drivers where the period elapsed must be handled by a work
> for a reason.

if you do a search this workqueue is actually used only 10 times in the
entire sound/ directory

https://github.com/search?q=repo%3Athesofproject%2Flinux+path%3Asound%2F+system_highpri_wq&type=code

Again I am not disagreeing that audio is 'special', just that there's no
real precedent for this move and that deciding unilaterally what's high
priority without looking at the rest of the system is a bit problematic.

Anyways, case closed since the patch is merged...
