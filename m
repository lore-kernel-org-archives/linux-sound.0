Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4202DAFDF;
	Fri,  3 Apr 2026 16:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235189; cv=none; b=tfgFc5YBMeIj1KxgmkeIQKo8M02cu1TKY998oNtENI0gJGeLMn/MG0qBXCk/XjOvX0mQ03J3z48tOxzgeXlSQQlHqXKe27y2dDK7dPa0Sbjl6dD8IrDEk3sTuK1KEpgk0oMAQAbv9rOoO7J9qqkyIbtRku0dwFVRsRELnUgoQOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235189; c=relaxed/simple;
	bh=tgPzzSMHb1yGjJDSR5gPEEIRILSxUJIN85OOFOLZGbA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UI80wEaFwf3FXkjmqKSinw4550VDWMZzrGhtUMwqZeP+NM2WX0uEcgqKOx2O6qOfV7/Wo6gty0x89+GWCqlEc5Cg1Hk2LD8/unnLkyt3oBBQJ9w2SlCv2toICBYbC8KqN3MTZcxaj0+Vs0Rp7TX9f2vAU+pJQkfE/Lz3NITTkck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkA0EoTM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkA0EoTM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF49C2BCB0;
	Fri,  3 Apr 2026 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235189;
	bh=tgPzzSMHb1yGjJDSR5gPEEIRILSxUJIN85OOFOLZGbA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pkA0EoTMC69zNi3cL9zvhKS/UDc+i0/2CjfjUcEvuUUiDRqShko3nBCPMTjHSYXq3
	 K6vmh+X2J8k3U66THtPJdw+LXfTuxghEsSfxzHXReQpGDM9pNUxTVuIVMGWYfOGUQB
	 y+qOvB5PCj4yFLFtM+uQyaVKdP2VOeioa7przu0pg5GBO6qmcLbzjVdhmc8ug9fcqI
	 Bqr1HGN4jd/lG4uioZje5nJ8bJc5PPYEiB0riGNXIOQZM0XFFNKx5+dyGe00laub5v
	 hnvcC2x1HFqWKz9H1eu4dAj3QW3wXf2fP31oY1cIZrWyXa3PkkrgwrdeIVET+kbSoi
	 V75rybcH433Yw==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, aravindanilraj0702@gmail.com
Cc: liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
References: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
Subject: Re: [PATCH v6 0/4] ASoC: Intel: Fix MCLK leaks and clean up error
Message-Id: <177522571080.52946.8298472605710550772.b4-ty@b4>
Date: Fri, 03 Apr 2026 15:15:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tgPzzSMHb1yGjJDSR5gPEEIRILSxUJIN85OOFOLZGbA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpz/BybAgqVyCx2bQluboyYDm95l0YzRCpLYKMp
 G5yDjfuRseJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac/wcgAKCRAk1otyXVSH
 0EgLB/9nmJLxLzX/eTjzcpTEgW5MSkgi7lzFETLSDqjLS85oa6S9PHIfLtRguAFDjOYC4+plieU
 jARmT6Ey2FDOcnFn2x038hB23QD7aV/TCSkeg6+Sfl3Sgcz770OcXaB6dPNFO1iurFntuF5nCg0
 FlSpiz2GEJD1nQMc5ky4s4ESwscMwe+byESRjDYhEucD1khfCKrpD/CrTDa8TwFs/h9M3jnXtL0
 422j7SFjIEfo1GVRrQhfd73JD73atC/bOFj4nxp7BuD1Gg/E6tfM+kjTlOJcGCcx87Y2ftnnpqJ
 XKPxfOQlHwzpzzX67V/qQ0mSsKkarQDCHoHo0e1a9BCpnyzV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Apr 2026 18:05:03 -0400, aravindanilraj0702@gmail.com wrote:
> ASoC: Intel: Fix MCLK leaks and clean up error
> 
> From: Aravind Anilraj <aravindanilraj0702@gmail.com>
> 
> This series fixes MCLK resource leaks in the platform_clock_control()
> implementations for bytcr_rt5640, bytcr_rt5651, and cht_bsw_rt5672.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/4] ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control error
      https://git.kernel.org/broonie/sound/c/a02496a29463
[2/4] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control error
      https://git.kernel.org/broonie/sound/c/b022e5c142ef
[3/4] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak on platform_clock_control error
      https://git.kernel.org/broonie/sound/c/dced5a373a96
[4/4] ASoC: Intel: Standardize MCLK error logs across RT boards
      https://git.kernel.org/broonie/sound/c/85c38c2fa17d

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

