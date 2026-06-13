Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B0837F011;
	Sat, 13 Jun 2026 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781376299; cv=none; b=O53kgJjOitoKedrAtQyBN8ykgVsMh6oeoAW+vybwsCr/zUvQtaVF1JmYOYGQ+rdgEGBdW07LESJvPWv9ESqQ/dm/u/QRWkcmTtQJ+ZRqm00M/xjTDvkxLTNUfyu/cQHajtdo+aorbRrs6o3bPFUhQs/64FleN51V2ogvYrfi+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781376299; c=relaxed/simple;
	bh=GRXNIqwh7Tkzf3BNVPv/j4cKJRjcRitKxUa76to4/p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPhhPk0hcx2f9HI139gqB3R/SRFerJBd3D0m8EUGgUOLUcrMrpEglXxphfc7pkDkK59L4r4fwyLYgsq3pQrj0r7hy4B3hMWCtnS+3bcdh4ttg0bd1f+iaScdig5zvc52NU9twH1AYbhO95BmTw4n8OCAPcqc2Z25JdjHuk1vBTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4E5x29D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4E5x29D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8CB1F000E9;
	Sat, 13 Jun 2026 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781376298;
	bh=RvtPhUmYt3jfH3tQ8SpX4R+e+sVqhDVDrv50TBQhfxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a4E5x29DfEhL4n5atvx32eD5+PitMiMDer8a3nqVtmjdq1mbK3+6f4O/ySjxYkadL
	 TMolbc+gRbYWMiYzQ39vgwTdHTJkpmNGrYB5JYMstHTU8Y4QqG6fPUkn/D9Ph9brpi
	 gEQ4phqLTPQuOd539F4Plh4kxwkXU7r/frU+YRmN4Mp+ig3xKn4KfPU2yoqbopyvXl
	 wMEtSevacTrfXos5AtaFdLEqQyumIKUf7oXNGV/YcSpHY3lB/Nk6e9ndl5cL7A4uli
	 OJbX1OTYpmXmoX6aayHKFCA6M7yJLCZNy+oqLz8wuunyYOsq71XShjDsedUAIEcDQ3
	 PEH+OyK3gpsiA==
Date: Sat, 13 Jun 2026 20:44:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: Fix RT5677 "realtek,gpio-config" type
Message-ID: <20260613-optimal-frog-of-honor-b0eff9@quoll>
References: <20260612214911.1883234-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612214911.1883234-1-robh@kernel.org>

On Fri, Jun 12, 2026 at 04:49:11PM -0500, Rob Herring (Arm) wrote:
> "realtek,gpio-config" is described as six 8-bit GPIO configuration
> values, and the RT5677 driver stores and reads those values as bytes.
> The binding incorrectly documented the property as a uint32 array.
> 
> Document "realtek,gpio-config" as a uint8-array so the generated
> schema matches the hardware definition and the existing driver helper.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/sound/realtek,rt5677.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

