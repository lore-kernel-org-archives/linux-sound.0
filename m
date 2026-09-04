Received: from mta0.migadu.com (out-166.mta0.migadu.com [91.218.175.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A933F6C55
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510981; cv=none; b=qh0HaZ+EfH72d/C3qTIypqTA8MsAlJe5rLKmAjvNlEAxqRHhlEX/LK3Ba/Rfb9sXOh21wSvvcJCIW3CJT1NYjtQR6wkqCAL5VUyyUgaTrTfe/iXI9R2Y/U5rcQpRlyWf64RSGRr9wTt7iEupuCOGvYd39A7Jg2DWAuZua8P9Sgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510981; c=relaxed/simple;
	bh=0LJHNxhVLG/qYZju6tQaq/vHtC/kswimquYT7U0GHmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IIlTGziWNRAfC/upKc3DEwYoXNPY33hpXNw99aLnWE9Y3tJLVN3pGE86xV8s5/TMNRjGf3WoUC3izC8zztT0DWDXoGyGzgX3oAbuRoM+ino44mOpKezfLLatatE+wojS0EjaiI50bAPKUgQgytoVWE+7flZ7W6X07O+I3JNeVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AS0WGoKJ; arc=none smtp.client-ip=91.218.175.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AS0WGoKJ"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0LJHNxhVLG/qYZju6tQaq/vHtC/kswimquYT7U0GHmQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788510978; v=1; x=1789115778;
 b=AS0WGoKJepIO2wqRo/OQJg4CLU+T0N8pPZOtbIlde6z7odlbb8pCCCc2EEHNjZ/JCDj2AFwZ
 Vazytmx7riicqB9TTcig6SWuaQIUgzVcgk8x1qnIuWTRD8S6eIa9OJEjKPtYmAGLSajX/wXtyfo
 V2XvswJeA3F+EeO9/BVYwnMA=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 361b9677b4cad989;
	Fri, 04 Sep 2026 08:36:18 +0000
X-Mizu-Trace-ID: 361b9677b4cad989
X-Migadu-Flow: FLOW_OUT
Message-ID: <4e445256-f9aa-4cc9-a2e1-fa45500dbba0@linux.dev>
Date: Fri, 4 Sep 2026 09:26:32 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: cadence_master: wait and cancel cdns->work
 before clock stop
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com, david.lin@intel.com
References: <20260901031019.233254-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260901031019.233254-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 05:10, Bard Liao wrote:
> A peripheral event could happen during the clock stop process. We need
> to wait for the event be handled before stopping the bus clock.
> Otherwise, we will get the IO transfer timed out issue.
> 
> Fixes: af4cc917826f ("soundwire: cadence: mask Slave interrupt before stopping clock")
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: David Lin <david.lin@intel.com>
> Reviewed-by: Shuming Fan <shumingf@realtek.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
>  drivers/soundwire/cadence_master.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 6fa3739221ee..c41971f4f177 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -1702,6 +1702,13 @@ int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
>  		return 0;
>  	}
>  
> +	/*
> +	 * wait for any in-flight peripheral event handling to complete before stopping the clock.
> +	 * No need to disable peripheral interrupts before canceling the work, as the peripheral
> +	 * interrupts are already masked before the work is scheduled.
> +	 */
> +	cancel_work_sync(&cdns->work);
> +
>  	/*
>  	 * Before entering clock stop we mask the Slave
>  	 * interrupts. This helps avoid having to deal with e.g. a

