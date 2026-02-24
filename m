Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3A8364EB6
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771931235; cv=none; b=AzMj+pzvle+nIXwFsIox/m/eFm3Bhc/xS7iu2er4bekMhncP/t0rVk/nnLQZqJKP5RwNE6uYJv3MO4DM8Gh5sD2Ak8pjsU0d9EdvTYaxPWTSFTXhJxhDzUyH7Zrf+UGucXyGjewq02kALmNIg52T0VGIwUbPvxZlPTBvdDvP9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771931235; c=relaxed/simple;
	bh=U7/fI9ZkUi6vcFBFMBMk64xAa1PZJFWpvz+QiLrZN8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHQKXZsbF78pF4a5/RfFsDso2HyjOTb3eIGFPFm+Jm/NX/lynB5YQW5QETL17ur3LLIV0ootcmchYH4WJ5tgqzzuz0UJ2aD8QV5H6HPsRPByOySJ2o09PhQvL2pFjpov27jMXktvwsR5qNHUm+s6nDJnJUCUsjOKPaC3dGASx34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V9RLDXAH; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V9RLDXAH"
Message-ID: <3a837f32-018d-4b2c-b308-2504a9aaf41e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771931231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELqBDBd9TH4/kakGcs6RUS4XfAEheAUiOec1hKzwcCE=;
	b=V9RLDXAHSx2cVNAvKw7HWJ2ddldiegM8j3+BVcJiVqf6V9twrSQvG4VC/2P8AIWXcNcor2
	OgucnTb+rMNqockwMIGAr/PgYqBO9rpSO4w+jJ4ef2EAB2EGb8kc8Nxze+xQmHAKr/UxWk
	3tCSfQHqpH36qTA2DO3c9Kdd9otEoT4=
Date: Tue, 24 Feb 2026 11:53:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: slave: Don't register devices that are
 disabled in ACPI
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260223092048.3695135-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260223092048.3695135-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/23/26 10:20, Charles Keepax wrote:
> If a piece of hardware is disabled in ACPI it shouldn't be added to the
> bus. Add code to handle this similar to other buses like SPI/I2C.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Makes sense!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
>  drivers/soundwire/slave.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index f5a3ca3b9dda4..ff763b692078d 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -115,6 +115,9 @@ static bool find_slave(struct sdw_bus *bus,
>  	u64 addr;
>  	int ret;
>  
> +	if (acpi_bus_get_status(adev) || !acpi_dev_ready_for_enumeration(adev))
> +		return false;
> +
>  	ret = acpi_get_local_u64_address(adev->handle, &addr);
>  	if (ret < 0)
>  		return false;

