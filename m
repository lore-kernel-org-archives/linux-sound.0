Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314AA275B05;
	Wed, 28 Jan 2026 03:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569348; cv=none; b=tfz+9DFSVwH9Km1obCiiQKEGRMlkJjWu9+zHOikLQfJWEgABQwxWHEjs24bSuwAyOqO4zcXtlIA+N5bTpeEGaCNbIrwGJp81CoV5lVcdb855IhMLG837cjRggcDja1ENoy7/kvVuWXNnjrMRKF8Zu/fLGVn25mlqJd8boNl1rMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569348; c=relaxed/simple;
	bh=H9NXgJot6Ofd8DdlL75INUWfELwxu3+FrH0VklUOezc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r3TrgkcW5zWziVDWxNISajY8ZpebXwkm9FguFS203xiwhmF+RCofARBVfB30BzJX424juNZWg2McHrZtcvLKz/4jamteAFUWVNOPP0YglyDLPm/tFWvGO9kkAfMo22f0V/d5NcbA9xcsIOPB6Z2GhQ7TeTquhCWOUGB7NaaH710=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rk5/Bmyb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rk5/Bmyb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2635C19425;
	Wed, 28 Jan 2026 03:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769569347;
	bh=H9NXgJot6Ofd8DdlL75INUWfELwxu3+FrH0VklUOezc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rk5/BmybWlM47xVlmxM8eKaBG5BmPG8Zym64Sejpg1wuTYn6mFccBTi6agVt02bmo
	 u+YgkbPBfGqCqvDEULJ04NvMD8Vz9i0877TM79w8ihEXVf/iMwUHcFvS25bXFLDKxM
	 0KSyrEMdYg7D+xdjAN28imLlOw6nVwyy5aYysfw0iwxzxxqUD0RvVf9WrFJ5hFprR2
	 mOOmUaZNNk4hQu5l/SAtbmX7wn5fBiv60X4k7AAkpAlX0U9M2Jry2Dx1xaqeh0wBK1
	 Z5tDpU6ThFIlakj2ETw6v6af2NY/ifIFI+D/fcH9vJa9M1p+AGRahLkH0XcJpVItfQ
	 Jq5T4F01Zu5+Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
In-Reply-To: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
References: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Message-Id: <176956934454.1515833.15704162153202007918.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 03:02:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 27 Jan 2026 23:08:18 +0400, Anton D. Stavinskii wrote:
> An incremental patch on top of
> "[PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC"
> adding the explanatory comments as requested.
> https://lore.kernel.org/all/20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com/
> 
> changes:
>  - added description for cv1800b_dac_mute function
>  - fixed "extra change" from previos commit
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: sophgo: cv1800b: document DAC overwrite handling
      commit: a8e3e488293118b8fa5d5e7ca786ca25b954ce12
[2/2] ASoC: sophgo: cv1800b: tidy Kconfig spacing
      commit: 8cf19b19dba8814ccc8b1179dabf28b7f8eefc22

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

