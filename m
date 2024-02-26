Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E8212FB03
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 19:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708975703; cv=none; b=EBEKCM9uJOByIEu2/BojloBdWPEMDj9qFZmajCkJaUjBgttieIeSv8OD8HxjFxTfmbqDbbXIuL6nZSxvq7NzqoHwiwcEgUbvdqhvUc9eedsgxNqJLTs/ALwpPsMkdy0LEwBTgzQuD6sLwGnNudp0hwPXYKUbKZaOGH2r75CZW+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708975703; c=relaxed/simple;
	bh=VsrxgaLb+abib+xObAVod7O0ZkmPJTnPeNMRVwjrXMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rpEDbI4k2Zg4ou2JOvFPH4BLUgmdVaz36xo5Ti/3RLhy7izGee4MdJKuBmuVfPPl7bVdIhYdq2wDGg6v/aIFV3NsQ8Eyya9OFkpCb6vX/iC8yLis+1s/5QRiCbGf+WamUOW6w67kt9dcTW80Yl4lGi4UqWT92/sWyTdxXa+qOIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/CQE36u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/CQE36u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A49C433C7;
	Mon, 26 Feb 2024 19:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708975703;
	bh=VsrxgaLb+abib+xObAVod7O0ZkmPJTnPeNMRVwjrXMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a/CQE36uwihueNCLxm80itCjFTVXNa/GYassCMysVAGKJeIB7/wf+TFK2aS9qF1eo
	 QAeLz10Y8kGycumzpgyO0gEs6lAfXRUenayIR4RX6dCr1MFEIv/B2/tV/E0NnY3AVK
	 zzgVAJ4Muh2+6A17f1NZGBgzLPef9l2JXJWI5WZUaHSLOGR1deng9XKZMsaXCH7xoU
	 OMTUje9etl4v2Y11uKXI7EO+Qcfvs9bc9vI1nMLIf/SsrHLs4gIoEq5GY6HEmJUQSb
	 MpZ0lV/lpemXeYNNlnjwlgcIqsXMh4nviAC3flCXJFf3zlyRDWjPKfgHdRf5QhocOU
	 Du/mtwsT5qFqw==
From: Mark Brown <broonie@kernel.org>
To: Johnny Hsieh <mnixry@outlook.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <TYSPR04MB8429E5883243B650AF86A030C55A2@TYSPR04MB8429.apcprd04.prod.outlook.com>
References: <TYSPR04MB8429E5883243B650AF86A030C55A2@TYSPR04MB8429.apcprd04.prod.outlook.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add Lenovo ThinkBook 21J0 into DMI
 quirk table
Message-Id: <170897570248.121037.750092229957179245.b4-ty@kernel.org>
Date: Mon, 26 Feb 2024 19:28:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Mon, 26 Feb 2024 21:27:32 +0800, Johnny Hsieh wrote:
> This patcha adds Lenovo 21J0 (ThinkBook 16 G5+ ARP) to the DMI quirks table
> to enable internal microphone array.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add Lenovo ThinkBook 21J0 into DMI quirk table
      commit: 50ee641643dd0f46702e9a99354398196e1734c2
[1/1] ASoC: amd: yc: Add Lenovo ThinkBook 21J0 into DMI quirk table
      commit: 50ee641643dd0f46702e9a99354398196e1734c2

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

