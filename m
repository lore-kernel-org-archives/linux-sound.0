Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A6812FB03
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 19:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708975702; cv=none; b=Bcv972ILgCXuMHVUFdzRHUZdvzgU/uq0M7rytlaYsM0PGyjQfnChaPIIxgWwOqGQAiIGlpXuYW8dXkFJAGOkuokxekpoNTyUGdGwJYTjLrT5xhfDXuyCh9KXk8MZM3ChYx4TFNfyruy6IaXE/qA/b2X2LtG/xpS3InDqSZtg2nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708975702; c=relaxed/simple;
	bh=yov1KLPW8jwxZx2ukMf7yAUWEQaYbyWrExCGjm2gvdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QMbXdqso/0X+BsGz9ef+tMlwS2NP0gFZhPxAcYHyKhsXEMQ7J0HEgg2iHuUE9XCMgPpv2VOiVRfmsePutou/eSjOU7rnQTSjPPH09rzpWKaUMrTH3UMNB2Jr7zLp0dg2+7p9YUGBlMoF38Qw2s6KJW/8cA6M8eIVwB8oPfooYs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy3LA6Mj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy3LA6Mj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3CAC433F1;
	Mon, 26 Feb 2024 19:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708975702;
	bh=yov1KLPW8jwxZx2ukMf7yAUWEQaYbyWrExCGjm2gvdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fy3LA6Mjfs0NNrQpnvUQ75mu9K6CKnI8ciNizTKxs9Jas+bxGp2IStaCustxrLtfl
	 klfJDYGKTEO6h3mGO9igdI9KR1bGbOmvom4WTEV9+n09N2gGnTTNvRr64swppHxU+V
	 Jqqiw4mh0iNaWpi+K17Ymai/OPW4P2Pi6y6iTDrPA9+oFr4D0fCKEqVtNeClucgE/m
	 tILtRyRo+6eFEdJLwVO//phB5d4KsrdnJ1lr8BQj2QIQOL7NXN64zLVoONslDvigNQ
	 xasdmh0Q6CTTJOdoN4cFohp3INQLb2Nr0bfvHbTJIquycYrkr3ubjfYerBjhf+JZ1o
	 RoXluF4voCjKQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
In-Reply-To: <20240221152516.852353-1-cezary.rojewski@intel.com>
References: <20240221152516.852353-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/6] ASoC: codecs: Simplify mclk initialization
Message-Id: <170897570049.121037.17100833782981803408.b4-ty@kernel.org>
Date: Mon, 26 Feb 2024 19:28:20 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Wed, 21 Feb 2024 16:25:10 +0100, Cezary Rojewski wrote:
> The patchset may not cover all codecs found in the codecs/ directory -
> noticed a possible improvement and grepped for similar pattern across C
> files found in the directory. Those addressed here seem pretty
> straightforward.
> 
> Most of clk_xxx() functions do check if provided clk-pointer is
> non-NULL. These do not check if the pointer is an error-pointer.
> Providing such to a clk_xxx() results in a panic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: codecs: da7213: Simplify mclk initialization
      commit: e2cb72d28740516cb03fa072e14b2f1a6eceef61
[2/6] ASoC: codecs: nau8825: Simplify mclk initialization
      commit: 71d322fd16a3a62d32a9e6a8d08f48e8a945a515
[3/6] ASoC: codecs: rt5514: Simplify mclk initialization
      commit: 67e9bf093372a070f67f85a6ffceb6a44d4cfcf4
[4/6] ASoC: codecs: rt5616: Simplify mclk initialization
      commit: f76de61ad1eb725cc05727377ccd4adda336b822
[5/6] ASoC: codecs: rt5640: Simplify mclk initialization
      commit: 6413849b678b04e30b5c938e344e653c31a5f73b
[6/6] ASoC: codecs: rt5660: Simplify mclk initialization
      commit: bf900c85f8a4ef47b868b6345879e35826a4fec1

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

