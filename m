Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225EB3F411F;
	Wed,  8 Jul 2026 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494870; cv=none; b=oNr9T4kHU0poDzeN/8eJbZ+tHh0OlezrNanjUzgKqMTNMg4HH9jSAv61Jv0zGD2Xze3QeAWiqk0baY5ouQUXWHOkMtMLyE3XiD+4fWTmDNflrzHdkeNDlfhgjpKFDmfLGffyd/+8EG8ytVLcQgs3m8UyG6+pQk17deawxo8RXzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494870; c=relaxed/simple;
	bh=EuaFJLflE7aeOT8XlWOJJ+tkTJr3MSUgkgiTx9c6PKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIj9vX3UApr8t5GhQPH7Id7Cil77bonSPuz97Ft80b2FpJ4DNANqCb+H8zqE/ck6mGrkBhlOfHZil0kYMGb9WhsdtasWajTA670kqky3lMxvk8RCeh51OXm3YhNB5JtGZUqiDNWUFVpJ2AnOjvn8TiSBKn6S7byriz2cC4yRRw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTHYWvdv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTHYWvdv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E961F00A3A;
	Wed,  8 Jul 2026 07:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783494855;
	bh=FJOgajIktGSPUwUpl1lGA3FsNG6XSSRNrkuGh8EQiz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jTHYWvdvXNsY3NzfKVWf/jpX7uJFjlDjzMkIzs1fi95SIxDPvxpNsFU5RNyhJebyI
	 kcL8rnj8vQCqbHNweg6s1A6gndGEkYfQ6CGzVU2t01DuJvPrEra/1LuYZq680QFJxt
	 viZEJiLm7kskYpMhoKDjNZyFXurL5ODhuXleI2qVUu0mP8nqyR2DIy7P4DAHxYsNPO
	 UiC2oGQ0ZvR06u12fQYuqM6HHRINhRt2/wyKhIRxVRrhRmbJNFPNPlJJ6YdJD4/hxK
	 gPILsPAV2vz+hBohfQBbtA2+Jq7uRsTPnmvl4E7p0FpjjsNoZfVascPKNcSOu7lcp4
	 kNcNOt2EoUX5g==
Date: Wed, 8 Jul 2026 09:14:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: Re: [PATCH v1 1/3] ASoC: dt-bindings: qcom: Add Eliza LPASS macro
 codecs
Message-ID: <20260708-glorious-snail-of-inspiration-6ae488@quoll>
References: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
 <20260703073434.2589657-2-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703073434.2589657-2-ravi.hothi@oss.qualcomm.com>

On Fri, Jul 03, 2026 at 01:04:32PM +0530, Ravi Hothi wrote:
> Add bindings for Qualcomm Eliza LPASS RX, TX, VA and WSA macro codecs,
> which are compatible with the existing SM8550 generation.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
>  Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 1 +
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
>  .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 +
>  4 files changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

