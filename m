Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7CD21770A
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 18:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764352888; cv=none; b=MRQhIxi4IZ2b9kUj0hpzcSSRVIq6gVb70IhWEDJT7RCkOS4ky9W/ZFE8+irb3Gb+v4gUuvMlr7sqznC5BnZU6CpcqBfTQ4BcM8xaH7B5uXqhGy/6g+/S6v59upQTDhF2XoJMTbMjTp1hPc0qepe9c6a2aHpypCsbRmDSALU/DZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764352888; c=relaxed/simple;
	bh=I/It0zyJbd+xON0ei+Hkx5qK4KQYTOnxOwcEXj/qfY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sOoOCh5qwG4gHe+u1s8TiIucPN7HsBcy7n0Fdij9D35pGikxVp2I4j5UgB4ox0brPRBWFQrX6wDxYRD8PqXL3RjECkQXUQtET7BVNftaA2JOP1ytUdkbP0u4WEDN6Ouo9tBpbDqkmDhZQ+ztz5R5iCimKJOzMu2OlRsoVZLbjjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaf/JHjV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaf/JHjV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA768C4CEF1;
	Fri, 28 Nov 2025 18:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764352888;
	bh=I/It0zyJbd+xON0ei+Hkx5qK4KQYTOnxOwcEXj/qfY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aaf/JHjV5SmnqeoQhuZec9sQ6rzn92Oq7BZWFB6rKhc7u61y6r3hEsgGJoVH3gCe7
	 kNjzy3GW5gtu3KgHELO1rrMP3ELxACS4IgqrsJK2sSeoBfC74mhM4EK337DkUpX2xX
	 sS6VCRyUroBswN/y5njqgPGPSpAWwB3luFvlSXxFsEC7iRq8II3bVEDDp+HjfBnHSV
	 xZwBy2KafTQeJkvua72ihXA3gJG/JnHnW4WkQlLaSxSlIo/IqSXH7+SWXVnPxkzmPE
	 8NUJkAcSZUnM4Obku/wlmTkQlN+dGYuWVZuygkFss5oRopVYFmo/ordQuMpObpOFp/
	 a6+nybSoAO/RA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org, andriy.shevchenko@linux.intel.com
In-Reply-To: <20251126095523.3925364-1-cezary.rojewski@intel.com>
References: <20251126095523.3925364-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 0/6] ASoC: Intel: catpt: Round of fixes and PM
 changes
Message-Id: <176435288669.113594.17207979732433677458.b4-ty@kernel.org>
Date: Fri, 28 Nov 2025 18:01:26 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 26 Nov 2025 10:55:17 +0100, Cezary Rojewski wrote:
> Set of changes addressing gaps in DRAM offset checks, error paths and
> PM.
> 
> The first three patches are straight-forward, the last three relate to
> the power management. The standing out PM change is removal of the
> catpt-driver as a system-suspend (S3) blocker. This is a suggestion from
> Andy as indeed, audio is not a critical component that should prevent
> the system from going into S3. Whatever happens, the driver can recover
> on a follow up resume (S3 -> S0).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: Intel: catpt: Fix offset checks
      commit: 1a0ce0a1e6d2e6e03469eb5233e2a571511b1ae1
[2/6] ASoC: Intel: catpt: Switch to resource_xxx() API
      commit: ea38b262a2df7c6f29753565fbe2db8492740f28
[3/6] ASoC: Intel: catpt: Fix error path in hw_params()
      commit: 86a5b621be658fc8fe594ca6db317d64de30cce1
[4/6] ASoC: Intel: catpt: Fix probing order of driver components
      commit: 16e17736282fea02c1a156b242c2dbf35d94e9a2
[5/6] ASoC: Intel: catpt: Do not ignore errors on runtime resume
      commit: 8a342b2be1c84ac205ccd8eb9cc5d8eb5871af47
[6/6] ASoC: Intel: catpt: Do not block the system from suspending
      commit: 56736543b570a1a16fbc4e3be1776a476c9ca14a

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

