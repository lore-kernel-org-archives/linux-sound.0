Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A76728751B
	for <linux-sound@vger.kernel.org>; Tue,  4 Nov 2025 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762272838; cv=none; b=LQOmEGn/xrAoMVSYehXbVjkaD3czTwjK+zuXvmu5K08m9sClFtTuS5GwJX1HX5YVdPhFAjYnLH9WVl0iaK2szWMVRdeUiu+hWlqh80jrceIee3yAzy/AXvqiDnM4aQLrIgPwpI+8mGhw1Xl3fprJabJHxlGz98sHaZzDoQn27pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762272838; c=relaxed/simple;
	bh=l0gqza/13wL9TKhHQa65xdj61+0Nm33d0BCcL0ca4a0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtDRXc7bf+7PHCcYGieVV883MBIPnAtmyJ0n8Y1GlUiRZ5B2f9ZTvjsuROgl8A4CWKqLxMO50JLs77PKNY9Kk1FDuxod4brZEyxMSYYg7HHPD1IJPjrftnx+NEfsryuwa8S6FJdW+qxq8PnQDmHznP1+y9jyzyavJjtqR3S2DgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Kd+VF/Mm; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Kd+VF/Mm"
Message-ID: <382ce438-5251-4d4d-af44-863197c77b94@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762272833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mThExexEsdmLIBa5RGYB+2IyiKeHuBXNXtGY6S50+f8=;
	b=Kd+VF/MmLgyx0dTtwjmlIyRPE/aAyGKfwY+I8wN9X1AJ3lSrDRfiMmvBRer/rQ/kIj2zaJ
	nRzdWNV2x5wZb4uCkeIPtwtn1ExtU2yMH830UGJ/HvOXMwPFFwRJ/y2PvBf7r6D4rbsA3S
	A5a2umh/dvu9bWDrYxOqTwQfnyMBFgo=
Date: Tue, 4 Nov 2025 17:13:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
 <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
 <aQOEREIJ8TiwZHef@opensource.cirrus.com>
 <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 10/30/25 16:36, Richard Fitzgerald wrote:
> On 30/10/2025 3:29 pm, Charles Keepax wrote:
>> On Mon, Oct 27, 2025 at 04:02:54PM +0100, Pierre-Louis Bossart wrote:
> 
> SNIP
> 
>>>> +    pm_runtime_set_autosuspend_delay(dev, 250);
>>>> +    pm_runtime_use_autosuspend(dev);
>>>> +    pm_runtime_set_active(dev);
>>>> +    pm_runtime_get_noresume(dev);
>>>
>>> This seems odd, I don't recall that we do something similar in existing codec drivers.
>>> It'd be worth explaining the whole pm_runtime flow.
>>
>> I suspect that means those codec drivers are broken :-) at least
>> if they actively use pm_runtime. The first two enable
>> autosuspend, that is suspending the device after a short period
>> of inactivity. set_active tells the PM runtime the device is
>> already powered up, as it is. Finally, get_noresume takes a
>> reference, this will stop it powering down immediately once the
>> pm_runtime is enabled, it will waiting until we put the reference
>> we are holding.
>>
> Other drivers definitely do that.
> For example:
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/codecs/rt722-sdca.c#n1544
> 
> (the other rt drivers are similar)

This rt722-sdca driver seems wrong, IIRC we aligned all drivers to do most of the inits in the driver probe, and then the only thing left to do when the device attaches is the set_active/get_noresume/put_autosuspend.

See the rt711 and rt1308 for reference, they have comments to explain why we used this code pattern.

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/codecs/rt1308-sdw.c#n709
