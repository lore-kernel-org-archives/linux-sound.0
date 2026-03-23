Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CE4381AFC
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 21:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302663; cv=none; b=i/eM/yKsxf3glRzodbDIqu6oUFWnr69mRjKYg03MPb4tJDjky7raQYE7zxaSVAw+9WfiQBvyNSiHTE0Jh63gf8JRRpT0+C5W1e3TqF1fgzmHPCfEBqYg+qxuZf0XVarktt8zehVV4Wn0BVN/mm86AAp6yAvQg5DfYqYJoogI2vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302663; c=relaxed/simple;
	bh=oEMwX9u/ielIWalbTkzwx00uPm4rzkb4cWlR/6aMpeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBe9XWZQTuuTN0srgNcjZhumRA/jTqXudWd8n1SLpiE1t3CeAsQFqHxknr5fuSOf25OPQeDw+hwUB+1utGHqlVV1SeTuSerYxDG5RnrViblGkhEDLsgz6Z/aHclGeO0xKpDn+8935N2icWT4Bbg4gmE5XT61VPSkECfqpr18v/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wtup1Zuu; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wtup1Zuu"
Message-ID: <ed200936-ce49-44a1-a442-541b69f46f8a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774302659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=arWGAIFWNbndNfZrmty+95oqOviZHNmvOVfPdxzlYWg=;
	b=wtup1ZuuXrh+auqncEuAV1Qxgqz45EjOw2wVsYs5gk7MhcKyrwjOo2GKHN3fVJKqvApBjk
	rXTSybMfcMhQn4WNWnZG4sqTGLphq5ZmDx27fUFLWdHBfVM64+Wh5IU2VS1vqI/S1gb2yQ
	2MOUj06hT78kEUghXBnTWeB/sQ3fgtE=
Date: Mon, 23 Mar 2026 14:44:56 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 3/4] ASoC: sdw_utils: TI amp utility for tac5xx2 family
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
References: <20260323041624.2120-1-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260323041624.2120-1-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/22/26 21:16, Niranjan H Y wrote:
>  Add TI amp utility for supporting the tac5xx2 family
> of devices to support tac5572, tac5672, tac5682 and
> tas2883
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>



