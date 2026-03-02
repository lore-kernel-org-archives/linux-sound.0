Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C043612FA;
	Mon,  2 Mar 2026 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456479; cv=none; b=bSGS0TYjI+HJX7832BaqcE0dloCSc2Vz4vcPLQUUNYtHeqfhsx7PdHTgJSVG72u/WYktkqA8mInz/PXykC+0xX0HCueh6JUJIIqOQvZbMjHUv6O/psap/tFiFMRDcXeLbwQJJuAot29WRzKqWV6K6IOMyQOybEkfHQDuM2vD/Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456479; c=relaxed/simple;
	bh=ZX07mlKd9UaTLqbInlbhOL7igqCWqkYgMCBD7UdX0HI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ey1WtKytXvMcd4MYpa+oFDGvYCDWFCvHLNIY0kaSbxAE866TysYW+gjIyALl0oKKaMKY3bnpqOx89rS9d5N+l8Vu/lIijFHa0DLVaOfrxuOsBfN/FXsdJa3wVmFCf/H8lWqqQdxaM5a5tGouA5uKJ7WpsVfSs6Na5t1YN6b8doQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aV2FNOar; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aV2FNOar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0B3C19423;
	Mon,  2 Mar 2026 13:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772456479;
	bh=ZX07mlKd9UaTLqbInlbhOL7igqCWqkYgMCBD7UdX0HI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=aV2FNOarFbPTFJRFQhQA/fn4QlbSawoZYjq8oBdeMeJ6BuPw8S9uyC9gKA1KyUtcz
	 uHB0hXSPySIQ3Tc5CkIhSx7W0C9yw/fy/s1HoaLKbYm/UihM7yPSougBtZz7uH6L6w
	 rbY/K9w2y17PvOtj9tX7ttUygAq5DIbc6sSAZQNB32J1OOVCddLcpQ9oHd/PMnEigq
	 Pm/flYuDamAPyF7o2q2Nul0Zxmdmp/5Wy1SCxZbUyZddujyJCMEi3Dw7jlwionCIum
	 VtClTnve/BcfazfiqsZ+/8d7vDh3bDv7F7I9AajojyoL9n4cNsVFBmSxLZikbezl2H
	 o0Ni1qVF2rdhQ==
From: Mark Brown <broonie@kernel.org>
To: david.rhodes@cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com, 
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260225100907.686470-1-shengjiu.wang@nxp.com>
References: <20260225100907.686470-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: cs42xx8: add error checks for constraints in TDM
 mode
Message-Id: <177245647743.39400.2428622442963787791.b4-ty@kernel.org>
Date: Mon, 02 Mar 2026 13:01:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Wed, 25 Feb 2026 18:09:07 +0800, Shengjiu Wang wrote:
> In the TDM format the ADC and DAC serial ports will only operate as a
> slave, the sysclk should not be less than 256FS and Quad-Speed Mode (100
> to 200 kHz sample rates) is not supported by ADC. So add error checks
> for these constraints.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42xx8: add error checks for constraints in TDM mode
      commit: da37bfe76b5b4ccc01ed8132215098e20d78e5f3

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

