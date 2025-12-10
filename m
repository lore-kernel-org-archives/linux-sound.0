Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156492A1BA;
	Wed, 10 Dec 2025 00:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765325808; cv=none; b=SEEBaRehFBGgfmYs0myRXJ0i4Zvtera6QX6aHODIYXUg1uh3riUbOtelkUv+qd9gnc5TP1Hqeml2y/hUg6puahyDYHJ56EPukbEQH9t07CdaU9v6vO1GtjrHvVxjSuBtQVSHKLjj2fRlraWU8Hyee8uQsZXJBQwGKUdJf13NbQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765325808; c=relaxed/simple;
	bh=8kOL4m+deoe+/XgZRtioioetT5KGklSSjjlvs0btHgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kGXWue9e7QvHW9L9jnehSvB/eD32TSEIMf+r2fSQ4uTbG2vRx+bq3/YuGpzN3Ex/BYcHnqqqcnRn9U4v10uYkJPMPO++swyAQJ2pBkK0SJt1PnsRO4u2VM3sxyTQB1ifXwLcWhGjEdibbTN/DArkv71NVTFF53NozZi6qxAEU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/Ho7dOl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/Ho7dOl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3466C4CEF5;
	Wed, 10 Dec 2025 00:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765325806;
	bh=8kOL4m+deoe+/XgZRtioioetT5KGklSSjjlvs0btHgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A/Ho7dOlhEk0ffNS7VHvk0tBZd2ZmvMJZYSY9jlSal/RTdeaJwS/2NsragbpqLL1k
	 hbc45AxiXF8ZJ5Pikue2bz2iO5TTKs2GmN+XnSoUkNzumys8+wS/ZAB0bV/ybqJoic
	 FeATxZ71zm5StpYyp449XQ7go+TN9n/WkIDPs/dcq+ZpeNFyKbLEXMW2NSggsZCtXi
	 spFj0rN9T6o+ntgowjdLJnV8sh9tELN56rWaE2koUpxzQ7uhOyeo1c3SrZQ+qTdUu8
	 srXLcUa1ZNKTRMQFOMc64QEP1geavQcHbYs/GDb+LjsQZWPXblrD2hS7GnKStcPTTg
	 r34NOoL2JTuXg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251209104657.485541-1-rf@opensource.cirrus.com>
References: <20251209104657.485541-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Fix incorrect select
 SND_SOC_CS35L56_CAL_SYSFS_COMMON
Message-Id: <176532580553.631701.11685327524775268278.b4-ty@kernel.org>
Date: Wed, 10 Dec 2025 09:16:45 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 09 Dec 2025 10:46:57 +0000, Richard Fitzgerald wrote:
> KConfig SND_SOC_CS35L56_CAL_SET_CTRL must select
> SND_SOC_CS35L56_CAL_DEBUGFS_COMMON.
> 
> It incorrectly selected SND_SOC_CS35L56_CAL_SYSFS_COMMON.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Fix incorrect select SND_SOC_CS35L56_CAL_SYSFS_COMMON
      commit: a061deb0b4d56a9213bc05c1abe626fdd303ee52

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

