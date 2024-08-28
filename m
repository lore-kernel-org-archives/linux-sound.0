Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102D71A3BDB
	for <linux-sound@vger.kernel.org>; Wed, 28 Aug 2024 17:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724866586; cv=none; b=u+XPFNZC2ACqWIY63N5OCpOebkXjitZXvjXD6z80xMJBL/FLUDkB+l6le3gTu7YwAEr5a5VX0YIoOHB3la3gMWFxmPY5C117M1EZYwIYjwIQ8hX8oEHXHN+pZ/0/ZeqVw/DIVKkJj6BinYZpHGJAwRmnwReO+7N7iPQllB41F2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724866586; c=relaxed/simple;
	bh=2SH+UigxpRJnXHMAdFMFeMqIzl7fIcKSZSQ9/XPz8cc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dY5D33i9/NM2T6joXAh/OoiQucDEiCxh33T3FCvewJ1JXo1vVZ2aJ2dl54zYK+7fkz+nbxC1lXdahZFtfXgPsRh0mCsSzfgJgEmoBHDGECfJ2nTDpO4D5B6KueGDzAcB5xG7UGqRCcshu8BxPEG72XNkzkYueEGFWt4Ipq4/fGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gw54++JK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gw54++JK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F09C4CEC0;
	Wed, 28 Aug 2024 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724866585;
	bh=2SH+UigxpRJnXHMAdFMFeMqIzl7fIcKSZSQ9/XPz8cc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Gw54++JKlsXR2q1JWs41zprfJZUNeymdql9IYVr71aFV3Mz+F9GGbpbnM/DSPB3OG
	 EXCRuRy1l9nSt4T6fWHH2YO26hfA5JzNXMfwt+o/ftzwLMYhyaKjK3IPrZHgDxYkTN
	 eHZ+Dz5fd8NHEoTEkQnTi+CXfXVGfEntPk3I/LBQqW2KmsDVnEcA4uppGo1/y70RUU
	 0v8q2qwbt8qonbkyMvba7f2BHhAqnpCDEd0Qr8+2qZN2ojiUkM4e9VXWQ0qVGhis7L
	 xsztqLPQ/NIUO7X7144AGir8q0tikHNvAKMFJNI7qzF1stTldICKdUix0EQmWXSOM0
	 l0SJxoArXKE3g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 00/17] ASoC: Intel: boards: updates for 6.12
Message-Id: <172486658415.355291.9319282413579245821.b4-ty@kernel.org>
Date: Wed, 28 Aug 2024 18:36:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Tue, 27 Aug 2024 20:31:58 +0800, Bard Liao wrote:
> Some simplifications from Brent Lu for Chromebooks, a new SoundWire codec
> support from Bard Liao, new cs42l43 match entries support from
> Charles Keepax, Add quirks from some new Dell laptops from Maciej
> Strozek, some ACPI match entries from Balamurugan C, and few bug
> fixes from Pierre-Louis Bossart.
> 
> v2:
>  - Add "ASoC: SOF: Intel: hda: support BT link mask in mach_params"
>    commit to fix the build issue in v1.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ASoC: Intel: sof_sdw: make sof_sdw_quirk static
        commit: 6785244f3dfd40fb0671c330de4e953cbc2e2846
[02/17] ASoC: Intel: sof_sdw: add rt1320 amp support
        commit: 1ab959bea29c265d7d219346a72ed15b2490d956
[03/17] ASoC: Intel: boards: always check the result of acpi_dev_get_first_match_dev()
        commit: 14e91ddd5c02d8c3e5a682ebfa0546352b459911
[04/17] ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach
        commit: 5458411d75947a4212e50a401ec0a98d4c6c931b
[05/17] ASoC: SOF: Intel: hda: refactoring topology name fixup for SDW mach
        commit: 85b66359c5a76ce613bd75460e4646e8a27b1e2f
[06/17] ASoC: Intel: sof_sdw: move ignore_internal_dmic check earlier
        commit: 775c1a4aa640c701eb67d3954a375000d2be3af5
[07/17] ASoC: Intel: sof_sdw: overwrite mach_params->dmic_num
        commit: 7db9f6361170a8caa32cc31d894fac1ba8dfc4f3
[08/17] ASoC: SOF: Intel: hda: support BT link mask in mach_params
        commit: 65dc80a78c5f42f5648396b218f50374cf1c2770
[09/17] ASoC: Intel: skl_hda_dsp_generic: support BT audio offload
        commit: 0752ba426a8182acbd083ca53fef32ddbf50e6d2
[10/17] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in ARL match table.
        commit: 26254073e74e9ea507fbd1f628adf428e545be6b
[11/17] ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in ARL match table
        commit: e1580f48d4a5b739cfbfbce5de637bc34000dcad
[12/17] ASoC: Intel: skl_hda_dsp_generic: remove hdac-hdmi support
        commit: a2a0312ac9ee3eb477a02f2706673cab6d375b07
[13/17] ASoC: Intel: skl_hda_dsp_generic: use sof_hdmi_private to init HDMI
        commit: 690640ef35a42ed96c89ab71788efef4c47766bf
[14/17] ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops
        commit: c0524067653d07e78bc215220bc111b6e5e4a94d
[15/17] ASoC: Intel: soc-acpi: adl: Add match entries for new cs42l43 laptops
        commit: 9ed85cb8c3af96028b2ba6209e9a8d2707e54f5d
[16/17] ASoC: Intel: soc-acpi: lnl: Add match entries for new cs42l43 laptops
        commit: 1be6b1c689575e80a92d4f3bb85e22b805355059
[17/17] ASoC: Intel: sof_sdw: Add quirks from some new Dell laptops
        commit: 9307694f340e518cac0e007f39dd9ff0736e6144

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

