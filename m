Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2C53E1689;
	Fri, 10 Jul 2026 22:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722086; cv=none; b=VduMBVUVgwvFTq7eld4Xi6Ml1O96tQmjfQemdrMsj08YNVkm899yKzPg4BpzUH4TLP+Iat2ZE9XFEiQXG2UoeL7V+0BY+jwODns746EciuVnccULb9FUMkYCLIh95CrBSNgCtsMr5qr4alPkZE8IRIfb9XrwiQgtgHKYlk8L+ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722086; c=relaxed/simple;
	bh=8WPKijw5P5rOmVDuGRGeuRihM/Gq9MhSIkY1jPCQESE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AxCKW6JA2gUd8YoIk7bUjt3jdpeHQK7/tRTRxlx4YnMdBprSxc1Cc2ZB0vjY1qESHmMW+nOVAfkzrNew0T6b5mZlR+O7z4ydfw5tPqA9o2wSbkhddo/hMNc/1/YcOj/mm/FQSb1D5GbFNFODtFnMQyhq3NsfclKAhnYrPvbn8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4s2fJi7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4s2fJi7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC2C1F000E9;
	Fri, 10 Jul 2026 22:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783722085;
	bh=bsVUbpJO2GFnjLVxq6bdSXKF7uiJuKIV5jBAXZe+u2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I4s2fJi7qhvlGsvBAf3XjVxcYGb9AiJxj2G8j/l13qEY4DZICNpD8JgFDOtNsa4P3
	 kNbqOH/YUhN94yE+ybaiNL+1YaIEOWiN6SvETavk4hwmutVU5X2wwhymkgM2cHrR58
	 5agbG6LIJemPfWx/EV+9juutpbtUnM6e32WN6VuUdBr9Nn2Y/Nf+8T7dWiGyJ2HfEw
	 ir6y53gd735640VoBlCrm2+bn2x5fudgKAlmzyKr0dBVVn/wyykoxdKMlQ9Gd4+NF8
	 x/S1gro8xYErqjvPhqn4gPp4QFIlotJ4Lz72m0k5SA686vO/4Ly4hTz9j7i/7lLQBh
	 xzzWvYHbwVIPA==
From: Mark Brown <broonie@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Michal Simek <michal.simek@amd.com>, 
 phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260710102138.29347-1-phucduc.bui@gmail.com>
References: <20260710102138.29347-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and
 drop redundant error handling
Message-Id: <178368691519.82617.18085220364374590223.b4-ty@b4>
Date: Fri, 10 Jul 2026 13:35:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8WPKijw5P5rOmVDuGRGeuRihM/Gq9MhSIkY1jPCQESE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUXBi1pQnJeRqGUG9U2bjBGsCIqN/W2cjapQf0
 Iq/H10XKXWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalFwYgAKCRAk1otyXVSH
 0GaNB/0VbsIgnHzVMpBnU7rbdbpr0rXWANUWa0LQ4gHwWtFRX+nbZ9zOW8oGRQyoj0u/JE8GJFM
 C/0s6Ii14rpLABtspabMJa3c86zLq9T7n+T+3HADTj+LNLNRw64Moa1h9iWT/gJb4jqrcnb2FMb
 aeOH8Zj+1nw8mdpD3fm6FMMtEpLbGNYQv1T9ftfRNBsaCDUWqX3nJYMIku+KwuYBoPb3TDekNDg
 AA53FHDHometPOE6BucnblRuE97biKAoE13VtJraBpf9VfyJnFXr4SXRkWG8249RimPXWA0Xy3S
 51XwYkp7w3/BT1dsSNotqez7r/dYSsQSwXaY5Iw4shZF2JXq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 10 Jul 2026 17:21:35 +0700, phucduc.bui@gmail.com wrote:
> ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series cleans up error handling in the Xilinx ASoC drivers.
> It replaces dev_err() followed by return with dev_err_probe() where
> appropriate in probe paths, allowing deferred probe to be handled
> correctly while simplifying the code.
> It also removes redundant dev_err() calls after helper functions that
> already report failures, avoiding duplicate error messages.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error handling
      https://git.kernel.org/broonie/sound/c/14b68141bcff
[2/3] ASoC: xilinx: xlnx_spdif: Preserve devm_request_irq() error codes
      https://git.kernel.org/broonie/sound/c/cb32e3acb103
[3/3] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error handling
      https://git.kernel.org/broonie/sound/c/f9620327ba7e

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

