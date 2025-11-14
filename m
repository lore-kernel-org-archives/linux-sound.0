Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA6C26ED3F;
	Fri, 14 Nov 2025 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763106074; cv=none; b=uDCINK8+5lRcjbIbs11RxjjWEO1fLS1fhnH4SL7HPDEEcEZEHJFqtXjKSqhRRVbeyqr9BAAl8iyY3nOqgRuObPr1/dpEItpxugZL2B/p9xYQ8+JFGgesQQpU5lRRTavSlTrmKEOP8wJk8Bv5JJE6kl7Nyadbq8DDWcWwZhB8T38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763106074; c=relaxed/simple;
	bh=XJhT76PNpoarYo4uIU+tUJZHQ3Ozmj44luNh6Kq6zHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRhmJC3HexRm6baGWfkElUhyYp9PsEJrfsi0Unc2t+moPQXZpewpPbzLd3YW997tkA3HI1MM4MqEtd/1DWYm5QKCiUmxSjuJ+t6sS5yvx3pHEDw5+1ikcs8GDxueQVsHEMZTTI0YJeJYwbl44ylXo7Tz5ccM4D4XfhZPKms9AhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLim17mT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLim17mT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0A3C16AAE;
	Fri, 14 Nov 2025 07:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763106074;
	bh=XJhT76PNpoarYo4uIU+tUJZHQ3Ozmj44luNh6Kq6zHc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uLim17mThIeliCN3FsNxvXRMO2ljdI4nXY8RHqIkabPyxo1cDWrxvtHiPriCHzpD9
	 RXdumeyPWlzORe7PfzAncadopaCgdm1PHluSepa6ikroaPiyBxf/o3GS/TcxmhpSTf
	 pu2Z/U2dVBLtbAjSP4UNK9aMIWLwC66LgVlGLwFsL0E1UcBsTTh4z3MD1oDWDuZISc
	 1uVOp+UnKg/mdBvsF/4rSuQ6eTw9RSHpTGEvTg5/27DKo2svTHa5gOAU9E29jTOxWy
	 2KVeux9lsiBKBotJzKpvjRY7X7xaCOEqLsJ+mEFcVbqH6gG9b4u1qhavRtTG2bbjhl
	 tpOVVd7fLZtgw==
Message-ID: <b863a8f1-22e6-4a52-be8b-9eb83b999937@kernel.org>
Date: Fri, 14 Nov 2025 08:41:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: ti,tas2781: Add
 TAS2568/2574/5806M/5806MD/5830 support
To: Baojun Xu <baojun.xu@ti.com>, broonie@kernel.org, tiwai@suse.de
Cc: andriy.shevchenko@linux.intel.com, 13916275206@139.com,
 shenghao-ding@ti.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, will-wang@ti.com,
 jim.shil@goertek.com, toastcheng@google.com, chinkaiting@google.com
References: <20251114073358.23046-1-baojun.xu@ti.com>
 <20251114073358.23046-2-baojun.xu@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251114073358.23046-2-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2025 08:33, Baojun Xu wrote:
> TAS5806M, TAS5806MD and TAS5830 is in same family with TAS58XX.
> TAS2568, TAS2574 is in family with TAS257X.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> 
> ---
> v2:
>  - Add TAS2574 support.
>  - Re-organize the patch, put compatible in front.
>  - Combined some chips as the reg setting is same (0x48-0x4b).

You need to provide reasons for dropping tags.

> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 103 ++++++++++++------
>  1 file changed, 69 insertions(+), 34 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> index f0bb5faf55c8..224999ed6529 100644
> --- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -34,15 +34,61 @@ description: |
>      https://www.ti.com/lit/gpn/tas2320
>      https://www.ti.com/lit/gpn/tas2563
>      https://www.ti.com/lit/gpn/tas2572
> +    https://www.ti.com/lit/gpn/tas2574
>      https://www.ti.com/lit/gpn/tas2781
> +    https://www.ti.com/lit/gpn/tas5806m
> +    https://www.ti.com/lit/gpn/tas5806md
>      https://www.ti.com/lit/gpn/tas5815
>      https://www.ti.com/lit/gpn/tas5822m
>      https://www.ti.com/lit/gpn/tas5825m
>      https://www.ti.com/lit/gpn/tas5827
>      https://www.ti.com/lit/gpn/tas5828m
> +    https://www.ti.com/lit/gpn/tas5830
>  
>  properties:
>    compatible:
> +    oneOf:
> +      - enum:
> +          - ti,tas2020
> +          - ti,tas2118
> +          - ti,tas2120
> +          - ti,tas2320
> +          - ti,tas2563
> +          - ti,tas2568
> +          - ti,tas2570
> +          - ti,tas2572
> +          - ti,tas2574
> +          - ti,tas2781
> +          - ti,tas5802
> +          - ti,tas5806m
> +          - ti,tas5806md
> +          - ti,tas5815
> +          - ti,tas5822
> +          - ti,tas5825
> +          - ti,tas5827
> +          - ti,tas5828
> +          - ti,tas5830
> +      - items:
> +          - enum:
> +              - ti,tas2020

No, this makes no sense. Device is not both - compatible and not
compatible - at the same time.

Also, rest of my comments were not implemented.

Go back to previous version and read the feedback again. You can reach
to more experienced colleagues in TI who should explain you basics of
upstreaming process. Or listen to one of many speeches/presentations on
upstreaming from conferences or trainings. Or read Linaro's guide on
their blog. It is your homework.

Best regards,
Krzysztof
