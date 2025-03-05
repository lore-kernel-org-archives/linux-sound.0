Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443A51A5BB5
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741193674; cv=none; b=HhsvLfbBVFZvb7Eqg2ENJlj5ra/W2Ajsph3Wf6M7E2ipsRqYheTV+QiGvNC7m+O+1XY1bfsG4jiQylSS95USLnDHT/lpvGNwx/cDp7Va8pTRKJGVrUyoPIlDBmWI9BmZ5jeTNdubKl4dr53ujS6hRYQIT7l/W9ScSNk1iggJNI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741193674; c=relaxed/simple;
	bh=9OS1cJjQS/4gRJ9Ko3FFycBjbCFGTFWCpjN/tyllTi4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SDH9DyjOvZrXEIlJQH5jSPA7FtYJdCvAn5pxwAEo+Vu8/aR2hQt0GMnHY9UAbiWHss/7qF+/lMWxXq0Y+kl8mEKDLdqlpf75orf/2flIMkFI8pAvGxEBNppXp0o7Z3c3Rl39hXbM3Pah2t/y+XmMT44ddwkOhptf0hLfZQud574=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpQ+WMjx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpQ+WMjx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0ABBC4CED1;
	Wed,  5 Mar 2025 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741193673;
	bh=9OS1cJjQS/4gRJ9Ko3FFycBjbCFGTFWCpjN/tyllTi4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SpQ+WMjxycWNd3AyiAqhL10CZ/zxOsUgich/kEKKYT0GCAcb5oz9NtphDAryzTA51
	 9Dw6g4+ptXY8X25p8tcXql5uDv6n9MlArjH2u8I0VMGaciHRRUb6brpCZxF6+AXs7P
	 TjQcDGG+iW6EnffihiTGW+quLBdiH2UeRpUuXoBodu2MaCWDTFa1bQWGPl0xmU8jrm
	 vEN7gsanIFQwOTK7VXUnbqP15HtuF/rFoY0eZKfnDUukGDEwpoktrpxC4jDwuC8+Lr
	 WJVFeFNONu9v/FZSA1g2vTSbnQUpv7d1B92HiKXjEaO+XzkYvhgfNVAle6N1BRwxjX
	 BB8Mn0i1aT4BA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250305134113.201326-1-yung-chuan.liao@linux.intel.com>
References: <20250305134113.201326-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt1320: set wake_capable = 0 explicitly
Message-Id: <174119367245.160083.4867604816412375464.b4-ty@kernel.org>
Date: Wed, 05 Mar 2025 16:54:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 05 Mar 2025 21:41:13 +0800, Bard Liao wrote:
> "generic_new_peripheral_assigned: invalid dev_num 1, wake supported 1"
> is reported by our internal CI test.
> 
> Rt1320's wake feature is not used in Linux and that's why it is not in
> the wake_capable_list[] list in intel_auxdevice.c.
> However, BIOS may set it as wake-capable. Overwrite wake_capable to 0
> in the codec driver to align with wake_capable_list[].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: set wake_capable = 0 explicitly
      commit: 927e6bec5cf3624665b0a2e9f64a1d32f3d22cdd

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

