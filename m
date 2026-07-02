Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E938F92A;
	Thu,  2 Jul 2026 07:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976332; cv=none; b=AV8EJ62yrzjE/gGvgSuxj1t/RvihC/OXTXiUCr7r0AMKWddHsWT4+l5rnxHfR9Hj8XLA1RjkpwIzP1QC7Jgy30S2ko6AUto7qlz0CdPWE43ROF1Z3gq5eRt5OLmY+5y3JpkZFFxN8G5wGl2sPDgEpqlWPE4+JmR+mriz6KVWoc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976332; c=relaxed/simple;
	bh=7xvk1tOx/mGc+/2avUHFclUJEvlifOrpq7q22vMUXSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKIvcV9wwgfw03WUuDYlMY6AbKm9xmi86ydjNBUxK7ynDoGqG1NTyMO90WQBUJoyg9z2E8U1rtok9XERXu0mOEmQefvW0ohm5R0PNFPlrl4NANQP8q2v8Q9F6ljFN7CbAWouRlGGo7Sg7IvCDS16Rpogf7+5O19O2xCufs9++Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMeRtYBn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMeRtYBn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D8A1F000E9;
	Thu,  2 Jul 2026 07:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782976331;
	bh=bzLKKMe7jbApEplxjumz0k1RO7TakfAge4mkRtGwUZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YMeRtYBnVfjpYfSLhaNKUs1/gnunMJB8tODQPhSmYUG+2eOgODs9zfLIGTymK8Cyz
	 LYsmSAonAdZABPe3rVlx9qvsHjdAhLh3bAX7465oDXpuJ0sp0eUmEgw0ppo+KstBil
	 uPx+g2u0s5krkVStfBTZrq8dKrjH7MV130tVJeaaw3fpoRjImT+rZpbEmiSlzJcJJY
	 iUQa9s7r/3DSj5AUE7t3KTzMv6J1/SysimbVdGvnYWRwtFXDAPu1lsRKhR30UAJiFP
	 BJlGcbp/cDB9yJ8IxbGkPctFcYQfTI5+4/y6bZGafVG4b/ZR0/nn35UoDCL8t764GW
	 Zf0LAOKbP8Ffw==
Date: Thu, 2 Jul 2026 09:12:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] ASoC: qcom: Add generic of_xlate_dai_name
 helper and use it in lpass-cpu and qaif-cpu
Message-ID: <20260702-augmented-raccoon-from-asgard-1878d9@quoll>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-7-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701105757.2779738-7-harendra.gautam@oss.qualcomm.com>

On Wed, Jul 01, 2026 at 04:27:52PM +0530, Harendra Gautam wrote:
> Multiple Qualcomm ASoC CPU DAI drivers need to resolve a sound-dai
> phandle argument to a DAI name by searching the component's DAI driver
> array by ID. Each driver currently implements this identically.

Heh? Identically? So why even doing this?

 +
> +static int qaif_cpu_of_xlate_dai_name(struct snd_soc_component *component,
> +				      const struct of_phandle_args *args,
> +				      const char **dai_name)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +
> +	return asoc_qcom_of_xlate_dai_name(v->dai_driver,
> +					   v->num_dai, args, dai_name);
> +}
> +
> +static const struct snd_soc_component_driver qaif_cpu_comp_driver = {
> +	.name = "qaif-cpu",
> +	.of_xlate_dai_name = qaif_cpu_of_xlate_dai_name,

I miss something - qaif_cpu_of_xlate_dai_name() wrapper and
lpass_cpu_of_xlate_dai_name() are identical. Why can't you use
asoc_qcom_of_xlate_dai_name() here directly (or
lpass_cpu_of_xlate_dai_name() without all this renaming)?



Best regards,
Krzysztof

