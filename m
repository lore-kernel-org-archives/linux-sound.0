Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336C13B442B
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445394; cv=none; b=QQqzKjUkqpHld7SIQx6TXIiAz0It1QAnRQexLOm7w3vTrIRFfcSvh5TcUPRrFdhW32yteSDEaUN8hCmTTOcaf7HOmlsVqEUuMPg3mNsuGHrzGv4/diVZSD6s3iwn+5Mo1dge6tJNvN2cSBNEQXUY/cyh8CzlWOGsdczzBUdiS80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445394; c=relaxed/simple;
	bh=rWfD/odLxfiz/3BwAHLudV88Ec4W4qU2Z5nWaXk7A4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kv7QhmwpIe4/qZSMix12dIzGlGXp4TSaPcw3FbfXwRezMhcbrSfrYELvJ7rvH1QnQFHTmMOypYSzikHuwFMlsig8xJquV3CVAoJlb0CgKdkza9T/cWdZJXTBsHBt3PnqlWucSNYZBX3Wx3lyt3ZQ2Sj5gCQ6UxW9LzsWC2cdo1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddwCpzs3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddwCpzs3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BAB1F00A3D;
	Fri, 22 May 2026 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445387;
	bh=PJ/h12hr1vjXHsCyT3N9BsLysS3ubPaDsGFJ3V41D1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ddwCpzs3w4rcPYdW4W+Rz2lpjo4WQMvD0oJ1OUBe8aIsfh/+SfsNPUixela78hG8W
	 wiZCMolGfKo62kKbYd2yyq/rTZs1h2BqEU9AQEYArmDtB49OcC+ygcGPLrur/XXyYQ
	 VkH+zMOSvXbf1Lx2FBJMQur1uhMAdTv2J78KcpctStFLmv/IaHUv3wY0x7FGf4xPAb
	 aggCGC4E3cRV/Z7f9lZyoBTE1jjExG1kQVBQVM1jzt07oGnzyHdu+8ksEmX1Tt8wcu
	 LeABVNfm1XOuSbaXsZUWzLAnMaVwDNU2DnLko+kw2FWOSYqh5039sNaN4bcKPYz9mp
	 YFnXftbaKQDxA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev
In-Reply-To: <20260520150204.18303-1-peter.ujfalusi@linux.intel.com>
References: <20260520150204.18303-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Print for format type in
 dbg_audio_format
Message-Id: <177940548345.58022.2641025896564847558.b4-ty@b4>
Date: Fri, 22 May 2026 00:18:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rWfD/odLxfiz/3BwAHLudV88Ec4W4qU2Z5nWaXk7A4U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC6J2swxh/fT5mjvTbgyGcCo5ODiPbwRwOEkX
 c7xTRR9rruJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuiQAKCRAk1otyXVSH
 0JBjB/4z8q/x/S4xAC4dkINS21zF9Bawt2CuqdNcISx8okXA1R9XPBXE79DHyz3DyCmoAjP2saS
 d0EuRJDPjkidE+SQ82HlhtolThpAYHO7HFKfJ8YOl4jtvl2xmnHBhHXd76lerBie2AnHFuig8yj
 9HQRlv3wy8eu7KjXI4niFV3vsjoDyDU/lejmROrvlP9KTfwADkdMQYgLyhnbxiB+NkrnvqIfQhi
 IYIQoKdyPMR4SLnYs/VIzUdIkOyPc4Lf/qkAllz0T2vj/DnKZoUqLAEudDEM8LwU8SGqY4IKnVF
 GLNSmngrbhEkaGqq4bcviIYjA6L76Qzmn87GD4hBMrtFzIrU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 20 May 2026 18:02:04 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: ipc4-topology: Print for format type in dbg_audio_format

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Print for format type in dbg_audio_format
      https://git.kernel.org/broonie/sound/c/6320b6445151

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

