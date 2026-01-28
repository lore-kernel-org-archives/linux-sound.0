Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C378F2B
	for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 03:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569331; cv=none; b=TOSO3ebhaYNQdWI39XOPygGh83qwpjGdjs9rlDhbK0lGC/eFMghH12cdN16tp/SFCVZbijb8AFdY0XC4no1F+BlKa0DcXnphDvbY5XFRXlQtstWk6/juao7zglDIH1ygVWhA2o0owS0wLMlcQ6YFJIF12gVQDgRbKruo1ORjIyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569331; c=relaxed/simple;
	bh=53hooVCWZlBjMezQE4e+3ZekK6csj4pnr/TZamcMDOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cQYZpsbMhLST5WxZiDB38UnKvfKtCXugBANLdncvoXBXY72NcIng5xE3z/329obaVr7lNIVeG+F/+1b/aTeehgtdpu6dbD+nE/VYRU7lVgj+9T5VlSlBOUmcFfk9nfSObYxc5UhKYL+X7vhzftQt+AQSAJNUr3GC2s2fjEDpbnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQp8yjWU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQp8yjWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3732AC116D0;
	Wed, 28 Jan 2026 03:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769569331;
	bh=53hooVCWZlBjMezQE4e+3ZekK6csj4pnr/TZamcMDOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YQp8yjWUKJBKO8040RjD8GVp2rXIwyEFGL55rmPaBm4zTsb2sIJ71U6M8KbnR85Kf
	 +jiC6bOROqVw5ZiWfGpIa2soNpuyeS3pki5DuRaAEqIjsKliNpuBW/nu8+tPz8401n
	 RAyhLy1ms+ag3k3+EzeLQDwxKgPCBnvf8DiUeUBkeU5opTnV13noXfVvgMUADBKCdE
	 JSTZZc/m7mWHUHRfcpBh/O7Rn3VY3x7+tVMLSIVY5D0GLAh0iLk77MyviVL/5WsfEs
	 ZYgNMRhNIR7ae9zjtF0RdlIgC9dMMXIdQr9hzHGXwfJ84L1VAenIM3Bpqr11z8NUDt
	 0vTkPUiJ4eb2w==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/8] ASoC: capsuling struct snd_soc_dapm_context
Message-Id: <176956933098.1515833.6025720230431065614.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 03:02:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 20 Jan 2026 00:13:50 +0000, Kuninori Morimoto wrote:
> This is v2 of capsuling struct snd_soc_dapm_context.
> 
> Now, all DAPM users are using function to handling it.
> We can capsuling it. This patchset moves struct snd_soc_dapm_context into
> soc-dapm.c, and remove un-used functions.
> 
> v1 -> v2
> 	- include tlv320adcx140 patch which was added in these days
> 	  and is using old function.
> 	- based on latest asoc branch
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: tlv320adcx140: don't use snd_soc_component_get_bias_level()
      commit: 34a74d04cd0d8dd552ba2118bf197f09e51e2336
[2/8] ASoC: soc-component: remove snd_soc_component_xxx() wrapper
      commit: 19a412b66df7cddbc1fa87e049c56bacf00adb27
[3/8] ASoC: soc-component: remove compatibility definition for component
      commit: d8b795f65217dd033daac5147eba6acb73a9a489
[4/8] ASoC: soc-dapm: remove compatibility definition for dapm
      commit: 40ff409eacac686bda70ce7720d8b0e7c7401635
[5/8] ASoC: soc-dapm: remove dev from snd_soc_dapm_context()
      commit: cf0e8c555b34b0ea3d2a41edf6dc214239a71c80
[6/8] ASoC: soc-dapm: add snd_soc_dapm_alloc()
      commit: 13c84b4c6f218c196c9c72286645247996800427
[7/8] ASoC: soc-dapm: move struct snd_soc_dapm_context
      commit: 5b517f1a5cace3cba9a48491706e330848ecef86
[8/8] ASoC: soc-dapm: tidyup function naming
      commit: af6d53db28e6448b1e0ce9aa314bc5da494d35ab

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

