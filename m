Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC382D24AC
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 18:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761157251; cv=none; b=Q7tU4Sjtd98ssX2j2jrPrMb1Gdj5bRMVb8j/6iq55R7pH20NGcVlBlLKonPPvmkfGR9Fn9Dp9N1FuDPuaz83scha/TyDrmRVe1KQ47LQMLcnuFvqM68reChUsl/lLwAzaVPythGDuuBvFyhzqgbLEzL9+OayoKs7jNH0Y7fgbI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761157251; c=relaxed/simple;
	bh=HIUnXBHD+mLzW7fdoPQIWY1v1J/txu0/4q8BpJt9CpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D8TLe7KvnTaF2eUItQS0lXj/2Ye1T/yX4zZPx52sJiOgpeuPKBi8zIss5blzvKaqDw+GsyWUd+8eXShNDiskdoEvNZuKlGTrPR1FRSH6li0tepXpfzpF1fqIEu3TYrvQq0ENTK4jNmDsLuO+Lx1HwFiwSY3xQgNr6NlrlYwgtDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EwyWv53c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EwyWv53c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B69C4CEF7;
	Wed, 22 Oct 2025 18:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761157251;
	bh=HIUnXBHD+mLzW7fdoPQIWY1v1J/txu0/4q8BpJt9CpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EwyWv53cO42BrR6leeD8wtWZadZDgqyRvmc60atLfRwKtSrxjOF8qGh4YB7sL2EqH
	 m/zBq25XIpVLQDFOfEQnFFUEQD7u1La7ulMlxJyFKBM/ORJjaoNDWLgDdvPvfk0KHq
	 x7V3qlo8oqEwMNEBVPLqSiJpK6WpmItgQiVCyuTNE7IGK8A7B7pTOKefsG96AL3wcv
	 uGsMAveF/W8ncva9qOX94vYm9JpRRaEZG9sBKSohHEXZtuJH8PevwhqSp4mMVUbl1B
	 xDxYCi3VrhFo/jmejj67PrOy36Vm7jry8JOGXjSm6kss4Sk1cHKl1RO6sCzsUJzFYR
	 F69KS5FrpIOQA==
From: Mark Brown <broonie@kernel.org>
To: Sharique Mohammad <sharq0406@gmail.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, lgirdwood@gmail.com
In-Reply-To: <20251021145611.1750689-1-sharq0406@gmail.com>
References: <20251021145611.1750689-1-sharq0406@gmail.com>
Subject: Re: [PATCH 3/3] ASoC: max98090/91: added DAPM widget for digital
 output for max98091
Message-Id: <176115725008.270213.9137512146201249781.b4-ty@kernel.org>
Date: Wed, 22 Oct 2025 19:20:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-52d38

On Tue, 21 Oct 2025 16:56:11 +0200, Sharique Mohammad wrote:
> Added DAPM widget for digital output path from codec to the
> CPU DAI (capture) for secondary digital mic. "AIFOUT2L" is the
> left audio channel output and "AIFOUT2R" is the right audio
> channel output, both belonging to the stream "HiFi Capture".
> Stream index given as 2 and 3 respectively, as 0 and 1 belongs
> to "AIFOUTL" and "AIFOUTR" of the primary digital mic. Now
> with this commit the total channels increase to 4, so changing
> the ".channels_max" for ".capture" to 4 accordingly in the
> "struct snd_soc_dai_driver max98090_dai". This will work
> for max98090 and max98091 both because in case of max98090
> only 1 or 2 channels could be used and in case of max98091
> maximum 4 channels could be used. Both the cases get satisfied with
> ".channels_max" as 4.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/3] ASoC: max98090/91: added DAPM widget for digital output for max98091
      commit: 638bae3fb225a708dc67db613af62f6d14c4eff4

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

