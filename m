Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C8572605
	for <linux-sound@vger.kernel.org>; Tue,  3 Jun 2025 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748966662; cv=none; b=UtZ2h45aqmicRbUCYYVhtOAGiqQvJGMsElc3eTfZznydvVNzE6HqLD78C6X93trLCjyOEtPOnmYinwjOFu8+e4BLl3Aoa3xmrJSuoJqL3MH2+WP/33WmrSyTh8sj/KfIceuIy8VuzvNl+2Gnf0csVNLFyEus308ir6LszBX/D5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748966662; c=relaxed/simple;
	bh=O6tGFLAPh32MDHFLYF1415IcZZBh2OL86oaVKyHMT3c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pamg4veIrXR1pxf8tq8KuFxoQnIpgN/HW+N6EdvyZixYv7aouRz3WMtBClqtG+AAo1JIrZJ17DLeJarFLa2k/gCKzBhcprD4rZAspQC43WKLK89wRNRuDHCeeEdp6MTV2vRyXcc6FpqWoRZorZLwLKigeL0avdPPlHrCHFI1wAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvOwdsZI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvOwdsZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63669C4CEED;
	Tue,  3 Jun 2025 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748966661;
	bh=O6tGFLAPh32MDHFLYF1415IcZZBh2OL86oaVKyHMT3c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dvOwdsZIy8U6VXtrX3i1eSoeru/auXoOIZIdpJHYxcHG+uTAzNTZYZ4y1VmQESXsC
	 cFrArhE4OdqjRMyKrORjj74KmFHIffbGV52q168seOOvKns4fjXljOMj1MQGjcOn26
	 NkcpKBXZ4d8lTLptcGIoYY7Z2fE5c2Ekh0ePZY5HFoxpccWQ4wpoOMMBjDxtZG5QuS
	 u9a/mSzCv7589ImfzHQ2ZPGG8OHSLOtKiCiDvP7QQaq/IK8s/mwQnm+27vVhTFlOTD
	 iTJtjF8UXgtcJQabRuHs9pS97QohNSOY2nNRhh7THqCu4L+zJ1qC5kQ5OU1CpJrRrC
	 mr0UmwW1Z/qSg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250530141025.2942936-1-cezary.rojewski@intel.com>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/9] ASoC: Intel: avs: Set of functional fixes
Message-Id: <174896666012.64254.14190132665871862218.b4-ty@kernel.org>
Date: Tue, 03 Jun 2025 17:04:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 30 May 2025 16:10:16 +0200, Cezary Rojewski wrote:
> Medium range of fixes all avs-driver related. The most important fixes
> lead the way:
> 
> 1. For ASoC-hda codec driver, existing RPM manipulation in
> hda_codec_probe_complete()'s error path is superfluous and leads to RPM
> usage count underflow if the probe exists early e.g.: build-controls
> operation fails.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: codecs: hda: Fix RPM usage count underflow
      commit: ff0045de4ee0288dec683690f66f2f369b7d3466
[2/9] ASoC: Intel: avs: Fix deadlock when the failing IPC is SET_D0IX
      commit: 9ad1f3cd0d60444c69948854c7e50d2a61b63755
[3/9] ASoC: Intel: avs: Fix PPLCxFMT calculation
      commit: 347c8d6db7c9d65d93ef226849b273823f54eaea
[4/9] ASoC: Intel: avs: Fix possible null-ptr-deref when initing hw
      commit: 2f78724d4f0c665c83e202e3989d5333a2cb1036
[5/9] ASoC: Intel: avs: Fix paths in MODULE_FIRMWARE hints
      commit: 9e3285be55e6c0829e451b4a341e3059da47ec9d
[6/9] ASoC: Intel: avs: Verify kcalloc() status when setting constraints
      commit: 5f342aeee2724d31046172eb5caab8e0e8afd57d
[7/9] ASoC: Intel: avs: Verify content returned by parse_int_array()
      commit: 93e246b6769bdacb09cfff4ea0f00fe5ab4f0d7a
[8/9] ASoC: Intel: avs: Simplify verification of parse_int_array() result
      commit: 065a651e2fb35209cbfe6fc5f1ababf92b66d4a4
[9/9] ASoC: Intel: avs: Include missing string.h
      commit: 38b1befc7a35a475d90ec32bfbe319f4412880a1

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

