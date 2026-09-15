Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5E243846B
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 17:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492353; cv=none; b=Rtpx3pL7NyNIRju+qj8nfdJhSp1WHAZhA1UfU9j0NEGjn9GM82uHQQEAHY9GXkJI6mdmFxGeMxzIQ+fOce7QBCYa/r1opBgueYwpR1Kv6dTm9nci91MfalN6UKByZEfnI3tgxig2ltsXydHtCWHZ3mhTpOibNQcTx7iO2b2Hmy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492353; c=relaxed/simple;
	bh=ViPmFwLfhb54GhzEODxvJGNv4HdpZ6h/lwkIF19mcBI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KuZxHWgvWJAI+ah7By2kfpfjfDtML8svznmQimWrIEpQ8alOluQQwwlYEqb1kDMmFP3HW5VUatZZOOVJtb2KBTHOUTDf14qEGnITR7BG+VX69L3qxmzFLrGRIa0HaAmmixEAybZFfr9BPfZlvp1yzd8DwZ+shtB5SsHl2J2R1/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYmXXTHD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYmXXTHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5164B1F000FF;
	Tue, 15 Sep 2026 17:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789492350;
	bh=DsOFZKRj/W/gzyfe/7e3lJVPQEKdgbAqlEygo3A7PDw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JYmXXTHD8UM7IWLeLHitKsOg9lvi6lYRZAwGkT6OjEBQ9ovmh0fU/P4KJZ+i/mWJW
	 W4gfua/gxse0Z6GSPrUO3cZkrdGC84qHG5IlY7sPyTOxqt8ezjSbQACoiGYeAHQ/L7
	 LOQqLEIEJIm34mbNp0oPm2kiXunge2bOjTNYSX4J45ypXUcPKbU9npkLuYfLdMx897
	 W8heZ6OqJJlNpZeavKc0mo5R5/FxjmMcfQiPvwzcNAXZKkGe6Yqris8e2NOLqfBcNc
	 /k7Z6iQ1rvu1miNOuORpJhWu5R08cBhYlodr99dRXR4mBi1nf/7vxyKwGQx16Ex6/Z
	 ybSe+3PxCXUTg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 shumingf@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260911084546.1342894-1-oder_chiou@realtek.com>
References: <20260911084546.1342894-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt721: Use the function_status check to avoid
 duplicate presets
Message-Id: <178948905403.151760.13263334136271634118.b4-ty@b4>
Date: Tue, 15 Sep 2026 17:17:34 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ViPmFwLfhb54GhzEODxvJGNv4HdpZ6h/lwkIF19mcBI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqXx6d+Qy2gBHsgB+jIdMZbq7PSHM5OvArQ+Ia
 bBUWanj6rKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaql8egAKCRAk1otyXVSH
 0GxZB/0VcT6DmAqAgMboFTXxrW324skHWGEwb3uhHUVQ/Lkt0hoP6c+gkKal5Hr5xV5sYwxJ/aN
 1emWW3/9P5ZjuT2jUggudZRHbhO1U+dbP5y32mJEYmvgRcCwdFwhmRtai08j7Q2tJENZy9Drtt7
 uuks0HLYZwCPOutrZrD3CnmFsvuKkZTzCamTPSo2nTjLGdBOWMnFedwPksv3svjo7XUyDNg/2Zf
 HzTXQhZrsm11fAgTnKkFdF5DaaUrHtj+DNNAnR/s+3K6mZu3qr2QQpA/TcSwlzky3xsg1HBYrLe
 j7H/dvZetAxDgzRSGbCiJOK6u1SHFaUw58gcn2K4w8HilbIG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 11 Sep 2026 16:45:46 +0800, Oder Chiou wrote:
> ASoC: rt721: Use the function_status check to avoid duplicate presets

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rt721: Use the function_status check to avoid duplicate presets
      https://git.kernel.org/broonie/sound/c/247b84c07b7e

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

