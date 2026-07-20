Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E483803F9;
	Tue, 21 Jul 2026 13:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642095; cv=none; b=Nighaqbr1cRFJSdBQugF7R/yaYhB8WYyIFKei5jNg8QHENCuBTCNePdGwSSv6ys7mWwxf/DJPv2k1d1WM0mGRzRifvpNDMffuk2kgDK3hSZIgqHyS0kiy5tubIqXaXVJumFirlcZpuswacIWjDFoEKcOPUby+oFkbog6XTKNLY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642095; c=relaxed/simple;
	bh=6S8+jzqaV/BBg69Yx45/aG5PQ9pJg03aKwX45gO20Qk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lsRMewdX59If6Nh+omoLCNYMILOV2TiBJqVJ8h2l9Y+He5hR/TLQ0iWCAh7DNJbvKWgRZVXYDvdx2FNKkUi6hJtGmnN8kX+bF9HhPgGxyAnRAaSF1JWrw4qM4HdWlgYFbJyTZ24HI8BbFHz27GKw8B+ofrDIvmm5eHlwql9iYDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSmg7TpG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSmg7TpG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5729E1F00A3F;
	Tue, 21 Jul 2026 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642094;
	bh=j4xSJky6D9pxt9luBUgFc8GPFToOMGSnRsYPikntgKc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MSmg7TpGX/n/9iWD2dfXOHoOsptSaUE4vOEh33sybFshBLJ4REd2PMUi+ogcfOrkf
	 G1ADyKbaK6+0VVMo1VW6B0+5sLRyKM8nId+VY7sIU9jKM+kvDCv4dCiqNE+03mypwJ
	 OkVplQZxjV79C8r21LQ/DFMg5kC/yPsL+vQ5X5T6CGjbkVV1FH5X047OCLCL73PBKn
	 YyrPAd7eNJTnuUB8QDtxVUO+nvNMvmHDEFFpIaAzZee7Sd5atgG8jokBbDoLGRIIcB
	 2bt6xTU32zGjusPwZY7VuPsFr1bxV7eawRkg2Jj3sKgycI1fToB1Hb/pN/HFYhUQ22
	 NCvz0nXZH8Yiw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ASoC: codecs: lpass-{wsa,va}-macro: check
 clk_set_rate() return value
Message-Id: <178455969776.8049.2661342430699692451.b4-ty@b4>
Date: Mon, 20 Jul 2026 16:01:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6S8+jzqaV/BBg69Yx45/aG5PQ9pJg03aKwX45gO20Qk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqX3orsbkBc649agdutXgG0q4c6PfDzp/uzsgfX
 bReqAp/htWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal96KwAKCRAk1otyXVSH
 0HxQB/sF/tMBjGwXvCxlq1tEPtGN2lIo3mglQpQx3u4q9iF15c4rgFcprifRArCFHQXz04NZvkB
 9itcEJpabRhhg5FgdVG6B0gm8xotg+S81mLp4mevLIQzwh57qa3ub3e0OnNTFzHD9U98SHG7RSR
 PdGWdObfvVmoBLBRGJhlZDqlt5wdYMy2tRpj8w1FaTCLPmHAzskLtTn64ZOLYpnkPBXDyw70p7q
 /DeJhEMFKKD2l+yaLFwFe4WyDqUPJznNfY8sVzOO1Recp4ElLEs2j/fuFLuYSDg/QMIkYILzCr4
 p2ExnvD7phlKK+PA8kY9470/FRpAPMEkV0p+CGVxV5EPxHst
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 15 Jul 2026 17:25:12 +0530, Ajay Kumar Nandam wrote:
> ASoC: codecs: lpass-{wsa,va}-macro: check clk_set_rate() return value
> 
> clk_set_rate() returns 0 on success or a negative errno on failure but
> the WSA and VA macro probe functions are ignoring it. This series adds
> return value checking and bails out of probe on failure.
> 
> This mirrors the same fix already posted for the TX and RX macros [1].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: codecs: lpass-wsa-macro: check clk_set_rate() return value
      https://git.kernel.org/broonie/sound/c/6173e18dd47c
[2/2] ASoC: codecs: lpass-va-macro: check clk_set_rate() return value
      https://git.kernel.org/broonie/sound/c/4fddda16f939

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

