Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148061EF0BE
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678088; cv=none; b=VDe0GoFWLh3oy/2nyjqf8ufMBIb2dNyPbeFWdYqfp5oiEzx2ywhmg/HC+kCTlwBhCJRD31i+d6I+5jUKfLcfCBUC9n7Bku4L3f3wbwx/FwdRl2z/CIvFIgcO7ZiT7SB4542aVWSFvjM4PqTGzCXx9HawMdMthMWcxeP85Jw/XMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678088; c=relaxed/simple;
	bh=cOmDykei9Cm7nLKluv0DUi7uQOLC9uWZlCQAl+Jq8/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJgZYO7Q21aWdthFThFCvRWXxVE5G8G5oj+Ct3o8pC+mygoKN3sz8w74T15Q06IG4qvWDNlNejOSw/zyNlx157ZSOMkVFHVB6FOxRjChGj2MY6MSE5qywkthqYNZ+7ZqFVmIs70QkJXeh3emJhX8tYjrsTWqqPV2qVrS80nWgAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aKayqRjM; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aKayqRjM"
Message-ID: <22497ec9-3e10-4b87-ab1b-723c735a16b9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747678083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V55u+NYAK0ljTgA/XMyO1AqZE/JHUahpku1FDxJoGnk=;
	b=aKayqRjMxVB+S6zH83FXfKou4MqKlrwvKiNtNVhxxlmeW27AtSk4w7rAZWnMcM7EzDusPU
	6ttiWjq+tKPqKkPbKMfUSqsFCjQD/aNgoDn4bpmAh6009nSbEwaNe0w+09FEfAAC+F8QPP
	iCoV57pPmfaktBgLTPd38aGAENwMRrM=
Date: Mon, 19 May 2025 20:01:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: rt722: make regmap cache-only in probe
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 Vijendar.Mukunda@amd.com
References: <20250519090645.2620292-1-shumingf@realtek.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250519090645.2620292-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/19/25 11:06, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch makes sure the access to the codecs is cached until the device is enumerated.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

