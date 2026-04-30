Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A44C3FB7FB
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536939; cv=none; b=pUCqukT6sOuzzbUiTinFrOXY3xe8hTcPxmlDXhBbV9G3DzkSbPujXJM6qras2Mj7m/8cDamPqR1spJJc+bhGszve52q9JbAmyxwKfu3eaoKlzkPRnwWIiApCvkS7vaoo//o+qsw2ngDAfEZpxmMgqeq8wcywMexEDojfw72iO8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536939; c=relaxed/simple;
	bh=QYwBfh9aEBJ9xg4j1MA/bTv/P3S7AzUKoot7jo/SreY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QufsEgTtT++rTX/sCv0pUoQHL1Jslq/izS0E0kPWA2YxKf8iRZ/R4hsZ8bKniH1GbC35z0hPnubUP9wn7hO0SZKZ5v6N6bTv8wwojQKf0ZzBw1bDct4fYdcpSsWdQEnlMf6KuhQ2wE6CY5Ay+UxdLd7if4CtyZ8GSZ+08jbtPqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GnjA4++a; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GnjA4++a"
Message-ID: <cbf1eb3a-7942-4a90-af5c-a6608939e823@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777536935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4BB/rp3teQQUnAQhlKRqakS49p5e4PIX3xc/URT70Vw=;
	b=GnjA4++am1W8qyBm5ejDFdLzfcx0U0go45eUWc3q8tIvblSSEzznY+PvYeQZqUb8bELynV
	kvVIAgoWaML06Hed5foUrWrkmJO++1RjMmJHkVysZ8t1m/9U/AcMvJs8OzDTkIcmJGIcrX
	SK77PS1AgC3nNBt1kUXqMm/dfDnFTt0=
Date: Thu, 30 Apr 2026 10:09:35 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Improve SDCA support for duplicated features
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/27/26 13:59, Charles Keepax wrote:
> There are some short comings of the current SDCA class driver with
> respect to duplicated functions and jacks. Fix some issues in the
> reporting of jacks when there are multiple jacks represented in the SDCA
> topology. When a single device contains multiple instances of the same
> type of SDCA function the current class driver will create duplicate
> controls, update the code to fix this. Finally whilst working through
> this also tidy up the handling of the sdca_function_desc pointers as it
> turns out some duplication has crept into the code on that front.
> 
> Thanks,
> Charles
> 
> Charles Keepax (3):
>   ASoC: SDCA: Add correct masks whilst reporting SDCA jack status
>   ASoC: SDCA: Remove sdca_function_data duplication
>   ASoC: SDCA: Support devices with multiple functions of identical type

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
