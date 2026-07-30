Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E3476CFE
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 23:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453668; cv=none; b=euwVnqEHDIG59gljRQPc6A9LCZauYQjnznYhUWsNC7uqdC7hIux3K2OF2dmGlpyDO3J0l7/eWFxct65w8eWyN9bn/szaYNLNrzKm0q3k/9eod25/hXbjm5pqv0g7YrfryIZQIA5LoJCSXBgyY6SCUJFM+CHxcIJhBTst8DNYgjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453668; c=relaxed/simple;
	bh=ofVu5yOW4CjWLM0YWDVYmERiCnmUEolYnTlLaIliyBs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LwC2DIZdi0V9jGOPQc9S4XnsXEVb/sZnjBmFx7BY/S9xQAt5wvil48ot/bbqV5YoeU3+V0ZmeVZhlG2in4yJSVIi0lEvXLq2fbabqzm++3Mfa94npQVjdJnfHFoIHDhoxfoZ3Xc+7YkC6pMi44UXjH6z2+OS/RENlMmiuYEFByk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLGd/5Yb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLGd/5Yb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF441F000E9;
	Thu, 30 Jul 2026 23:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785453666;
	bh=Qqzz2g3MXpWrNCvz9wPS9MUiTpl9XOlc+5nQzvWnmGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SLGd/5Ybf1LbakJkZmKGJn1OACS/pgoR1yZdlKJcbhHTl1LDF5lQGDwCYdhv3o1zf
	 oVNaO7XPAbreZBuPtPk69vgtodHMVShhYEo0DQseSeQvGt60HrA+52gCicWTCnSNUU
	 vuCxIQtJyNWcOmCpqNZg/3rxkGAlDZqpoO47M+jJLfiN45aPjf1lT/oTDYv8g8erzT
	 BfupcObVcn2SAJKA5wtIlRvpg9JfrKf5x2lzUxBlYLWJeKg9mVfYligg22eE4bzm3U
	 UxmhGGjsHXgpQRTWJUSoSKgPb2h1S/nDCVw+OkwjcWK+hRcmgjG3qHQzIuCZCe+gE5
	 oH8nBrGenkm7g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260729032227.3750770-1-shumingf@realtek.com>
References: <20260729032227.3750770-1-shumingf@realtek.com>
Subject: Re: (subset) [PATCH v2 1/3] ASoC: SDCA: export
 sdca_find_entity_by_label() helper
Message-Id: <178543320803.343356.5106832969414816209.b4-ty@b4>
Date: Thu, 30 Jul 2026 18:40:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Wed, 29 Jul 2026 11:22:27 +0800, shumingf@realtek.com wrote:
> ASoC: SDCA: export sdca_find_entity_by_label() helper

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: SDCA: export sdca_find_entity_by_label() helper
      https://git.kernel.org/broonie/sound/c/c24f4797d8e5
[2/3] ASoC: SDCA: export sdca_asoc_populate_rate_format() helper
      https://git.kernel.org/broonie/sound/c/772e3409961f

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

