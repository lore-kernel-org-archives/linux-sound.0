Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900AD39CCED
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150988; cv=none; b=LLvzWLAF9JiuU49S8D5+8+7ZBfHut8fYObRRmMx+wCjo0JQUN65a+oStWHyh3UnAPPwhZFhx2GsH4AnkAvJfaffIkvHPMXI8FhdjrDoX7x5Qe9/k4bT45Iy+5CdkhmZaq2i2f96VoBT9NVQKva06wUOn5rhEyjAmRco7B2LB7zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150988; c=relaxed/simple;
	bh=qpPxJG6e3+eIQHIpNT6yKeyEoxSzhAAXAoOVx0x+p8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a8+nATrbCga/nFtGY1IP8Q7FcCZjxIunreE97la1mDmZkrZUtaJ5UKaB9ZGwnGXUsGWM48hmqI8uBMOKBrqjDYBB8MZVd2U4Z49zaH+xYqKqDGsGgDIbagjaIlqD3oq4ka44NBvBnnQuTQi5MkWSHcTPWBMOrSx2Rlp5D8sZruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwbllpID; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwbllpID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD001F000FF;
	Wed, 23 Sep 2026 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790150987;
	bh=HpZPtml+xMQT95FcRZ2jMHhg5Tfyxjxq0jUtxQU5bcY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KwbllpIDAXW+cYrgUHZD6QuUuTP0nRHNugTyiY8DpCfFcdLzhhi2EoPEu3uP5eap8
	 FAdUu3YS+3FJW7NR9zrLuZYPzaZv0cBO/t19Kedtu4JZ0NNn7C75BpvrTLC8nRrUJ3
	 029jfc6JUR5QDnNmBDYH/6yid8oBH4hUOp8ICgHo9mywYREvwSbePgZ+YTKNyoQ4Zg
	 Y4aHc0F62AKxZSTEdbqQ2xhONPmn1b29TF/sneAIAvWYZeeOpkB3Iyb3qR+glPH0R8
	 D+CljsDDPyjEbakUDP659WOdu/Cg2Z8kiuVBpKGv/gva4FP9gM0OuCswGld2XaE7RM
	 8YCm5N8km/oHw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
References: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/7] ALSA/ASoC: Intel: add I2S function topology
 support
Message-Id: <179008316318.322763.12415774803120622524.b4-ty@b4>
Date: Tue, 22 Sep 2026 15:19:23 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qpPxJG6e3+eIQHIpNT6yKeyEoxSzhAAXAoOVx0x+p8A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqs4lGOoS5YDly0S4FYZRz7zK5VTAFBk/ghmcY4
 P7BHc19/zyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarOJRgAKCRAk1otyXVSH
 0CnDB/9k4mVzyDCMXXzeF7vCyDL3iEm57rgdKXomrn4ZRzsn9JDv7dG+VMYugqWczbHGQz0lXvy
 R03FwT7FYybsazhYNQsXM7f4aAIXPf587yerktcKN3AvePp91flErss2KXPrX6MWEdkStK8jJ/1
 JEGyVtmXxGAGNGOD3KoCzlczzrIIJ3g5oNOHJ8jh/Dtd6GBw02976+ltFRYAvzzUvUPbwMlTY6u
 bHDSxSqIzlqdLn7JDn+3iWY21r+xao0UEqzYR75hSNgsxoyjk2xn69yECQHEatiCwcyMK1PX8vM
 V0PXe0cdz3whyV1gLbDGNZN+bNr1UV/UuQPMNQaKXNQ+qCSY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 22 Sep 2026 17:23:09 +0800, Bard Liao wrote:
> ALSA/ASoC: Intel: add I2S function topology support
> 
> Currently, function topology is only used by the SoundWire machines.
> Extend the support to the I2S machines.
> 
> The only ALSA change is to lower the log level. Let's go through the
> ASoC tree.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/7] ASoC: SOF: get nhlt from all topologies
      https://git.kernel.org/broonie/sound/c/6d3400863bae
[2/7] ALSA: intel-nhlt: lower intel_nhlt_ssp_device_type log level
      https://git.kernel.org/broonie/sound/c/3313c59b1888
[3/7] ASoC: Intel: sof-function-topology-lib: create common helpers
      https://git.kernel.org/broonie/sound/c/5a0601364c32
[4/7] ASoC: Intel: sof-function-topology-lib: skip non-exist file in best_effort mode
      https://git.kernel.org/broonie/sound/c/aa436d8744af
[5/7] ASoC: Intel: sof-function-topology-lib: add I2S support for sof_sdw_get_tplg_files
      https://git.kernel.org/broonie/sound/c/6736426f31e8
[6/7] ASoC: Intel: sof-function-topology-lib: add get_function_topology for I2S machines
      https://git.kernel.org/broonie/sound/c/21465d348777
[7/7] ASoC: soc-acpi-intel-ptl-match: I2S machines: use function topology
      https://git.kernel.org/broonie/sound/c/7f1040813b63

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

