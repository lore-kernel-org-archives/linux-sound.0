Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D5420DD72;
	Wed, 26 Nov 2025 19:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764184363; cv=none; b=O/3byOD3iLOlNWiO/a1Qkk5XnmwXssbK0Ax4Vil8wxQ25zSd8x2xaEnPxDHQmL6NcxPstH8u9eEKDrRogzBL8aJW8FpTsKh4hJmzCz4oOVReYbftyRL61LtrhtbbvfOpzJH7LtJwpZOnVI13rdy4ZoPqcLuuK1QcldOXeaScdGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764184363; c=relaxed/simple;
	bh=YpjygfcjSzxrpjHH5eH7VbwQeUZaAs0D2e9Be7o58U0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZXRRjK/f+f3o4xu2ajrPh01U4x6mcJFD9P2paf6HTyjGiVuz3cGgFC1C86t5Adt1hCtApuOU3QKJrgBYe18HhgmuukyBwN05wTPnaNsXFSHjE0brJmAmpwaA8QaXhNI/2RW3UPiRJ3BsgXTVJ0vSto3pFGKWXd1RytowpGoWFcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3kWhMXX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3kWhMXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F37C4CEF7;
	Wed, 26 Nov 2025 19:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764184362;
	bh=YpjygfcjSzxrpjHH5eH7VbwQeUZaAs0D2e9Be7o58U0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T3kWhMXXqdYsQZdgU4trZkEDX2Ke7LGCc/4HXWEDtHFMEF9WBATw+Efe742iFzgT1
	 SEEtARh9N/dSMgpP1NYTfbrd2py9TD0ixYSjK7AB3IJzfBuPCQAVofQUvkg6E54zJd
	 V/BKtz4GExjb4a6WczPL4lxFZleeMn/rYGPNPz0ed6rSSzTTmoPy5l2EDx0r5ctNH7
	 AeKbT7tgMEDrppPMx20hTkTqm8quLovjZgvZVHyz3dsCcRDyzkHnSJpDGm/++ey2T/
	 Obu+S2eTb38aVOvmeD9DodwJyzeBxkUxoaaOirc+BSck9kfoZftdCYx1fa5fouOpQK
	 BBIKl33IzCGeA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251126131501.884188-1-rf@opensource.cirrus.com>
References: <20251126131501.884188-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Remove redundant download buffer
 allocator
Message-Id: <176418436134.117076.16200821055578141148.b4-ty@kernel.org>
Date: Wed, 26 Nov 2025 19:12:41 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 26 Nov 2025 13:15:01 +0000, Richard Fitzgerald wrote:
> Now that cs_dsp uses regmap_raw_write() instead of regmap_raw_write_async()
> it doesn't need to keep multiple DMA-safe buffers of every chunk of data
> it wrote.
> 
> See commit fe08b7d5085a ("firmware: cs_dsp: Remove async regmap writes")
> 
> Only one write can be in progress at a time, so one DMA-safe buffer can be
> re-used. The single DMA-safe buffer is reallocated if the next write chunk
> is larger. Reallocation size is rounded up to reduce the amount of churn.
> PAGE_SIZE is used as a convenient size multiple. Typically for .wmfw files
> the first chunk is the largest.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Remove redundant download buffer allocator
      commit: 900baa6e7bb08ab3d24388cf945c7be063ac1b89

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

