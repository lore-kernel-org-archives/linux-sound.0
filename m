Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E036402D;
	Mon,  3 Aug 2026 12:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758980; cv=none; b=U9CkaAt8hHaFf8j337K5t72isNpy36tN7Le71AIjtKHsdY+HrFW7ulKxhSbBa7rCHEuD3fiX5pemlVdvSdMxFOA4bEOWsuziBrr6MfuuOSqm9C+YnCNdjNQ70pFA6/YhYmxpZxPDoWto46h0r5cZlzMO+3wDCqwMXoZFzqXO90o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758980; c=relaxed/simple;
	bh=P8Ckpf+AN9ZXGrpQzc7rMMK7C90l/DR12zs6wgrPdoc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XE7mbVJ+sxNYz1KNdWDw4t9CW2MkAIczMM8lYOthkYenb5Gha+llSz91+/Z4gNFEdcCS88SdMnlY5/LfyY3NMj/bCVMHTZA8qQBk0MOPaI3+qlfWLe3vrf/d2pI9Gj6p/CQFz7Z+iS8frpeJjhspugOuRwE1TwZNAhF6czX0/iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LE4uggvR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LE4uggvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB0E1F00A3F;
	Mon,  3 Aug 2026 12:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785758977;
	bh=zaKVh0FDmUcsEgGHkLh3QfsnZNLagXA+/chtSQ0Z1Ek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LE4uggvRovJgUR/LZfiAVcxG8ktASipOTh+pgyf6zh8Sy57KK5XePYk6V5381COlc
	 2LRQJ1HD9cJylaoUGwMg4XNBl4WQTy2Bv/7QpbWEGxbwjjT0AlBZzbwHGcTxapK24s
	 NOYB98XXBet/jcbwLF4edC0hEw2c8pg/np/dalBVgcUi/6XoONzQf6Q6XXCgcxk97L
	 ncCPOJwPjpogf45Yan52sfQW9y9VObCz1dJxZ+y46Xq6jIjA7eECxSptkjn/hdObMC
	 joBG9BdStORypTpBN/TVqY59sJIwSRz+VN4UyFDH4Taw7cLsLLU30CWdyymfGzZ0Vn
	 hVNvB+aP9bPgg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 hongyang.zhao@thundersoft.com, neil.armstrong@linaro.org
In-Reply-To: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] ASoC: qcom: sc8280xp: add Monaco/Monza (MAX98090)
 support on QCS8275
Message-Id: <178554149364.353541.4962926572169960740.b4-ty@b4>
Date: Sat, 01 Aug 2026 00:44:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Fri, 31 Jul 2026 17:26:22 +0100, Srinivas Kandagatla wrote:
> ASoC: qcom: sc8280xp: add Monaco/Monza (MAX98090) support on QCS8275
> 
> This series adds sound support for the Monaco/Monza (VENTUNO-Q)
> platform on the QCS8275 board, which uses a MAX98091 codec on an
> LPI MI2S link.
> 
> Patch 2 (from Neil) registers the LPASS MCLK1..MCLK5 clock IDs in
> q6prm-clocks.c. Without these entries the DT clock reference
> "clocks = <&q6prmcc LPASS_CLK_ID_MCLK_3 ...>" that the MAX98091
> node uses cannot resolve at probe, and the codec silently runs
> without MCLK.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: qcom: sc8280xp: tolerate -ENOTSUPP from codec set_sysclk
      https://git.kernel.org/broonie/sound/c/07fd957b53fc
[2/4] ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs
      https://git.kernel.org/broonie/sound/c/a2fdf929fbb4
[3/4] ASoC: qcom: sc8280xp: rename snd_soc_common to qcom_snd_soc_common
      https://git.kernel.org/broonie/sound/c/a28da0f80d05
[4/4] ASoC: qcom: sc8280xp: add monaco/monza controls for qcs8275
      https://git.kernel.org/broonie/sound/c/4ba2678ad03e

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

