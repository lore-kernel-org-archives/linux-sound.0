Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8013F23AD;
	Wed,  4 Feb 2026 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210188; cv=none; b=AaGhHpwPaFo2+VN6InzWCYlla6D/ZC6gkUJza+LLqQTZ7xKLy0xhjv+E+RiwL6A1wsAGMuPOJ0mVkK2SvCYdFoANCVq8h8xaG8aaubMN3xKOjw504nUhwKL4eV/yxHBCk35yjvS1J3auFYAKzedLoYwIX2g+QeGPAmk3WvpJx6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210188; c=relaxed/simple;
	bh=VuP1CSk7tRDh/iCmP9OV7DvBrP6Wzbvkw395NoBrFlA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VvqlD2iJDrv2seSgmg1q6/Xtqg8wqZFn+ghrY/24brkHOrYTSF5mP62rqefl2NJP77iFD7X1xmPQd66gwqkDAEVCLI26ogIChfGH1MlpJ5H0A1Uu/5gKNnt2gipypenhZK+T+1Ss2UrKmYdQKI93tyODXMRq278G+m7gX1pFiLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLE+IWFX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLE+IWFX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2449AC19422;
	Wed,  4 Feb 2026 13:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770210187;
	bh=VuP1CSk7tRDh/iCmP9OV7DvBrP6Wzbvkw395NoBrFlA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TLE+IWFXJSDw3wBGGNF1S963QxLjZTHD+JpWpG+/Sn8RjdrC329UFUKVK5B+2KlyE
	 ggNWrcrbOOcBlSNuRNd/fXv1c9sPt8fxxjNevjMH8mcgkJfgYK/p81aEesxpWWhamG
	 TCAS9JWXnApADmaMBu+cJjvwocMMnCMsMj/BWY7DIMtKeTxZQqgBxpP+nnPKG5/HsS
	 7W0ZdgEgnWGgTaxOvMsTIrPScow4nZubmGIW3lJQoLvJaceiPNL0n9Y8Khg+c0a/E7
	 tvTzeo1hpND+U1yRgUd0J6aksBeN4P6kCiSvGBCjti+OTwMBY6Dkx3RK4RwQ8jmVSt
	 OZwl7CYAmuVvw==
From: Mark Brown <broonie@kernel.org>
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: linux-kernel@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, Vijendar.Mukunda@amd.com, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260202205034.7697-1-chris.bainbridge@gmail.com>
References: <20260202205034.7697-1-chris.bainbridge@gmail.com>
Subject: Re: [PATCH] ASoC: amd: fix memory leak in acp3x pdm dma ops
Message-Id: <177021018588.97050.9802416021827464786.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 13:03:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 02 Feb 2026 20:50:33 +0000, Chris Bainbridge wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: fix memory leak in acp3x pdm dma ops
      commit: 7f67ba5413f98d93116a756e7f17cd2c1d6c2bd6

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

