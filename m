Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C00250246
	for <linux-sound@vger.kernel.org>; Fri, 15 Mar 2024 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710522859; cv=none; b=R3JkmGGkewOzXgkG3qTqMAk7JvWUvTO6Hn2PBQcilFV5aN/SGjpXkIksjvipkKhD9Qafnp4JWxY1KjuBid8Xf/a89LKKHXh+Fm5Z31gAZ7H610k/2qxK+OP57sRjlQpLr9Q55d0Ev1nShYelxjkuKBvw4rM2w0fBjPIYI0FzSCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710522859; c=relaxed/simple;
	bh=Kaz0LaYPRpBxspj1FcPNiECRYBY8jmkWnHc+j92z6KA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bcY5Xk8c1wi58Av5SVUM7aaTMxgX0lqea1Tl2lMw7C6zPlI8vG0TeOKv37b+KER/o+7y9B7/tnKcXw5LnylfSmrtJsQNF9tBAPm0WwcPAtvmTf1OvZDcNVrvLnZlpnHhyAbKdkECQ11KYLe1U4K4BFKRMa0xwYeFI2gooEnQuoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=siuNSCCM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="siuNSCCM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B789AC433F1;
	Fri, 15 Mar 2024 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710522858;
	bh=Kaz0LaYPRpBxspj1FcPNiECRYBY8jmkWnHc+j92z6KA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=siuNSCCMU02IGJum3mKw8sj53+bK+YUF3nkJPxGPeloRMNxAffsCKP9Tzoe9ZeFEF
	 aPkr4aaodLobFKRpFMYMsztFieLImFG+qeoWoYgBBXiekQihve4b5u5NMDbjCQnmuW
	 BTtENQ86yXmQ+kdLbsj31nQa0KhMBwH7X2LRc6jU/sBqbB8gD7n2qiJzyERu1A1ekJ
	 9L7Wo5we59gsenxWKmn9dqoSPWzhHjObC2bUcbkrd+mqNne+FiQNxMzqHHxA45nnNq
	 lT2+Pm0XqgBix7DPrVPPuy8+X/8kE0X67djHyzjr6jgKwqmwKxXqe+k4FNPAaYuO5u
	 zU16CGZZtvS2A==
From: Mark Brown <broonie@kernel.org>
To: Jiawei Wang <me@jwang.link>
Cc: linux-sound@vger.kernel.org, sashal@kernel.org, 
 vijendar.mukunda@amd.com
In-Reply-To: <20240312163256.886831-1-me@jwang.link>
References: <a9a4f09f-f38a-48c0-81dc-2796c6126e3e@sirena.org.uk>
 <20240312163256.886831-1-me@jwang.link>
Subject: Re: [PATCH v2 0/2] ASoC: amd: yc: Revert "Fix non-functional mic
 on Lenovo 21J2" and "add new YC platform variant (0x63) support"
Message-Id: <171052285728.54017.11209846729223561085.b4-ty@kernel.org>
Date: Fri, 15 Mar 2024 17:14:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Wed, 13 Mar 2024 00:32:54 +0800, Jiawei Wang wrote:
> I would like to revert two of my previous commits after
> realizing they incorrectly enabled the Yellow Carp
> (YC) driver for Pink Sardine (PS) platforms.
> 
> The first commit was reverted because it added a quirk entry
> that incorrectly enabled the YC driver for the Lenovo 21J2
> laptop, which is a PS platform.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2"
      commit: 861b3415e4dee06cc00cd1754808a7827b9105bf
[2/2] ASoC: amd: yc: Revert "add new YC platform variant (0x63) support"
      commit: 37bee1855d0e3b6dbeb8de71895f6f68cad137be

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

