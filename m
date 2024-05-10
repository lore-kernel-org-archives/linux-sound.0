Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BEB481C0
	for <linux-sound@vger.kernel.org>; Fri, 10 May 2024 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715347092; cv=none; b=gFY7z3K14ugK5xyejpJzbDb/EkjTsaW9YNYIq/Iv+04mxB4DlrMGJqeMC/p+8TacX3y7Ycc36hX3e/8rAwUO8hZVnrVmoXjKkTg6ywOrTa8BpdFIF1SsxcOo+wbqdnOK6mpVImPE2ch47TAp9CPuCwE3C1mL6wh++1jREfhyT6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715347092; c=relaxed/simple;
	bh=hHtcyqvhPX2o8hoLu/rDMiD2BYzXhE4Hpz0HLs3HrIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h/B3CQaU5UO2cY7+XSI0CU+Gr6zAF9jzFtlMjVanw9S3nnITXl90MoUmnh0haP08cy1hrRs/exW0Hx17H2sLsOdjplaQQ5cig1ymOhls0AwFiwcjh7rtjGqR812qKrhLicjsv7NbB1bgCV412xCT5RCTUyq8MzieUcy33MTNO48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUi+2+sE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUi+2+sE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED1CC113CC;
	Fri, 10 May 2024 13:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715347091;
	bh=hHtcyqvhPX2o8hoLu/rDMiD2BYzXhE4Hpz0HLs3HrIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pUi+2+sEQusxWlECKmT4XhzSh+uM2wfI4BQ1fiZyt2baBho3bUwX0B2iHNETedSyZ
	 hRnfoItJo/3yZ+42FH+jQvpIH/Anb2XVFKISFGjFHIHiiGFpzbLG9uixgraV3LvYyH
	 IQfKeYlV7j/5IjhgOWl4hScyH7O/Nc2nMCRFVtK/BN9R/ueCUSlC+b3pZJ9AMWMfnB
	 bruWlPWy9PxZSVLr7OjsRSLUdEp5B3m8sLo6gHH9K1CQdz90BTDHq682OxYt//Y+9b
	 9MbchKBO/11d3Uy+4Fvhj/rSSv9CJ8JjuCr/yR5z1kRlR6n+tIufzosCWUqiC1P1+a
	 O6+wN4JAZsxuw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20240510073739.23541-1-tiwai@suse.de>
References: <20240510073739.23541-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: SOF: amd: Correct spaces in Makefile
Message-Id: <171534708987.2178997.1235199291835204069.b4-ty@kernel.org>
Date: Fri, 10 May 2024 14:18:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 10 May 2024 09:37:37 +0200, Takashi Iwai wrote:
> A space should be put around "+=" in each line.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: Correct spaces in Makefile
      commit: acfff66ee405060576ca88fab5eb569d10adfb45

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

