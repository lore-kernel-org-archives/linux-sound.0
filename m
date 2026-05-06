Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15FF40DFDA;
	Wed,  6 May 2026 01:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778031662; cv=none; b=dQa6n9+K+MAJJ8LZobJKPvchzEtUsl6jsRTKAtosJ71s+6+aqL6UcMdjc1lE6DA6KAmXtx8n4Y3biJjKa7lusiWAPFYRFBtDe1gYLewH58dDxWIonbZIkmbuDc7DOLuVXvhCUH9xe4LbrC7qvDCHSVVA0edZtzhmNzFIULDyYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778031662; c=relaxed/simple;
	bh=hhMyhYQkEibov8dn8mpF2dhq9pE2vOf4P3z3yErV8Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTFBnTBdDLqOHrMmhJo7rK2MvsYX8LQP63Ds7i+BfjnY4r2TE2pbqaDSkSxM5aYLwLd0xn+Tov/Gb2B+FR3MZUkFsp20eT3BCnthC95nH6u5vlFScTOKv3LN5Vc/CwxKy1maDSFz5fHlEyydvw2QNHHNGpJxOrDQ9PXeFyLRqlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbmIvA0C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbmIvA0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409D5C2BCB4;
	Wed,  6 May 2026 01:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778031661;
	bh=hhMyhYQkEibov8dn8mpF2dhq9pE2vOf4P3z3yErV8Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbmIvA0CoRDijT5PixCvhBpVGsf6Pe4U9+n6QJfiJ1GfQfJxpMKA9fg7rOuw/7ee4
	 RhVtgKO4zwQx35Z0rvxTLveNcyBatCa0K7UzyOINYii6rOdpBwHhaS4Zx1w/VkT9Kp
	 cqDiL/eY4RhGnXKBHNAsrtUq80zHpAhA508Khi7b2lhL3iIVs0UxNtv4mVhAcqtvjQ
	 xpEQQ4vEuvcxEXQBpoQp9XF6dTaKCvi7oB2PBkKNDkdfJhoyb7oRBDBKgw6zChytNE
	 btd0bvsL7VmTgd6cSCwpGQ7B7yFJ+/aO4vW+AnBIgpj/EEJ4JuIyP0/iFuEFhjnqEW
	 AGfeQUsMYrnmg==
Date: Tue, 5 May 2026 20:40:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
	spacemit@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Yixun Lan <dlan@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/7] ASoC: dt-bindings: add SpacemiT K3 SoC compatible
Message-ID: <177803165885.276520.14965394611244579892.robh@kernel.org>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-4-2fe99db11ecb@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-k3-i2s-v1-4-2fe99db11ecb@linux.spacemit.com>


On Wed, 29 Apr 2026 09:38:49 +0800, Troy Mitchell wrote:
> Add the spacemit,k3-i2s compatible string for the K3 SoC I2S
> controller. The K3 I2S IP is the same as K1 but requires additional
> clocks: sysclk_div, common_sysclk, and common_bclk. These common
> clocks are shared across multiple I2S controllers on K3.
> 
> Also add the spacemit,fixed-sample-rate property which constrains
> the sample rate when multiple I2S controllers share a common bclk.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 31 ++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

