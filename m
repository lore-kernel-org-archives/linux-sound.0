Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A202580E2
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 22:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761775345; cv=none; b=Hn8xhjDBk8XkNbqDTTk4hyMh1PKY90hci9AwqzYCQDPDS5LeeMZ/0mZT7RyJBhr3Wsf6L3RvTaKCCZ6TJJY0ezlCwxzQiJbuMef0i3oG2igHF7yJgnrUDCtoAz5nLpc6abCe/qFl0gcOTvXJ5QczS7KjOHZ59RSIMXnmizg2/fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761775345; c=relaxed/simple;
	bh=4IfA1eojBA7lr5OboxmLCnWf0vMG2zuCQpuewDuh2Ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ERcoLP442tEBMLgbXaUA5uUhpSdXWJe4Aee/2eo988q3CL9y8OXfCE4eZeOQV07+65vXveNfAia96ZqsHLihXZrzdhm4wrhr6nhO2gmf4Z8I3bQeZC4Grbwk9I1Ojp/Hd2zKJXcm1nKyrDs7qQjRLLjKUt8YGuOBlhub2SnewtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pbzx0ff+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pbzx0ff+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDABBC4CEF7;
	Wed, 29 Oct 2025 22:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761775344;
	bh=4IfA1eojBA7lr5OboxmLCnWf0vMG2zuCQpuewDuh2Ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pbzx0ff+p31UIVZJbFE9O1C2hua8MJ76Ojm0oSqWmznCyhbh3lAbTS+6LwIAk0Eq3
	 eCRcF/YwPYfOGmAJKQDWEK0S82RtGW6hjcr87FgQFS6Jf7xbP2btNV8m+8nfSH1ZLK
	 R2O2i57dV7ABB4VZvJb0gyBUk+x26VOf9JthJZ9qZ5eX54vDTeUg1puUmEWQD6jnWe
	 VLMzNnY4df0KqyNBURw/VRAVddNx8GfDdaqC4n/qGnr1fh4OBpIvBkvxHWhgnTu8Kr
	 mh9luDGHVo+MRZODLhAakdVn/cMh3t4sNI5fuXBhsw0PmJ6a5ku5d0c8LVTb9nvRtU
	 ekQoygskYUx7A==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 RESEND 00/19] Add SDCA UMP/FDL support
Message-Id: <176177534256.1198235.13179064498290932859.b4-ty@kernel.org>
Date: Wed, 29 Oct 2025 22:02:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Mon, 20 Oct 2025 16:54:53 +0100, Charles Keepax wrote:
> Next installment of the SDCA changes, hopefully the next series after
> this should be the full class driver. It is worth noting this series has
> a build dependency on a patch working its way through the PM/ACPI tree:
> 
> commit ac46f5b6c661 ("ACPICA: Add SoundWire File Table (SWFT)
> signature")
> git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/19] ASoC: SDCA: Rename SoundWire struct device variables
        commit: 715159314dfafee66e6deb50b4e3431539a919d8
[02/19] regmap: sdw-mbq: Don't assume the regmap device is the SoundWire slave
        commit: 013a3a66f25af3fb614f45df43983657514944c4
[03/19] ASoC: SDCA: Add manual PM runtime gets to IRQ handlers
        commit: 907364ea3db47530751add6d2d62122ca17329cb
[04/19] ASoC: SDCA: Pass SoundWire slave to HID
        commit: 7159816707dc7040fe3ac4fa3d7ac3d173bd772a
[05/19] ASoC: SDCA: Pass device register map from IRQ alloc to handlers
        commit: 390c05f47d0749b24db65586482308c5fd680fe5
[06/19] ASoC: SDCA: Update externally_requested flag to cover all requests
        commit: 56bbda23d4bece7ce998666118a068e4f71d59fb
[07/19] ASoC: SDCA: Factor out a helper to find SDCA IRQ data
        commit: 8d557cc4867f2008f440c54b4423464301a1ef4b
[08/19] ASoC: SDCA: Rely less on the ASoC component in IRQ handling
        commit: dfe7c3401ed3d3bd8e61be8d6d452896513eb52e
[09/19] ASoC: SDCA: Force some SDCA Controls to be volatile
        commit: c7b6c6b60594fd1efe35c61bc6a2176b25263ccc
[10/19] ASoC: SDCA: Parse XU Entity properties
        commit: 0a5e9769d088bd1d8faf01207210911b9341b62c
[11/19] ASoC: SDCA: Parse Function Reset max delay
        commit: 7b6be935e7eff06025e18cea4c6620194450abe2
[12/19] ASoC: SDCA: Add UMP buffer helper functions
        commit: daab108504be73182c16a72b9cfe47ac3b1928ca
[13/19] ASoC: SDCA: Add SDCA FDL data parsing
        commit: c4d096c3ca425562192a3626c30e82651d0f2c1c
[14/19] ASoC: SDCA: Add FDL library for XU entities
        commit: 71f7990a34cdb11f82d3cbbcddaca77a55635466
[15/19] ASoC: SDCA: Add FDL-specific IRQ processing
        commit: aeaf27ec6571527e750eed84bb3865a0664ae316
[16/19] ASoC: SDCA: Add completion for FDL start and stop
        commit: 0723affa1bee50c3bd7ca00e00dee07fcef224b8
[17/19] ASoC: SDCA: Add UMP timeout handling for FDL
        commit: e92e25f777483b7cc3e170214cc84337d7a415cf
[18/19] ASoC: SDCA: Add early IRQ handling
        commit: 12aa3160c10a3179c73c4f99a2d5aec0fd907d0c
[19/19] ASoC: SDCA: Add HID button IRQ
        commit: ef042df96d0e1089764f39ede61bc8f140a4be00

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

