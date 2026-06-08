Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84CD2EEE95
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 02:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887008; cv=none; b=LCxJJIkhlRlyShqcqSqxhwfOzzIQ8doKrMtIeJFNMcYLim4aUXYL66VLN7BoIZetDNe6MXkwM/hCaGtIFLuLmfhIKGxR6G0h2Ux6dRorLDv+vWchuwat2HOO4CO8OP0GMu9vgjKjG05/7VLN8lyqlpzep48mU2r6P0ibwsJLgtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887008; c=relaxed/simple;
	bh=491fWt55/N2aTx44vs9X6kBKZdkQr3bM+n0tnZ90BXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6HFoma+ufgP+qdcKIJULTbtfxZIiW8UKPS6DoOhg4WM5tRiqUBLlSg0kcy1wrno3hLWEGO3MbFbOh1/daneldM54YBATnriKdu18InrjbdOP+s7eAi9CA0Wwy3ZJ31JuU4qArYQpSSzsQpPn+PIOa3DSf3+V3n2coMveNjxpDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=MGTsitXG; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="MGTsitXG"
Message-ID: <8b2318ff-d07c-4c2d-9c2d-ef7c5c763096@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780886993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=om3kMyjepA1gbqPe5vEK7VOqgLsCQEKydpPF0v4/Fwc=;
	b=MGTsitXGrXbEf9LiDSGBLKIMTNZZCYtXzz8LKWu7cOEAhNE3pMzPeHTjJAgORivqI7b2lw
	GL1nsLfYT4+W0KRhVJiioeeg5sdfGWjL3y5bqlN+CkX8U6wIQCCC/HKjE7KnFkuFZAS6+Q
	F8R5uEHL+Hh+ljff00x/8rb+0XGfXRM9syD7eX3/GhkuhFvyxaWy8eWKoZc75y4WQ3kMkm
	q/5SI1m3+2T7qtlgfDLumqLQAf7pV4WFKED6d+5/MOdlYc7+6PN7M0AbT024IQ72ju60ua
	6v3nYJ3vtsKrlhBVT8lAeumvZQrO8DZAHtX1/Og7N5krHwj5tVr4q1EF8TW2Pg==
Date: Sun, 7 Jun 2026 23:49:41 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/7/26 11:30 PM, Mohammad Rafi Shaik wrote:
> Add support for MI2S clock control within q6apm-lpass DAIs, including
> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
> Each MI2S port now retrieves its clock handles from the device tree,
> allowing per-port clock configuration and proper enable/disable during
> startup and shutdown.
> [..]
> @@ -297,6 +373,59 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
>   	.remove_order   = SND_SOC_COMP_ORDER_FIRST,
>   };
>   
> +static int of_q6apm_parse_dai_data(struct device *dev,
> +				   struct q6apm_lpass_dai_data *data)
> +{
> +	struct device_node *node;
> +	int ret;
> +
> +	for_each_child_of_node(dev->of_node, node) {
> +		struct q6apm_dai_priv_data *priv;
> +		int id;
> +
> +		ret = of_property_read_u32(node, "reg", &id);
> +		if (ret || id < 0 || id >= APM_PORT_MAX) {
> +			dev_err(dev, "valid dai id not found:%d\n", ret);
> +			continue;
> +		}
> +
> +		switch (id) {
> +		/* MI2S specific properties */
> +		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
> +		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:

SENARY is also a thing these days btw..


~val

