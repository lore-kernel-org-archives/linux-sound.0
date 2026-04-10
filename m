Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD2723EA92;
	Fri, 10 Apr 2026 16:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838532; cv=none; b=TJ59m6JzwxR9MtfECqX+TmKyTT4uVSOo7rtuYgHTwkjDHpnL9LXdvEt8IKKFzq/KdTVEySzSIh4tVlqsSqgm/wrXSmqJlYifc0n2s2kM8Rn/3AMtAFWycPAT3Ey0BkeC42HFtmG2llfemK/Xp0d6fFF1jqiz6RlaoPxpcoUX18Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838532; c=relaxed/simple;
	bh=RkYIGAMtVluhPZSjl7DFjZv0VXH6U4Ua0lzzKm4xHDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aZ9rCxqQfbRbzlCcR0JesyBkwluG0c0sP0EoFR1ot+3m5CbRyFXerl8BJs4l41PvuWpTqdlHHA1/cqjuIfK/W7A20UmIZDE4MEL+Ly4keYpph2KQXqzYdwCwrJ1M1hqyymr4guW9vGx1ttFywk5EgoY32/SKUMuIOb0Ny8MX0FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0yPFrmN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0yPFrmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2670DC19424;
	Fri, 10 Apr 2026 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775838532;
	bh=RkYIGAMtVluhPZSjl7DFjZv0VXH6U4Ua0lzzKm4xHDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s0yPFrmNpngWzaz/t/P+FlCxexdOjDCzxtqf8M/O3XBMuPFWsED+KaU5IC9Ebr3ey
	 tzZjQYZc5wAZUVSsx5FfXUOimLmciQqJyId7W/2mf3jQW8yoHTJpAgdLV9xVweWMNP
	 6+ZxPhgg2mw8nlLksoa8SsRCocqmQTlWQ05ktUueBcUaJMikKw5zkgVpkV1f8A1lWb
	 b9uIeSneWpZhwHXW82PIbP+QY0zGmldbA7eo7fjrc0VpZDKUKEICXgjLYWVm4g2Nn/
	 wuqx6QREBcphpPheB5ghK8H7UBhFwUT8CMZmQYZQOcRPmoIXOk0A9/PCl+IYvEiChr
	 WuZ2Vrbr828Tg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, lgirdwood@gmail.com, 
 Ihor Uzlov <igor.uzlov@gmail.com>
Cc: venkataprasad.potturu@amd.com, perex@perex.cz, tiwai@suse.com, 
 mario.limonciello@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260410094553.24654-1-igor.uzlov@gmail.com>
References: <20260410094553.24654-1-igor.uzlov@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add MSI Vector A16 HX A8WHG to quirk
 table
Message-Id: <177581707435.1070744.16253607136350151660.b4-ty@b4>
Date: Fri, 10 Apr 2026 11:31:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RkYIGAMtVluhPZSjl7DFjZv0VXH6U4Ua0lzzKm4xHDo=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhsybqo76c3LZZSemuIVaLrC47XWop0lhVeu3GAH1yN3lg
 dtD7rV0MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQATiRZj/x/1b/2WaYxtaWqT
 03aLTqy1U7rdvnKyf/tud/2PpUXsFyRipr9JOWH7+o1YtXX/a4+Obk/d5VJvj3ZHRnwtf1q3Jbz
 hbefP29GRl5jvtiqXvClYIfSsN9k659mr5xYu31QlrjnbcVckhLnd/7TgUZZxbpOTIb9pbW+U5q
 6fBQZVRyMsZ/eGs5belTsUVy5j919WSf8Zl1xEzoyy+6W/5knFLshiX1Xg3hT3veupXLanyiv+w
 Klbju39dORm7mSljnOy3P/Y7eym5rAJf9GpnbxxzuTJXqFbPGJlbt79EjPh+rZNJ6LyJab+MfEy
 WB/fumNDJ89hb3erD/2bGJuPfDOJk/0xgb0k8LKjTp8GAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 10 Apr 2026 11:45:53 +0200, Ihor Uzlov wrote:
> ASoC: amd: yc: Add MSI Vector A16 HX A8WHG to quirk table

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: yc: Add MSI Vector A16 HX A8WHG to quirk table
      https://git.kernel.org/broonie/sound/c/72dcd84938f5

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

