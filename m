Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474733314CD
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765285538; cv=none; b=WNZK/4S+ot5NZd9P3EAkAJLHPQ1+rwqHgSrVMewqsJj+fA3e+79KSf8THBqzkskiQsOoND6aO8YIq5YsIed6uSDZFtJjif/gKK5NKap9TXKv1/ieo4Hw7QMgBNkjlG4jjUoolMD5Bv3KP2lcI/CmS+iRMXTQMHemlqnJ/kBclb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765285538; c=relaxed/simple;
	bh=NQ594D/I+KyiCT1nrEW1ZCXy9y7Zy6ood9X+M5TLFRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FvmbYbt/T9gHpT2UAoFzgzYbgpxeZaaQxUaAe5DHH4XweOqFJR/Yf5avUQl9a2hjohWPpFwj8KyTh8xV2qlZHt+Sus21IhsX1rdsT4HYxVIvdMwvKWIAzgRcExQmy9iA4J7b92jutLTKzTXTK8OgkTvDvY7SOqBcWuMiie7xkSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hhylam1Y; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hhylam1Y"
Message-ID: <e6307ff2-b8c4-4d6f-a739-3f6a2a19c5be@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765285532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NQ594D/I+KyiCT1nrEW1ZCXy9y7Zy6ood9X+M5TLFRw=;
	b=hhylam1YZrMJUnZyTC01pqptAAet3PQcJM0OwkxcaOjrDs6hdJDSmoC6E7UJxFWtZylzG8
	f3yOxuTkez/FHYnG0OsSqqfZ/4HTI6qwU+yfjL8t+5AQlFd5RXBVmmhr/FAo+UWczZxwbi
	QQ38o1w8odh0u0EGV3zWTn2NZLQtDsg=
Date: Tue, 9 Dec 2025 12:03:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/7] ASoC: SDCA: Add SDCA IRQ enable/disable helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, vkoul@kernel.org, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-5-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20251125152128.274808-5-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 11/25/25 15:21, Charles Keepax wrote:
> Add helpers to enable and disable the SDCA IRQs by Function. These are
> useful to sequence the powering down and up around system suspend.

Can you elaborate on what the system suspend sequences might be, and how it would differ from the pm_suspend case?
The patch itself looks fine but the design isn't self-explanatory - at least to me. IIRC we already disable interrupts at the host level to prevent interrupts from getting in the way of system suspend.

