Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393452FA0F3;
	Sat, 22 Nov 2025 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763808952; cv=none; b=XzgVVRTtkAZ0geljL7X/fBELozd/g4zoHs1CIotReyh2bBPm7SOc7QRWMAnHmkqd/va5SnhA2MxGQe702Xtmho3ThjfcwzHLkwkh0Sef/yoEeDGDsGSgIEDdtXITXQQYnXdV7hK9lGvqRWNkLqheKFSOAA9RFqWn+QnRdAJEYtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763808952; c=relaxed/simple;
	bh=HZ8SGt5LpiDkeDZ5QijPEVOSKtKXHqPpxLl4Uc4UGAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Blv23Ku97xz51WgcWICVw07QLzHHL/CUGDa7krIJo4JUKIfC6zDD+J6K2NtobTdJbNNGo1SGPu69crrKqArt8iLqSvAZjqvSxhgVt3VfomYddDfGW2YxQQnHGH2zB2IRWr2AgLcWl0JckFOK9tR6jScVUXWJpkBY53dUPGiyirI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKJs7hoQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKJs7hoQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0A9C4CEF5;
	Sat, 22 Nov 2025 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763808948;
	bh=HZ8SGt5LpiDkeDZ5QijPEVOSKtKXHqPpxLl4Uc4UGAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKJs7hoQS5m+r84Y+XABoTGy2qFyJgiWiRUlDYERtz93ayMAZGly7zY9Nh5/6p6Rs
	 ojYO+7pRD1vmZlFkl8RF6dJJUZusYpzfwumZDu3Z+aO1pBf26bJj0NRMbr3MehU/fY
	 l5NhAKBb7mcbln0d255n2kB8e04quWaz0qFWzjViTdfPU5FAFBSeU9cKgrW+IAlD8/
	 oaVl5uYCe6q/+vUt78Za7uTgwEGNAaAxPlNedDFjCdbnvCqx6p1NwazLcL1FtDQvJQ
	 YN0H+BT4kAdOndM2W+dBr5B9z8PTkpktel9GIkhiNEebhHItN7I3TXE6JWMHBsAZuP
	 dCmfKPNkgyskw==
Date: Sat, 22 Nov 2025 11:55:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org, flove@realtek.com, 
	shumingf@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH v7 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings
 for ALC5575
Message-ID: <20251122-prudent-ancient-puffin-63f54c@kuoka>
References: <20251121084112.743518-1-oder_chiou@realtek.com>
 <20251121084112.743518-2-oder_chiou@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121084112.743518-2-oder_chiou@realtek.com>

On Fri, Nov 21, 2025 at 04:41:12PM +0800, Oder Chiou wrote:
> Realtek ALC5575 is a highly advanced DSP and microphone CODEC that has
> been designed for AI audio technology. Its impressive features include
> an advanced HiFi-5 DSP core, a Neural Network Processing Unit (NPU)
> owned by Realtek, and embedded 4MB memory, which enables it to operate
> highly advanced AI audio algorithms. The ALC5575 supports 4xA-mic input
> and 8xD-mic input, as well as a rich set of interfaces such as I2S, I2C,
> SPI, and UART.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---

You still did not respond to my comments from v5. You did not
implemented some of them and I already asked for improvements.

I will not review this and I mark it as changes requested in patchwork.

Best regards,
Krzysztof

