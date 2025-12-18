Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AC92D7DC4;
	Thu, 18 Dec 2025 15:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071943; cv=none; b=GbVEdXfFf4rREESvNiyBdGSwB56NnERGnnHV+Hf5e52Fp8YkzS+5AmW/IAIKTutWZZJHKd5JStnCJPyL6SW6BPoVSAaSyszo0TBFEgKc9nD2nn7HrT8simXZyvRtjAoNZQAY6ZCp0s8+v59smhG7cZa48feoPkLaG71YmaM0ebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071943; c=relaxed/simple;
	bh=3JJeP5zxAZxE/TV1bjmiq4zGyxVT/yyPXx+E0GY9+tc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kNMsMoRwKoWFpOuOqKtUJc66Myoe+XJtb3EXvA3LVwN+VnKEGN2oXhsEY+nJ3laOuUUYvNkCqyoChrsxboZwh5UZy406TV1J9Ki4melNKpD/Iap+NHayUxhlTgpftv5OTzmMtZPL5flqLL3UQvuy1Z0n7/Z5xLz2xwhwOwic1nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0UwAEpN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0UwAEpN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8902C116D0;
	Thu, 18 Dec 2025 15:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766071943;
	bh=3JJeP5zxAZxE/TV1bjmiq4zGyxVT/yyPXx+E0GY9+tc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f0UwAEpNv/lkLdf2/QnmtEiYXakiJGOdmZS6gyTuOMND7qFGx/h1r2F6mT5J4d3vR
	 ctBUqTriqi5suYJLGmZ1VkVEHWrgVu9KIQ417DfXIuvP3sKxR3SarZrlsF27vFf+QX
	 b1c5VNfk9IMPw/LaQt4jcRF/uow0zlSRX2ehLzBwJ2bCgLL1i7vxfkvVI42JtTZAIn
	 AT1dQVzQzO9x/LWIO0h3qVMRu46r+5yXEp9ernpck+cyh9jU2Nf0Hye9OpGjUX3Ron
	 y830ieGMQidFSwuPXiveI0JZCnz85c2hAjd8a3mwX7RGUt+A8dpNHzugsp53HHMfWe
	 UKQphqsFURN+Q==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, hariconscious@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, khalid@kernel.org, shuah@kernel.org, 
 david.hunter.linux@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251217054458.38257-2-hariconscious@gmail.com>
References: <20251217054458.38257-2-hariconscious@gmail.com>
Subject: Re: [PATCH] ASoC: codec: rt286: Use devm_request_threaded_irq to
 manage IRQ lifetime and fix smatch warning
Message-Id: <176607194164.209701.3385160535673365709.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 15:32:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 17 Dec 2025 11:14:59 +0530, hariconscious@gmail.com wrote:
> Replace manual "request_threaded_irq()" with the device managed
> "devm_request_threaded_irq" to manage the IRQ lifetime and also
> it removes the smatch reported warning.
> Remove the manual "free_irq()" in the "remove" function as free_irq
> is tied to device teardown.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: rt286: Use devm_request_threaded_irq to manage IRQ lifetime and fix smatch warning
      commit: 3622dc47a4b13e0ec86358c7b54a0b33bfcaa03c

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

