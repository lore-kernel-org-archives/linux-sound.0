Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEB917BA2
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 19:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873752; cv=none; b=PaeFeHpTifmbZETiA623BY0u+tURTbGzyNr/cADzxQQd6jmAsAygyB/TqKq/1YwxyYNalkyOX2hg1JojBDfEHimLBi5t1Mg9QRmfTVAx6dPG+wUp+5AVStfxa8N9CVSluV66ny923lZMBvYEqIxuIyLGwsYhHe+bm+wtmZXQ3KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873752; c=relaxed/simple;
	bh=a+PDB+tS/fkgeicly3iZ8eFXPqkZVvLK0OIbpOHT9Fw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IiQYNQu1DUq9nA8MDdHz5a0Ru88K32ZdlvCs4aV8vOuoMzV2fPlZEENf6k9yj1j/1hfTGRbD6zRBL0AYK/AniwGfV9+ItO9zUXcXFn/QO4Xqrqxvli+qThHvygB8/uxsKDqew4x3Pn5D2prAQGbsQIyYAKuM8S4xE1/laQT6c+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAzeZdDL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAzeZdDL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79123C116C6;
	Mon, 23 Feb 2026 19:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771873752;
	bh=a+PDB+tS/fkgeicly3iZ8eFXPqkZVvLK0OIbpOHT9Fw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WAzeZdDLCQsyLEAbEpZXu0QLxG/3X6vsitePNowev4PVBzyaYCVG18+hXqP0FWJQ7
	 Kg7kXi+NscXW2i32XejUlKDi6u2ehTx4tl2iYCDrmEm5ynTcmgnnB/KU6OKSucdhCG
	 nZ/XVGTh9dIdU/Nm919ykpScg4DxFyMSLqIPrr7J5cMyYtPabojRB5I3tzDJdvjDDZ
	 4YBPrvjuuhtygGI/OQ6jfpo65hWZOGJQErckPAMZ9vDBMCJ6V/orkBzmdk2JoU0SrS
	 vNSRmpJH/mfs3ajHtUnmiFyhVohCekow20424nWiXFSL5qkYFOQztZmvBoHrTr9mC+
	 fSUZM8jQSYM+Q==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Azamat Almazbek uulu <almazbek1608@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <20260217121219.79960-1-almazbek1608@gmail.com>
References: <20260217121219.79960-1-almazbek1608@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk
 table
Message-Id: <177187375122.720764.9171311551512811536.b4-ty@kernel.org>
Date: Mon, 23 Feb 2026 19:09:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 17 Feb 2026 12:12:19 +0000, Azamat Almazbek uulu wrote:
> The ASUS ExpertBook BM1503CDA (Ryzen 5 7535U, Barcelo-R) has an
> internal DMIC connected through the AMD ACP (Audio CoProcessor)
> but is missing from the DMI quirk table, so the acp6x machine
> driver probe returns -ENODEV and no DMIC capture device is created.
> 
> Add the DMI entry so the internal microphone works out of the box.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table
      commit: 32fc4168fa56f6301d858c778a3d712774e9657e

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

