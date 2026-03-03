Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84538C409;
	Tue,  3 Mar 2026 11:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536802; cv=none; b=UED8BvyTXAG6X44TEyCPcmILN9hwbouZYV1YqCW/38LK2recMs5brYr8q9C5n7dWfVhw4Ls8ACGpwTxJq29jh/kOcBZIgr6GDbmx0RtWibRCd0JiNvOm1Drl+J/pscUiJHAJcStZUwPu6kgeYKcvd30UoUddzijsXkc0zCHh83k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536802; c=relaxed/simple;
	bh=17tAfC6fT4Vzpxs/htFg/df4OK6S+lUM1Yw7ZN5kBb0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E7g547so/lCDfE5srDNdCCcHc9H7BJmHgqGl7OoWX9wXUBhGqyrEolkRm11xBEKO+NIBKORA7z9aMH5y5o4UwfcgSq9QnE8iRf/M7/UoWFvSdX014KQgyQsb7oMl1+HUUCFtq4Km6vKsNDcf1qu7q7gTmmNleWE6SPJsutL0KCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5BfBPoI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5BfBPoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD73C19422;
	Tue,  3 Mar 2026 11:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536802;
	bh=17tAfC6fT4Vzpxs/htFg/df4OK6S+lUM1Yw7ZN5kBb0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r5BfBPoI6IWpGGA56TywY8FD/yLFmaLY6IRfPI8aIJhNsGur19NDyH5a8kvNwCLQR
	 F23g95EyWO2BmmTmpqZSjAZkeDCiwG1J2ohuu0H/c1xFDU/PYlqpiCRhdacyZXHa0Y
	 OGnFI/Y9uhItnYhZqsoWoeL4siZzQ0WkqR2VcOZJfkk1ju1euTYVU73pUAuwsyliwt
	 D1qUi8sdCnVJ0g3EMdwsFKBGOF2r2ieeLZp9kogVFkknuSR5ZIOUDGSIa7kK7Age5n
	 e9GzBKBAYakqSX8GWlkOQlm+6nbTdQhHPcShvL46fJGioIS0XDPl1hABtoIof1BJ4E
	 AFSqrzPCyIBUg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260226113511.1768838-1-rf@opensource.cirrus.com>
References: <20260226113511.1768838-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Suppress pointless warning about number
 of GPIO pulls
Message-Id: <177253680111.22767.8769716090482256290.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:20:01 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Thu, 26 Feb 2026 11:35:11 +0000, Richard Fitzgerald wrote:
> In cs35l56_process_xu_onchip_speaker_id() the warning that the number
> of pulls != number of GPIOs should only be printed if pulls are defined.
> 
> Pull settings are optional because there would normally be an external
> resistor providing the pull. The warning would still be true if pulls
> are not defined, but in that case is just log noise.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Suppress pointless warning about number of GPIO pulls
      commit: ca5056f5a78ce62588878d138e8141f01d70e61b

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

