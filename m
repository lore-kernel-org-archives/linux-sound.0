Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6529515A85A
	for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731334893; cv=none; b=b9SVtTIZDKd+k17D4/SuM82nz+0U5+27IpNh9aKwhQ9adQINM67kItxOmZ7kahL3XmwshOXheqenrirKfcHvQ+1RIDfKSlm1R/S1Mz7TR3cySeUZroZWFJo0V7ADOny7IoMcGN1AmLJUtgfn68PaeLQ5ThRo1D/yt6IeLQXKyjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731334893; c=relaxed/simple;
	bh=KLDGogRSDNSd0AIWrvT1c4FzlA0dmvDENkb4jSSzzyM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BS9Z592dwasJ5M7Bj5xauZq12mHL2faPtEd6y7EZksx7Gy0lGpR5kzJTvW9HfIx19fraxOItFNQs3IuBpzLNkbagXQmq06PkxfTOpVOts2oSTNBCf0iRbcjIj3M0WJ81OU5AzLoRtl9UlG04CGbfuDzVRmtP4e4iK76MjH4P63g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2k3E39W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2k3E39W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93052C4AF09;
	Mon, 11 Nov 2024 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731334892;
	bh=KLDGogRSDNSd0AIWrvT1c4FzlA0dmvDENkb4jSSzzyM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n2k3E39W1TaKn7rAnTCyE9K9+wubJplGB/3Hj+4lkokE+fJujTmTole0Apy8zYISO
	 tfetwhR7UXh0wLFcng+qCTA1qrxIrqdxjFgBzpnFgKfnqHPbWun9PRX7cdP/Rcs1zb
	 2c8RSEGtps7LNta/7vBXPmeu4g0AoaymDepaSmkAlCjA+IZhvG0np+x5GEWH39VIfP
	 Xx1u1Sn54aj0n7jtcngJ+bxM+Ww/dmjp8cXDaYd8mxliOjzDgG9XOh4JXAvu9GLR9U
	 AADuqVdHAaYLrvbToutlU3dgAriLz8DnZ4VncCmYPppDpdlsIAWXt2xJqjz4QrYQW6
	 a91543quW3YGw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, deep_harsora@dell.com, bard.liao@intel.com
In-Reply-To: <20241111070618.5414-1-yung-chuan.liao@linux.intel.com>
References: <20241111070618.5414-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: intel: sof_sdw: add quirk for Dell SKU This
 patch adds a quirk to include the codec amplifier function for this Dell
 SKU.
Message-Id: <173133489134.303054.13154010254500296516.b4-ty@kernel.org>
Date: Mon, 11 Nov 2024 14:21:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8

On Mon, 11 Nov 2024 15:06:18 +0800, Bard Liao wrote:
> Note: In this SKU '0CF1', the RT722 codec amplifier is
> excluded, and an external amplifier is used instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel: sof_sdw: add quirk for Dell SKU This patch adds a quirk to include the codec amplifier function for this Dell SKU.
      commit: d859923faeca740ae9235e2b9328999836e681b9

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

