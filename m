Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AAC632
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 17:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111167; cv=none; b=PXDjg7liqnGc6dRkU9SYLlQU/Q60YfjDqF0lzFIzsZf1LrJC28f/bLSf+M/vphpmD29t9n4Dd0g8N+9s3VfvXMkAgBTOdPOoZ8YJZKDVNqIcIla+zLZY/crC+TxUlgm1cABylnLDhuLKW7W/liwbq7on1djYv7clzKQbNmsjo0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111167; c=relaxed/simple;
	bh=oMdOmI4oR0C1aTtRTC4tyzSV0IIHyU1JLhVcMMriIRE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OA4tUwJvOkb8vAexjFnexJzYJrcP68MDwveUI8OAk8xk1Hyt758UmYDEmDcN5CKQwBkCaCZFeo9Ndi60V45szy7yh6ZY9Ush4z0i0ENP8v7XAttRVQ6GLTYuZs+zwIJ0PqpbPmbV7ubySVUb8vQ+qwDn+mN6WWqkgBUtp1NgVSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oS/U1ALo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oS/U1ALo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE362C4CED0;
	Fri, 13 Dec 2024 17:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734111167;
	bh=oMdOmI4oR0C1aTtRTC4tyzSV0IIHyU1JLhVcMMriIRE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oS/U1ALoyvPsgNDNiNkDzh7jbL+tcEy7I+hUK05ipV97er17EaWfz3N01dV4Gz3cU
	 +wGQI81wO+f3i1cx0VR5r+NRaIKY1o8c4R07cIgUuSOxiiMLwfZnCVswoLc0O5DWmG
	 S0NAe2nS873OfJM9xdgXGIGNJ7nIGhebmhXaHR1Vb/ZseDeDyzrm0vGBgXLFTiKDCP
	 DwdnLNPA7rsK6t8s3BawUV5QdwXDHmJnhwpgzeh/cGqDoDNoNMqQw+Sdh5jA26eUy/
	 ccEXJC9ENWNKVRXA7H6XdWRaMY7PeGQvXyprjyiAlv9OwIwUi9kmM8lUv5fC6A+xMt
	 w+TBFBTFPymMg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
In-Reply-To: <20241213131717.24071-1-peter.ujfalusi@linux.intel.com>
References: <20241213131717.24071-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-priv: Remove unused SOF_DAI_STREAM()
 and SOF_FORMATS
Message-Id: <173411116544.268962.8404901494554440726.b4-ty@kernel.org>
Date: Fri, 13 Dec 2024 17:32:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 13 Dec 2024 15:17:17 +0200, Peter Ujfalusi wrote:
> The following definitions have no users: SOF_DAI_STREAM() and SOF_FORMATS,
> they can be dropped from the header file.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-priv: Remove unused SOF_DAI_STREAM() and SOF_FORMATS
      commit: f851b987f39121bb73d110c8508cac5ea60cfdc5

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

