Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE1027A123;
	Wed, 27 May 2026 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884130; cv=none; b=lq1l2cChrkVUgJi7gIN7tz229jMGrzN5SDyeIdUgzh1o+p3uKZtnz/i7kMrCKn9XjaJXt1VzSVv8EZrCUMWC596WRTsmSWzgdFd34nzPQOcpFayXuc1BxfkRdL7E+g7dDuR8+KGyEDehq4K/JnZ2KlPcCep3QjTbVIYOF3yTuV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884130; c=relaxed/simple;
	bh=tnYAzgMBuqmRZK8j3qp2e5JP5glDmK2noosKTVYSHVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CxszYLweaCQAQ8fk/GQ8GE81iDaua8WYOqWl1HYyLBZMUUOqt4ePsxFAC7GcIPi1pEpN0kpDXBC9OwBkhrw/AdSAzDzipuleql+Sh7wGVtPvS/A/IfWnUTwdEfeC2S6C37lFeFpKA9/cZLzEsa0+ewFiOq4IKzuwyksPu9p6gy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgfBQoMU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgfBQoMU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15F41F000E9;
	Wed, 27 May 2026 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884128;
	bh=kmz3S8SeXEouYCvTyI1c6X4PajkZLKx9XT74qYYqulw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IgfBQoMUGZyBsIpIWiL64ks3Nt28L2xhx6lxbRgoNjYzbECGiXOybzwdn8CUk6+MJ
	 AR7SePEfOSQp+eKVnRFLZNDdA8SIV53krYjOFI1qXRnBT72RmbN49+sl0IL/TKbRal
	 pS1AWyjiwO3LdURziXqKQp9m99twFu0cZj8hGisChsgRnUfHlowWvoLLKzNwMuTEiM
	 t0O198gJL9OsswjwHaN1JGMOVLErlV344t4HEP8ikg7ht8E3sIohH1paz5YZga26BG
	 oz4Fk898ft65steCvsmA/g6yPWgHrFnjd8MECD3E2DzL13xjw6/Jx0EsRELQiF+2/a
	 b2ep21vtZL6ug==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Zhang Yi <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260526-es9356-dep-fixes-v1-0-39ac16f43d54@kernel.org>
References: <20260526-es9356-dep-fixes-v1-0-39ac16f43d54@kernel.org>
Subject: Re: [PATCH 0/3] ASoC: Address es9356 build failures without
 CONFIG_SND_SOC_SDCA
Message-Id: <177983646892.868420.6559889005159591766.b4-ty@b4>
Date: Wed, 27 May 2026 00:01:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tnYAzgMBuqmRZK8j3qp2e5JP5glDmK2noosKTVYSHVU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFuBdWySVFEDeybEPr+ust3IKljbmA1ponvsw1
 9NshQCD+uqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahbgXQAKCRAk1otyXVSH
 0C6QB/9Ez4uSMQ97a+xMCvyh0PY1VhNJz82gFQrw7lKG63HtVigZOl60edolIseDPm6hz7DKtlV
 t8iM+ZxhjVP06oENNMW6bkLJws5tlWq3plpkY8DdSqM1R/zuUHG7wtmQC0mLASMS141ewTapl9Z
 Djeco/2IXhBrxaDEEbPez9ygdtDlcQgZNcCH/O4e/lDHC211gKpBKykb8VDguKNjkIhXNGtIz8K
 A+9Lde8GeCftLXaizHLv8gzc8aZG3pHeYPNEJNcB0D9OAUH0rVzUW1nokrTkbYO1wT4VbebvixU
 wrOXJepQGR95VLKHxAuQrLRLZ2nHBQTurA7i5EEgWqpoMnM7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 26 May 2026 14:53:11 -0700, Nathan Chancellor wrote:
> ASoC: Address es9356 build failures without CONFIG_SND_SOC_SDCA
> 
> Hi all,
> 
> This series addresses the build failure I reported at [1]. The first
> patch allows CONFIG_SND_SOC_SDCA to be selected by a user. The third
> patch fixes the actual build failure by requiring CONFIG_SND_SOC_SDCA to
> enable CONFIG_SND_SOC_ES9356. The second patch is a standalone clean up
> to make the third patch diff cleaner. If there are any issues, please
> let me know.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: SDCA: Make CONFIG_SND_SOC_SDCA a user selectable symbol
      https://git.kernel.org/broonie/sound/c/0eb827875fcb
[2/3] ASoC: codecs: Adjust indentation in CONFIG_SND_SOC_ES9356 definition
      https://git.kernel.org/broonie/sound/c/c73be330f475
[3/3] ASoC: es9356-sdca: Depend on CONFIG_SND_SOC_SDCA
      https://git.kernel.org/broonie/sound/c/51d82ef5ee4c

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

