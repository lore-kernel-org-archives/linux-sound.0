Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C33231852;
	Wed, 21 May 2025 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817612; cv=none; b=q1ks2I1HSJoeLnGsNG7KNdAIL5ZK8wSpEMeduTYJdUWxvwMD+oKCIMwfC6amj5R1A6VD1lfnhXrPy+loh4ovH+c3xUsF1PwVafEOTzXnyKZPeM7ulYAzoU0rF5MO6uXCF9Bul2l97k1WlGAkynjubD1K5Gq7fR/nQ5ro2y1OixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817612; c=relaxed/simple;
	bh=GqhcHy+s2VZFuM/NmJY+LwckhNVt8w47dJVzGuwGhP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vro0Oxw5gX2KRSoiiBnF3I5tye9mqGAILFeSn2KGWMCc0yPgdHzVUD/uEBEsyIauNpr7Xd92Qke6IYJyVZvi9pdAtnxkCI1GoL9AiROHJTYNLvw6rL9T8Azs+r9VZXmLuYvY6rjVOv+cQUgI1PvchZMyQkFe3gwSMBDFZbUOz5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nmd0PJ2K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nmd0PJ2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5ADC4CEEA;
	Wed, 21 May 2025 08:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747817611;
	bh=GqhcHy+s2VZFuM/NmJY+LwckhNVt8w47dJVzGuwGhP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nmd0PJ2KfXPxg96r/u6qewjNu7MYNp3fhmNAzTEA+N80MLKpPTNfTY3AUWWcwcxfp
	 4aNMQHHGTYMaLUEH+xBBujp5lMN2EcWMP78HHK8Xa+4bvrGxDv/9TzCvwbC4B3ToWU
	 Yzo+peh+Wt68bJsP7G+LT4tcGC6geG+D7GZamJ5EO8yzPjDzdeyCMAxAtGzh9RibCs
	 aMPlQ5HAy98GNreQebJ6LWfA4IcOkf3APbgbT+dh1z5W2e3/fKun6kiLgAqlV8BtTt
	 2UI5f654h+Ls+QFKLsRFRg+nkCaRDqFzlGTtDRSc1y1u48v4aZXKfET1lmCMTBU+Pp
	 U743K/coC5mxw==
Date: Wed, 21 May 2025 10:53:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: audio-graph-card2: add missing
 mic-det-gpios
Message-ID: <20250521-intrepid-precious-ant-79b9df@kuoka>
References: <877c2kaxn4.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <877c2kaxn4.wl-kuninori.morimoto.gx@renesas.com>

On Tue, May 13, 2025 at 11:39:27PM GMT, Kuninori Morimoto wrote:
> The yaml has "hp-det-gpios" property, but Audio-Graph-Card2 can handle
> "mic-det-gpios" too. Add it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 	- droped redundant
> 
>  Documentation/devicetree/bindings/sound/audio-graph-card2.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

