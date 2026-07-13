Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5550117A300;
	Mon, 13 Jul 2026 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783925442; cv=none; b=djjFdDe8BoxEMJjB9qfVdKjisntfJuJzpEbFWZyr8g6TDrAXE4r4iBIeHRpjIC8xG0vlYPcpzaQ+xPrOq3SvZmv2FNlxCODOTMRsETvFrt8To2L5C/5I4WiwtAfYzUPyi4Y13qhhIqDqL7ceOR9dV0V4PQXwxUXtZbqApd4EcT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783925442; c=relaxed/simple;
	bh=mQ+4DRN9d63E3rzfV0bGbGtC8LeMHIhW6pSjqsZQ0ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LR1g14lmD6fDWf+53g4XHK+RvqBxXOTzP1S0FWYauwIRdnwJiOrpD1HmcnpXYPwoY9oOu8z62VF/5cg/H1M85JLd/sU6xP04frba0aEMSzFT+Khzj7YXWjRHb+PHL5YuTGQ0ofLrgV0KKnkDrpkBk7ugGpHo2S/vzR9qP+Gyg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRzbZqlC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRzbZqlC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AD91F000E9;
	Mon, 13 Jul 2026 06:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783925440;
	bh=vZBDUEi5m6U01ptAwqgONbfXSHnBI4ukApFMKyNtgSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YRzbZqlCV70AdoxSri3n4C2urI2jgnIf+6oW8VltXk8pVrOCcXOPKBFy9N8BkMJ+F
	 hpHLf/moegrtbFMMVQ5Q6EmGzZbNS2HtLIMSrSsJd/J2lyChJx30sleAbHxg6YdxC3
	 ZT6Qwse6ShmT3xupQom6iQi1XU9xzfXLWRT0ffFKnwUg9z7bHXjXNicYjtluI4dntF
	 aBlJDDp0TGntd2HBj/OwR1VmvsjamUCAfRFldiROlg0LQqVOHuEtSUVvGBga3LI7aL
	 nmNqQLj/+B3FhcSJFu8Ll2oeKeYSWtKQcxhEQZcCkcyf1YvTnsQfOdfYi9QTYVbHEq
	 GpryT93bjNubA==
Date: Mon, 13 Jul 2026 08:50:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] Asoc: dt-bindings: qcom,sm8250: Add TDM slot
 properties
Message-ID: <20260713-sapphire-narwhal-of-acceptance-afeb3e@quoll>
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <20260712134110.3306763-6-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260712134110.3306763-6-prasad.kumpatla@oss.qualcomm.com>

On Sun, Jul 12, 2026 at 07:11:08PM +0530, Prasad Kumpatla wrote:
> Add standard TDM slot properties in CPU and codec endpoint
> nodes.
> 
> Some audio backends operate in TDM mode and require the slot
> configuration to be described in Devicetree. The common TDM binding
> defines dai-tdm-slot-num, dai-tdm-slot-width,
> dai-tdm-slot-tx-mask and dai-tdm-slot-rx-mask for this purpose.
> 
> Permit these standard properties in endpoint nodes so TDM-capable
> links can describe their slot configuration using the common binding.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

