Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77EC218580
	for <linux-sound@vger.kernel.org>; Sat, 30 Aug 2025 10:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756549937; cv=none; b=XViBBVgTtg+/PjwAxJECgzw4faokDXFVTs6awWuHzUK7++9zdOMZ1s8+ziEYOutuwGXPcbyMhVfWRJ55GEDyDQcXTYmhrQofeN0HQHDkCZwuYPQjR31brzFkmclMRy3yeUv0wYBlDLD44iYLHR+FaRITo72JF+X90zicA+e4QVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756549937; c=relaxed/simple;
	bh=lyxxFUjcBUu66ldjiJ0IZZ5xY04McjNrdRLbV1V5fbY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X5txjwXGgqem2HCzTuJZ6nEXlK4uzCmPhVrWUj9mkzesy6lIrfTOyXI7E0TBxlBWQxt3Iff/uq+ZM0R6avFD36GbBnnrpGfCtV2GKCq8f3qghzaF03MFlXJyrt01REtocn4UF9PTmKtb3Yh+n6d2YBW+vnn1+yIuSKGhEH01f48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQGNOSFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQGNOSFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581E7C4CEF5;
	Sat, 30 Aug 2025 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756549936;
	bh=lyxxFUjcBUu66ldjiJ0IZZ5xY04McjNrdRLbV1V5fbY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hQGNOSFTsBXiGbdra6RCTudmxvl66g2Mx62PwSxk8Di2+YAVGMl97yR6M09bCmtsQ
	 ZwzUwTKMXbnkAHk5bv8CUCYrLWv7VLQ7W0VsbKs/OJhF6/Jp3JjuS2xsmN0p66WUgL
	 /wlXDIAP9DOdYGEh4iy4hrG85Xs3agg/biOMrSUCvVRZu6UyhQnUjzizize4yOQV/J
	 y8+XuSBkoo/Ssq/5C+s2n+KnwCLUP9upir+DjPE4RFgdKDf0wdpRYcxZOkItCGIcWj
	 cNf8dGhwVU7FbaWhjPP6obvVjUNZVf9kgwB1koSw6nWyPNugxXKHG1ui7nUl/FnZs5
	 UE/YP/tcljItA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, jyri.sarha@linux.intel.com
In-Reply-To: <20250829102510.15159-1-peter.ujfalusi@linux.intel.com>
References: <20250829102510.15159-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: sof-client: Enforce client access scope
Message-Id: <175654993264.400773.2857329100258384075.b4-ty@kernel.org>
Date: Sat, 30 Aug 2025 11:32:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Fri, 29 Aug 2025 13:25:08 +0300, Peter Ujfalusi wrote:
> Up to this point we had a spoken rule what sof-client can access and what
> they must not (they cannot use sdev directly), recently there were attempts
> to break this rule as clients could access sdev via the sof client dev.
> 
> The series will re-arrange the client device struct to 'hide' the sdev (and
> the list) from client drivers to prevent abuse.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: sof-client: Convert sof_client_dev_to_sof_dev into function
      commit: 850c5dfb17b381f30c4052a68c43da5abc678e74
[2/2] ASoC: SOF: sof-client: Introduce sof_client_dev_entry structure
      commit: 07752abfa5dbf7cb4d9ce69fa94dc3b12bc597d9

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

