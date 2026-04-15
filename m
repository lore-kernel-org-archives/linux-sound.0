Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2163803EF;
	Wed, 15 Apr 2026 21:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776289890; cv=none; b=lr29WnR+f8uw4VzeASqWKY0dxwVDVOD+fw9zb/mbh4Z8yhQA/j76kCBRIIsFLhmCgB5p5GnmdY+d5ocGyOb6zcxmzb/CZAUSZBT13Fm0hKpUi8xx/tKkoqwdRK4QHtupYpRJRpf5dX3e3BT0KtL8SLWwtWNRUp9iNIgmMfS4iOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776289890; c=relaxed/simple;
	bh=oyZwUyRQzG/nIYpblsarSIbWA3aKj0rWxz5YN4dmVvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkQer20SXxu2qaEVYvoNbHFagVhZofjNCllyxhGiO9vZkYmlfQ4LUv5KyDUAZO1gtiX/rlDKdzQx1/3lpGN3mBbGmsYs0WbYyZu1mgdS8zviadE4IYvWdbncRg90yN7OlbBGiCFeb4ph3XBgU6HiEeH5uZDzYNyOCY6R+vN3J3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyHizvdg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyHizvdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDEBC19424;
	Wed, 15 Apr 2026 21:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776289890;
	bh=oyZwUyRQzG/nIYpblsarSIbWA3aKj0rWxz5YN4dmVvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GyHizvdglc+29LgsaGAWqaYVL6ZYI/hYXuMgOIsu/Zi8LFkNtJj22L4xRaesCDyxx
	 56gK+ShdTMhvUwTuDaJKwvx75vfy6rkw5u7MBiEkgK9McC6z9JYfSzckKZ/9t8J1rn
	 EMFM+6wpvuDb52SRP9FnDqKPBLVl+tMw9JHUfX4wgCwyUUhgrZUmGqx3tkzNyoi7bW
	 o88eNOnIyBlMxApe04QezRYHHAHC7AScrwcuSyM0v2t9hmLTsFjiurQFT0xr0XhRA/
	 HfkpOdwNDKWy6sINOIFlvmjRtE3LY2uf387N81A9d7rsu9Qrv64u5AViTcWTkOL0Ek
	 y7CyFYVuyJlhg==
Date: Wed, 15 Apr 2026 16:51:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl-sai: Document RX/TX BCLK
 swap support
Message-ID: <177628988619.723274.6196056382812573083.robh@kernel.org>
References: <20260404183547.46509-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404183547.46509-1-marex@nabladev.com>


On Sat, 04 Apr 2026 20:35:00 +0200, Marek Vasut wrote:
> Document support for setting the Bit Clock Swap bit in CR2 register
> via new "fsl,sai-bit-clock-swap" DT property. This bit swaps the
> bit clock used by the transmitter or receiver in asynchronous mode,
> i.e. makes transmitter use RX_BCLK and TX_SYNC, and vice versa,
> makes receiver use TX_BCLK and RX_SYNC.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
> V2: - Drop | from description
>     - Update email, rebase on next
> ---
>  Documentation/devicetree/bindings/sound/fsl,sai.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

