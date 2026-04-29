Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC1388E60;
	Wed, 29 Apr 2026 04:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436397; cv=none; b=qxsSzNnLaqzTTVvRgUfUvuI6HjaimFkp5fBM6OGBE2BQe7RME9UJpEV2F3pk9E8YcojD82JzF/ej9LMjWcJIFY4Dqv1KPKlyji2Yo3oZ9p/eDZVhdIdIUo/fo6t21IuZv8Mih0NDfVq7QES5LfxQWa611ZeDoJupZA3pWm//jFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436397; c=relaxed/simple;
	bh=sgSlmcfkmFn+RyY8Rr/hv4HWbbiBjtQRzspK0nT5ta0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U5vXv7GhLdnoVp/4Qsd5uq8gg+QwEsNyGLIhQ8tawVbIwF8Gq1RWjT0iZnkAam5QeZyNzmv/EABab0mSrPt68U3E7koF0fKZkfvf+zqr2W2d79Krcft790QS5j4PvimHsT1mc/f/vpYGwMHK//FM0sj7Q14xH8B+eILeuRs++vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PH4EbJKy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PH4EbJKy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57545C2BCC7;
	Wed, 29 Apr 2026 04:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436396;
	bh=sgSlmcfkmFn+RyY8Rr/hv4HWbbiBjtQRzspK0nT5ta0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PH4EbJKyu7u2Pkz3/UcnnvVdvwdIEkOcVonds/pKZFIYEKSGv+5wj7uPUK7TQaK3l
	 LJtua6KLn3F4Jl8aBd1ZUqKF4cyDiYu/mQEWANKJfQKPgk+RX1G0napbRMwyn9Zn7S
	 68gU7TlJLeP/cWDzIDps7uPu0lOP81/W/DvUiw/GvK1Oqyo90wcHg1H1rMQZzh/k5E
	 knKcsHNo/qCWSUGwSTdSl74z/CTsYAwVcgghLb+tWrQP3Sz6bo89rFgn8Fg8AXy+gN
	 oiNNeDArQYfrnEffsiKukBdZGFQhWaor+HkWxxQQ3kRpuUDlxhKi0YEhfZt50XL04Y
	 rYCUVIY11O4iw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260428204728.24103-1-rosenp@gmail.com>
References: <20260428204728.24103-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] ASoC: ti: j721e-evm: allocate dai_links with priv
Message-Id: <177742886024.363516.4916188796621724857.b4-ty@b4>
Date: Wed, 29 Apr 2026 11:14:20 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sgSlmcfkmFn+RyY8Rr/hv4HWbbiBjtQRzspK0nT5ta0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8YbpaFxI8L+VeOQNODikTtv9sTqwlfwe4e5HO
 FTxevopTPKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGG6QAKCRAk1otyXVSH
 0DDtB/97YCVhHFfk96vO6owxso2uRkF9tyhPljtdUsrOF76yKsD1JSyTXaLDH26gAeFE4SQ/sS6
 OgZDSVGqwZ089Vqr6VEVT12meDE9PZsK/P/kav0+jQjM5xR8/8LJhUvq55mtDWmtW9F5kXgPgAE
 WfcXSwmG68JJO4tua5avR5FDLtCSB8M5TPMMTz4wvUOYMIMtSzW0n1rZnSUgwjpuT7XI7q9I2K+
 SnuwUvwIjAqMLMAPsNeSyUADoEStk+zZrZcMLhS2sqlmlU7YW+jco4TML6nnxOHGubDGjcyhcrm
 bWsTIVk/DPNLphjmN/c4/FEYWNBEk8gNpCcRIH3ux1F60CTh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 28 Apr 2026 13:47:28 -0700, Rosen Penev wrote:
> ASoC: ti: j721e-evm: allocate dai_links with priv

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: ti: j721e-evm: allocate dai_links with priv
      https://git.kernel.org/broonie/sound/c/85db411913cb

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

