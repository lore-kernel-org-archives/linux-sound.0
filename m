Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6373033E7;
	Tue, 13 Jan 2026 17:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323761; cv=none; b=nW3kiFgFBcrogA4zNuAGiRza/LO0jjwQKDb7iwHNQkyjZLXvvgpsbEYOrKNRjJK94Pc5Zbd5Qlc6xOuS5QeWRrxEUg/bmKYA/NcpMbYpaBQttwbdBdovcNVKUJd9PAj7YmXxes3hdpH0Lx8G2GiG1kdmSB86QL98yuHNxk8Eg9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323761; c=relaxed/simple;
	bh=KKpm1n7JON0CqCSUv654PwykDNFLzs8gXwnl6nCN04M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nRc9uCwkUE2Mcy4FdBH7EwYh/h1RLLJ6LRfjokqW38+BtZXboNk3V2/iJoPN/evcJOrjVA81+od1y4AcS6ztan4rt133xTLtIAf8nrZ8l5mJpxn8JAdzePuaIiE2yzCtCsGA2I9wYrPNfVJzjLoXmBWVE20uVP6FJgJPeu/JfbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gn1RZiFg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gn1RZiFg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B3DC19422;
	Tue, 13 Jan 2026 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768323761;
	bh=KKpm1n7JON0CqCSUv654PwykDNFLzs8gXwnl6nCN04M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gn1RZiFgreLFrExx5wzibpe9Zh+2zsJmVW/dwOUjkRar4nlbrvKWTrlYMOCgtuVFw
	 NwEKAVRWynFQu6HGrcCWlb1NzxTgS2N3GQLmvMdP8+w4p22V6ONNVORg00lCE9uw2E
	 TFhGL6lILNJHLrr/JHTWdcONLN3f2AWq7hWzeTZXQnfuGM8gzjcEs464RXzEtV0sKs
	 heo2AVgEZ6DqtdTXiu1yTWRH7nHUw/0EgytmpAYkMvrogbOTDW9czYuisB2KNMnYVu
	 WeeRv/eA6yxgpTUhK4rVYmqp3vx5hHLeLFBdThQxIu/Tj6jrS0iR+fVWKeEpxYEWji
	 EK8hxe3aiobNw==
From: Mark Brown <broonie@kernel.org>
To: Radhi Bajahaw <bajahawradhi@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mario.limonciello@amd.com
In-Reply-To: <20260112203814.155-1-bajahawradhi@gmail.com>
References: <20260112203814.155-1-bajahawradhi@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Fix microphone on ASUS M6500RE
Message-Id: <176832375985.935467.13325265972528303669.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 17:02:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 12 Jan 2026 21:38:14 +0100, Radhi Bajahaw wrote:
> Add DMI match for ASUSTeK COMPUTER INC. M6500RE to enable the
> internal microphone.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Fix microphone on ASUS M6500RE
      commit: 8e29db1b08808f709231e6fd4c79dcdee5b17a17

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

