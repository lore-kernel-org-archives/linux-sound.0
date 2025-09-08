Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC542FC025
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333680; cv=none; b=LpndPXbsAgTxEnAIM+f37mNXkS9mfYAtKIAdmiQ89yXfRjFluS7s6b1hvAePv9k12hqUhbr0Yb+a/Mh63LFN07s0Xjr5pY4GWccVT9aHBf5aInSxNd/lrQ3zD1vwxrQB12NDw4qxuCePmpH+yYwubuCUyVyP1+M0qPiGU2bjoyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333680; c=relaxed/simple;
	bh=Z1I6OYo011DvrH/3+qDcaUrpy9tn3dyDIoaZKZTKruU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCWURMscc7sBp/8LhfHTiZ1lVIHsA3IlN+H43NacKN4fz9T7uE3nrZKjiV7aTbT+NeINGoJoR7GBCqVdlmVYhpdg6IxwsQuwAtodhzy2m/CAcv8dqhEXC5i1rNTlbyTAnH6/rtcQ2cUoeO706PYU76FWNvJDdBxn34HTjAUMIOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Cap+YK8I; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Cap+YK8I"
Message-ID: <f5716cc7-8971-43fc-a646-56a9353fbab5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757333676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YbxS1LwYllSceCRPDhdRGcjqrziChiHEXiloEHeGirA=;
	b=Cap+YK8IV6OP95swLsyjzgxwwVto4O7zFLcgkr7C2gsfGQnZ9GvBCGzjRZOd/l7ZsckrRu
	KnHioVwGy4Qc5icTBI+wqwIA1tr72S4qXVdbr5xFWY6nVGs6Mq+idPjVT53sLglXPoU8oA
	hUyGI/qZCemxopBhLreF8acGiUKRISE=
Date: Mon, 8 Sep 2025 13:42:40 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 02/15] ASoC: SDCA: Add manual PM runtime gets to IRQ
 handlers
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-3-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250905143123.3038716-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/5/25 16:31, Charles Keepax wrote:
> SDCA interrupt handling is a bit odd, the SDCA IRQ registers are
> defined on a device level but the handling of the IRQ is at the
> Function level. As such the regmap IRQ's PM runtime operations need to
> be on the device itself to ensure those registers are available but an
> additional runtime get is required for the Function child when the IRQ
> is actually handled. Add the required manual PM runtime gets.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/sdca/sdca_interrupts.c | 42 ++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
> index 79bf3042f57d4..6775f0f7b5659 100644
> --- a/sound/soc/sdca/sdca_interrupts.c
> +++ b/sound/soc/sdca/sdca_interrupts.c
> @@ -11,7 +11,9 @@
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/device.h>
> +#include <linux/dev_printk.h>
>  #include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_registers.h>
> @@ -86,18 +88,25 @@ static irqreturn_t function_status_handler(int irq, void *data)
>  {
>  	struct sdca_interrupt *interrupt = data;
>  	struct device *dev = interrupt->component->dev;
> +	irqreturn_t irqret = IRQ_NONE;
>  	unsigned int reg, val;
>  	unsigned long status;
>  	unsigned int mask;
>  	int ret;
>  
> +	ret = pm_runtime_get_sync(dev);

what does 'dev' represent? The SDCA function device or the parent SoundWire peripheral device?

I would think it's the former, with the parent-child relationship used by the runtime_pm framework to resume the parent peripheral device if needed.

maybe use sdev and pdev as an arbitrary convention to help the reader?

> +	if (ret < 0) {
> +		dev_err(dev, "failed to resume for function status: %d\n", ret);
> +		goto error;
> +	}
> +
>  	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
>  			   interrupt->control->sel, 0);
>  
>  	ret = regmap_read(interrupt->component->regmap, reg, &val);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to read function status: %d\n", ret);
> -		return IRQ_NONE;
> +		goto error;
>  	}
>  
>  	dev_dbg(dev, "function status: %#x\n", val);
> @@ -130,10 +139,13 @@ static irqreturn_t function_status_handler(int irq, void *data)
>  	ret = regmap_write(interrupt->component->regmap, reg, val);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to clear function status: %d\n", ret);
> -		return IRQ_NONE;
> +		goto error;
>  	}
>  
> -	return IRQ_HANDLED;
> +	irqret = IRQ_HANDLED;
> +error:
> +	pm_runtime_put(dev);
> +	return irqret;
>  }
