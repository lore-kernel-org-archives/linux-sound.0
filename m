Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6793B3C1A;
	Tue,  9 Jun 2026 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990137; cv=none; b=OJiiEtIm3cp5aTFf9AM5OKSDybIEI4cl5aCs6QzzmDNUg72tNOr6sxbyZMFksMOwh1jwo351AvoxLLWk/ERMMvZtGij00vROGTyKqf0DYxaVzgVSghQ4IlWpOSSIBJuQVlWcrUwQvVhkNgEzK+8+8wDH7bTDf4c8Z/3UgaP6EBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990137; c=relaxed/simple;
	bh=Qzq8JFlFuObFvmKuFmssnbGMWgD29AFPCAnznkuDpA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5+/0Nka7y3BdSiN7Xc6N16dLr63lzLgH9xCwCW6RnFoDp3NiobukkreuC6KDwqavYCtUPSno75Yy3MnXwHKNcSix3kVfwlXYHO1u8aA87XNUkd5SW0hPKJp6rRAch1x70Rk+5q6Ie7omECFS6f9i9ZPrHgBvYdMHi+50WmbK5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQG/1zsH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQG/1zsH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2DE1F00893;
	Tue,  9 Jun 2026 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990136;
	bh=sWNAmXeiWmwxeKCoQ11+GrDkd2t2GOIhhcnyC5yfQl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQG/1zsHX+JRRF7DbIBZJZG8OKX0NWnFOxKLv7cTXIfpCkTf6DXL4opYKkNc7U01b
	 2WvQ+LWMwew+eKuWNgjs9oCUICK/ksO2NzLYkU1Ny8SX37YvJJESxj2tVYVECxlEx6
	 bYYKziFRJ5F3iHHhfG9rLLXMxXqB0M+ahp6fe3TnNRGywPPFSI+4hlvGpTTwZCxoSO
	 U/9RFlpaHXlmngR/a36ebbL3ZdcGaoF4LGDfO0xEhZ+DIqIrc7WjfJtVipW8IPP9Q6
	 4e0QYEvNGB9kHfWUuj+h7zuGtNkhKiMsj3l/y8ViXs8w+Ge0jXRQ5biLDqndLus1IO
	 ZFr45H+Gjk3jg==
Date: Tue, 9 Jun 2026 09:28:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] ASoC: qcom: lpass-rx-macro: Add shikra compatible
Message-ID: <20260609-pretty-coral-weasel-e951ef@quoll>
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>

On Mon, Jun 08, 2026 at 10:50:22PM +0530, Mohammad Rafi Shaik wrote:
> @@ -3648,6 +3655,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>  	case LPASS_CODEC_VERSION_2_6:
>  	case LPASS_CODEC_VERSION_2_7:
>  	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_0:
>  		controls = rx_macro_2_5_snd_controls;
>  		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
>  		widgets = rx_macro_2_5_dapm_widgets;
> @@ -3809,6 +3817,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>  		return PTR_ERR(base);
>  
>  	rx->codec_version = lpass_macro_get_codec_version();
> +	rx->bypass_fs_control = !!(flags & LPASS_MACRO_FLAG_BYPASS_FS_CONTROL);

Is this specific to Shikra or LPASS v4 codec version? Commit msg
suggests latter, so detectable from version, no?

>  	struct reg_default *reg_defaults __free(kfree) = NULL;
>  
>  	switch (rx->codec_version) {
> @@ -3831,6 +3840,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>  	case LPASS_CODEC_VERSION_2_6:
>  	case LPASS_CODEC_VERSION_2_7:
>  	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_0:

Best regards,
Krzysztof

