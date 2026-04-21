Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A72F25E4
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792131; cv=none; b=K/PX8/9Gj4AHbUqKV8wVva9woell1P0lKZVlcT/qRFRoHRJI5OihLE94Lj38JbdWvQLQcvVDTorHE9vvtol1UvFB6FrYcUeNk0EHV+3rv0FJkz0r9IpN2cjhpWR2RtUu5v7KoxBzfuemuzcMVACed0pu50FfyGHNmz70RACjoL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792131; c=relaxed/simple;
	bh=NJdcssXikq07N4UmXu0/kKCmhX9pOO4Pg1US5X6YG3I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C4S2kNdwmiqMQGnFnL/x/pR6gVLN51U7RKqZyZf5LoSo5AZT7hdhvzQiVXrdLXPhMIDMb1Nl52oA4vPUwrsixI2RuEvsRIQgqZ5BV1Q4qkzaCfCJF5z4kVkUPt4FuuavafBptZm/kqcxiltO2b7BMPIIm8/PYilgk8CVcCBbQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkqk3ZB7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkqk3ZB7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C5AC2BCB0;
	Tue, 21 Apr 2026 17:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776792130;
	bh=NJdcssXikq07N4UmXu0/kKCmhX9pOO4Pg1US5X6YG3I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mkqk3ZB7kSQ83YrRnMecHuR0fcjpp2BeZ+GQI/+cNkAC0OAbjhH6q0MlvO6PcORt9
	 zezzRq2TpXzXOAlHrSRP218gRBTsUg1MTjsovedTzuvzhfxwh2Qg6X7ZqoqNLMf/bH
	 W/YPGen+owvGo5lmjR1XQSQ/haCmhS4oWlEp91VDYGi/pI0RUoL0GuuUkBJqUE+aW1
	 ywH9O2n1Fl7Qfnaan3lWfhuE7UYMr/mG6DgbWiaybKApDWH31tqZY649x9wJ/RRgiZ
	 d76bnP5UbPI7czjKClYGlbkYA3nLOPeCgxS5L6sZv/G5hELEBlJVeQuCEUzaCa0Mld
	 JbFgClMHK0jXg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260413124621.1345315-1-ckeepax@opensource.cirrus.com>
References: <20260413124621.1345315-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] Correct bug parsing DisCo booleans
Message-Id: <177677857106.43010.13188435195794723796.b4-ty@b4>
Date: Tue, 21 Apr 2026 14:36:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NJdcssXikq07N4UmXu0/kKCmhX9pOO4Pg1US5X6YG3I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp57JAEwQShb8x/E+hGwRPS4PimOc06WeI2c4Oc
 q1LAbN6FTuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaeeyQAAKCRAk1otyXVSH
 0AJCB/0bUuS/IBNC30tgiKeQkrYmbUDWfVnbK2aOhVZpTas0FnYWItpNiIiGX3lPRZ8kOvCiPT/
 PNAx8JVt/xtRqg0S4AgQrvbCE5US52VNIk+oiSPu3RdwNDbykeM0YjX/hM1Tz6L4VP26AmCl4WO
 OudQBOhBV0RuQJb6cNVT6fwBRvWyFOyrAzBKyToJMIM3j5S1eEBN9SuvyVqYed/EJkFwpT4CHpf
 zuSuiKeXnFhNfPNGWcsoTWEq9nkkWFi68HB/uwIOUgT6W4uVyLRpMnom7urAsz1kxb81Na4NCm7
 692OFqSgrUGYzIz6abpC8rLJdYqUaztfeFZpxCxCczxxvzjl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 13 Apr 2026 13:46:19 +0100, Charles Keepax wrote:
> Correct bug parsing DisCo booleans
> 
> MIPI DisCo uses the unfortunate convention of allowing boolean
> properties to be present but having a zero value. Opposed to the
> normal convention of simply not specifying the property. Fix an
> issue in the SDCA code where mipi-sdca-control-deferrable is not
> parsed correctly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] regmap: sdw-mbq: Allow defers on undeferrable controls
      https://git.kernel.org/broonie/sound/c/ca1b11b36d82
[2/2] ASoC: SDCA: Fix reading of mipi-sdca-control-deferrable
      https://git.kernel.org/broonie/sound/c/956c032be7ca

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

