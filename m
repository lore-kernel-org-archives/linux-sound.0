Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307131DF72E
	for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730135905; cv=none; b=QsIsPmrmtW1QtbMCthzMN/pmu4Ge9MS9iII8hA3/u/AH8RooYM/VU9QBbkXBLXj5ACSeZtqvuMS6tOAU6UK7zWlSa6jk7NKeV7D6F/9BPAEQ1I2b3rPUT1URgVqKAjgu5gjeiKrU40CB1n/ZQ5yaEKWwMdeCH4DvwOoNvS5qrds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730135905; c=relaxed/simple;
	bh=4L7PNu5TgPM1jtWncJkinP/0fdYWoLDw25I9wvjjtwg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dgTEze+sJTruypc7vP0kpfi7I909H+LU+6FAhUKMvtFNYRysCoF3eEEJ9pH6RcCVmkLm9rjH5c7+k9R+T7u5m+CxUIOuDuTJZhqSbVIbb9NTRhhpJDmnEYF2WHALqMdodUlaRIyudi6+61qfeANWUugXynhGqZ/b5xIpeXPwEzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0sJUFIv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0sJUFIv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C122AC4CEC3;
	Mon, 28 Oct 2024 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730135904;
	bh=4L7PNu5TgPM1jtWncJkinP/0fdYWoLDw25I9wvjjtwg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o0sJUFIvrJgQCSRtAHlA3Kpms4U4uRC1Rgkf6zkkmRay8rfkhHfDDzGpqKHOZP3vz
	 eCe6OeK9wNwX8OCa+WtlzweO4Ucjtx7WlGtT+HI/pUnhuhSuMI1FMmEf66KmqEm+T+
	 Cyp4kBMzDwQccJF/xy3tgajFL9CC/KPqjhk/pXsnrCEUpW//J2ihxzMJO/glL5UePf
	 4yZXqVxWqaLPGJEHPpL0hgE+08QvmOwmNGXdlplhc5SMsuFByPQh3UT0BIlFpEb3y5
	 cN0hcQMGZVsNeUR1l6edJjmVBxBY0HHbkwBtQcs+tfexfPWslME9/NHjybXbJFU2gK
	 OK+YXZHZGkP5g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241028072631.15536-1-yung-chuan.liao@linux.intel.com>
References: <20241028072631.15536-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: add rt722 and rt1320 support
Message-Id: <173013590235.106425.18425083377637530452.b4-ty@kernel.org>
Date: Mon, 28 Oct 2024 17:18:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Mon, 28 Oct 2024 15:26:28 +0800, Bard Liao wrote:
> This series add rt722 and rt1320 support for a new Dell SKU.
> 
> Mac Chiang (3):
>   ASoC: sdw_utils: Add quirk to exclude amplifier function
>   ASoC: intel: sof_sdw: add quirk for Dell SKU
>   ASoC: Intel: soc-acpi-intel-arl-match: Add rt722 and rt1320 support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: sdw_utils: Add quirk to exclude amplifier function
      commit: 358ee2c1493e5d2c59820ffd8087eb0e367be4c6
[2/3] ASoC: intel: sof_sdw: add quirk for Dell SKU
      commit: 60f1c71ec874a581a194ff9a86174c4744b6e555
[3/3] ASoC: Intel: soc-acpi-intel-arl-match: Add rt722 and rt1320 support
      commit: f193fb888d1da45365daa7d0ff7a964c8305d407

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

