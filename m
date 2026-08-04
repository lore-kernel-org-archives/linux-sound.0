Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001DA41A900;
	Wed,  5 Aug 2026 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925429; cv=none; b=IHnKOcPHiRpLRhb22eCJJ1aPv97ns0X74NGy6jUt5Mvk4Ev8YzvmZDQUW7sZ1fnLQf3Oj0Rf7g69W3uOqOzODAOFFlGnLVLOpJrS2vWHp32Iv4oqRyfwt+JP3LMi4jFNU9BlWQO4qqJ6kjLthNcB2eIPBI5k7ZmpDMffaHM1o1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925429; c=relaxed/simple;
	bh=iyP35T+dhY/KGk9oEUROcXnRXuRKFAxv49U7VP1vmdc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d1h6IKgsDYk62Hym34XoPI9a5pJFGHbDeZWAfjIn6P0EROsMNBZYlTuir460B/np8Hu6IGgtR7bJFAv2/QD2aPYE9j7CfkFU3fr2k4gPl4X3VbBoQArLFUdNGwBEyMakCi8AapCdE6zUrHEZ88v1KkriLMiX9v4hPcF9ZQEBGww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fd8mcH8r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fd8mcH8r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8021F000E9;
	Wed,  5 Aug 2026 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785925425;
	bh=lHu7nUoKAcszBoQg8ltjHjQ4D9lctd02DJ/hqPfKriU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fd8mcH8r8AddVPKSaH4YxveKpsxOR8dGJEZ1s10vErEvIo+8BUkqJP+n6EiRlMevI
	 2XmBI+AGKZznow85/1ssXA1mhdU2czUsVRAKN5EgO+mFSWSYSEA4gh+vEySkCL7kb+
	 c1hecK8xpbnsvlIZvX5RRKiAm7snJsV3LbFnkLD5iTmecv4d4z049diWkcoz9KulCs
	 Ai5Xt39JnTGUB0QtrM+DHnNIU7YwPkpR66YhvQS3sQhng0NhJ/HXYxlmt2LI17cygP
	 oOiN4tCk4J5dWE0smaumZccTKggjHgWy/+pG/xbwsaORzDaeA/4EtPqNpxzaoktNSy
	 AWKxy3980V6aw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260803231823.95147-1-rosenp@gmail.com>
References: <20260803231823.95147-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: xilinx: replace OF with device handlers
Message-Id: <178587305577.111355.14781935298630433831.b4-ty@b4>
Date: Tue, 04 Aug 2026 20:50:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Mon, 03 Aug 2026 16:18:23 -0700, Rosen Penev wrote:
> ASoC: xilinx: replace OF with device handlers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: xilinx: replace OF with device handlers
      https://git.kernel.org/broonie/sound/c/99ddfbba9e71

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

