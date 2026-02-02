Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B042D8760;
	Mon,  2 Feb 2026 22:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770072515; cv=none; b=fxciWQRj+bv5VIe+go+KXOCZmY5uq/9SVWLy4cO11ykP7CL3umjQz842uypv1Z5f4lb5gKO6Btbt9fZaoLTt6IzAip91pYywvgsPoEV6Yk6xZyqMOvNLtiNnMrSblnzL3ZVOEfcuozl0HSJUnu+3Fmu3didU1z1etAH/dakg0KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770072515; c=relaxed/simple;
	bh=aYu81NcwFMAORaJj9y7rTBOzP0kkk0aT1EcNj/YqlJM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VPODMUyXA/l7t06Q4vpWh9GrJPDDzY41Q1SnNE2u/nns4Ls0JQOkqt/L02Blc02X6BdKz5yQ3zQl/m7UX9e8Qj+NmVikeK8PM2r2R84Jgu2hQ3rbdB2SUuMUBoWPRWHpscvYhmo6Lu3mrfPWDKZ/AmragpM/uKS4580lQhHKTic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdbuD6Ie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdbuD6Ie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0047CC116C6;
	Mon,  2 Feb 2026 22:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770072515;
	bh=aYu81NcwFMAORaJj9y7rTBOzP0kkk0aT1EcNj/YqlJM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cdbuD6IeH0hrAKB8MR6Fq3VMJ9n5FPrv+CXDOf7BlC8X2xC1ZB77k6pqlcOF0pZKC
	 nPmXWSHiJY+O6xD4uxuekVKvVmXoRqJn3wtq7q17PE0e+tL77gSIZ1POZI1lWDrIl8
	 V3m8Wp0Bf9Lq2L9Q2D385B/+A5UWisW5jk9ZFCuV7fnKet8e2xZslNfM/yL0yjBHBP
	 /uppc1QAwPbRtGfWsIJ6wuX8lCPaFNa0Ttb4wk8ptyAxC1qjNv4qmAPNM+ifA3W1PB
	 bBeJw5wD1hWQPRhaztiMe4i09t9hZ4Y2t9I0U+Y4J21FQjdZr/LLT9OtmzQZXIV471
	 QQ7PPbVTaCNlg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sound@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260202095323.1233553-1-arnd@kernel.org>
References: <20260202095323.1233553-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: sophgo: fix 64-bit division build failure
Message-Id: <177007251272.963821.10295988533387990164.b4-ty@kernel.org>
Date: Mon, 02 Feb 2026 22:48:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 02 Feb 2026 10:53:14 +0100, Arnd Bergmann wrote:
> cv1800b_adc_setbclk_div() does four 64-bit divisions in a row, which
> is rather inefficient on 32-bit systems, and using the plain division
> causes a build failure as a result:
> 
> ERROR: modpost: "__aeabi_uldivmod" [sound/soc/sophgo/cv1800b-sound-adc.ko] undefined!
> 
> Consolidate those into a single division using the div_u64() macro.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sophgo: fix 64-bit division build failure
      commit: cad9720dd7e4dcdaec8e854fb2c1d1d45fd6dbad

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

