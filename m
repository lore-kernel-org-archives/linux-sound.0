Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417F52C3258
	for <linux-sound@vger.kernel.org>; Mon,  2 Jun 2025 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748882566; cv=none; b=SnRFnyMwwvrOEaDS39EKQt+5pQ9jNJgg2hhVLQKASATwaivI3qqNsVCsw3uqtHPir1X37hZTRhg86Rk/CAHM3mqC9/ydoXwDknr/QzwDRsV20U1zfvOEQjj8CHGw8yWpRaVLqS5yRYvb9Xs0U1OkCOFm2XOyFk1cYQ20DBCp7Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748882566; c=relaxed/simple;
	bh=elykp+u2fwtPkcXY614S46fcXW4suKkBq/jP/lIQb5U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i0n5ZDLeDh+ZA9XZHcxvn06eAimPLWcXlBJ3QIKwY7KmFAPHxS2jTM3sKuMVbu29unDfEmJgtyYMGzioIKCV7qtrhtiJVJ5CrhSlhVezneKj+NmR+E/nwk8v7gUcfa0e1iCPpllm1i6ghvhCrMl3dCptCOMM4VSlSwWNpMHMW2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWX48jSv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWX48jSv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7176C4CEEB;
	Mon,  2 Jun 2025 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748882565;
	bh=elykp+u2fwtPkcXY614S46fcXW4suKkBq/jP/lIQb5U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uWX48jSvsgTgCpchELxto58d3ZIRrwL84RYSIEBeiNWwEc8prrNcp1vVxhEDvx4fs
	 rePowkiKtqqFUkjks3A8XJT0amb37uaYPzEjRy9Jxvhl4swGbOfaSyLUUIqab/se66
	 cIS88K4vxU9HfZc+8zieuSCNHDzVKFySonRMFkjG8tTf5rTdEI7HrK4J7Hb3xaoVa6
	 hODY3KveqXhrAY7dK5/UPyopHoXOXNqRQ4vIWtH7Q2WHFPajbIVbjTEOxA/qkCBLsS
	 P83MVjzzlCv2I8QJLL+TSz6hBkWp1054ViR/oBOzIVEGNmwZtirXwYBbsM7NU0Zx2p
	 fr8a5KLl3S0JA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250530141025.2942936-1-cezary.rojewski@intel.com>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
Subject: Re: (subset) [PATCH 0/9] ASoC: Intel: avs: Set of functional fixes
Message-Id: <174888256446.96622.6929185418537717818.b4-ty@kernel.org>
Date: Mon, 02 Jun 2025 17:42:44 +0100
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

