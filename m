Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF5F28C85A
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753110274; cv=none; b=RRlr7gONXNdaguXROYvAEkZ9tnRgldeZaNyXocAC9U1KSCW4FVMFWe03PJxupzVH8AOfi+k/bciWbyqjgo16hA8zPuRQTbHwg87pbWaDEwue0rkiGuB86KMKLtnwcKPjlyn65uRL/XBHhYfODbmo7LIdKdHYLuWLl4JrFMiwM4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753110274; c=relaxed/simple;
	bh=Ns1RWoIG60SjtgWVbs/rQqx2r0D7kAUBF22/Av8oXfw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FmOa1eJOgZ5I/6QyycIaY3Jl9Ylw+mFp9t7hewI4L7SAU2PYJIv1tBt6E0ovzFTDWRUbuwSjxD/c3lEqISMkonGM+RgZL6CZe0kNgGQCkJVdT+9begKqYb4Eu5tQSs0R/TSVSAvQXNOMt2Bb5ENkrDIjeQ35IPhpet7pTcu94Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzQ10S7Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzQ10S7Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733C1C4CEED;
	Mon, 21 Jul 2025 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753110273;
	bh=Ns1RWoIG60SjtgWVbs/rQqx2r0D7kAUBF22/Av8oXfw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WzQ10S7YkKpDEKqXorXPDlKTDUqXhS6vTPNg0m24Z/L23tXvOj3RT11xpf2ZcQkmb
	 ZmrHJTiqd9yGeMhITUjnn2Rfajo7UMwCRbssYf+DzLAHbjPYN0mjbDqXN5rYXpzMXx
	 TlUlnhndZwE878f7xQvz1knZ1Cg4sQRRyfe9Paq1pUTihFXDkvkqjKfbzA41oiyU6r
	 kDyWETCpI7BTmBbFmwJInaCfMieQjy6BzziGWa/m+WL99SMZmthut/Tq9Wg+tCdyk/
	 /+IoSfNottRgh+6yqoLi8sVF3JbxBt4NoPAWdHZW7zFwzdHb8O0+jfLMf/KjPpkedG
	 KMEDv4pmjpZZQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20250721063039.2234279-1-yung-chuan.liao@linux.intel.com>
References: <20250721063039.2234279-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: PTL: Add the sdw_process_wakeen op
Message-Id: <175311027220.206895.13908038005458131723.b4-ty@kernel.org>
Date: Mon, 21 Jul 2025 16:04:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Mon, 21 Jul 2025 14:30:38 +0800, Bard Liao wrote:
> Add the missing op in the device description to avoid issues with jack
> detection.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: PTL: Add the sdw_process_wakeen op
      commit: 0503ac474a3d57b62ea40c7720058ae42668d948

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

