Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B77633F370;
	Tue, 17 Mar 2026 07:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733905; cv=none; b=X4GYzgqfRcB6Yzew4C1MBxTnQSVAh5fQUf//JUOWG4ZUJaGoN/v0u25XNDAlHJ0dVyt1cLn3U/CJulKAbT03PrnwyNAZ85n7jABJ2A1olgCmw+A4uUEGEvUTt5uKMpIMW/jVBo35ilzWa5FaWRd3INO7w7GeTQRyWib/3t6jQBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733905; c=relaxed/simple;
	bh=DTgKQOjGOjxInuU85/citXraFmUYvI60GQFWFQGivGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLIY9BdxBn66H+0xL9b+yXLyEy5S5LIKL91QKE8KRYfP2ko5z44jI+6YSSPuRAkugUpMqotPgGg6O3uO4Vd/Dzcq3wgIttskuNrAYHUoKCBgAaLw+ctkT3bW4HNNkY7KrfeQNBgQk1CMJGHnJuBssml+NiSSxDWNUqgyWHy8Rb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qidu3F6x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qidu3F6x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7E7C4CEF7;
	Tue, 17 Mar 2026 07:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773733905;
	bh=DTgKQOjGOjxInuU85/citXraFmUYvI60GQFWFQGivGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qidu3F6xPSfyzd49HdwXhZO4pHv3E4IMKdNXYKJRWJDnrrjGfZ6zKmNIp3YuNIvn1
	 xRthSNUdTN5K1NGxXK1q9ikCfuHkUp1qJWxoQrL8zvDh6ysHlC/Un8cdYmmAcYD6sC
	 j1IlyzbNC/T4gKOfnJEC5FNxuhJrVtQmG4rbsT6YFOETIca6whLACWPCJaR5+HrMDK
	 Nd/YPO1TbpJJM99NXX6MytiTDAIHh2vrZdBBCiD+d9nRlOWgzoFxqvp4kyd50f9LGi
	 R0UyvTH1Pu13WcrqAP7YNJxE/jKpaVzgPnTqGHX2fttbHI7aRc1ArlKoGxk1GcMh4C
	 mRbuS1VaWc8wQ==
Date: Tue, 17 Mar 2026 08:51:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: rockchip: Add compatible for
 RK3576 SPDIF
Message-ID: <20260317-accelerated-mosquito-of-experience-e8cc7a@quoll>
References: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
 <20260316-rk3576-spdif-v1-1-acb75088b560@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-rk3576-spdif-v1-1-acb75088b560@collabora.com>

On Mon, Mar 16, 2026 at 07:23:00PM +0100, Sebastian Reichel wrote:
> Add a compatible string for SPDIF on RK3576, which is similar to the
> one on RK3568.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

