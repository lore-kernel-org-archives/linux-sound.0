Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2929D243964
	for <linux-sound@vger.kernel.org>; Sat,  7 Feb 2026 13:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770472476; cv=none; b=YkBWSgzr1ECrJdmxkfgpJrW3fPH+sD75C63RJVla3TwPMXZStceD/z1PbjT+y4KYEIa8ydmXYaeN249pWwwhW3toEGFw1dEHmZRjXod6gaYGtz6w2R6DUuDJgUQAhzKU/b0U3n8XWUWpJX1hqAd+ouym0wm+pJGafuKbT5gpkXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770472476; c=relaxed/simple;
	bh=yPZ1H9UX6jrJZ+xkbuY9UtMgjrVpIJPWO+9WUBGek1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bxy0xMoNm2IZwT7N2TKNQrIp3y9b4tBmmIb6aoiafDDlDmW7Slc27y2wBAZKZer46zBLiosTZKqagvqQsytvTs8Kfgzw/x+cBNgmG2EdH7hVbymHTVRCl5ZAetM2o74eLd+mUpqtVkZMxq6WTjrBmKCjLnNFMJQyCY6Zwsfe7hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lWDk4YLq; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lWDk4YLq"
Message-ID: <34aa5902-8bb7-4f44-a80b-2f2a7a21c1a4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770472464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T99mCHGrU1RYvFo1gVA4fmYGgq5q8qjtGkD0dI0GPwc=;
	b=lWDk4YLqYNk2uXU2FWxPszJZ/GElsWr9qQpmgjbzrfH6QCrvFeZD60xArqowSG7hh0dNac
	qt0IFuRsOuBCbUQtdGzlxjYmfADSYKbV5gQ8PV5Bl+BBZGjjfdnwxqlMVbk2IbXJOC52RA
	jl7iO8RaPVn9Un9jvqv7cFPtVAQQRSE=
Date: Sat, 7 Feb 2026 14:52:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH V5 0/2] soundwire: amd: clock related changes
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260205164539.892403-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260205164539.892403-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/5/26 17:44, Vijendar Mukunda wrote:
> Refactor clock init sequence to support different bus clock frequencies
> other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
> 6Mhz with different frame sizes.
> 
> Vijendar Mukunda (2):
>   soundwire: amd: add clock init control function
>   soundwire: amd: refactor bandwidth calculation logic

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> 
> Changes since v4:
> 	- update commit message
> 
> Changes since v3:
> 	- drop unnecessary debug logs.
> 
> Changes since v2:
> 	- Update commit message
> 	- add comments in the code.
> 
> Changes since v1:
> 	- Update Cover letter title.
> 	- Fix typo error in commit message.
> 	- drop unnecessary condition check in compute params callback.
> 
>  drivers/soundwire/amd_manager.c   | 109 +++++++++++++++++++++++++++---
>  drivers/soundwire/amd_manager.h   |   4 --
>  include/linux/soundwire/sdw_amd.h |   4 ++
>  3 files changed, 102 insertions(+), 15 deletions(-)
> 

