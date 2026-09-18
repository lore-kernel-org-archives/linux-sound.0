Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A89775809;
	Fri, 18 Sep 2026 19:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758204; cv=none; b=nAopf1uUNCYkz8JxJhVIgV8gWlIn0r6nDuTMptq+g9jAQj6z1Malq8hRGR2SfdLUNNZoG6VgQbb6QFXIprhDE1qp8Jl3uJrk8W0Q7hTTbVW2vxxxLhbW7pMbhI02MkMA6FXK4fmib7AmlcA3FDZ5Swh89MNXs9p0mBGN9EgwCOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758204; c=relaxed/simple;
	bh=VGu5OVe8Gt32guAgL50wZyofjiBQ70zzPMiDozGV7Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZ2z+V7FdokYTww8LY97iMaEGn5jupccoWiIm/CryewExGPDLraaY7lK5csNCXMg0O2eUjjt7+LCOVgHJcz6/BJ+gdo6OBAIH7ppx5muf/CnIMDLZPrn67WDLuy/SQuLa0FgrbJOoXx9aMfIGHhPwEJ7gNrl7t7mivqyp137SMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kx1/zlEP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kx1/zlEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426271F0089B;
	Fri, 18 Sep 2026 19:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758191;
	bh=SMDnpXRqsriaFT8Kwgp4ogIYYIUAOMqgkFEA8+f+WNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kx1/zlEPm04Z3uAI2d24PUThV8wI1wz2rdv73kqyntVSgJPOHqDxMxRcWO81TseD7
	 plHwA38f2htZld8xgugwedN81N8w9mFMl5DiW2rxoQoJ52HiPd7eO0BRu83NAUPU38
	 P3Jo2ochiEQ646JiaAUyQ4bkidpyJjmghUynlOJ07I6Xsk2BttBRv8yWfHqfCs6XrL
	 wpboV/xmPhsySQt8bJehOOTcieyeCZcN+zy9fzV4qKuHuw4aV/XjyzAh27E11VcPCd
	 QazfNhTWM+MqjOxeTbaWk0e4sErL6tLkvwKCQApOxN2IGlWIJcYZLOeyc6i8kMPPeh
	 95hOIMUIeTVkg==
Date: Fri, 18 Sep 2026 14:03:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: mfd@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/9] ASoC: dt-bindings: ux500: Convert MSP binding to DT
 schema
Message-ID: <178975818919.1425531.9356057148360708257.robh@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-1-6771ac714e82@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-ux500-simple-sound-v1-1-6771ac714e82@kernel.org>


On Fri, 11 Sep 2026 01:03:44 +0200, Linus Walleij wrote:
> Replace the incomplete text binding with a DT schema that describes
> the clocks, reset, DMA channels and power supply consumed by the
> driver. Define the MSP as a zero-cell sound DAI provider so generic
> sound cards can reference it.
> 
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../bindings/sound/stericsson,ux500-msp-i2s.yaml   | 92 ++++++++++++++++++++++
>  .../devicetree/bindings/sound/ux500-msp.txt        | 42 ----------
>  2 files changed, 92 insertions(+), 42 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

