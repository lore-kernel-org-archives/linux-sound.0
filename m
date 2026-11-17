Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939557;
	b=mRYTJAj1P58WZ4uBI/Yz3xR3qRTVI+Ru4DxQD1TKdeekOkv/eqCFz+htTZKYt3d5sFkR
	 uKCJr+XgQFIRCac53lNoeiA4FinmTXuKzRjpCTAA32KfeJeZHY+9at+h11adprK7ldVUI
	 9CGTuDnXiq9MvXW0BW+6mN2nHtRpDTDncEvGquvXdLq/0O5PV3OFAcax2rPLmMD0tf7MH
	 F58n6cIubnE8ndfEGPgJkIiUmnj19cxjo9RgC83vYN+f7UDKJqUmhyldtHFc2LQRh145g
	 zUptk69oI/wLF8W+DTLuWmlLqyL4QsOfYMYAuy+Vx38IBUR8SC/BcFlZJrg/OIYB3AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939557;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vg40dQb3GyjaM/MxwfceZkeTged0zEm24vPCwQKrnkI=;
	b=dyIvnMFb3Uqb2hwk19ipam9nI0uv6BIRCq3TyNKw9o7Y7Ffwv66J7aap5bVdyOK5R4JA
	 dbSKAe9u88MbYTHkFhPTnMANrsAzllUHXF00NKTcuDvCFDpBXJshkdg3HFXfNMPmZMzqb
	 YgBbUNQbm49Fdx4gRc2n8DSbsmMv246hEdDBmcFTbPL8fSy+uzra5HLfXrZJk9NBqBm8V
	 FyGpi41thQBCQVYPtaCNlZSCY7nwXWBJtHkDsIIhUkZRUgQl5xkl5np02LLdA8nKJSloV
	 TkxT+IsrA9evz3+e5ulqL7hnahJzNBxXVVNPIMrijo8hsCdqb4NXpaPWABpUhY7G4EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igGL+6q4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB10606A330;
	Tue, 17 Nov 2026 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igGL+6q4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936091F000C5;
	Tue, 17 Nov 2026 18:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794939556;
	bh=vg40dQb3GyjaM/MxwfceZkeTged0zEm24vPCwQKrnkI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=igGL+6q4Da5+IEnxwi16adVTd03LHQO/AXNqfgMSGbkn3e2WJPOfsNkPcFAlKERnl
	 UKaCLa66zLshq3iIsEhBLbZhvpowyo20w69zt0V1gtoeu2uwhiIsDIFndEq85MpgPz
	 2FEmhpneQLcYMzCh7sFlEVCj5iIsZEvieQ794KTuX6fq/mz6lQZ3DZrSBvBWzboGrY
	 sLOnraMWKA4KzDq17n9VYZq8gL4EirxRE3Wst6LoX7GPtkxe3hh+wWQkA6pTLpmIhF
	 wdEYvKowlWk5JJx07cuBNqmZapku++MMpuR31Wnoioei8ojxZHN/F+cPNcyL8dfcLA
	 9Jb81giaBmy0Q==
From: Mark Brown <broonie@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>, 
 Andrew Jackson <Andrew.Jackson@arm.com>, 
 Xingyu Wu <xingyu.wu@starfivetech.com>, phucduc.bui@gmail.com
Cc: Tim Bird <tim.bird@sony.com>, Yuri Zaporozhets <yuriz@vodafonemail.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261111022731.8243-1-phucduc.bui@gmail.com>
References: <20261111022731.8243-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v3 0/6] ASoC: dwc: Fix several issues in the I2S driver
Message-Id: <179492885684.77896.4596853748674055063.b4-ty@b4>
Date: Tue, 17 Nov 2026 15:20:56 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lHsvseC/SgaaidQmhlOI0G8I6Fn6dKWvEYamUk32QDQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+zFrA3fi4c6/YddYkF/5JzZkpp27OOrdBjrOb79Ai6
 zLl0GkfOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRLwqMDGtMaqV2XpWZ6Rcn
 d4I9ouXkpYzv0ndiflWwtZxn2sPFeIThf+lLzzKj7hNv5/wS1K/b8fL+6s23nk5ds7kz5Kd0iOe
 Fy9wA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 11 Nov 2026 09:27:25 +0700, phucduc.bui@gmail.com wrote:
> ASoC: dwc: Fix several issues in the I2S driver
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series addresses several issues in the DesignWare I2S driver,
> including clock rate calculation, DAI configuration, channel limits,
> DMA FIFO sizing, and error handling.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/6] ASoC: dwc: Fix bit clock rate in TDM mode
      https://git.kernel.org/broonie/sound/c/1b1af8e535b1
[2/6] ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
      https://git.kernel.org/broonie/sound/c/6d814b962a87
[3/6] ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
      https://git.kernel.org/broonie/sound/c/0b67b15489be
[4/6] ASoC: dwc: Fix DMA fifo_size calculation
      https://git.kernel.org/broonie/sound/c/89c6374420f7
[5/6] ASoC: dwc: Propagate optional IRQ lookup errors
      https://git.kernel.org/broonie/sound/c/5d836a3a1e51
[6/6] ASoC: dwc: Remove redundant error messages
      https://git.kernel.org/broonie/sound/c/6d871a9e6a16

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

