Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AB63F2116;
	Fri, 22 May 2026 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445414; cv=none; b=t81RSzgmF1f0diZW7Z6w10WzB2y9Bvkrwz/S6+ri0wVZE1g3m0BrlxLeh/JtkgQav5ov4UGJxLL7QNA+tunNcMlmgVJYxi8WTVVLIdOVhlk+nizHesjZzLDwVQH5hQ1kuz4joCrgOne2sH4j0Szov/0d4ocXXyLYgF89pn5eMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445414; c=relaxed/simple;
	bh=iAK43T2+9azlrcebdl3BFQr9o7vfdTl/z07AtF1LsRU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a9LURzOlB31r67kUit/DlXOJ3MicUfD6Wtd1C9IZ1sU8B7fOFCdPg5Xj3koxHm969eFFc8AKDyGaUZBgDOdKMsHozuRvMVQYMFccfv7Usj6+uYQTzpdEnL+rd5L12tsBbYBXRwkffNOI9JsxQGW2YCSVyNV9Kr9WTN94lqkO8hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZg9nCoi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZg9nCoi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C36B1F000E9;
	Fri, 22 May 2026 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445408;
	bh=8sZHNaz7QCeYVY2FRyo4xDc4GW0bbEy9iWr1A9O4ztE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FZg9nCoix+kazX7aKlH+p5kwntvjtFXQps5441f7IyZNBokS8WntUKz8ty4RRab8s
	 X14HRkZwDjd7IrFJ4tPetidSsJMuLD1O22MWxkWF09XZbF8n0Dx4Ks2cciJRRQuW3E
	 xIhhcP5JGTjht4wowFRy0ZkY1VEknWV72Dhq9aG2lyvSxFZcxO76QcXGy+Dpqs0q7s
	 vkRAM3kgd0yg7gKPmqyw0M+E/7h1Xi+3HTUu9ygUThq48vMhLkfjAKi0T/vp2NgdBT
	 Q4qVgHu+QQjzri4bkA/0oi0+5JIyIR1rfPUHy750eXDNbB7neWPTgkMW3MaJ3F30/R
	 gB1vrkOdGKdtQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260521122511.987322-1-rf@opensource.cirrus.com>
References: <20260521122511.987322-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/3] ASoC: cs-amp-lib: Some bug and typo fixes
Message-Id: <177937283777.58022.11166232970674157370.b4-ty@b4>
Date: Thu, 21 May 2026 15:13:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iAK43T2+9azlrcebdl3BFQr9o7vfdTl/z07AtF1LsRU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC6fe+bKUDV2qUWRBBUwxBVtT2q4f6/eg2PJW
 kgeEnVsPWiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAunwAKCRAk1otyXVSH
 0GRcB/9TrIRicNSbe3ayWhwxMHPN/f+90XfFVLdhFUKfC4agqtkUx/Sw+I7mAgz8ejHu/wcIwLc
 MCuWqtscg6gYtm+6EhS2VTPRTqCipo/nXEYHHq+Hnh0xDC14h8QE6XBMSSY2J9plXRxy8+zLNka
 kjrMOXgBqOBjbKk5Nv9Cg7zesX1JW+NQEtoRA89ckA9Xk0SZpiwOky5G6h/aWmoYlpPV056jnRt
 Pqdjc1xX0nFuMZHV+mRXa1jfe0QRsF6yOr791/kV9wYQtn+768HsBGUQoyXUSfp3paM9ONbAedo
 Jj2XjCYXlsK1NqIdYs+pZ+lx5ZLCOVnKerWGiR6It48Y7BqP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 21 May 2026 13:25:08 +0100, Richard Fitzgerald wrote:
> ASoC: cs-amp-lib: Some bug and typo fixes
> 
> This series fixes bugs and a typo in cs-amp-lib.
> 
> Richard Fitzgerald (3):
>   ASoC: cs-amp-lib: Fix wrong sizeof() in
>     _cs_amp_set_efi_calibration_data()
>   ASoC: cs-amp-lib: Fix missing dput() after debugfs_lookup()
>   ASoC: cs-amp-lib: Fix typo in error message: write -> read
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/3] ASoC: cs-amp-lib: Fix wrong sizeof() in _cs_amp_set_efi_calibration_data()
      https://git.kernel.org/broonie/sound/c/67a52d3ebb5a
[2/3] ASoC: cs-amp-lib: Fix missing dput() after debugfs_lookup()
      https://git.kernel.org/broonie/sound/c/ba28a07a9a0b
[3/3] ASoC: cs-amp-lib: Fix typo in error message: write -> read
      https://git.kernel.org/broonie/sound/c/a68525268685

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

