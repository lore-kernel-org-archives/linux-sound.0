Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229922;
	b=eRi0yCv+10rI2M+kgLM1XtbJO1QGNvYAiPf9lsjC50mGnS0Hp0R2kcUTK7U6cY3G7ejX
	 WpkzyjLnN/tivNLOlKrZIEfymoD9wVchLXKhlnyxrgoYWeJ9ISvJqSNky/V10CJeIc/qt
	 XXbb/+koYdaKd9xCCrJmnLBXm7RPSfkZ0uOMT3BAnaMBoE30u4cKK2nh95ZKUgxeAWV1E
	 Ug2N0eayCruwI9j2yME18R1Z/2DltowDd6GmZsZL8zvFyxrHpiRUd2mO7C7M/7fqFJvur
	 uNANeTGnyT9JpdY9y2Fz/5UV8jukqsTpR3AKmb3zR7nPq1YDqbrEfWU96tv6tuORR7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229922;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=URZ/ULk+4PWcUSYqJk0FCIDVu0Cq9bVkhuiXHZozVsc=;
	b=o6+lGTfc2rDAg3D1izkXNlUEHOZ5ypuXCgC7mMzRsRJc9YXN8Rb7VRSLfiAdecXf8+BD
	 hhPHGlpJmXxQaSpt1tvXGPp1CoND6G8Q4xDOcx67ZtF44R4xrOQWyILoJA3mlgieA87rK
	 B0PX8QeWVAzPLRg3D3sQnLACHYkfGSABqEiBjOjKn2cl3EfW8xMjgr62gOeTK7xsbLVa+
	 cptkzpIIdUqH3qqtS9O1zQAImfw1gxeLmFIroeBfT94oYNbE4o0ENUx1cz+Jh2E4fWtg+
	 Q9DFeUvbESG4sx4PhZJ6++Ix1FjIfWcn/vDZm4TOT8RnK2plMjaT/8raJuR5c+8wNDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYISZiBD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFF0606A326;
	Mon,  9 Nov 2026 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYISZiBD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254951F0089F;
	Mon,  9 Nov 2026 13:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794229922;
	bh=URZ/ULk+4PWcUSYqJk0FCIDVu0Cq9bVkhuiXHZozVsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YYISZiBD7mBBiBmdvss79zT5VFDrcBjl3rsasdZGo0XqYSP7aTWYRyXSL5DA1JUx3
	 azU1VX/tkgJEqKYtrt6qU8jGbJtafsHojQ6iQs9YWONiAZ6WvwQxYPAZ0nRBadgo58
	 Nz/ESq7N1Fn0+WDoviLuVmgbVak881v2O+3v4MT82ulYn95wrfHK36w61Z+J1vXl3k
	 29KLq1UkY8TnAymJTWs+LsqhdL4YuFfr7nEqi8g6rjLvTHvS4VnG87AOWQTPbwvGbH
	 NO1bQ6KU5BAjdgd2kua7N/rbucscxeUAuqY0ZtTfX3DYoFC+ddMaw22cYcV6Wf9YnM
	 R6tfM1xGVCKow==
Date: Mon, 9 Nov 2026 14:11:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org, neo.chang70@gmail.com, 
	kchsu0@nuvoton.com, sjlin0@nuvoton.com, lkp@intel.com
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nuvoton,nau8310: Add NAU83G10
Message-ID: <20261109-grateful-white-meerkat-090edc@quoll>
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-2-YLCHANG2@nuvoton.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109051251.471879-2-YLCHANG2@nuvoton.com>

On Mon, Nov 09, 2026 at 01:12:50PM +0800, Neo Chang wrote:
> +  nuvoton,sar-voltage:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      SAR Gain Tracking Selection.
> +    enum:
> +      - 0 # VDDA
> +      - 1 # VDDA * 1.0
> +      - 2 # VDDA * 1.1
> +      - 3 # VDDA * 1.2
> +      - 4 # VDDA * 1.3
> +      - 5 # VDDA * 1.4
> +      - 6 # VDDA * 1.54
> +      - 7 # VDDA * 3.12
> +    default: 0
> +
> +  nuvoton,sar-compare-time:

Use proper unit suffix from property-units in dtschema.

Also, Sashiko feedback needs to be addressed.

Best regards,
Krzysztof

