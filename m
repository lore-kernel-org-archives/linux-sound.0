Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48DB364058;
	Fri, 30 Jan 2026 17:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769795984; cv=none; b=h5BL5PoINZUHKBffAP07JZntu4gu5BlJm8Dotiw+rQX9cJ7mGT6UrxwYZHW5o3hEPbldj2hm5FEmsFmJD60fCE4pt2W/HPG0izAKVtCdd80ev25Bf4tLyfFZTRnlQwwYAlYJ5QORQ7YaxXYsD4cDfHoH27Tq+pgPxJgn1iAmucI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769795984; c=relaxed/simple;
	bh=S4/yp+MdfeV2mwfjQS+uTilG4izmWUbgxmuOVRrN08w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dpuU9AAKwav+JnBr3obAppN+2H65I+LSrBhFJzd/HoLMfi+QsV9YUI/ZfV6npI0MJ0eRQ9DeW2MtBxdq+ogCBJE1LaXRq8YbS/jMIVrKeIyR3AMSdoCOGZdRLMaAFUL80+VdXF2wyJZj/8vnQ5NCgr3Ous1xX3oo6xrsV/PCOYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNyDFFSe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNyDFFSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB147C4CEF7;
	Fri, 30 Jan 2026 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769795984;
	bh=S4/yp+MdfeV2mwfjQS+uTilG4izmWUbgxmuOVRrN08w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nNyDFFSeTnnUpC+FjBkJR+AvbLL50MIOuw3HonEp5r/wnxFrBH1hTT1vMdsMC3YUx
	 /sZoIiy+RNGMBeIdaGB2DV8PMXf6PSQlsA0X6H3Y06qgukpoQi8qpwMOTXuIQC3VBu
	 m2DpPQR5DHpaFZtOAwI94KMijGrEDOwtMN2NsWHMkw0gkrGlRJjleLgFmVXEJX5ufl
	 L6BD3UzZYZRZTQ/Elny+jTuaiJXl9JhTW4VScbGZl581rbHnPSNwoUiAkrCaoZPD8r
	 QfgD3zu5cD0aoAqg4Bj9vDRKDbXudo6AxBWJ26FBlx085k+F7oxlvqUClAhgoqgQEz
	 cR7qejmz7geJA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com, 
 srinivas.kandagatla@oss.qualcomm.com, krzk@kernel.org, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260130091904.3426149-1-nichen@iscas.ac.cn>
References: <20260130091904.3426149-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: max98390: Check return value of
 devm_gpiod_get_optional() in max98390_i2c_probe()
Message-Id: <176979598250.995066.12098500477287136570.b4-ty@kernel.org>
Date: Fri, 30 Jan 2026 17:59:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 30 Jan 2026 17:19:04 +0800, Chen Ni wrote:
> The devm_gpiod_get_optional() function may return an error pointer
> (ERR_PTR) in case of a genuine failure during GPIO acquisition,
> not just NULL which indicates the legitimate absence of an optional
> GPIO.
> 
> Add an IS_ERR() check after the function call to catch such errors and
> propagate them to the probe function, ensuring the driver fails to load
> safely rather than proceeding with an invalid pointer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: max98390: Check return value of devm_gpiod_get_optional() in max98390_i2c_probe()
      commit: a1d14d8364eac2611fe1391c73ff0e5b26064f0e

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

