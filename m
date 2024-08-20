Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEED19007D
	for <linux-sound@vger.kernel.org>; Tue, 20 Aug 2024 12:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157857; cv=none; b=O66UV5F2YDX0XYaOPlbWolx1tZrpkffu4YLzW/BMf4AkiIgm8MJdzEeGazTnyfP9N/Qoc2ZBoowf9yXEWpW2gvLkVnWb9Ix7YkcVVamahbqbUH3dYtyv6EPJWZXfi5mtAJI/mc9b3405qgwenLnEERG/oojhenVkPXRk+K2OdbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157857; c=relaxed/simple;
	bh=X5AoTVD2yE9lBdfJaMp7zgH0CVmec+oU9/W/US1mxYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D3HmGFrxdubM9O1XfPdkuzOl3NwXggBSdC18NknOGhmdwZBylWZdvfCO1lTkXVarqDwGTAeB9ukvNTF+jBKJOXN5oHEmqifR5rSkMR2+dhVjttIl1KsEuZC0u+3QEOIPH2sxnusIstNw0jsHCJ/0rlzn/W0jYbYIbnOSMgeAznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGnUwoun; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGnUwoun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5F0C4AF0B;
	Tue, 20 Aug 2024 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724157856;
	bh=X5AoTVD2yE9lBdfJaMp7zgH0CVmec+oU9/W/US1mxYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LGnUwounOuvqdN05+yU1aQcTJbE0hT49SS9F7DMKvQpPp5hpPp2FBRhfh/kLt6LMP
	 VsMAb7iBmXl862jOIQgZvVrP060bqNysRnwUR70OESRk7UQsgVPces+QVOBGRMYKWT
	 UUnbGpDPWbFiplhLgYCwQf3ka99O0zWo37CNLZVIeuheiMHwjTS/7zujlCcoFQmpTX
	 v1galI7YaaOYMrFjBOlYnZvCXh3bbRq45Vc+gU7AY9jf8WnRJ/ZN7ELdKjPAgskkvx
	 r5PbF4YIzAoDwfVCgCCwIhirTTs7x7ybgmqi+wvl9MZ3XMesPSz81zEUVCgF5k75kd
	 jsPbpzMdiN34w==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, 
 andriy.shevchenko@linux.intel.com, cujomalainey@chromium.org, 
 lmajczak@google.com
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/14] ASoC: Intel: Remove skylake driver
Message-Id: <172415785444.39606.12714679433175466185.b4-ty@kernel.org>
Date: Tue, 20 Aug 2024 13:44:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Wed, 14 Aug 2024 10:39:15 +0200, Cezary Rojewski wrote:
> A spiritual successor to haswell/baytrail removal series [1].
> 
> The avs-driver found in sound/soc/intel/avs is a direct replacement to
> the existing skylake-driver. It covers all features supported by it and
> more and aligns with the recommended flows and requirements based on
> Windows driver equivalent.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ALSA: hda: Move SST device entries to AVS
        commit: ec7bccd770b628a465458194aeac4408cdcc5ccd
[02/14] ASoC: Intel: Drop skl_machine_pdata usage
        commit: cd5c4dd97f35cd7cf772fc8c12738bd971cbb58e
[03/14] ASoC: Intel: Remove bxt_rt298 board driver
        commit: 4d61ed7609d8b8fef71f78db6a8ac3221a46ea17
[04/14] ASoC: Intel: Remove bxt_da7219_max98357a board driver
        commit: fa07502e01569b39265008bac783a1202a7560e5
[05/14] ASoC: Intel: Remove kbl_rt5663_rt5514_max98927 board driver
        commit: a08b5fde945ef8b427d2d29515a806fe571d7639
[06/14] ASoC: Intel: Remove kbl_rt5663_max98927 board driver
        commit: 1af24289751253e58850ba572c584f7e6b1caa87
[07/14] ASoC: Intel: Remove kbl_rt5660 board driver
        commit: 1a40ef882fee37006243ebf0b4848c7811672fe2
[08/14] ASoC: Intel: Remove kbl_da7219_max98927 board driver
        commit: 1daa8dce04619f39d4d8ee43ae2a0cec9ab31897
[09/14] ASoC: Intel: Remove kbl_da7219_max98357a board driver
        commit: 15d6966580f3e40fe2f4ecfcde2edd69cc5508e9
[10/14] ASoC: Intel: Remove skl_rt286 board driver
        commit: 51d8e9b20db840e78e0d1ff585cf4c8eb4e091b0
[11/14] ASoC: Intel: Remove skl_nau88l25_ssm4567 board driver
        commit: 4dbf2f9a725d1370d67f9a3bce2f33e913b57e52
[12/14] ASoC: Intel: Remove skl_nau88l25_max98357a board driver
        commit: 6de8dddc56b0577df996212b634f82f6f1fb013c
[13/14] ASoC: Intel: Remove skylake driver
        commit: 46e211411113932be1fd31580a03502466648f91
[14/14] ASoC: Intel: avs: Enable by default for all SST configurations
        commit: 526139aff1d14c5a2cc0a769c063f439444c61c2

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

