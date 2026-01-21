Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D7A286D5E;
	Wed, 21 Jan 2026 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962619; cv=none; b=aV4ZgurRtEvJjHKte34DAxoZf181Z3hoxZhVemYPBC4Ceai5vZzI88sPzmTgKjcSLI3Fg2pFvL0iWRLc51nwMjMajm2FW3eirvs3ZdnuZeK+Ypbp1PJMkv7PnYxqYNzzdMNyLaRVkUEjdBs7oHusY3ktbPzGXJZ/60lOZAOQ98w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962619; c=relaxed/simple;
	bh=qGrGq+WjO+0/AMaXMyyeImAUN8v9eq1Kl4YybbLFXzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/8rAu+ti1NVMN4YMPpUsCKL+V/lqfht9kr9L7/5bZFoYs2s1OKKw7Yuodns7uXC5sHH/8ooN4BtLWdYg+y4g5c/+qFdi1Uqte0DqnNzOc3MPj/EVCbrguedeGZgVqll+QEqPVRMC1lxIHI+OxSRJ4UTqp1qszMGsEEVtekV8LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uoItEJWm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uoItEJWm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD35C16AAE;
	Wed, 21 Jan 2026 02:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962617;
	bh=qGrGq+WjO+0/AMaXMyyeImAUN8v9eq1Kl4YybbLFXzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoItEJWm0LVFPE7anJieBvxWmwVdoDk558iLW23WzQAstABvo9/zQOVi3jsMtCgf/
	 LYtsmpG0gywjuHq5Rq0fxpUgBlzXovRd7O4jBMXMQRoA9elWM3sATYZIDlE/6W0QiX
	 SSNx4dWROuFb+mwg9jc460Dv9W52IYBWmgOtfO5yLoPvErbsBnpET3+OsWLHoXkNb/
	 Y0QLjO/JkpKPDDG8WtlusYBHvzuh5A4yzZM4jOd+IsvDgu8xCxLHY9vG3XB+csdibZ
	 4tlHUe16S0cma/Dhken9DepdXsLgTgrIFLNKPzHXa/YN98KD7QK0vBqIBfOY3JN+G0
	 NIXcnGRpnqV2A==
Date: Tue, 20 Jan 2026 20:30:16 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Takashi Iwai <tiwai@suse.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	sophgo@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v4 3/6] ASoC: dt-bindings: sophgo,cv1800b: add ADC/DAC
 codec
Message-ID: <176896261596.1836014.8166453734393092086.robh@kernel.org>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-3-6ef787dc6426@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-3-6ef787dc6426@gmail.com>


On Tue, 20 Jan 2026 23:06:05 +0400, Anton D. Stavinskii wrote:
> Document the internal ADC and DAC audio codecs integrated
> in the Sophgo CV1800B SoC.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  .../bindings/sound/sophgo,cv1800b-codecs.yaml      | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

