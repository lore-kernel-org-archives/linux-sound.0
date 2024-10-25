Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA361607B2
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 15:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871330; cv=none; b=MN3qNDXi8fUGGQOan/NoMEJYp83qYBef6YGm87T5ORSacylKF8mBiI48BuLYkZl3UyRfHX+Fiti0RzaWV2oaz8zQBZqzYr5m2C16idRlL0puWIHj3julS0w+pxeTJ7N47p8b5ajz4jIwIfed8Qf4UZrXZ5Z138xDCcb5nJNWlmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871330; c=relaxed/simple;
	bh=ELrgxFS/zVRZdLopvFU7WgJc3vB5kgIXPgO/HbjlSeQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eNeANRp9De2NOF9SNCfVgeTyFNt11tWq8QKk5YPj6zihJg7othyFOzGQtwFNqMVKAx2rJb0dputQ83M9+wb5v4A6chq+B8AqFDZn0qiSHH2aFTfn/Kg24KkDQd0mn77wiL6gpFLoPOKaADQercbJ/2VPfdQofeQlJS/nce+9UZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XW4/i49r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XW4/i49r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BFCC4CEC3;
	Fri, 25 Oct 2024 15:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729871329;
	bh=ELrgxFS/zVRZdLopvFU7WgJc3vB5kgIXPgO/HbjlSeQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XW4/i49rfUBGSFZAUQl9zBH87Q6pOsJ6U11JE8whRxB1R2Q/Qg7XhZQiBOqEHkqRH
	 9mkbL9wPJ2ayy1SZvcZJpu91aUIia1lwsfWG7TJflIeO9IaK7a5MYPoutkyy8uAXj2
	 gxPQOf1XDXLYI61n6UVQQK0ANztNc8fn2zQ6TV+wSi0GWt37U/3TZmTFa5l1q+/vQV
	 CJm6da5EYkgJEV80GplFwMBi7kDCQ+4s5pSpHtkN0jKnN03ypMsywsR2dOUzzf6Ruk
	 p1oaw50Jo4+QKySDmGyGyqS6oXaxeF9OESq4WLYI8v5w7x7R2JT5lmAQLhhL0f3fqC
	 e0rhPjI8NtrjA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20241025090221.52198-1-hdegoede@redhat.com>
References: <20241025090221.52198-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: sst: Support LPE0F28 ACPI HID
Message-Id: <172987132005.67736.14036622073163000296.b4-ty@kernel.org>
Date: Fri, 25 Oct 2024 16:48:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Fri, 25 Oct 2024 11:02:21 +0200, Hans de Goede wrote:
> Some old Bay Trail tablets which shipped with Android as factory OS
> have the SST/LPE audio engine described by an ACPI device with a
> HID (Hardware-ID) of LPE0F28 instead of 80860F28.
> 
> Add support for this. Note this uses a new sst_res_info for just
> the LPE0F28 case because it has a different layout for the IO-mem ACPI
> resources then the 80860F28.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sst: Support LPE0F28 ACPI HID
      commit: 6668610b4d8ce9a3ee3ed61a9471f62fb5f05bf9

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

