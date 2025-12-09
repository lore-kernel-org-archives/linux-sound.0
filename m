Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7CF328B55
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765285546; cv=none; b=HC48RyGQphfZWNk86E7v3KKmVHYeJubEVZ6RmskyEVTTT+rU6OF//z4JLClT8XcEvluGHM9TPiFACstykT7h+m3rx87GKAdIOP9/E2RG6QQWbP11ut+ZUEbF/vH+qPawD5u3/FXjPGnWEFm75qI8qRUZG11ztDYBbthzvm87VKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765285546; c=relaxed/simple;
	bh=uxPXb6TbpQrqnTJvS7ldbaYwjE4NR5smi6VaGg0tcRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5g+UdSsJCWpzHN5irGQIxMIvgUIYQ75ktpVlthaIygu5uZPOa6TTjhNIGPTG352YJ2jQo318EtmRmGk5CkgvMNbaf286DC8Ungx2JOgoPfBghP4TB9PaErZstAFGyzrn7mXz6QyuAPMAq5vKnnCbJ4aJPpvQf4iKH9C5rWrBMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lcwWHF/z; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lcwWHF/z"
Message-ID: <9e306719-a954-4ff4-b2a7-5fbf4268929f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765285543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uxPXb6TbpQrqnTJvS7ldbaYwjE4NR5smi6VaGg0tcRo=;
	b=lcwWHF/zBnPSx5iJ3wPCgiVl16pxW4zPkc4MtTbQk4ECO235AzTh7fHgI+VevaZv0qwONC
	iZYQf0ow+0d+EnQKKXWdIEXtAzHd9miiV/EgHMz/Vw5f/Gass8xEuT6TEQimkk/4rid/wR
	Z8FmuSVlyOtzk07TpBiUBGzP8N3rJsE=
Date: Tue, 9 Dec 2025 12:20:41 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] ASoC: SDCA: Add lock to serialise the Function
 initialisation
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, vkoul@kernel.org, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-8-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20251125152128.274808-8-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 11/25/25 15:21, Charles Keepax wrote:
> To avoid issues on some devices serialise the boot of each SDCA Function
> from the others.

In theory all SDCA functions are independent, can you elaborate on what the problems might be?
I can certainly see that it's not efficient to try and download multiple firmware blobs over the same limited command or BPT/BRA channels, but I am not sure I see the dependencies between functions?

