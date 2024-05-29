Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210F716D9B4
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977243; cv=none; b=jpUxtbUMog0BzacBJ+RO56Y7DcZL3HoJqtQHAADCbKpaqqP5OlO5CMD9HBXF2F/awiGdIanOBpPoVtOVS441IjowL8xu3OwG6+toJY0jY8qoWp6zeF3OaaQtfQcZZCU9lMwsJ9EBm8DbmV3OfxbA2kywAyiV0wvNhH3uvfrg3Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977243; c=relaxed/simple;
	bh=BeZT1y1D0NaRWPFP1/L/72f0lhkbdJtiLP2bSL3EjQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mxMYiH1kNDAeRa3I026WJ41dJcBzYnfQNuSbhwFlTTO+8X3EyJnRJdZqOrgOW1vLMgaVvSa8IrPFGzp3oAqqR6kbVDK+bUwz4GtgLyVyDdObqvcrL2gL+xK0TrHZAXkwCQ+c73hwJtNM9ddll9jCUZ6mvuqIKupb5aXABS5AWB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4NG8EwE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4NG8EwE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B66C32781;
	Wed, 29 May 2024 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716977243;
	bh=BeZT1y1D0NaRWPFP1/L/72f0lhkbdJtiLP2bSL3EjQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S4NG8EwEFon5y2qHe42QDhmslO6IkZjww0FKyT0q+pUwPIBw/Y5kyR/kd0M2iNfow
	 DHOKlJZ98WhNhlkKt4j2KiLsl1Cgp1cXEE+WqV+0gQfinbU5a3PubpxveBQkHXPP8x
	 LeR6DxxdvWtTAKZwrJ2O1jShhck4cbIYDq8uNXtVneN6Cad0n+pN4dNoEs7infv/Rj
	 PZ6BC/VTEckAp21K9nFBFkRMawcU6jPLK7Fisomp1Mb+ftLeByYiQZbGi6fPth5tgy
	 wM7Es8GxeC+c3A1rO75fi8SP/qa9RvOeta62Cq4Ju6vAJY/R4Kj2cRb3Q3X3VBKofQ
	 MCgATLLno9R/w==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20240527100840.439832-1-ckeepax@opensource.cirrus.com>
References: <20240527100840.439832-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Only restrict 44.1kHz for the ASP
Message-Id: <171697723826.23184.9578882362103619222.b4-ty@kernel.org>
Date: Wed, 29 May 2024 11:07:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-2ee9f

On Mon, 27 May 2024 11:08:40 +0100, Charles Keepax wrote:
> The SoundWire interface can always support 44.1kHz using flow controlled
> mode, and whether the ASP is in master mode should obviously only affect
> the ASP. Update cs42l43_startup() to only restrict the rates for the ASP
> DAI.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Only restrict 44.1kHz for the ASP
      commit: 797c525e85d1e44cf0e6f338890e8e0c661f524a

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

