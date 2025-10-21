Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7D732ED42
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761046637; cv=none; b=X9N51nTbVX1DLHvCdtXVyDAoYD+pw3TP8LWr5o3aYxzn8IaU6TFBoTZnjLzl/CqLZY+QjLHvVCN1D922Ygoz25qZ0uYAuV3eNHzpbRl977T5AD139NkIRxKc9RdTJSQHe76g16IZXuo72JnHwo165Zpsgwr0xVsbTHtuWOvPEGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761046637; c=relaxed/simple;
	bh=cO71dd1Z6PGZwv4/dEKkmF05ci8UdEGYUkOkgBJdTO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZZhEKkCnv0jmABVRndK6g3cGbhqlHP7NzR+D9cZ5ERjOtxakdKn5OPirVF3URXOwedOAZ05EtLe/WH+QbpXvvzfYoWE6vVZu0LXvJVCXv40PmByHyzsvymq1CV6HByuxKIR5W/YWcey0s4HobI481Rtpp/H9YgfTuPOPZ7a4/jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGNFPvLn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGNFPvLn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85C9C4CEF1;
	Tue, 21 Oct 2025 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761046636;
	bh=cO71dd1Z6PGZwv4/dEKkmF05ci8UdEGYUkOkgBJdTO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TGNFPvLnkECmcL2Uc8K5Mz2edE2o1aKFIFi/U85gzhxKdvrlnK21sa4eNBFX/dJ2I
	 5gpKjNsRUFmW4ONlEaAVmvi5tU9nh5M2DZK5D3ppK65ZBUAPSdm2AN6UICNoHHNnhU
	 RdG5c7p0BYBWkj7LhnDXoo9Ark4U2vQdjIsiJmbYSF/EaI/TF7V7YTQiSURuR3GJ8m
	 lbcRa0yfYjqXZbKHEzogsQ9DXascZ+6oeqSLkQk5xgrnUV18IfyaC13QkmDrzsLSWB
	 sfPgHY0/Y2A7TScWMllxkvuEfCoCMlBz4ZXvbAxWw39XZUB8IP5iZgFVwSEcTl5Y88
	 P0W7UtsAKpxFA==
From: Mark Brown <broonie@kernel.org>
To: Sharique Mohammad <sharq0406@gmail.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, lgirdwood@gmail.com
In-Reply-To: <20251016151152.1107083-1-sharq0406@gmail.com>
References: <20251016151152.1107083-1-sharq0406@gmail.com>
Subject: Re: [PATCH 2/2] ASOC: max98090/91: fix for filter configuration:
 AHPF removed DMIC2_HPF added
Message-Id: <176104663567.21978.4910240431564015336.b4-ty@kernel.org>
Date: Tue, 21 Oct 2025 12:37:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Thu, 16 Oct 2025 17:11:52 +0200, Sharique Mohammad wrote:
> The filter configuration register(0x26) has AHPF(bit6) for primary record
> path, which is common in max98090 and max98091 and has been defined as
> DAPM suppy widget as "AHPF" in
> "struct snd_soc_dapm_widget max98090_dapm_widget[]".
> It is the DC-Blocking filter for the primary record path.
> But the same functionality for secondary record path in the configuration
> register(0x26) is DMIC2_HPF(bit2). It is not present as a DAPM supply
> widget in the current code. With this patch adding it as a DAPM supply
> widget. In the current code, the mics on secondary record path in
> code are named as "DMIC3" and "DMIC4", so accordingly naming
> DMIC2_HPF(bit2) as "DMIC34_HPF", and declaring it as a DAPM supply
> widget in "struct snd_soc_dapm_widget max98091_dapm_widget[]". Also it
> is specific to max98091, and should be visible or working only when
> max98091 codec chip is used. Therefore, written in
> "max98091_dapm_widget[]". As "AHPF" is not part
> of secondary record path, replacing it with "DMIC34_HPF" in the
> ALSA routes to "DMIC3" and "DMIC4" in "max98091_dapm_routes[]".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASOC: max98090/91: fix for filter configuration: AHPF removed DMIC2_HPF added
      commit: bf6fb4a272739e0d1b2c570276324142517d1905

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

