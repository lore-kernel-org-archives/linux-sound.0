Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56214219E2;
	Tue,  3 Mar 2026 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536804; cv=none; b=Sybbe2GOYcC6sWbns93URnjuBk7XMixkdMZKLlVbF6WrM7zOv/pNdqGybSEeuG0wsh+VMs5kTcgR+g/JQWqKB2f6d+ygOVl/U+0cBW7MXtNIIhrmEMf2IL9TjCzQV/MKYKLR6qpMxcrei1aT1F8GWhglJaO6dXNogLNfTP6//IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536804; c=relaxed/simple;
	bh=qpVwGrhwBxlw+Pc+vRHoNGotcYi9/V3FMBymFuQSras=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Mxi/7DRPGR44kpzrx6eUxhGQblIDHtUTREUw55nom/ai2WlsDttqnA9zmneFrvZ+BUujpT8CL/NRO0QKAQk7fmi8WNTvXepGsP0wSrbP+vt5saHeWqEeJuErSvoam3koW376OIcppHdYDQ2AsaDAw+CV4WZEbE+OSy80HPaWz6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCYVSElG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCYVSElG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EE1C19422;
	Tue,  3 Mar 2026 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536803;
	bh=qpVwGrhwBxlw+Pc+vRHoNGotcYi9/V3FMBymFuQSras=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nCYVSElG0YofkabMk9wMSyyIe0qFT2iU8d5KgZQexCz80FpNCkR/hvSTkRDun43Co
	 pGV+x/J4730tpEKfQH8E5Q3VLlKNgDnbHyF+Y5v8Y3W4IObl1vRGplM49p90/oalM3
	 hMR3LsDTSrUYqzYL9LhUah9+gw+ZZTuLYoakjcczmKp4AiNe0F4VTUDT/J2+O7wmxz
	 AI0zcrjMFLBcDTnkngxqG1n2U6DGLzlNs5mMIkDMKe7iZP4MRmFE+1HEAjRw6tZysT
	 7UyF0ED9llVMbOUc+3lxG58aJDCfE49c95Jt8Ru9YG4OVBMf2xS5Lo9WVtQhPbjGRh
	 mCA1B/axlfRPw==
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
References: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/4] Support wm_adsp hibernation for runtime suspend
Message-Id: <177253680239.22767.16138184990022496541.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:20:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Tue, 24 Feb 2026 16:18:04 +0000, Stefan Binding wrote:
> When the CS35L41 and CS35L45 drivers suspend, they are put into
> hibernation, and the regmap goes into cache_only, but the firmware is
> still running, and wm_adsp is not stopped. If userspace attempts to
> read a firmware control, it will perform a regmap_raw_read() and this
> will produce an error in the kernel log.
> 
> To prevent these spurious errors, add an apis into cs_dsp and wm_adsp
> to allow wm_adsp to hibernate. In this hibernation mode, reads or
> writes to the dsp controls would be rejected with -EPERM rather than
> -EBUSY, and no error will be printed to the kernel log.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] firmware: cs_dsp: Add API to hibernate the DSP
      commit: 73942a6ea26bd7e02b7c260b8b7aa942397be894
[2/4] ASoC: codecs: wm_adsp: Allow wm_adsp to hibernate without stopping DSP
      commit: 6394a52c90c4abd10c8265983ec1f53207cd283e
[3/4] ASoC: cs35l41: Hibernate wm_adsp on runtime suspend
      commit: 4d80c0dbcda551b8b86ff14c6ae93026993970b2
[4/4] ASoC: cs35l45: Hibernate wm_adsp on runtime suspend
      commit: 17c6bf433742e0c1ff5ce175145877c0194e4a7a

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

