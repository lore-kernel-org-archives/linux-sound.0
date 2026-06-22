Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6AD381C4;
	Mon, 22 Jun 2026 13:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134449; cv=none; b=b+Sar+k2DzeTMRgZp0oYqwsn3wgl77rRZN7Z/VRoIex543ucBiCF8CdlUYHgkJSU4oqJH6P4AvIbPNrqhgA581WYOnRIPMKUycoc+yiW31M5BfMbba0IKv6T9/zobb5Id+QnTv0oM5Ae65fM8UIrb3lumtnk3SNZQlGlYUzDY5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134449; c=relaxed/simple;
	bh=BmkLShQQSsd9Zy14x8AvUUN//pkPGPIpVsulAvE7YiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tx/zQlfncthfvuPGU3wr74Jvg4tzp4FRi4GUV3NMhRkGhfkCnGfgDxBDR42vxGMjMb4/c8Re9GKwlvJyaRqCsTL4jRfZgFz9fDExye2v0E8CGysKtTb6sYOF0PeoiZKbW+KiQL8VXHYQEEWjWHkzgEFfCn6W80CxfhLHZa4z9p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6+pwgYo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6+pwgYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0B91F000E9;
	Mon, 22 Jun 2026 13:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782134448;
	bh=whsnKoILtujHUBAeROtFy9LnxopDzLo7OcbVTsH4JFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E6+pwgYo96OrCnarKwUsKgphMwAd//7Dg1nfS1cz6xyeGcrrGf0qNVkOfTYizzg+W
	 sS0A0OMRmOtFspS/FoKYrsIVU6s1HUgwlELD25zNeYNi7RYpCPYXJXHjG3D00q3jnt
	 6lSisL1vwhfuMVTXdqT8f1/9sJB2BUKqKYmtR1Y63MivJ0Zt2UfRwyqVuG0okFgNqH
	 Jx6EBwdbekeGH9ohYYqy4jBkbHHkV9s/rj4dN22Ja8UKlxH61nFG5Jq7ZU7+7yESzc
	 c66+4z/bQiVCW40rdsHIIzIHgdbkwGAgfGJPur9z1tnW1nwqztQAQRYzuPvR9fFIfL
	 AjAg85fn2QjvA==
Date: Mon, 22 Jun 2026 15:20:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/8] ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK
 channel for shikra
Message-ID: <20260622-illegal-cuttlefish-of-chemistry-fdfbdf@quoll>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616201315.2565115-2-mohammad.rafi.shaik@oss.qualcomm.com>

On Wed, Jun 17, 2026 at 01:43:08AM +0530, Mohammad Rafi Shaik wrote:
> Add support for the modem_apps GLINK channel on Shikra, as audio
> processing is handled through the modem DSP.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

