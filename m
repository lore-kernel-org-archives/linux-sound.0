Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11E513633C;
	Fri,  2 Aug 2024 18:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722622867; cv=none; b=BfvdkXPhBaG2smgE2qUhX3nagd1yBtk9qDn4bv+KnzEu39MqMZFXzKYaOfyAIYsi8uiYLPhhEY+LoOjBFG/tFDhDoV6CW9LRbk/ro8OPPjFg3cWkJRKJk6jHqeuR5am0t9K4vNQxC+1kTlOfIBPMhmDFdEgQ+QDlhsnzs2rMpko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722622867; c=relaxed/simple;
	bh=G7JBKRrOhMKLRs3Q0JQ80dT2AI5Js5oqFIMYQMzMrO4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AoDp+sAMAN22SFlVz5AVzVAOe/H5zYmlNd5TxmXrdH7uNY4jk3taTBX7kNKB9YKt1GYoDHkMPJ2IxdKr/PXip/HaOM5MIlRPSG68TI4UkC2bI6H/Azv+trzhyTEfjt9NHq2GlJw5c759uVueo77pRvYoE44lceZLoC6YMer9UYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYgLr98n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYgLr98n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4490CC32782;
	Fri,  2 Aug 2024 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722622867;
	bh=G7JBKRrOhMKLRs3Q0JQ80dT2AI5Js5oqFIMYQMzMrO4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WYgLr98nhqiJFVNGCB1MZMWgG4GkCmgKRbVTkOmG0lBdFgdX0MsWcKTzOXvjlAvCe
	 bWSE9XgSayIl6Ucd8yI+YnAPO77jvLOPcdTnYOAhsf6KZ2/cu0Ewc091xADQIWJDrl
	 PAicMD4Y3/qOHXSI9oWPY8sMwZrnA4b931YXg2QjcTroB4TM011XR772JlvSi8MQXD
	 eSbyBNEq56uH/7ReEU2apiraTDAhw7tq7JQrwmfJQwEPZY2rm8+u8yzVDsAuCQ8ltU
	 VCaTecLrBFC/Ph6JHZM2/a0ovN/7EFq/fKpNnh2/kwk4GH0u4cCfBJwlvAg4sO+mgF
	 ZxleD+1KV8MUA==
From: Mark Brown <broonie@kernel.org>
To: jonathan.downing@nautel.com, piotr.wojtaszczyk@timesys.com, 
 vz@mleia.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Yue Haibing <yuehaibing@huawei.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240802101044.3302251-1-yuehaibing@huawei.com>
References: <20240802101044.3302251-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ASoC: fsl: lpc3xxx: Make some symbols static
Message-Id: <172262286392.83468.2866189640414967072.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 19:21:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 02 Aug 2024 18:10:44 +0800, Yue Haibing wrote:
> These symbols are not used outside of the files, make them static to fix
> sparse warnings:
> 
> sound/soc/fsl/lpc3xxx-i2s.c:261:30: warning: symbol 'lpc3xxx_i2s_dai_ops' was not declared. Should it be static?
> sound/soc/fsl/lpc3xxx-i2s.c:271:27: warning: symbol 'lpc3xxx_i2s_dai_driver' was not declared. Should it be static?
> sound/soc/fsl/lpc3xxx-pcm.c:55:39: warning: symbol 'lpc3xxx_soc_platform_driver' was not declared. Should it be static?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: lpc3xxx: Make some symbols static
      commit: a1c2716738b7ba9e912e04872639dd39c72baa35

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

