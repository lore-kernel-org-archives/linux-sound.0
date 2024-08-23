Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CEB195
	for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 22:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724453829; cv=none; b=JzgvTcj/76rDJNbdiRUqoScTRmXCzVhpCn0JlfZq4AhGewISzu1GKwzBTdZsAE/ALrdSp9hyluwdOyl0j4K1OA5L3obxjxDZ5UuJ+AbPe+Vf9VdcMcnshSYoQK/fcuslWUS9za02S68tSqufB+xCekO9u0i/FdloUpIglLhKSEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724453829; c=relaxed/simple;
	bh=W/CDtPs4vrEPcGRTjULwaMcukxhP03HdOs/6BCsQpoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ri1wVGUXYaXEHctH5AoGjh9o7XGUK75coye2cdxZCNlHAvRojk/o6+rS0Zq6Qg3KPh8wmDG5JsVku2TOgLYiyrje4e78exgDQsA5cmk8OvN9gJDCfvuPMmw797mBqUgNCI96lhfDFEp4E1Euy2EMnZq8YR2q3Et3k64ID7ukC6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXvNhq2a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXvNhq2a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60154C4AF0C;
	Fri, 23 Aug 2024 22:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724453829;
	bh=W/CDtPs4vrEPcGRTjULwaMcukxhP03HdOs/6BCsQpoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KXvNhq2aL2PwMIpKJAGFk+z6TOJGfl9HQt/+S/agmM6EWrG5FhLzfmCl3CFZi7G7V
	 iZnTQOCNUYsSD2TYcekZyU23Goy7UcdN+quYqdJHjVdVmZb7PPDit0S0CIqXC8nVpo
	 KnLCVq7R/ECVYAdDsH7wW3akvOsTgaMlmd3rrn45R9XZ4dqopm6Q9Qe7tVhGQt2oZx
	 Q21eBaUzbVPmc1A1fi2HDQQhEGGvsr5FByB3KQQE2iLgvtpoxP+GpxuMSAWG4Wuj7R
	 NYEQJHRKjZn5kCIXYVAP28ZNt1DiAX2IilZkDPlWJeNhE/DwY685jX4DC+S20olUe8
	 trzXu+35VmY/A==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240823074305.16873-1-hdegoede@redhat.com>
References: <20240823074305.16873-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F
 DMI match less strict
Message-Id: <172445382681.842154.8004186993571993560.b4-ty@kernel.org>
Date: Fri, 23 Aug 2024 23:57:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 23 Aug 2024 09:43:05 +0200, Hans de Goede wrote:
> There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
> turns out that the 2G version has a DMI product name of
> "CHERRYVIEW D1 PLATFORM" where as the 4G version has
> "CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
> unique enough that the product-name check is not necessary.
> 
> Drop the product-name check so that the existing DMI match for the 4G
> RAM version also matches the 2G RAM version.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F DMI match less strict
      commit: 839a4ec06f75cec8fec2cc5fc14e921d0c3f7369

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

