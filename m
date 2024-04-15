Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF6E1864C;
	Mon, 15 Apr 2024 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147978; cv=none; b=fpJ4OXvy/D8Kp4b6gVseaa6nVm5Ti92LZoiGWK88nbiupTPYtjHsRLED1wp/CRbnuV81f8M0sz7GqrQagp9px4E9y91F+SpkMl7AiFfOZdfXT7a4ifB92EwlbK9TXn+Ypropx7POtCtXDUb7+KcWSe6984MU8lZXr+G+uM1QIuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147978; c=relaxed/simple;
	bh=LAgK+StBnGkWbSGATqPLBF1s3gA6gg3TYn11vtSjrE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GucJNlygZIlswy8G4GCdUxd9Q2UyErAtdKLtWD+3p1Z3qgBpSj25zVAqsuAN2bYxrpwLR0bT8UbY9V/6b5xx6df+O0YoJU7cr8q6PomlDC5NOox9aHrJPBtn7zzu1zMnMLU0EYsZ8nuFVeTyyUvmYoOgh6JPGMyK2TJ+ANXUqWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIoNh3Cv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIoNh3Cv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F065AC32781;
	Mon, 15 Apr 2024 02:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713147977;
	bh=LAgK+StBnGkWbSGATqPLBF1s3gA6gg3TYn11vtSjrE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AIoNh3CvaJscKxg5T5HrS1Fv3FZE+H+Til1Qf//LrWvcbg2n6T+OInjVhQsYSs2pp
	 cR8uN4U/y/YbDwXKFUFxSeHdoHUr4m7gf90qpXcQ6fZ1Qwz8l4ZGX6IRGwZqBH/2Lu
	 HPWZLYmvOm3mcF6EPUNyu0cee3LLzqO4aFRS8bSzoTTi6Zp8U4lv6+C/0Gp/ldhDWV
	 6CWTIaS7xb+xrk2L9nNkZsncDWLaS1X/hY4u9H2iMdCfqG+6sJWwvG8UOUPIjkooN8
	 1+q0hcGtMwkmjxhrhBJnvPeyO+OrySQZTU/So6aInTn0anWhZZHCwmfCr2dF7c0XVF
	 kW18qA7vJH+rA==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shengjiu.wang@nxp.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
In-Reply-To: <20240412121410.2948048-1-festevam@gmail.com>
References: <20240412121410.2948048-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl-asoc-card: Document
 fsl,imx25-pdk-sgtl5000
Message-Id: <171314797539.1649319.16109271891144958377.b4-ty@kernel.org>
Date: Mon, 15 Apr 2024 11:26:15 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 12 Apr 2024 09:14:10 -0300, Fabio Estevam wrote:
> Document fsl,imx25-pdk-sgtl5000 to fix the following dt-schema warning:
> 
> imx25-pdk.dtb: sound: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,imx25-pdk-sgtl5000', 'fsl,imx-audio-sgtl5000'] is too long
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl-asoc-card: Document fsl,imx25-pdk-sgtl5000
      commit: 4be7bc275253c0f35c8f6362af1ee5d91d5d83e9

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

