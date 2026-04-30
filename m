Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4FA346FCF
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536942; cv=none; b=oikyuDghDIGjMSWwnvpQpjKazunOluroRDrxSPE9maA0A/lKo+pwoPx9bznXj9bHQ2N67WDZs9pLiIKVaLjkSD8S9nghSqNKCz3EpbxbBVlzfObuyr5+cgotlqgcA3ZyyRBjMHpJG+JzHhcj3jdlU4UZKsXoDOSDxAmp8hNFt/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536942; c=relaxed/simple;
	bh=4BtmSROXrgJ3uYaIivsNKUAZzGBNSL62GrG1BUWaHvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vyn+TtfnG6a8L739Hp9VtwLQ2ieRiiYS2NTmMkxxOck2rkHbkmDN4uANAPFkc8hCPh+wiicyGfRJucTdkF/S1UjcXHyPYJ2kuXhVKrNnBROr2aVMd8zS31LMiRFGaulDMu36k37wis6lXMiFL9+ln1pcc8mZqNOno8Hvljnh4Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HlLLxdCg; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HlLLxdCg"
Message-ID: <425da74d-159a-43c6-a205-c404d0c74fb4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777536938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yb6JMqsoHETISacK/WZM7A7l2mq1ilEtNYGXhpKzL/U=;
	b=HlLLxdCgKnIX+WXPcRQsd82TFHnt0zeQ1G+fQhT7Ri+KymKvjcdD4KRFjSq8+MVxaiAaGs
	cZwJZJ2ygSiEQ6UIC84bSMck7arl3DjnvgSgstnHcy0fNDGyDG7T7Kz8DhagMJyYkAhq2z
	mn9HXTOZNlwHzJjj7bZCC9I+8iB9Y9w=
Date: Thu, 30 Apr 2026 10:12:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] soundwire: intel_auxdevice: Add cs42l43b to
 wake_capable_list
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260429153614.741899-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260429153614.741899-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/29/26 17:36, Charles Keepax wrote:
> Add cs42l43b (both packaging options) to the wake_capable_list
> because it can generate jack events whilst the bus is stopped.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> 
> Changes since v1:
>  - Add support for the QFN package of cs42l43b which will actually have
>    a different part number.
> 
>  drivers/soundwire/intel_auxdevice.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
> index 913e95207ee1a..ee951be154657 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -51,6 +51,8 @@ struct wake_capable_part {
>  };
>  
>  static struct wake_capable_part wake_capable_list[] = {
> +	{0x01fa, 0x2A30},
> +	{0x01fa, 0x2A3B},
>  	{0x01fa, 0x4243},
>  	{0x01fa, 0x4245},
>  	{0x01fa, 0x4249},

