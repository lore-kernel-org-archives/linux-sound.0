Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F18E1F7084
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 20:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280773; cv=none; b=qFr0PTixdPHjRARqslg1ktUzMQKeGkPvQkWp2csEfg2kgvbSAKWfH8/G2bSsAqLC1X08crLdwkumrBe1e59NTPq3Z4nEetO958SDcMzJe4ERLv8Rj0afesc42jHBoW5AXlTAfxpJpZHnjlv6n2dITO9O4p6UnG6s3wsWYUxs4EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280773; c=relaxed/simple;
	bh=tlsY3FbqN2ZDSA+kYTYWuLuTn5rmlIKFf1MQGkZ+vfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SanFpXCHOkL3dD50+xfkNizJXzt3//DRl46dRl/XrgZqxLcbSFFSX3uGEtkhkUpVMhGJkUr4HB0BCI4g89XMNjWKcj0hyhaBRYv6G1gBrEqTE2G3hLMamRYtwHbanZkJXUB/JNZ2EAec8zkpYirbZ8qi0qsm00ruE/0cKmZyiaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xVlBbZgG; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xVlBbZgG"
Message-ID: <8780fa77-d51e-4be8-bdb5-415ddb03482d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736280770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17c/M9Y4qnsonmzrTECV0F/b2SkVz64Rsqws5s/i5no=;
	b=xVlBbZgGknnfJNtW5s6lu6ZSkxBdfgZ0mySqkHYiO/kB9dSVlqhy0Qj1xLs2wTtcqaiq2n
	bhAO/z+WtZtHIDq5OmYXwJ8HIVRq0WTv1J0q49RhlmVCwi5ntxJ/l4Rbbagh2BYxm9u7da
	mue1rurTdwJaPGTzbEf/lYMGaIB6Vyg=
Date: Tue, 7 Jan 2025 14:00:11 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/6] ASoC: rt722-sdca: Add some missing readable
 registers
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 vkoul@kernel.org, oder_chiou@realtek.com
Cc: jack.yu@realtek.com, shumingf@realtek.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
 <20250107154408.814455-6-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250107154408.814455-6-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_USER_FU05,
> +			  RT722_SDCA_CTL_FU_MUTE, CH_L) ...
> +	     SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_USER_FU05,
> +			  RT722_SDCA_CTL_FU_MUTE, CH_R):
> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_XU0D,
> +			  RT722_SDCA_CTL_SELECTED_MODE, 0):

nit-pick: maybe we should have a shorter macro when the Channel Number is not used? Using zero here means there is no channel-specific control, not an explicit intent to program ch0 and ignore chN with N>0.

