Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C81D531;
	Sat, 29 Nov 2025 00:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764377277; cv=none; b=PUkoefbxpsh7Qk7YDODXAc5lx0WDSaYHndB1hlEf8hAsFjA8TvyCREzp1GK8tozu5woWqtLB06G2rZfgi8/Y2pEfgXxc2H4wm5EcLZ2WRv8xcyUECR7inerdQJV68yLtn4S9dIbT32Itq/aAMfuqi5ASTHTiGrQYMiowo+pkNzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764377277; c=relaxed/simple;
	bh=tiAEou82DuUPk+Sgy3KV8Kfoc2rL2M+tYZqbLVakkhQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DtpJrWAjQCow3n5wJ+CwX3VopFr/oUF3ra7bw3+FCwLWmDoEK1kX+Sza+I/CoISHeVCa/orhQMPkiaXh6FQrHQkHgGPGprOyxadifDfzTcbVIM06e4Skanbnf2RnwnJImPQvteIaUV5/k6EIPiJyiQV0VB/8ni8X4fQ+pZX3Lls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbnYBxG+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbnYBxG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD02C4CEF1;
	Sat, 29 Nov 2025 00:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764377276;
	bh=tiAEou82DuUPk+Sgy3KV8Kfoc2rL2M+tYZqbLVakkhQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hbnYBxG+0cW43jI7TV6dBhFZ1hNYT9QQxSWJU5Hrt3/TBdQeW7vGtyxpraRyIiCuH
	 FnBD5up1HB9OytsZDl62zIeDe1+giBTPNG4dV6JJpR1olYHHQWCG+sIico6tfoZV36
	 GB3yHqteSF+Ft/Dh8/o3/ASzDD8XZajfMDI7pPlrH3+Twn6o1ynMKAz0MPPLytp4dX
	 zMWjAJSgVr7A2IVMdvOZzA3t5DAsvzJ/ToqY/0RojJ1ntVsEsIrIxGYg/n1q+wbP20
	 MzlBSOF6MWtv4JWPoW1LeQ6dz7Zj3I8P4+Ay6d1XpvA8wjzAf+VYRbcv5jVnPEHO3L
	 4JfStWh/vN3Hg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cy_huang@richtek.com, srinivas.kandagatla@oss.qualcomm.com, 
 zhangyi@everest-semi.com, nick.li@foursemi.com, alexey.klimov@linaro.org, 
 linux@treblig.org, thorsten.blum@linux.dev, 
 kuninori.morimoto.gx@renesas.com, marco.crivellari@suse.com, 
 ardb@kernel.org, ebiggers@google.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wangweidong.a@awinic.com
Cc: yijiangtao@awinic.com
In-Reply-To: <20251128130323.628091-1-wangweidong.a@awinic.com>
References: <20251128130323.628091-1-wangweidong.a@awinic.com>
Subject: Re: [PATCH V1] ASoC: codecs: Modify awinic amplifier dsp read and
 write functions
Message-Id: <176437727292.280659.6109776095774075430.b4-ty@kernel.org>
Date: Sat, 29 Nov 2025 00:47:52 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 28 Nov 2025 21:03:22 +0800, wangweidong.a@awinic.com wrote:
> Modify the dsp read and write functions of the chip and normalize
> the dsp read and write functions of all awinic amplifier
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Modify awinic amplifier dsp read and write functions
      commit: fd16593d456053d110c6e7bd141a7f381a1b10f7

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

