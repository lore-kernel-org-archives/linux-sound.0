Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5A3237717
	for <linux-sound@vger.kernel.org>; Tue, 22 Jul 2025 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753200400; cv=none; b=KhMTHi0qN32rzO6rB0XC8r1pNytf2i4psJivldNq2KlJr71IeuKc6NrJoxj539A6hrl/Uk95hC5IH6leJfD8+iO3c598TmBE3SJRZJSXbQHwL8vcEIWZXxzZD+MXOuC724sx9Hp1leZAVbPOCBoh/vOni4DgtMUUSUpHXODLDB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753200400; c=relaxed/simple;
	bh=0++ljG+L+B0G3BSXIpcjskExio+FpSqwqh+/h6M+1Lk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GgBGwiNNvtQNKrw8hsuAtWcR2LeGzfWAo8Gh/MaIEGDuAKfOPw0GgUX9cm6PVlueQYE3DTBVFTZ1dRP6AH+eccoLhxPpUmMq2ZIJHi5HhABkSiu+UNTaEu89dea3gIPnsRqgmBYoz2hcQ7e8VgkCI2IhLzaiTx0/Ho/S7aCkaOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rom0V2gw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rom0V2gw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3951EC4CEF6;
	Tue, 22 Jul 2025 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753200399;
	bh=0++ljG+L+B0G3BSXIpcjskExio+FpSqwqh+/h6M+1Lk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rom0V2gwgAG+tuv22VMViNZ4sti8xu7pVoM37rZkDjIT610GZo6mpXLfX7J5cFzCi
	 wyeV+BJqV1pZGYCimKbw8b2j9vOHDjF/CrTAQ3ASbVXe0ZENm/pPw2adf394bxdQay
	 O0J7sYDL4Y+5US9wUr/LHOpfokTztHSc5O3Xa8qC2ck1eJPHPmVe8AMDeVen3hcwyq
	 IwtuU0keCkBR3i6Joe1HbMEJK5A6Dp9Lpp0dm63/9KamVDmx6IbQ0ok+C9TOgM1C+H
	 tUlvfAkPRun3/6FLKDe6wa/grhl2SQbVpUWQq64C9NdF0Y5vRJofm0U2YdY5p6hfOr
	 kIekoamaWaAoA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 shumingf@realtek.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250722114705.2816910-1-ckeepax@opensource.cirrus.com>
References: <20250722114705.2816910-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Fix implicit cast from le16
Message-Id: <175320039795.65081.8989951832019101144.b4-ty@kernel.org>
Date: Tue, 22 Jul 2025 17:06:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 22 Jul 2025 12:47:05 +0100, Charles Keepax wrote:
> As the HID wDescriptorLength is explicitly marked as little endian it
> should be converted to host endian before being used.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Fix implicit cast from le16
      commit: 246570cd351299959822ac21e75e2975f80ce4b7

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

