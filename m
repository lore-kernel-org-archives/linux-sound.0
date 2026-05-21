Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD6A3D410D;
	Fri, 22 May 2026 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445301; cv=none; b=omOrxmkBTbNC3WAP/99owcH7OeSIdFNC0iiQzzM8tUnKv2Kcaumh+CPezHs/1e/vXHyeNyRmkM+6AIwWw3m4gNTD3UKIsxQYGdea49lk+tHeLNhSuIFpzcy8LcOxSUJDuylt/K1rF9p2Bd5YYGhj0ECwqzGEKKjSfhvp/iZ9UXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445301; c=relaxed/simple;
	bh=7YTj92kNqvTxGEe1cNNLW3RP34iYfpF+DoJGWlj3xwM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CKIWsGgQ8fbjEkl1y69nC4BZV/bdYEp+56yKXD58aTj4cvlvoNhe3vnlTgGL+zby7iuhnSipzeMM7dIwRk3V/PH4PTEZ+l+K43E0OqBzkWPgV3mdmwsgf1dQuVoCofCyZzIn9y52pbQaFybCbgzorJfHzYux9XOqvKK44B0Mha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYux4OQi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYux4OQi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A7A1F00A3E;
	Fri, 22 May 2026 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445299;
	bh=7gK2VR5gTI+UcAjSIhHUDW5Ykd1zlLoCN9jWLoSHkKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kYux4OQix/CpCPxP9dEwfqnQNKXaifyZl0h50jWsUy1ysSEkJeSh3SPepKhOB9zGc
	 r0P4TYvILY6aT2MPkNHwlwTCes7dl7Xl6HnoIuoVlcfWpZOTOlRQsI53BAYh5xJgP1
	 5MUrc3VDUIFYsiDxXDDv1RtKObhh3HT6NgzQjBZkGZX4nVEQeo1NwOQB3ZwytCRC+S
	 bGy8H/YUU6VqtMZPs796782c5RBm8bPiBIoh+kGvI6bP2MrZD69fBUSQnMz7cL21ct
	 QF0mT0ScagCvZF3mhfS0zI/qNvnWrTP1mhU3WcVNUFx0rvg7UESqyid6hWWDPxz+t+
	 1NofCVM88rxtg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 mario.limonciello@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260507181251.20594-1-Vijendar.Mukunda@amd.com>
References: <20260507181251.20594-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/5] ASoC: AMD: ACP7.x initial PCI driver bring-up
Message-Id: <177940532272.58022.17604355383917647171.b4-ty@b4>
Date: Fri, 22 May 2026 00:15:22 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2080; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7YTj92kNqvTxGEe1cNNLW3RP34iYfpF+DoJGWlj3xwM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC4wMmoGSf2XUHjqPOumZ4DBeXxztDrvpEhDN
 lJKGEQtE8eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuMAAKCRAk1otyXVSH
 0KIfB/98mpoWQjqPO8MFh0MMVef4sPG35/sZJwa+V6AATwLOP7N12NZGz3i7OMFwYRg1RWt/d+w
 07401ZoTslhaTd+8fx0it2DZezQyY3RjGmXjquCX8M4/YWiAmXpDCBPo7Q2mEq4i4yrNuY7ghJ3
 t4/ra5QpVQEBw7QEe1cHrR8pJ5tNjeHCGl3kRTh8jJafJQcXM7uqT0+lzWTtdNQ41SSAPOZeoiB
 DYtyjP77/Bdzg6KZNuff6dlZ41GAr/sgvj7C3exv3Gpsv5xk/V/t3x0oH9An0kEdRvOP4qq7oy9
 RcKtAHARQVPz3+r5Hfc+IOqTBqtucmVMINUv568qfZFEuY48
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 07 May 2026 23:41:28 +0530, Vijendar Mukunda wrote:
> ASoC: AMD: ACP7.x initial PCI driver bring-up
> 
> This series adds initial AMD ACP 7.x support for ACP7.D / 7.E / 7.F
> platforms.
> 
> Compared to earlier ACP generations, ACP7.x includes substantial design
> changes, including an updated register set/layout. For that reason,
> the ACP7.x implementation is placed under a separate sound/soc/amd/acp7x/
> directory instead of extending older-generation code paths,
> keeping ACP7.x-specific logic and register definitions cleanly separated
> and easier to maintain.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/5] include: sound: add register header file for acp7.x series
      https://git.kernel.org/broonie/sound/c/44d16948af55
[2/5] ASoC: amd: acp7x: add ACP PCI driver probe/remove sequence
      https://git.kernel.org/broonie/sound/c/1da6f798eda8
[3/5] ASoC: amd: acp7x: add helper functions and hw ops
      https://git.kernel.org/broonie/sound/c/b5a2fdc5e7d2
[4/5] ASoC: amd: enable acp7.x drivers build
      https://git.kernel.org/broonie/sound/c/533308171bf2
[5/5] ASoC: amd: acp7x: add system and runtime PM ops
      https://git.kernel.org/broonie/sound/c/07d56a83ba70

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

