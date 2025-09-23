Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E0D31691B
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758615646; cv=none; b=Nbj67bKO0vfm4y0rEaqbjhdH7aQCzt4OFeYdTRF3GlUHW2KAjHI/n78FV+vovGWfiy2HjVLQJkZcZ5uaeMATymeXabepL3Dudi7EhTXwhvtYnt0FyW2kzEb3FMlam21i+ALxcOCwI4GYK4JulWtX34w7WwZg6g4ZVT5AK7AHBio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758615646; c=relaxed/simple;
	bh=uhVcKOVGexkqhwPIFLonAcK9G4SknktyxCVmDC5JL50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fKz4i6OatZ0X44yIZILRVquvUFcVn3UZO9BynwfJGjw5jjUp1FzXQf6PgRds7eG+TXspmuB81GrA3eUYuEjMn0vOqt23nRw+4TDV+7sT+HVNuhCyb7M79aYWk27q1mV/FObVqmBgytsIvp+ycA+3noX5idIivJyaVkqhdR2x/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tf7mnyH8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tf7mnyH8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C48DC4CEF5;
	Tue, 23 Sep 2025 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758615645;
	bh=uhVcKOVGexkqhwPIFLonAcK9G4SknktyxCVmDC5JL50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tf7mnyH8XoV8VnR6a1L+Mogf9pms+7AAPLczAbK2jGBt+jvbU0wRhxr0YHo161vDr
	 YSas3eFm3kaoXrTqi4W3is5sYkRlgWm0QE/B0QUocZdNxzeRNciEwUtBLBqi902cqT
	 6ZJQB3WuUG+m9l7oVc6jFnLilmcF5iptIUH5YJZG0gkwRWGkLGZwMcJgwbL4wMIrNi
	 Vk4yBFZdWG55WfjPwZeF99znnyapJ36IWWbo5dEzpE/43uFBy6iQxH/L3VrdoYyK9m
	 qRCQbQHqt2PvsYRigLECSB+heVEerVwwDgZDec8FYoLxstrqBn7nb9SO1YFQuMuDw3
	 z9Cgi/Df3Uclw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com, 
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, navada@ti.com, 
 shenghao-ding@ti.com, v-hampiholi@ti.com, baojun.xu@ti.com
In-Reply-To: <20250912083624.804-1-niranjan.hy@ti.com>
References: <20250912083624.804-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v5 1/5] ASoC: ops: improve snd_soc_get_volsw
Message-Id: <175861564199.978426.13414867456859175456.b4-ty@kernel.org>
Date: Tue, 23 Sep 2025 10:20:41 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Fri, 12 Sep 2025 14:06:20 +0530, Niranjan H Y wrote:
> * add error handling in case register read fails
> * clamp the values if the register value read is
>   out of range
> 
> --
> v5:
>  - remove clamp parameter
>  - move the boundary check after sign-bit extension
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: ops: improve snd_soc_get_volsw
      commit: a0ce874cfaaab9792d657440b9d050e2112f6e4d
[2/5] ASoc: tas2783A: Add soundwire based codec driver
      commit: 4cc9bd8d7b32d59b86cb489a96aa8a7b9dd6a21b
[3/5] ASoc: tas2783A: machine driver amp utility for TI devices
      commit: 96384a34dd15b0e7357a34af5c848d1115a35e62
[4/5] ASoc: tas2783A: add machine driver changes
      commit: b41949a2109e49cb96a1dc292efa249933e5232e
[5/5] tas2783A: Add acpi match changes for Intel MTL
      commit: 63b4c34635cf32af023796b64c855dd1ed0f0a4f

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

