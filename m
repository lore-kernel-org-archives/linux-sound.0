Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEE53FEB0E;
	Thu, 26 Mar 2026 16:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542066; cv=none; b=C9fZBh7ICK8iAjWIrQxUqvtBuw77/tQJT875wkbnaFdCBbWzz6+K37KLBYW9FJ5bIinYau614ib8Ss58g4xjOesWMUj+UMmDIDr6JihZLSabvrhczmN8NtxcZm4b7T1LjZd7dtbk3ZIuaQfJNgTg9UnmBN+c5lcUNPVOGKihksA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542066; c=relaxed/simple;
	bh=GWGAnWT9ByD78NDu9/nZprTOheU+Mw0OrXGr6dx+GZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sjzSd5tL1EKJBL2G8NfunXYt8p+j0cKJGOuzG9i1aBRQp2UFX3MHwx44LGws6Aw93KLHNtXjrpKABJLFU7zrR5gbUDHeBaHq57nr31eVJ7DVnJQjXKXRRgd2ftMZYgdFWGDKn/gKYc3qULu8enS/W+hK9T2cyRUZJg/DsVjnm+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ngd7gKpN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ngd7gKpN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E417C19424;
	Thu, 26 Mar 2026 16:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774542065;
	bh=GWGAnWT9ByD78NDu9/nZprTOheU+Mw0OrXGr6dx+GZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ngd7gKpNkYIiANdA15hQl6+IhXlYIt4ia+i24V5c5NKkkon9Yhni3pJxaRk4EUG4f
	 tvexjeXnbwmMn+/Bh/6rF1tNupYHphAKqTcexDOPF2IZ91Q5HPV4IrVY3/KZKlCjmd
	 ny9my8xySCBsfxIyrfciXJc8H7CLOiKAlxWgHZCHJjrTuxj2UFPo4Q4blPRMMlErwJ
	 s6fTrFQ7dTNTsEBx3+RM6rwC72yDVgV3/E6icVPjqA3BfZmfrOnfy2rwy2AqXplnNx
	 wS4vq+nCh+fYFR+eTRQTVjTKcTmtIHkB7JUKSnbsCUdzszALNQgZny3Z7oDSf1JWf4
	 fggrJY6nvUk8w==
From: Mark Brown <broonie@kernel.org>
To: lars@metafoo.de, nuno.sa@analog.com, 
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com>
References: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: adau1372: Fix error handling in
 adau1372_set_power()
Message-Id: <177452123262.47114.6404512037766557753.b4-ty@b4>
Date: Thu, 26 Mar 2026 10:33:52 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GWGAnWT9ByD78NDu9/nZprTOheU+Mw0OrXGr6dx+GZk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxVzvG/BlK4+wRWDUOZOECRNryzBMCLN8lpobe
 /rp/NeeYMyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacVc7wAKCRAk1otyXVSH
 0ILDB/0fxW8c8Z3ZxmKIBK3feHQAS9E0IxleMwsumBm8ZKpgETebxZQRlx1uHRS/Boir4t3iV6K
 NgwW4OeUvYJIhsaY+SmlKVH1Zs+Nlf74iWT3KtuLUG8ICuLtMqZPwnOKm1WnaPkDBLNnSHCtvD8
 UfxKcPEbM4vJxk9h0JJF0rYurImQsRE4wK7h6Nulb8zxAgDmG45L1VeUQTbkNMgl35vwePhmFxu
 eLL0XNl29NQKuvifiIMuMmRYTes+cElxoakafEL6a5Ak79BKZ3OVrkXoFuB777Q6IEIZ7Ad7vNH
 4H1e5dfVmkZWJoF6dDUnFzOd6ac/u65NIwa9z0q4wOhMntMR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 25 Mar 2026 22:07:02 +0100, Jihed Chaibi wrote:
> ASoC: adau1372: Fix error handling in adau1372_set_power()
> 
> adau1372_set_power() had two related error handling issues in its enable
> path: clk_prepare_enable() was called but its return value discarded, and
> adau1372_enable_pll() was a void function that silently swallowed lock
> failures, leaving mclk enabled and adau1372->enabled set to true despite
> the device being in a broken state.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/2] ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
      https://git.kernel.org/broonie/sound/c/326fe8104a40
[2/2] ASoC: adau1372: Fix clock leak on PLL lock failure
      https://git.kernel.org/broonie/sound/c/bfe6a264effc

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

