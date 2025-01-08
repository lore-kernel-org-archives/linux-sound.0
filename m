Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EDA25949C;
	Wed,  8 Jan 2025 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736358448; cv=none; b=q++lonr4IgaBZ/hJtxc3y6Nqcyyqa78DWd0dMLfgtGRhpydzM7PWYKlffLyRhy6AI69h5BwV5YwgKXJscf4PB0glDneuXSjseaMY/7uhltfiO++AwMGxh7N+qR5pPFmOM0ePHJQOh+l1SU0puCKs0QH/bhlteyKb0vH34p3z2iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736358448; c=relaxed/simple;
	bh=PLvdCY87dzn6mvG4kil2B3nOAMBCR1yJnTP9x2on9bI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K2S/DJkcy4qxhKxi+lUqhsYd2VovEzHER76b/RcxgmC42pwrrELOzMx/XtIulsKJlLHbRsg4Lon75eyhyT969Gt0fS/ezRKhdjSqPDAdMUUzUFcPsOY48mGxL3tywrscTgkkh+N8JEhMSTqD+nBmXgq6I8/6tgv0sE1lqgmz2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSMde5G/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSMde5G/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1F2C4CED3;
	Wed,  8 Jan 2025 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736358447;
	bh=PLvdCY87dzn6mvG4kil2B3nOAMBCR1yJnTP9x2on9bI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SSMde5G/bLODTk4J+kMTSaEipKBIaZ7+isFq8Jnsnllv4sDDZYgMxWEdel4ax9Hv4
	 XUONnnUeAEDHsMP2jr6L5cq7SP5E18w6a37sS5rsb8UgWZUyqbskeKiiPfFO9uzXjA
	 mj5F3o5W1oh/8o282g+pdNhL+lrV8PGbS3ZX8eFyRNqu8vkjmO9Fw+sdKrFCvJsGVk
	 BYKQf33xye8dC/VEuoob/rImTqoUwR4h7hCKJ2bDGvtcBAkPvbldmer2zPtrkf3njG
	 +dSNUFAjcR8k0WkaGeL6J9ERqqTlkiNBBgf3EkFvr5ocb4lSzCM5CugduZpG8yopzW
	 U+RAshfnkdxQw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, s.nawrocki@samsung.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250108134828.246570-1-ckeepax@opensource.cirrus.com>
References: <20250108134828.246570-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: samsung: Add missing depends on I2C
Message-Id: <173635844598.103652.18153734869150452945.b4-ty@kernel.org>
Date: Wed, 08 Jan 2025 17:47:25 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 08 Jan 2025 13:48:28 +0000, Charles Keepax wrote:
> When switching to selects for MFD_WM8994 a dependency should have also
> been added for I2C, as the dependency on MFD_WM8994 will not be
> considered by the select.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: Add missing depends on I2C
      commit: 704dbe97a68153a84319ad63f526e12ba868b88e

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

