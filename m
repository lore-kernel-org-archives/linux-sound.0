Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B22FB6;
	Thu, 22 May 2025 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900069; cv=none; b=XbfQDOaLWlB2A03164sLK15hDw5pzxwV2W5wt+gCn0M/wPbdJW5bCgVtZDNqIvWVAS+JZkiuxhnjoRWQvabWesnVnwK4V02L3AzXMdxa3meBd9Ud9+WNfGJb9bRGUHjRFJDvCc9Bqa5vMFnw3xGSBCxsKewDBJwr+mCtLgCVOFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900069; c=relaxed/simple;
	bh=Zux10m4GfnieJrSX/HTBCqomT/g4SCqNLVpt/znLjX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNso86yp/76ArqdE9O4UbO3IJIp0dUwTsXw/GTPTpuZofLTZQRVVq1TG7VwBkjR5XMd3i8AcRmj+Dq0ghzLF1gYVzMjisAOkucuAlx9wFH3CRxyCruqg4UQCkmILKjRMNgBwPUgsjcqVIIX9A1sj+cZNsuJC3ZZEpqA3bhWszFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRi+WV1T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRi+WV1T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B56C4CEE4;
	Thu, 22 May 2025 07:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747900068;
	bh=Zux10m4GfnieJrSX/HTBCqomT/g4SCqNLVpt/znLjX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRi+WV1TNTXQk9TPpABiPrBuWk3NRtGFwp5XkKtHh3SUMR8mvT4LGOx2yzUyQ9/Yh
	 Z75f8v1aNWXDrQerBM0/XaDGPJJzsoSrOwlxO8CxUSrZlzu7bS6bRRC1vZWwzWaX0A
	 mJ5R20D9+u4YAmQtTDPRiCZsKaPTQU43LOzfaN081OyB6JxmCAdIeBt+VVo7XsLok8
	 p21PChI1IEzxS/N/nxLG1A8WiOwIrs9Kdc/Zjpe7mYibVKdngyAS97CmGRmfGoDdiX
	 fjulTThcVunYGwCMVZWVuXcbtkUuLix2ok9VeoQy5Q9WE6C52wwblfBAYX3oeRPv//
	 DiiOeZPOnsFsA==
Date: Thu, 22 May 2025 09:47:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: audio-graph-card2: reference
 audio-graph routing property
Message-ID: <20250522-petite-intrepid-swallow-d27b0d@kuoka>
References: <875xi4axln.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875xi4axln.wl-kuninori.morimoto.gx@renesas.com>

On Tue, May 13, 2025 at 11:40:20PM GMT, Kuninori Morimoto wrote:
> audio-graph.yaml already has "routing" property, let's reference it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

