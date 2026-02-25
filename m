Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645EF3D6488;
	Wed, 25 Feb 2026 19:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046412; cv=none; b=gg0Y6esF8gBNAhEKvPb/2OGQpu7OYJgbZWG7sNEWSgG1+MBSp9DHwqs5vEMQ0b+t/+Ef3pGcXb5WqsDFoElUwOErchyrwS3Iv41rNYNx6ncfwwt0z7N2/84qeeavSt6KgV8B8zyok9GIfPmdGGDYCLFUrHuK70iJUN4tgtS5++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046412; c=relaxed/simple;
	bh=Jc/lX+/LywfDJ22uI3S6YEygDd03csTPApxYkxm63kM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y+kBZeCKeYh2kaqhaRW/lYyZT8yG+hcvwGQny6T9VHrYnBUlU6qAJJtlOMvcaZJlFNeW0/3Ic8s3HYnnNCoGcydzzK4frWwVVpeDxxWNACKE4jnxunYXpQAUIp4xdN0T3czvnqucMiNr7mxO6T4WgwfF2ujFN3lzia0CIyA7a0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJs3WT3R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJs3WT3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800DFC116D0;
	Wed, 25 Feb 2026 19:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046412;
	bh=Jc/lX+/LywfDJ22uI3S6YEygDd03csTPApxYkxm63kM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HJs3WT3R/0yFCcSKyhclheVQEviduH+p1chZ5omAzVRY8ByEkbtr121tk9sxqjTqi
	 /7EAKV23YrxbaVDd8zNwJ9doixn2pJdir+2/cmma8IXt+LlMuG1OYDGBY3/aYuYKmO
	 8Le8wjJqD7/y/FFkjaJQ+op/9jxDydAKqjqv98VrpesJv84NNx6QSGTuaPI57ywQBJ
	 tMWEh3Z5vPDq6jTKI1XvwkJUC+etKmWhZC374iYy0rHcgI99vwNq8tvEFJPfWwAybr
	 ghesym9/2MZGvcrolRH7q1000dFVTs5irJi7MSrY6Sx4GcLS+UL90vkM/Ai2BL8izP
	 uSzsLiX3r1fOA==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20260211002255.4090440-2-jekhor@gmail.com>
References: <20260211002255.4090440-2-jekhor@gmail.com>
Subject: Re: [PATCH 1/7] ASoC: rt5677: Add 10EC5677 ACPI ID as supported
Message-Id: <177204641023.168100.17663316355355939070.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:06:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 11 Feb 2026 02:18:33 +0200, Yauhen Kharuzhy wrote:
> Add 10EC5677 ACPI ID to the match table. It is used in the Lenovo
> Yoga Book YB1-X91 tablet at least.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: rt5677: Add 10EC5677 ACPI ID as supported
      commit: f43aed8dfecb10e95b8235d002990739ebe72c5e
[2/7] ASoC: rt5677: Allow it to be defined as an I2C board
      commit: 9f56f0bd2e49876ceeaf9036887fe9b50dfa6b6b
[3/7] ASoC: rt5677: Fix typo in the header file
      commit: 687f2679e8bf65bca247ca7f4013130d609e1e56
[4/7] ASoC: rt5677: Report error if the ID register cannot be read
      commit: 14848e6a8058916e9b008734aa36da989725b6df
[5/7] ASoC: rt5677: Set up ACPI GPIO pins mapping table
      commit: 0cc00de3dd5b66c80e6ec1705ec929f4a45ffa1c
[6/7] ASoC: rt5677: Reset the codec during probing
      commit: 904e71d42505ca2af19b0031ffffefc8c1fefb48
[7/7] ASoC: rt5677-spi: Add SPI device ID matching table
      commit: bf122191473e26a8f195308b1ba924c98424c8e1

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

