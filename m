Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34B5283FC4
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770212979; cv=none; b=H/CtdRJ/ceJkzt7MFVAlmuWotHi/ugmqo5lFP0bHzrzZwmLuSiumEvJuI04D7oZNk7VdCtO6H9OFQAkyIII4pZfZXeqHoqn/wtOvBgzuOw3xqEtUgcjOr4xj84u6rTJF/iS2iPYz1pj2F9B+D2jtuIJohb5sB1RqKaE9vM+MzRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770212979; c=relaxed/simple;
	bh=ZiQPfJ7XomN4yCF/Mp1/G+pCQWd9tozx9ytVQgyHPaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DdwFnLswc2fnpmSUQYrdqhHgIhn6xxQIaMqA+9TK2IwzY+1Vm97L98Q49KHnjS3PlIuC05WNsVvlvFauaBAyUeFr5dg7kfR9C2D7dPg9G6zB/2WYEJOjdQWTOfNve+oQqBuosNmRYERN80mfGknT6A65TlJ0+thnxdiVQ23m6B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VPvlZFFe; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VPvlZFFe"
Message-ID: <c886cd4e-5b07-4dca-9239-e9f42f5cd6b5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770212977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiQPfJ7XomN4yCF/Mp1/G+pCQWd9tozx9ytVQgyHPaY=;
	b=VPvlZFFeJTil82v14AIygxYODialuc2FI/aTy6eJ61tAn8U83FrhPcCTpF8Al2aDhGmuPt
	xMjifsCtnclbWgQBTIrOoSTt6AmTibaW3if3hHsxa7voQuVgg53e+wldJLi9+sBgZB4Qqc
	XmtZMeWaMjsuupIJVph6Zl5RFVIG7Cs=
Date: Wed, 4 Feb 2026 14:32:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 3/6] ASoC: sdw_utils: add soc_sdw_es9356
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260204094452.33289-1-zhangyi@everest-semi.com>
 <20260204094452.33289-4-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260204094452.33289-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> diff --git a/sound/soc/sdw_utils/soc_sdw_es9356.c b/sound/soc/sdw_utils/soc_sdw_es9356.c
> new file mode 100644
> index 000000000..ee79fe14b
> --- /dev/null
> +++ b/sound/soc/sdw_utils/soc_sdw_es9356.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2023 Intel Corporation

Please double-check this copyright, this is a new file that isn't contributed by Intel.



