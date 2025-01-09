Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1A0747F;
	Thu,  9 Jan 2025 18:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736447290; cv=none; b=uSkaACMDnLVZTu/BFZODFhYJKNyQ/oaTYY/JbrHUJpablNgX7T57TB7ZAH5hEDiFubA81OW863NOfN+cn0YogW+Gl26P7cMc+ICl2QGxLly8+d9PfTXhShYRaZ8zSm8Bnw8bWnAk5mM8Zqt+cBZWKToHOQgttGJlo9D+P7Yko7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736447290; c=relaxed/simple;
	bh=GnTqAbmS+0XNG6XCb2Pjn66bamWYobSzdcPTT42kJts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MHD/uNQCOKoIJIHekMd2Orc9CYNe5maSkIhMbONYQi+sgcsIUwBkxAr0kL9DKM+NwlL14KX5W0gJSQQF3lrpukYlkP7/NrDvPTYcOBBiloJzUPoOnmlvRSlGGVF+Tv598mEUtF7yIFQq8HEfv88JJ34MAR+ujAFj7dNtElJN0EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUHNUjdp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUHNUjdp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A212C4CED2;
	Thu,  9 Jan 2025 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736447290;
	bh=GnTqAbmS+0XNG6XCb2Pjn66bamWYobSzdcPTT42kJts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DUHNUjdpBhfhsQQu1mCuwpwEBD7ZAW5Lu30ZXRyn3ZpxhENfuJROG7CDK9dVKIakq
	 Y3KKm4xD9mO9LbJmAYqzdgaLyWY3rZUVVzPvdXc6uFYgEZJKxQlKiajFpJpzEjrW30
	 5F1Nlet2fxNKKbAq8Udy9ozT0E+EmmltlBML5vPzDFeuNxKsG5ReO+TmWtqxgpT/K4
	 x6lrqKo1rlsPUqtWLx3cYEYy87lsjjOaORFm8aru3ooqU+X7ZQxpSlFMDs13jq0KiF
	 Psyp0j8YnJ+9E3MijncxugwbVZ1cxcT6fUJWtZjxtsa3wIL9Cbor2o9tZPhR/u3eVV
	 HB2r4dMX4f3NA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Yu-Chun Lin <eleanor15x@gmail.com>
Cc: mario.limonciello@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20250109171547.362412-1-eleanor15x@gmail.com>
References: <20250109171547.362412-1-eleanor15x@gmail.com>
Subject: Re: [PATCH] ASoC: amd: Add ACPI dependency to fix build error
Message-Id: <173644728829.595760.10385819507790790071.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 18:28:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 10 Jan 2025 01:15:47 +0800, Yu-Chun Lin wrote:
> As reported by the kernel test robot, the following error occurs:
> 
>    sound/soc/amd/yc/acp6x-mach.c: In function 'acp6x_probe':
> >> sound/soc/amd/yc/acp6x-mach.c:573:15: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
>      573 |         ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
>          |               ^~~~~~~~~~~~~~~~~~~~~
>          |               acpi_evaluate_object
>    cc1: some warnings being treated as errors
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Add ACPI dependency to fix build error
      commit: 7e24ec93aecd12e33d31e38e5af4625553bbc727

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

