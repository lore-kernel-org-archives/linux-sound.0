Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085B91DF72C
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058454; cv=none; b=C+YJetnGRC8qjGrANPz4XHRBGlvUnq7ziieuzciq1REQ5A6Iert9hXJZyTTxXBYTJzRk72LCQr0GI632sz3CRyOAMxOu3S82iOPajUqDgsmD25y2YsUHGr7gOnjxKsUe8qgAjIQHLplTY54NMVPLNYR6fggMzljhrudKkm2MfDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058454; c=relaxed/simple;
	bh=mX+Of56p5oPrN/H/bMq0wtR5I6XGhxHBQA3+k1ajWME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAzVWjwKOmgCfKIAzSEIRQ0jUoxznxC4A3mI4MIoBOeDhrX/mr77Y5HqgCPJXLm7CSSvaCVxCuilu/VnPHjbIlPePzxTW71t3n65ijEuZR45LzdW4kmpDo1sPF2kLRRwVnnWkxzKD13g/tD/hWV1xhr0pZRBbGEjZX/bGFr/nic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Py98N+l+; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Py98N+l+"
Message-ID: <cd574985-e434-46d9-91ff-a2782c6e8eef@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747058451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/4J0SuZByrIjGLOA8bKYmKRujar1zIqb8dCwbYb/Ck=;
	b=Py98N+l+v3N0jqaarZVWAuNqUyYYCIJhAZcgMuDJ3R3dhiYH8Avs6M6utyzIYC1pQr6cxk
	Kox+R9T289iO55LMfcQtR0NuyhMHmW5xEIbzqtn6t4s2v9/+AytfraXz7DuE2JBhqk3E+Z
	EDFti0HFiez++r6zlhv+0ZZI6dtxtlU=
Date: Mon, 12 May 2025 15:53:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 5/6] ASoC: SDCA: Create ALSA controls from DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-6-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250512124240.799509-6-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +static bool exported_control(struct sdca_control *control)
> +{
> +	/* No need to export control for something that only has one value */
> +	if (control->has_fixed)
> +		return false;

why is that? It'd simplify userspace if there was always a way to get a value, even if it's fixed?

> +
> +	return control->layers & (SDCA_ACCESS_LAYER_USER |
> +				  SDCA_ACCESS_LAYER_APPLICATION);

That filter on access layer does make sense however.

> +}
> +
>  /**
>   * sdca_asoc_count_component - count the various component parts
>   * @function: Pointer to the Function information.
> @@ -76,6 +87,8 @@ static struct sdca_control_range *selector_find_range(struct device *dev,
>   * required number of DAPM widgets for the Function.
>   * @num_routes: Output integer pointer, will be filled with the
>   * required number of DAPM routes for the Function.
> + * @num_controls: Output integer pointer, will be filled with the
> + * required number of ALSA controls for the Function.
>   *
>   * This function counts various things within the SDCA Function such
>   * that the calling driver can allocate appropriate space before
> @@ -84,12 +97,13 @@ static struct sdca_control_range *selector_find_range(struct device *dev,
>   * Return: Returns zero on success, and a negative error code on failure.
>   */
>  int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
> -			      int *num_widgets, int *num_routes)
> +			      int *num_widgets, int *num_routes, int *num_controls)
>  {
> -	int i;
> +	int i, j;
>  
>  	*num_widgets = function->num_entities - 1;
>  	*num_routes = 0;
> +	*num_controls = 0;
>  
>  	for (i = 0; i < function->num_entities - 1; i++) {
>  		struct sdca_entity *entity = &function->entities[i];
> @@ -99,6 +113,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
>  		case SDCA_ENTITY_TYPE_OT:
>  			*num_routes += !!entity->iot.clock;
>  			*num_routes += !!entity->iot.is_dataport;
> +			*num_controls += !entity->iot.is_dataport;

shouldn't the same line be added for TYPE_IT?

>  			break;
>  		case SDCA_ENTITY_TYPE_PDE:
>  			*num_routes += entity->pde.num_managed;
> @@ -111,6 +126,11 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
>  
>  		if (entity->group)
>  			(*num_routes)++;
> +
> +		for (j = 0; j < entity->num_controls; j++) {
> +			if (exported_control(&entity->controls[j]))
> +				(*num_controls)++;
> +		}
>  	}
>  
>  	return 0;


