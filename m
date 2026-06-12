Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83CA946A;
	Fri, 12 Jun 2026 15:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781277128; cv=none; b=NvjOVhAdkoxRRTqEY5ijQlHVnmNnUO+pDwX9wRxpr6H3I/vJLxFDPA+t5XMJvRWcnZYRvTZ3kOBLVIg2x+zEC/vLCAjBa64ic5+C5wm1VnF3iQPT/4IS21j/QXxrTp4FKbAL+fNSPWcqbbuJctOptgTahJ1V1+hlPLP9IP63CqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781277128; c=relaxed/simple;
	bh=wY3mfMYzOhc0v/yjLUAD4IypuwjUeOJQyyb6OVha6gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmLnAbXL4u0aae19HjFH0uZNRvKOBCSsl0hs678spZRh40StnT3nYnvL3afocJnrbtdHqootdB4oUt1t1CJvDD1I5TQd/kp19AJfWPuffBL7Qeh63OKsKhrIAS0/lqOqtrnQrxnPOFkAnPXFJL6WuFceyvVRdxoFmWjlrUr04NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgnGNNKn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgnGNNKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8721F000E9;
	Fri, 12 Jun 2026 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781277127;
	bh=Sl+jzIVY65x8T0Pt2I7VlkDlhCHiRh/X8cMGKKSNoEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FgnGNNKn9s23sVBUqi+FNBIVrp421ZfG9YP4QYf0TpFAoU/OlFoN49seTeUlgsjcI
	 MFJaN/+4bQhjtNySxXNi3WBVvylt3D0q7OnDJWP3KG71lBAmNXOih94Q+g+NzkrbJn
	 RpmlRjororN/hCTcX+zubWuXfcLXF4MYFRl+HNNRNaxvDsUuAOIHu3TyhcgVIHegEa
	 QFaNaH8JlRrS5zM5uDrxTzjq93e+8533nyBeeZl9y5h77bFZT/gqn/SShGYfPqjtx5
	 Auvu8CttajYHsdtJV1yO/ZxlEji9coZlFoTgjfKMK02vx3VZpYaZloAHkiE/qVs+N9
	 bj82rZjKoSFRw==
Date: Fri, 12 Jun 2026 10:12:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF
 clock descriptions
Message-ID: <178127712594.1038565.14609439013063781178.robh@kernel.org>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
 <20260602101608.45137-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602101608.45137-2-phucduc.bui@gmail.com>


On Tue, 02 Jun 2026 17:16:04 +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Update the binding descriptions to match the actual clock usage, where
> 'mclk' is the controller clock and 'hclk' is the bus clock.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v2:
>   - Update commit message based on Krzysztof's review
> 
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

