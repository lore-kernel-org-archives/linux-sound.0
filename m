Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35EA227BB5
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 20:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758140555; cv=none; b=iuy3N9POW2TFu4+KsEIEEJwhWObMhwycBTLE1aI7+vin7BAERJhQ2PoOZEupwv/fq5eCfXHp9UmsD/jUOGjHmJjt8Lx9uBRNgQiix85hcGSHQfZ3lxYV/quUZ9vx3i8vlIXPw3JX4wfgml1EdEISBzozIJ+jLg9DCWrx20MOLPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758140555; c=relaxed/simple;
	bh=yD/lg+oP9qfAbdX1OZOAPN2q2yw8DgKnQ3aLtNrCRkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UregnjsOT3jONzRslfR0S+lWhAxW8wogbmZP4RP5OCxiDuO6FSlLZ7c3lYL2dYE+FHfpS9yLhR5cc90vCm9mTD/qlleFpMwDDnRQM2oRkBMD1Sn9jrwGHM7aeKKB7QqKzPSZEvSyyus7Ju5c5GQYJiv/6r3yL+GokNU8RqzmOFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sBAv/O8m; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sBAv/O8m"
Message-ID: <e88ae1e0-7fc4-4915-bf20-564232640c6c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758140551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gtSjVVA/bRUNisSK/faReIR487PK2Eq7c16i8Ue9YDY=;
	b=sBAv/O8mRp3q4R9pNS3nV7kSCYUTD144VBDb4Ula3hV2bGfZMwFdlrTqiGA9lDK1bPlF33
	H4/ee8fb2wf9beDmqW+IvEZfEhyd9VMPcjKi5KeFOSVnFbpILUNU4OhchiBMQwCSl9Mkzi
	IjZxVg2damEAVZKl/B8Vf8eKn0Zz2Eg=
Date: Wed, 17 Sep 2025 22:13:27 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 16/19] ASoC: SDCA: Add completion for FDL start and
 stop
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-17-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250912103504.2679226-17-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/12/25 12:35, Charles Keepax wrote:
> Add some completions and a helper function to allow other parts of the
> system to wait for FDL to complete. The sdca_fdl_sync() function will
> wait until it completes a full time out without a new FDL request
> happening, this ensures that even parts requiring multiple rounds of FDL
> should be fully downloaded before the driver boot continues.

I couldn't figure out what the last sentence means. In theory we have a status that can be checked to know if all the firmware sets have been processed by the device. so why do we need a 'timeout without a new FDL request'. The status tells you exactly when the FDL iterations are over.

 
>  /**
>   * struct fdl_state - FDL state structure to keep data between interrupts
> + * @begin: Completion indicating the start of an FDL download cycle.
> + * @done: Completion indicating the end of an FDL download cycle.
>   * @set: Pointer to the FDL set currently being downloaded.
>   * @file_index: Index of the current file being processed.
>   */
>  struct fdl_state {
> +	struct completion begin;
> +	struct completion done;
> +

maybe explain why you need to track the 'begin' phase? This isn't a concept I can map to the FDL state machine.

IIRC the device tells you if it needs firmware or not. It could very well be that it kept all the context and doesn't need to be re-initialized always. Adding a timeout in all cases doesn't seem quite right - or it should be something done for specific hardware that always needs to be re-initialized with firmware.


> +/**
> + * sdca_fdl_sync - wait for a function to finish FDL
> + * @dev: Device pointer for error messages.
> + * @function: Pointer to the SDCA Function.
> + * @info: Pointer to the SDCA interrupt info for this device.
> + *
> + * Return: Zero on success or a negative error code.
> + */
> +int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
> +		  struct sdca_interrupt_info *info)
> +{
> +	static const int max_fdls = 10;

I think you can have 8 sets with 3 bits for the status. where does the 10 come from?

> +	unsigned long begin_timeout = msecs_to_jiffies(100);
> +	unsigned long done_timeout = msecs_to_jiffies(4000);
probably some defines would be nicer

> +	int nfdl;
> +	int i, j;
> +
> +	for (i = 0; i < max_fdls; i++) {
> +		nfdl = 0;
> +
> +		for (j = 0; j < SDCA_MAX_INTERRUPTS; j++) {
> +			struct sdca_interrupt *interrupt = &info->irqs[j];

I don't fully understand why you have the interrupt in the inner loop. For a given XU, one might think that there's a single interrupt for the XU UMP used for FDL, and that each set is sent with the same mechanism?

> +			struct fdl_state *fdl_state;
> +			unsigned long time;
> +
> +			if (interrupt->function != function ||
> +			    !interrupt->entity || !interrupt->control ||
> +			    interrupt->entity->type != SDCA_ENTITY_TYPE_XU ||
> +			    interrupt->control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
> +				continue;
> +
> +			fdl_state = interrupt->priv;
> +			nfdl++;
> +
> +			/*
> +			 * Looking for timeout without any new FDL requests
> +			 * to imply the device has completed initial
> +			 * firmware setup. Alas the specification doesn't
> +			 * have any mechanism to detect this.
> +			 */
> +			time = wait_for_completion_timeout(&fdl_state->begin,
> +							   begin_timeout);
> +			if (!time) {
> +				dev_dbg(dev, "no new FDL starts\n");
> +				nfdl--;
> +				continue;
> +			}
> +
> +			time = wait_for_completion_timeout(&fdl_state->done,
> +							   done_timeout);
> +			if (!time) {
> +				dev_err(dev, "timed out waiting for FDL to complete\n");
> +				return -ETIMEDOUT;
> +			}
> +		}
> +
> +		if (!nfdl)
> +			return 0;
> +	}

Why don't you use the mask provided in the NEEDS_SET message?

> +
> +	dev_err(dev, "too many FDL quests\n");

requests?

> +	return -ETIMEDOUT;
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_fdl_sync, "SND_SOC_SDCA");
> +
>  static char *fdl_get_sku_filename(struct device *dev,
>  				  struct sdca_fdl_file *fdl_file)
>  {
> @@ -225,6 +291,9 @@ static void fdl_end(struct sdca_interrupt *interrupt)
>  
>  	fdl_state->set = NULL;
>  
> +	pm_runtime_put(interrupt->dev);
> +	complete(&fdl_state->done);
> +
>  	dev_dbg(interrupt->dev, "completed FDL process\n");
>  }
>  
> @@ -238,6 +307,9 @@ static unsigned int fdl_status_process(struct sdca_interrupt *interrupt,
>  	case SDCA_CTL_XU_FDLD_NEEDS_SET:
>  		dev_dbg(interrupt->dev, "starting FDL process...\n");
>  
> +		pm_runtime_get(interrupt->dev);
> +		complete(&fdl_state->begin);
> +
>  		fdl_state->file_index = 0;
>  		fdl_state->set = fdl_get_set(interrupt);
>  		fallthrough;
> @@ -363,6 +435,9 @@ int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
>  	if (!fdl_state)
>  		return -ENOMEM;
>  
> +	init_completion(&fdl_state->begin);
> +	init_completion(&fdl_state->done);
> +
>  	interrupt->priv = fdl_state;
>  
>  	return 0;


