Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABA01F7558
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729860104; cv=none; b=FklsYk1zxLge1OxZX25wS0JlDcvU6wXy7LWqwJk0qfyWEcUYyXXcn0yqRpgaP+PwjzGd3IcMXMcCC31xpN0bH+hHYPBxDr+EYQ12HffYsRAsodz9A/DFuKifjLRO7ABGdoQvdRiQZBJET0A8tDqAQDpbDK9EMctP0yy9Grtja40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729860104; c=relaxed/simple;
	bh=AqQZLEMJFSrAdX0z32ivvP3i3IXKnECdySEz24gTgpY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nT/YsQ9oawScuo+kxCD6N+u0r7LZ4ghI0cB9Jve+1jqR/jxQXImy4PXVTCz38P6INH5janaxD1EM0mO4B0POTc0Jjy/BCHvlN8VoJwgfWfem7XXRK+D5ksyrEEkwU9x7XNnP6YW28mhkMuOEojXS4zWmeeSbMIvjZYu0Ek+0LcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0TVtONL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0TVtONL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA23C4CEC3;
	Fri, 25 Oct 2024 12:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729860103;
	bh=AqQZLEMJFSrAdX0z32ivvP3i3IXKnECdySEz24gTgpY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m0TVtONLbQ8zNbuxrdKx2aFIFrSNsWEJWAUjtVU51OeymxiHUrLHYnysB1300ZhHG
	 EQTGeg+ypw1KeLLdqqz+2rVFJnWdYIPysOQ8dFSM2qWJo944DdjLpbHfohjAK3n42T
	 7JWtQ79kvsfcHDpMaReGNg7KRM5qFp/L/jBSYGI6AgpGLIf7iaWKNsO0itAUFWJbIV
	 ObZx9Fe0JgyB4xZmwE8KIQe+4F7MY/5mFRl0JgfzBOzaUVS69cTAtx19E7ZTyvoqcv
	 I13t6y3w/BEFCTP2C4jiCGBFsw6rHXKxC0+3ZAPwQsmrwxd+b6/0651sP8/0aJVdLb
	 Or/ErdyGTGl8w==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20241024211615.79518-1-hdegoede@redhat.com>
References: <20241024211615.79518-1-hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: bytcr_rt5640: Add support for non
 ACPI instantiated codec
Message-Id: <172986010071.56653.11680033904061857798.b4-ty@kernel.org>
Date: Fri, 25 Oct 2024 13:41:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Thu, 24 Oct 2024 23:16:14 +0200, Hans de Goede wrote:
> On some x86 Bay Trail tablets which shipped with Android as factory OS,
> the DSDT is so broken that the codec needs to be manually instantatiated
> by the special x86-android-tablets.ko "fixup" driver for cases like this.
> 
> This means that the codec-dev cannot be retrieved through its ACPI fwnode,
> add support to the bytcr_rt5640 machine driver for such manually
> instantiated rt5640 i2c_clients.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: bytcr_rt5640: Add support for non ACPI instantiated codec
      commit: d48696b915527b5bcdd207a299aec03fb037eb17
[2/2] ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet
      commit: 0107f28f135231da22a9ad5756bb16bd5cada4d5

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

