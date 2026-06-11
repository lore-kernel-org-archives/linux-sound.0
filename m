Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D0A3CF026;
	Thu, 11 Jun 2026 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174710; cv=none; b=G3OF1WaISsdH0Jeq+QRN+hsHkN1/fGrI+S8IpZ2rxcyfye3MwQz+D8B2JpI75WIH/KWH5BfC63honnTkSWfYgtEhTgCYRPpd06JFzd1Kmy+c/0o+ytCE7rguWS5YUe0414/ko+CyHHqB9MHukT7K/W77PssKT2nh8y2c9PyNS94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174710; c=relaxed/simple;
	bh=xUf9NP+3JTz8YejeI2xVB53MhV7ZsY1BbnCq+GljtKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+fbyCzCh4OziHjQdI9KG3fgkkpzdwrz9fBjevrUzdUyxr2aqSW6GuxHCsLYM5XC4VC6sFKwfINQjl5cEAx8gVpS1mk8MKP7Mkl3Ue0wmVBgZivg7UwPJZE8X19b5dWPOfrmA5d3OXIjnqVEoLGEKMU/vfPjx5RnkkOE3UpDn+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+tPaFoE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+tPaFoE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD371F00893;
	Thu, 11 Jun 2026 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781174709;
	bh=lpxcEneq5G32Hfx07mEVbt1enPmTSAquqlhYMABWXo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U+tPaFoErm0EvgUSOmTe0GLqROZtGuwSz46geC5+zu9Xxxd3dbWJCbL5zqR+rr+xY
	 9IrW2NUKfyh3yixZmJ4t7b8i+lpsD2oOUjFrLZ5RQfkS4oWowa+5gkywSiHhtY40vt
	 sOGfJWUmXumOtxfeX3gceoKhCxZVKopf/D7T+p9k8PphzWG0JAF5F7Wfxoo9+i+xwV
	 Pt0b6e180t1jnGxxZA1CEAMQI9wqHpwFNhrWuif6ToncHNOH6BuXiiHOwB2lz6Uisb
	 tTO+gr3qftrfspnfLlw0J3f91EmlqvNs9MhVynw6MXBpf1/8qRb1EgfnlNN50Pl0lS
	 ssqUSF+SYgi3w==
Date: Thu, 11 Jun 2026 12:45:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, 
	devicetree@vger.kernel.org, tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Subject: Re: [PATCH v1 1/7] ASoC: dt-bindings: ES8389: Add members about HPF
 and clock
Message-ID: <20260611-mamba-of-legendary-anger-af76a9@quoll>
References: <20260611031824.4628-1-zhangyi@everest-semi.com>
 <20260611031824.4628-2-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611031824.4628-2-zhangyi@everest-semi.com>

On Thu, Jun 11, 2026 at 11:18:18AM +0800, Zhang Yi wrote:
> Add members related to HPF and mclk_source
> The value of HPF is not dB, it is just the value of registers
> And add HPF settings to the example
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  .../bindings/sound/everest,es8389.yaml        | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

So this is like third time you send the same.

You never responded to feedback, I don't see improvements and you keep
sending the same v1.

Version your patches correctly - read help of git format-patch or just
use b4.

NAK again because you just ignore us.

Best regards,
Krzysztof

