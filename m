Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D5816078C
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 14:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092507; cv=none; b=VF9MK0DEauaQOUYxf1Kfr+NoIPFVK0nqe6DbpXAQumXREgFs6O1Ax3oxYfV1YEJrXsdpa++V90mEAeNfKHrJoigTwsImWY69J45iut83PIQW16OIwGca0jemLLsnmTXQfpFmmRWldWKQZ93TAgm2yBphLFDWvmuELD70/7LlQb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092507; c=relaxed/simple;
	bh=rh9ZHphu6xhB7OxL8asZBjORtt/B3YfKbGwrlZBc6cc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jc3l7dqsRH2oQUB5nb9SdmEWGojFWtQJq1BMX+FwI6Px2CAB+8kVFb1rvu9wHjx5wdlcHXolMpzAf/ELCaxeCobtte4f3hDZq2lo5OLOO/UOa8rTo1jODN83tCaYY3Mtau9ir645T6NEnmdO2nFCJgSeqT/9yS2w2/YgYVOIpfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBu4+3nW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBu4+3nW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7556C4DDE3;
	Tue,  7 May 2024 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715092507;
	bh=rh9ZHphu6xhB7OxL8asZBjORtt/B3YfKbGwrlZBc6cc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UBu4+3nWgiamZFHlRcnS2ATFNkDtDSETJcVAzEKOqIElti2qiwitwR8zvQEstP4Fw
	 DNPyQYbn+3m8DsBVBGGwCI06hLccmeCOhAUPQp+GdN/c60ctVDpHg54fVloDzVP3b9
	 O3wvE3KwR18gti9jOzw8ekjIrYoumbsXZbhAruI3BNFJkHMpLGW/rVbvG4QMIJAKLU
	 6C715L9YLPpBy5g+3dRM3RvldQ8pZYld9AdD9i4UWfqAkWeaKQ7BPKAOj408OV90kp
	 D82JKoThpkkeS7WwA0DTh9hirQrPfWVSTfLMIZKDvh6l36/4q5H0CqtJb86oUBoruU
	 CMFaNDr1ZzegQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>
In-Reply-To: <20240506121106.3792340-1-amadeuszx.slawinski@linux.intel.com>
References: <20240506121106.3792340-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: avs: boards: Properly name input
 device
Message-Id: <171509250547.1985791.9610168876081651324.b4-ty@kernel.org>
Date: Tue, 07 May 2024 23:35:05 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev

On Mon, 06 May 2024 14:11:06 +0200, Amadeusz Sławiński wrote:
> Machine boards expose input device for use with userspace. Current name
> in some cases is incorrect, fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: boards: Properly name input device
      commit: 6490bec6d5bf1001032c5efea94bdf5b5104bce9

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

