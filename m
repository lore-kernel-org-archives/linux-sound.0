Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF6399CF5;
	Mon,  8 Jun 2026 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906065; cv=none; b=YNndCmjFqElfhZqOaGfNw7XausBZktH2Gb4OiyerfES5Qed59LmmLhNCVPzpZYEfzNg24gUfCkfSZRHdZyrQtNtcgqbxgBMUpAIcXtXrf7VE0RfWFX8LPYyu8AqbQyC9EX0cwDZh9wzogBVGpgyQCIR+sh8Yp9yG+/m2X1oQq8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906065; c=relaxed/simple;
	bh=eEf58wVHdRuUO/Hskq0T4UR/B7ICRR2BGeZ5Y5irEZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpdmTBb9Bl4opiq4KNRaH8+V/UpTcDHgOqvp2V2pOKhvvQ56ky3PPARssPqWPm6x3L27ZFKUnc7GvgZbunBj9bj7KiXQlqhJMCtwr8JDdQZ8+N3oGW5uW1bYSPVYLmSoxYm+ahlFO8z+4nkvIcRhzM+A2H6dX0iEp6CX0CFVWlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYiUszw6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYiUszw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A631F00893;
	Mon,  8 Jun 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906064;
	bh=nEyq2RLHjc1mBNuhUMfnxj06UNEfpzy+ame2str7MMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IYiUszw6Bwhonk0Bqe4kZxEpzYYtOw4z2OAijXRCIbUdXT/nJg0ImRIJMDOZ7xO5D
	 PtLikCyk61G61Aw6pTlSdCZuM0uZbQOMzSklICjtHRCrBLLA3HKHeOASyeVkPykSIm
	 jdj2NCeT114IP0IRJwCcG3imyYa+KpNUaJDXbLkxJdyvvwrcHG/76BECs4Yps8RcsO
	 8QTAdypqgXhcmq7hhEKTjNkCIk1i+1eRY6eLXeNtO+6xm8ZSLylWx0hUPEfoW7PROm
	 t1IX20/JLqS+JDOfaGGBF3qz46IF5RQMAjTLVphrlug6uVBoNKhnaBnytdu605cZqb
	 sstu3Kgyt+Y3Q==
Date: Mon, 8 Jun 2026 10:07:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, andriy.shevchenko@linux.intel.com, 
	13916275206@139.com, shenghao-ding@ti.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, k-yi@ti.com, henry.lo@ti.com, 
	robinchen@ti.com, will-wang@ti.com, jim.shil@goertek.com, toastcheng@google.com, 
	chinkaiting@google.com, riyo@ti.com, a0393308@india.ti.com
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: ti,tas2781: Add TAS2573 support
Message-ID: <20260608-tough-light-mayfly-08c7d4@quoll>
References: <20260602100532.6463-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602100532.6463-1-baojun.xu@ti.com>

On Tue, Jun 02, 2026 at 06:05:31PM +0800, Baojun Xu wrote:
> The TAS2573 belongs to the TAS257x device family, featuring an integrated
> DSP and IV sensing capability.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
> v2:
>  - No update.
> ---
>  Documentation/devicetree/bindings/sound/ti,tas2781.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

