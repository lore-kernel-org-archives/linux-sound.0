Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE853AEF34;
	Wed, 25 Feb 2026 19:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046406; cv=none; b=N7g2rxHUBN/MXGOlMv7CfCexP79DiVDy1NWiSRSGvWsuikMFfMHNR6xQc012v2+3quFyidihjrBofwFzDHFFV6b6SRlk4Pi49yyatz44yq77EQ+JfPynT59bUqTZe3IPV+HYsuoULcZHzytsBwO22QJaEKJGZOnid7uJYWT0TPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046406; c=relaxed/simple;
	bh=RN7eL0CoziHQfO/K6Gkxx1PRI6Li9lToOWl0Sp+5LDY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=geyndPFeG2q1ltA9/ZKPtK7ASlFcCDoMaaGkHOgdsW0Ng3DHgxCQKBNqMrSWZeSOZI9mOk312wiXhoqlxOFpqclMdMrHD7o0Hc0LmgoAP4CqkHufXtxu3SNTYH5WDtI+FbH/OXDBk1XCfszT0EcknKXTDNiZvjvVuIYxeVvbeOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3wUZlpi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3wUZlpi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B229EC19421;
	Wed, 25 Feb 2026 19:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046406;
	bh=RN7eL0CoziHQfO/K6Gkxx1PRI6Li9lToOWl0Sp+5LDY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M3wUZlpi6seD1vHMRMkTCR8OQHCji2yhdbO9ZdBaZkGHpIqwghT0VbWF8MbDlcDYX
	 S3zk8qX4OV9fHLqN8fxyEVzQ8++vZCYbYZX97wgthtyOyQAQYvPFQac1y4uXyrOfmE
	 kp6+Q26e8OUFrfvCnyHg3LOhovfe/8t1YgpZIubF30oggP0OoLOJbJ0IZEidM+W2Q+
	 KSa5k6sskAe3CkAnrg/Qv0sMP9r94vo15LAIVneYcW2aT49cNWmdGUESRsYYvHOeOM
	 jD+jg660UxzSa4d6AGliEmlgX81b6v5WRQ+4ApcqakKD0FlSQ40m0V0JjxpwvMq/fU
	 jki25fKC/4E2Q==
From: Mark Brown <broonie@kernel.org>
To: vijendar.mukunda@amd.com, Mingyou Chen <qby140326@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 mario.limonciello@amd.com, venkataprasad.potturu@amd.com, 
 Sunil-kumar.Dommati@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260213055904.110256-1-qby140326@gmail.com>
References: <20260213055904.110256-1-qby140326@gmail.com>
Subject: Re: [PATCH v6 0/3] ASoC: Add DMIC support for the AMD RPL platform
Message-Id: <177204640447.168100.4667388323512096726.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:06:44 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 13 Feb 2026 13:59:01 +0800, Mingyou Chen wrote:
> v2:
>   - Reverse ACP CONFIG PIN from 10 to 14 for rpl
>   - Remove the rpl folder
> v3:
>   - Remove rpl configuration from Kconfig and Makefile
> v4:
>   - Handle separate switch case for RPL platform (ACP Pin config)
> v5:
>   - Remove clangd generated compiler_attributes.h include statement
> v6:
>   - Fix typo issue ("reverse" -> "reserve")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Add DMIC support for the AMD RPL platform
      commit: 70bbd833986ae6691b3609a0052a733ff2421565
[2/3] ASoC: Drop RPL driver
      commit: d3fbf61317f6ec99398661b95d1046008ee61282
[3/3] ASoC: Add quirk for Lecoo Bellator N176
      commit: 78dfbd4ad0be9f51de7b9a19388809254aeccd26

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

