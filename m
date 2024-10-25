Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58C1F7541
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 12:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729860106; cv=none; b=hLO0+HQbIPqop4PFwaXa2MoHEgCPiJSbl7nerPl+5UpVW+au6DrCk6PXYAi2fxR5BszAZwMeLMDjchThlLipFKBNjFuA2FjnnBtHqWKj0XfFmMTMCZYTiR2hb5cFROt2/S81krqBMcS7GJNRffW3YJIvOm7WxvWH5WbvD80qQoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729860106; c=relaxed/simple;
	bh=jkTFXl/u5YI+Kj2Bz9oWOlkzIbSLJNYMHBeDzblLabw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PA9WFCDUC7t7J4V2qxJY3evl1UeE8LxbjnS3e5UHwyqisvD6SPOylbKjkhKlYrPsfz1Gvq6oniQfxprddH7abOd09U5f74Y8oDChecNFNo7mIWaqBHDRxV3UgpiOd7DxW/8CUlJta29H5TVYqFrRsCVeoB7otwy+0a38z4vEg9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y61ETnnB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y61ETnnB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D2AC4CECC;
	Fri, 25 Oct 2024 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729860106;
	bh=jkTFXl/u5YI+Kj2Bz9oWOlkzIbSLJNYMHBeDzblLabw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y61ETnnBZ1716Wb98T6GdzHODHsiOxCdFDGlWX7bZkFk5KQgCM6psazm7GZ1twgb+
	 U/84hUjKX6VPK8ittfJBfxASciQ88vauiVhuGdm9oLjZcMsi9cxqXZWykeWFvVQa9S
	 a3Do9YsKeGZDYVSOYeJJbFWaVlYBoB9dTOIB5cgwcjK0BofOVfDtBH1pDc6t+op+FR
	 Z0K+zcXd1HJV9659K/IsTE36TCJ9J8ZXvrIQl18A/t1+OROuGaC7MTHvveAjnXkLi1
	 MPApaISgVOJqq2J1w0n7PfrQocrh4G7cwnvGfKYRwT4d8tIn25buLjbVwfoJxIcfXu
	 Zxe/SKLX4nONw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20241024215612.92147-1-hdegoede@redhat.com>
References: <20241024215612.92147-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: codecs: rt5640: Always disable IRQs from
 rt5640_cancel_work()
Message-Id: <172986010364.56653.8753119584825113504.b4-ty@kernel.org>
Date: Fri, 25 Oct 2024 13:41:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Thu, 24 Oct 2024 23:56:12 +0200, Hans de Goede wrote:
> Disable IRQs from rt5640_cancel_work(), this fixes a crash caused by
> the IRQ never getting freed when the driver is unbound from the i2c_client
> with jack-detection active:
> 
> [  193.138780] rt5640 i2c-rt5640: ASoC: unknown pin LDO2
> [  193.138830] rt5640 i2c-rt5640: ASoC: unknown pin MICBIAS1
> [  193.671218] BUG: kernel NULL pointer dereference, address: 0000000000000078
> [  193.671239] #PF: supervisor read access in kernel mode
> [  193.671248] #PF: error_code(0x0000) - not-present page
> ...
> [  193.671531]  ? asm_exc_page_fault+0x22/0x30
> [  193.671551]  ? rt5640_jack_inserted+0x10/0x80 [snd_soc_rt5640]
> [  193.671574]  rt5640_detect_headset+0x93/0x130 [snd_soc_rt5640]
> [  193.671596]  rt5640_jack_work+0x93/0x355 [snd_soc_rt5640]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: rt5640: Always disable IRQs from rt5640_cancel_work()
      commit: 032532f91a1d06d0750f16c49a9698ef5374a68f

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

