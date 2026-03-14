Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B77B23EAA5;
	Mon, 16 Mar 2026 01:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625119; cv=none; b=bdC7ZyFAPCg2njJrguWnTm9C5+CPAXEPS1zZndjof6paUL/KYdD3hfkp507VWDlNio8N2wGAPCDdAwKc47qYrNMYlE3mrvGyeOrFlmQeVICBdHlc1uzcQudP6zT4wEJf5UlVBGvOnCN+3nBi52vrh1euHbkqJhdUCvU4koJung4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625119; c=relaxed/simple;
	bh=bA+Iyzmby42sU6Z1icrI0H97xkdG1LqZqTVazWf3LOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MvbuZGLgMhj3r4bplsAqwxUDJpa82l8AViQecIHFR9m3O9tuIjAKMatUYtt63e86EJSD9XpzDxx31ub/198dK2nic7NAeT74fkBhnTPHX1rihDF95GPkvakRPwnAnUq5bYC2ttg2BFDOU4mEoHegGjL/JJGRXZ4lSroAn3ivqAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvVld32Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvVld32Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B38C4CEF7;
	Mon, 16 Mar 2026 01:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625119;
	bh=bA+Iyzmby42sU6Z1icrI0H97xkdG1LqZqTVazWf3LOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CvVld32QfkU+Kg50U9PFfxyM7kmdeHs2Sn9kj1jx9sEfy0gsHoud1qcI4E/xRkeEQ
	 jwrzJ+nUkJZ1TKcc5+J1l3+v6inieVcLqKr1WI6rX9oBA6NdQ1zCt+ui/bLB8SkFrz
	 1e43pPGfOfM43UEqMLtlVmXnkhJkiKCjDpMoGfMeijze9sjyPdeYKzGjpdUAVgOiie
	 iA/yGLjkSQTV/66pk7hGSASSGRWsGIdSQdyVq1ezHveOk7iW2sTdWQyczVjoPRm9ol
	 iDnmWmxd4at6u5AUvPkaf2c53Y4l3OrfONk4YTscY5c+CGa6RZyuUegtcHstqxeWma
	 JI8TwqZ4pdtzw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 kuninori.morimoto.gx@renesas.com, ckeepax@opensource.cirrus.com, 
 AjitKumar.Pandey@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260310044327.2582018-1-nichen@iscas.ac.cn>
References: <20260310044327.2582018-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: amd: acp-mach-common: Add missing error check
 for clock acquisition
Message-Id: <177352552955.149922.17599008928348411740.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 21:58:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bA+Iyzmby42sU6Z1icrI0H97xkdG1LqZqTVazWf3LOM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt18bunUdGf64eEThMGBkn2igz4dT47uw0/SsB
 p+lq+ibAQyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabdfGwAKCRAk1otyXVSH
 0PEaB/9jw68gtCJlOLoHFycV24pnNGIxsTyfzVmGKxxYnsD3sSpwfccfDvJoRq95dR/W2dAbja0
 WQf8A76vbTlXPiop6OvMe4o2r/+bUUqldu6Dw3hAkO3GapWELmHSHICFgEtUOHkbtrERrSWA2Cv
 lq7DwfxY+2trJlO36EvaaD+GIvf+cbtNEVXhlWLtmpKeD3CAA8w3YMaDnybncIfFN6MbNcE8OKK
 BMra3YvnbM7V1QkkrPa2BITxZJYzv3AvXeHAoXtSSVdV5tlEggkOqyRfGohirufXujfTljl/+UW
 W0i0BLZEMCNyHFbbgWTGhuOZOubjQIyxT99XuLRsVoDNXX4j
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Mar 2026 12:43:27 +0800, Chen Ni wrote:
> ASoC: amd: acp-mach-common: Add missing error check for clock acquisition

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: amd: acp-mach-common: Add missing error check for clock acquisition
      https://git.kernel.org/broonie/misc/c/30c64fb98399

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

