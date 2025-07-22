Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BE51ADC7E
	for <linux-sound@vger.kernel.org>; Tue, 22 Jul 2025 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194834; cv=none; b=DYot5z9IrTSGbDPE1pLFuv3pEpT5T/losO1iB5DyLP9x8Fi5Z1RXxVruOd9NosWTnlmjndvk6cTENaF5N/1pcNLOpNoLAceGGnniqclQhedV4+tQ5zqkQGpy4QyAfO+q+8+SSEmE0e/BWP2mdKRkLmB9hwqo7jV4GzlxTq93V40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194834; c=relaxed/simple;
	bh=lSY9VYZCtYMQ2Hvr2Q414T1Uypl+dV0N4CQJBrjgpuc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ti5IybybXF+oyx282tM5IPBJwokaAKWlaH+AUtI8H2YUU3sT2UTE1hbqonubXIRExNfoQJNw7vxrsLLkRs7+7sz6YDyeL0Cp5W0U++Fvs5BUbJXZvK5wslcg965dWVar77rdOAZA7FQoGwAl7cZSUBghLxjE2UXFKI7gPaGxXpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ls6rQYAB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ls6rQYAB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB67C4CEF5;
	Tue, 22 Jul 2025 14:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753194833;
	bh=lSY9VYZCtYMQ2Hvr2Q414T1Uypl+dV0N4CQJBrjgpuc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ls6rQYABnuQkeiZf501YwBN258mQDAsJ+bgNsXUjoqv05T783UaLfd5M4v727LRU6
	 cz70a8GPARrtL+V1E7XwiBBzjj1U7US1pqGkVJkHC0s68rYaFJpw24S3lZKRIbVN5y
	 cscvHdGCdxJ4HzpCyXKO1Ut8u/RlNpslnpVhF8fT00vWM/CB6STbsMfGpMQClTbYFp
	 rHmpWIk2IK54b2cFcDMnQ8aQZehSG1hjsXYu3CKSyXoMaKfCJPxdPGtS/hJiQgheEj
	 ELQpclfxSrJ4AHBCylCwDf0YzJeVExQWWDjXSEdtcF1iPRFi5Ps9n2JJVWmUsFk/GX
	 lvVZcOsMC17sA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 arnd@arndb.de, linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20250722102305.2513755-1-ckeepax@opensource.cirrus.com>
References: <20250722102305.2513755-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Shrink detected_mode_handler() stack frame
Message-Id: <175319483211.46177.10845599800458227937.b4-ty@kernel.org>
Date: Tue, 22 Jul 2025 15:33:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 22 Jul 2025 11:23:05 +0100, Charles Keepax wrote:
> The stack frame for detected_mode_handler() is a bit large. Dynamically
> allocate the control value struct, which is most of the size, to avoid
> this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Shrink detected_mode_handler() stack frame
      commit: 59c5dbd585a0bee70e51fcdf36185f7602b9c285

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

