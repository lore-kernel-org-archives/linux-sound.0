Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39713126B2
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568631; cv=none; b=KevvyB/Yq06mF1yC9bRY/D5PUytEKjgDHuvVnUwdoc9n1gz/UyUPV9hK6EDes82wifjtSh/fsXa6YY1Nn0mbw8Z8ecz6P/1fkp9WEojTGWJ4N/+uMtt+YkDyQKLe38qLXutAyfa20wcRdDDfyK6GhjuhQEgASnoPmMEIe2Abxfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568631; c=relaxed/simple;
	bh=zGRevRS+1c3cISLJYK4ph6axFIjnmT29I96126jqspA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YMGCEi6EnPq+BLca6VeviBAOgpewS940Rlv5ywFd++y7Q6o1eK+FMdcLF3b6Jl7pb+WCmahf4L/iHV4TQua4sJOjDkQRREGdLPVytecGKqNBfYpvSnc2VfEcwKGU+MsPgtJRwEDp4R+IX2BUhxZvRFRh8nbiaTGKZ+WiQ6GVBQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXIhtA52; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXIhtA52"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCB3C113D0;
	Mon, 27 Oct 2025 12:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761568629;
	bh=zGRevRS+1c3cISLJYK4ph6axFIjnmT29I96126jqspA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EXIhtA52e6p9M0cltUj0FnDAbhV/lkOvn3BMFC0amd/xcAKlwZBXTZ8VTO8z+IXc5
	 vDdCr7tBiFyn0O+6sdjrNmCcDALxefgtcYONCJTBk9PfoiNDS9XU+XyNA8pqDIuozv
	 H+EFbYWFYNJLuM6wbIBR1A64TWfz0gRAwRQfWiiQYP8Q50D9rXXo2vXO8kNJZJvdxk
	 LQSvHF6DWJPCS1Y+y9CY6srOPhtWM46yy1+j6sngXiTD6SvANz/k+HCm/vTL4UqLTn
	 gIqb9mV0j6CIM//J/tBDzALH57EX7Nxir1ZvW0WCitUvPyhaAy/whV7vLJEcXbHxmt
	 +2e1nresvxQ6g==
From: Mark Brown <broonie@kernel.org>
To: Sharique Mohammad <sharq0406@gmail.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, lgirdwood@gmail.com
In-Reply-To: <20251023142044.2247989-1-sharq0406@gmail.com>
References: <20251023142044.2247989-1-sharq0406@gmail.com>
Subject: Re: [PATCH 1/1] ASoC: max98090/91: adding DAPM routing for digital
 output for max98091
Message-Id: <176156862790.24382.5536504848538903264.b4-ty@kernel.org>
Date: Mon, 27 Oct 2025 12:37:07 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 23 Oct 2025 16:20:44 +0200, Sharique Mohammad wrote:
> Each route connects two widgets, so in this patch, the widget "AIFOUT2L"
> audio interface output left secondary mic and "AIFOUT2R" audio interface
> output right secondary mic is connected to "SHDN" and also to "SDIEN".
> Route with "SHDN" as source is required because "SHDN" controls the
> shutdown and must be ON for codec to operate. Therefore, "AIFOUT2L" and
> "AIFOUT2R" must be active when "SHDN" is ON. Route with "SDIEN"
> is required as serial interface logic must be enabled, that means
> serial port must be enabled, which ensures I2S/TDM clocks and serial data
> lines are running. This is also the case with audio interface outputs
> "AIFOUTL" and "AIFOUTR" in primary mic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98090/91: adding DAPM routing for digital output for max98091
      commit: 2528c15f314ece50218d1273654f630d74109583

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

