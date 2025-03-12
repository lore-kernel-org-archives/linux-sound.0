Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38794139CE3
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741791623; cv=none; b=ZTEPOpjpDQdml368E4OYHnEMAV9TNCLuq4qDdumYTC1x8frvYs9bRiDRqU+vOxFTkDi3fyGU9R1sVwOFwIcCPWCX25WwZTQ9T9XRNIArWoHlTNManim28IPm25uIPVGPv8mBzji4GFpYsB4+z+xzmjCqZYg5omID3f8UueRExjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741791623; c=relaxed/simple;
	bh=h0owBGHML46ZHAUJfTF0XA+gxwgfLdWLwidnV/opcGs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dnALvwH+ApHib9VDKfBpAgVUp5jJXxbMtc6PoUb2L4eH0/DjzjYGYpAZDdFJ4cwF2tRMqXzXNK2aFYaZ8SWQ5XpLnRwTCXGhE7xCWG4WMYR3TZaA596a8Ubwr3RlcZ6padfgn2+k8mBZwTgfGLuNav0CL2IVa8O6Z/KmnPHbUMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhW+5qd1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhW+5qd1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B75C4CEDD;
	Wed, 12 Mar 2025 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741791622;
	bh=h0owBGHML46ZHAUJfTF0XA+gxwgfLdWLwidnV/opcGs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RhW+5qd1nUUEb5CwYkwxpbJkf8gQnZE1LuU4CNIo6oxXpOkFivjR77AgPXQ4npZuL
	 c2wnV2UQkUlJs4C51KY+nkz7cm1vh1eMcWT+4/dkrdyl6XDKZzb2ue+LDMrR+dDRYs
	 fBKuPh87B++WRmmfgQCwawdA/u06bfMMPa0EsSy5E4DD7NqzF4a3JL3e4/CrTiHs1+
	 2uAN+x85UnJ/ANd9uMTkSsw7EbiELpwI7K8PDZJKKWeZ+kxfYrcUXYJQEWE7/v9VxX
	 9zZLJGTz1vIYtxLc8FftIj6+8OancYpvBk4fubXpE8HgMTqsc9qX5h8aMAJ6gAznng
	 Ls6h5IDmkk9JA==
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sound@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250312-cleanup-table-v1-1-1d9a14464482@linaro.org>
References: <20250312-cleanup-table-v1-1-1d9a14464482@linaro.org>
Subject: Re: [PATCH] ASoC: samsung: speyside: Free gpiod table
Message-Id: <174179162004.54662.17603338171072138756.b4-ty@kernel.org>
Date: Wed, 12 Mar 2025 15:00:20 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 12 Mar 2025 11:02:25 +0100, Linus Walleij wrote:
> We create a gpio descriptor table but it needs to be free:ed
> when the module is removed. Add a devm_ action to do the job.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: speyside: Free gpiod table
      commit: 87fa872a1ecf542efc66a9184127faf03037f827

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

