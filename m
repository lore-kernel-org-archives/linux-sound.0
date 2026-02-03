Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178B314D16;
	Tue,  3 Feb 2026 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120320; cv=none; b=FV/6SlPy/B8Zl0JmYI7iiUOnUHvNGtL6zUYebN4dcfgOBf1kY1vZBrLCKs/mbZGCke2cv62+XYPu060KINVJFOKYjAiN60ypSUE/+bzuV8HEFTSxubplOMms6pOijLHhOrudFgGL3QqDXjEQx8UP7jeMhGGswa/EdVr7ynw7Kkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120320; c=relaxed/simple;
	bh=KbSvjqE/aMaKltYdCjxV0dTcOFPYKmtYiMGRuMre0Ek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lfmiKJ/1dsvRb0W7CFoB7VYZMUNq2o6fcM3In3KDb6YFMcCxotRgMg9RTvqMf3Y1tbeQO/IumfZjnEMd2tU4EKSstKxFjDaDVQx8JQfhIM8BXKEB6SkKtlLt1LuSMNb45wS+ANuvHvivmK7xMzWPcUV+fwifuY0UwMfI6XQN+kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Redhywsb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Redhywsb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D2AC2BCB1;
	Tue,  3 Feb 2026 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770120320;
	bh=KbSvjqE/aMaKltYdCjxV0dTcOFPYKmtYiMGRuMre0Ek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RedhywsbeX6DWstvCpNA3/bhcaa8W5kY76aqZetpl07CznXURiuSZ5Klej1OjzGja
	 j0jj/+UmYfZu4MypiTfr8eVN3MSoiTMNtxsON84KIjwW+EHR/0smPSKhAvPN6U2P7F
	 NVpOqoEAhCsNs3WGdd6u9VBk6vzdMvRtEDJGL797x7b45ShKGwR6/m2/UE6UsMnb1m
	 vbPKo0SRpmckcdhIa5/x6smrqxZ2K847La62nc4syvHBcVUSI4ACeG3UCPPCtdqgIW
	 C9YPAXvLIZzyCdTEx9pMYY5kiLA8LE4w8jji1npupbxPqmSo1WQmX8hQkP515uAua3
	 058tXkE6xVnIg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260130171256.863152-1-rf@opensource.cirrus.com>
References: <20260130171256.863152-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: rate-limit log messages in KUnit
 builds
Message-Id: <177012031931.85387.7521440900629176229.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 12:05:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 30 Jan 2026 17:12:56 +0000, Richard Fitzgerald wrote:
> Use the dev_*_ratelimit() macros if the cs_dsp KUnit tests are enabled
> in the build, and allow the KUnit tests to disable message output.
> 
> Some of the KUnit tests cause a very large number of log messages from
> cs_dsp, because the tests perform many different test cases. This could
> cause some lines to be dropped from the kernel log. Dropped lines can
> prevent the KUnit wrappers from parsing the ktap output in the dmesg log.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: rate-limit log messages in KUnit builds
      commit: 10db9f6899dd3a2dfd26efd40afd308891dc44a8

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

