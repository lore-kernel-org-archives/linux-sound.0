Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525091E1E01
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058456; cv=none; b=OCbs73AfnaGORjq+zapZRgsQ+LKAD14QzhF+dsobXFX/WJSv9VoW51Tl/DSeXFzbU15jUIsUtVN99zpDM5QozlBTIUtqWW4CDyQotKguRkU7RC9jPmNNf4MSfRxGqzJ4GLCzBdNWeL9ydIU8taXb6qIPEx8hOonA+q0l3XYLp+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058456; c=relaxed/simple;
	bh=YcyFM70g612K4vIZsCtd7JVpJcPBNrB3+JEk3P/btEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ti220Cy5AIVtupqESgV35ayl/9CyCspaVM+KsbWRkIU6JPBV4wXHdORtCRhRIHp7/KfpcB6xxsj0u5fk/Z93sOMkXRT32O6NOGOgFX2UXcUYF+UyvfYVfWdYJtq+yjMa1lDrgUu/w4OFFfgAjLWvRs8hxGE51XAHc+kM1CNgjZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pGHQeWyh; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pGHQeWyh"
Message-ID: <8f94874e-0a4c-4c52-af12-c3e67e45cd18@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747058452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kEf8lKAQy5yPjuOIHVHPd3VRnRKaIgpjJjr4YGoq2eE=;
	b=pGHQeWyhbe/e37R4yes6/8UQ5b5odOs1KBY2CujAL2xMJR+682TNIBQGFOlIXHlEvp2xmG
	FUEJLil7xFlI7I1qp0A/XbDfWLnQH1D4OxaKjcWKr/oeh+YI0TgpjhTeryZyhCgMWtONFC
	HY41z+apXLck96mamFESwxzJXEyH6iQ=
Date: Mon, 12 May 2025 16:00:18 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 6/6] ASoC: SDCA: Create DAI drivers from DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-7-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250512124240.799509-7-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *function,
> +			    struct snd_soc_dai_driver *dais,
> +			    const struct snd_soc_dai_ops *ops)
> +{
> +	int i, j;
> +	int ret;
> +
> +	for (i = 0, j = 0; i < function->num_entities - 1; i++) {
> +		struct sdca_entity *entity = &function->entities[i];
> +		struct snd_soc_pcm_stream *stream;
> +		const char *stream_suffix;
> +
> +		switch (entity->type) {
> +		case SDCA_ENTITY_TYPE_IT:
> +			stream = &dais[j].playback;
> +			stream_suffix = "Playback";
> +			break;
> +		case SDCA_ENTITY_TYPE_OT:
> +			stream = &dais[j].capture;
> +			stream_suffix = "Capture";
> +			break;
> +		default:
> +			continue;
> +		}
> +
> +		if (!entity->iot.is_dataport)
> +			continue;

should this be moved as the first test in the for() loop? The switch cases for IT/OT only makes sense for streaming/dataport terminals, no?

> +
> +		stream->stream_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
> +						     entity->label, stream_suffix);
> +		if (!stream->stream_name)
> +			return -ENOMEM;
> +		/* Channels will be further limited by constraints */
> +		stream->channels_min = 1;
> +		stream->channels_max = SDCA_MAX_CHANNEL_COUNT;
> +
> +		ret = populate_rate_format(dev, function, entity, stream);
> +		if (ret)
> +			return ret;
> +
> +		dais[j].id = i;
> +		dais[j].name = entity->label;
> +		dais[j].ops = ops;
> +		j++;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(sdca_asoc_populate_dais, "SND_SOC_SDCA");


