Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE832D7DDF;
	Fri, 19 Dec 2025 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766153382; cv=none; b=MgR6vxLIbelv1rp+ogb1GH5OXmZsD2Wv5BCUQQmLSPvCJhw6HHrrqLL5VRJ1gOAlX7JD35l/72kqlz7MM7wH0ES4uQIrehsJ2/7ErawrhUTtVyZKhINwCz3EptVVnRYaV6ewC5IJZkJUc+LlBnOmhxYrLRjhLFviDONHFURjbyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766153382; c=relaxed/simple;
	bh=bS6o5KQV5NmeS8Knm5nXjCP4j0b8R+t8+omKFOhR33E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lgJB4q4+92nb6Ek7md6k/8Ul8Th5jNomZOaUWlzkKsvu/27pncCG0ylwLiaK+QCbAkUqkG1ciEsDgh99lkOA2wo8qCThwXo7XDFARb4BZ1UFfSsc7RSr9jFMX8hNBcJqU9VkRGJwqnsVgAB60IAg0ps+BolIOJFx8P7lwzgAhAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkXARABf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkXARABf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194D3C113D0;
	Fri, 19 Dec 2025 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766153382;
	bh=bS6o5KQV5NmeS8Knm5nXjCP4j0b8R+t8+omKFOhR33E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GkXARABfJJWxWrh4mU1S8gH1+qNHl+t6bkgolBR/YljDVeQHH2oV/jgkLK+chRVDP
	 tPNMRrUaGfyLqkDBB8lC2XS03cP+OtkaKkM8V3SdPORlWz5B7z1q/oVYhkipRui6RO
	 u1Tcv639C4UyaBXnVD4pHqin6p3KBvUolcIpz2bsir4UDCkyM7vpltO/TwiJZBaOF9
	 GfDBTq5PFU69ZRwfXPMVCQeYqWJLaTgyTRLwfgHgDdz1h64aN+RTPW9cr45S+iCVdg
	 QR9cpM550qGR4SqGHkG3fdW7arUb3OoG64N9VHpFvvDfmU8FrmlJ9lC7QPYobgsAkL
	 uFM9Pui0pEigQ==
From: Mark Brown <broonie@kernel.org>
To: yung-chuan.liao@linux.intel.com, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251217163227.1186373-1-rf@opensource.cirrus.com>
References: <20251217163227.1186373-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: mtl-match: Add 6-amp matches for
 CS35L56 and CS35L63
Message-Id: <176615338083.412520.16318107650352498935.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:09:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 17 Dec 2025 16:32:25 +0000, Richard Fitzgerald wrote:
> These two commits add support for 6 amps with feedback, primarily for
> the CDB35L56-EIGHT-C and CDB35L63-CB8 and similar hardware.
> 
> Stefan Binding (2):
>   ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L56 with feedback
>   ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L63 with feedback
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L56 with feedback
      commit: e43aefb771e82f2e13a435c37ef55813f4140f93
[2/2] ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L63 with feedback
      commit: 26f637fa08879152b9c82417d0d4096019b386ff

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

