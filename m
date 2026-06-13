Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E8A2147E6;
	Sat, 13 Jun 2026 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781346898; cv=none; b=pBEzM+BZjZtNliqVBD68+6+5b2WCGzY13Jmro3loY6/TECWkVWQrLDYqE/mxwOir1zkaTb/vDMFoQHLmNUc7YDqNUZMd3Xd3pBn3k4DRx+PUBfAkoaEFjUGtv8KfZd0SiS2JGdPsShcUqucWRpOibxqbMreyYXDCBKEsvZHxodc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781346898; c=relaxed/simple;
	bh=vexnXRwpBZ9lV1zmyycUMB0Umd6DtQ/y9k4itCfMZQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jF/0147NLxz7bjB7FskkbB//uuMG27M8bE+12OZmWdjTT1Y9ptp2o90oOI33rjRQcUOob6AibLCl/HLtTfZY3VIfxU5BztK59rLuXLAbz7ZC/3eGqtIqb0MjSZ+QBXr11mO5XzwJ6DCURsctkX3xbjWUDNT8WGRwgmXMKiGNxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIgxlFgp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIgxlFgp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3021F000E9;
	Sat, 13 Jun 2026 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781346897;
	bh=lg3WoegOv0vBnnwAu+Z8akfRMouXpxKcBffoZTEtats=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iIgxlFgpgZVZ9+L88jhlEB1dMqhOyBXhAiVYHLMPZJvVHzqnj4Bn7maK7otIPvTDZ
	 gwg41hZvzGlW6P4LwNvPObAyxqCv9XQ44FWQ7SyzA4FsQHsY5vRKLrLigrY4/2mqQf
	 NrZmd+awydqlbI/4oJCp5nqGEU4VyTUvWjZEQt0+KpaMLdNS21KxIWObFxEBjuoU/u
	 0NiohZK/8WTyn2+l7X18AS+l5AubflOmKq/0X0WhM6ayPVXeCWq1XDHsdDcQkoXfWK
	 EHUMG8gOFPmntkehyPrRAXCWb85kRDHn7kz3Gyj7qrkeyvenaa7vuEYH7SOvLx15np
	 ElsHS/Aw7sAOA==
Date: Sat, 13 Jun 2026 12:34:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
Message-ID: <20260613-lively-shellfish-of-glory-b2c5af@quoll>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
 <20260611112946.954172-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611112946.954172-2-ajay.nandam@oss.qualcomm.com>

On Thu, Jun 11, 2026 at 04:59:45PM +0530, Ajay Kumar Nandam wrote:
> Add Shikra sound-card compatible strings to the Qualcomm sound card
> binding so DT can describe board-specific audio topologies:
> 
> - qcom,shikra-cqm-sndcard
> - qcom,shikra-cqs-sndcard
> - qcom,shikra-iqs-sndcard
> 
> Shikra EVK variants use different codec/interface combinations and DSP
> processing paths. Describing these variants explicitly in DT allows the
> machine driver to select the correct DAPM routes, controls, and clocking
> behavior for each board.
> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

