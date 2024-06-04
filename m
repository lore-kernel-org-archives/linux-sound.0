Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D13A13CABB
	for <linux-sound@vger.kernel.org>; Tue,  4 Jun 2024 21:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717537984; cv=none; b=NzOHxqLV9iQfxLsQserx5NguGWKTB5FmE2fY0xD7zLNekxSl5+iscxH/eJiCZ0uQH6JY2MPgPB+HQmnk101fB0rNcpuQDpIa08vfWDA5yjnkqfTDzeeRW+oqmhMlRHSEWY7ScWdW2hWSGqlFZ66YtvgYatWkyR2CTsS5MS/MFLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717537984; c=relaxed/simple;
	bh=bpspmCcC0dliw2h8w3NumD//Qj0YSSS6bsH/z/o5rEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qsG/zscqEohLcHACS8snjyaqjxx33LbaWjyXR00CX2tBZHlIWw2uU8W5ZyfDW+NkTauvjwL3emPqzic8guUDBXc6Pbf+gmLBtikTaR6egIuTGGKnR3keiMJUrbLB21SXyYDCZIUA005g4nbKWjUmzYVtm1RbS0/afOq6k0VbNe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cr5atBTN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cr5atBTN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1100C2BBFC;
	Tue,  4 Jun 2024 21:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717537984;
	bh=bpspmCcC0dliw2h8w3NumD//Qj0YSSS6bsH/z/o5rEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cr5atBTNws2/XqMIInBiJoXbyPDF1i4Ote0xyLuTITtwrYm2Z00kzgWY9Y3EKXC8w
	 SlCkVA9ba8Q9wdsYa/shbC8FsswogifUBBWcvXMl60YJf5TVu3qmgSsCcfG/BAZcGd
	 x/X+/ZARpKzvWH6nvysqUnh9rHRdqSayvevUxn7iUvLm4WCl+PW8DO8HmY11PpbU/J
	 BqlQUBNgsSfj01ZSnzhMS8e/BHHLpXoOuC2sr1LSswiAIq/QQrT9+ElV+TOsJaH0o0
	 qqTBZeIvPM8uUzgGvfKLyqHFCYOOhy8VOnNId38kAOnAKlY2Ua7oIOB9NmW0XATcKK
	 NDi2TRuaNxB7w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20240603073224.14726-1-peter.ujfalusi@linux.intel.com>
References: <20240603073224.14726-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: hda-dai: skip tlv configuration
 for DSPless mode
Message-Id: <171753798236.310373.6377521365725248262.b4-ty@kernel.org>
Date: Tue, 04 Jun 2024 22:53:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 03 Jun 2024 10:32:22 +0300, Peter Ujfalusi wrote:
> Thesof_ipc4_dma_config_tlv() call makes no sense in case of DSPless mode since
> it is a configuration for the firmware.
> 
> Regards,
> Peter
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: hda-dai: skip tlv for dspless mode
      commit: e0e8e4bce61cac674fdabd85d070e7bab1634a8b
[2/2] ASoC: SOF: Intel: hda-dai: remove skip_tlv label
      commit: 3b06e137089fc0beb5ffa6a869de9a93df984072

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

