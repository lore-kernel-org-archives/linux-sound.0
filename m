Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF62F320A1A;
	Thu, 18 Dec 2025 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046078; cv=none; b=uDDpa8bKHmADNaTF9u5DJu+ZcBWgcnhFgk57fCeOYQWwNVM3bj9Kfmk+BdSGTQS17jTTbiaJyMvJ1HcZVMigtQW/UypyDH8/DQDt0x0COzfu8LzHwPVxP2p19KD4KhATOWWNb0kSkdJ5fEEg/uC/7JgA7d4dn+hQY28BZQuQTjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046078; c=relaxed/simple;
	bh=wcbV35fmlx9I6q9lyJOuzaoAo7F6H2C4tNBjF3nGLLE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BdrrBMFlUCGlrwiI9IrWgcLj8+LKO4k2N97FZQcj8Af5E/8kWegT4uLtimKMNz8dfxRU1xwG3mAD+zgszj8pBBlzD79z4zEwhNsZ9tR+IOfr1KeV9fdFC/h+GXjS2bnJ7171kK46my7NJAuKaO4NvLScJEuwtLOaOVzAVwICxlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBjZkIab; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBjZkIab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29E6C4CEFB;
	Thu, 18 Dec 2025 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046078;
	bh=wcbV35fmlx9I6q9lyJOuzaoAo7F6H2C4tNBjF3nGLLE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GBjZkIabvIqHw88c/CZ8FZ4sNTS+ynZnRepSNFQ/N+1cr/91LK4byLWTcEgcTITlQ
	 v7XzxaycfARNs5dO9xdC7QSe77tWtPxJ9BiN7jXqKA1k2Ao5PemDt/PbdTSc2LNaQJ
	 TPZ1osqourcrxZi+PAXqI+sbLCBThZzQaPmzmvfgFpfzZQPXMXwJs8O0qxhy+ecef0
	 V67m1Bw2ZcN8La62edTZCodmv2T9RopdtK90+pKHBZKk4Njez6OPOYwaHiweuEuCsy
	 J+LmZmTjija1jogafkxeNyKAV9Hk6T7opyhu/0+nYg1UKHR7XdLqbDjcUk1OCGLKlZ
	 70+boCQsJs0zg==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251216142204.183958-1-simont@opensource.cirrus.com>
References: <20251216142204.183958-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Allow sample width wild cards in
 set_usage()
Message-Id: <176604607740.48417.4985076773190014002.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 08:21:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 14:22:04 +0000, Simon Trimmer wrote:
> The SDCA spec allows the sample rate and width to be wild cards, but the
> current implementation of set_usage() only checked for a wild card of
> the sample rate.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Allow sample width wild cards in set_usage()
      commit: 87783532d34050e2bff6749a4fe9860e624a0540

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

