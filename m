Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EA62147F0
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 17:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602822; cv=none; b=tsfRUcvQVXXT8iL6bNWCZpGOz0UOUecooL3JV5MQ2KxEzr6WreMblV9VoGR5ADlS3yVVmkUn0dXvM3U+BO+gVvGUpXB1TVUmQOCDzA9IpSSdbacH0XAvd9dhs3UptlXrxmA9jgwg19gTovG33sxiRqtUmXPKqKL+OShNxBiWgbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602822; c=relaxed/simple;
	bh=ApP1xnMcsItU23naC7aONR6dFnsnSVrtTwL9Tmcdc44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cePpRjSdcqW3iSO36i4qamUAfr6CNruRQ2F7VptNjiJpWKB7k3cdgGEzV072U35f+1HDDF/OKwpsuj4Rgn7Q8UoT3DM3tkmXV6VP3RFP6hoIz90zpQj904ughhpYRWWIN/iM3oJR2WJ3TGoZAYyJMehGCcvBer6ePxpNjPQDV7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frGj2GWs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frGj2GWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAA6C4CEE9;
	Fri, 25 Apr 2025 17:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745602821;
	bh=ApP1xnMcsItU23naC7aONR6dFnsnSVrtTwL9Tmcdc44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=frGj2GWsva3ao2AfbY6fSVFIfky5ajYmHfjY9wZ2bZRb7ivqweaUKXAQ6huDAafYd
	 iChCj9T16M+tzpZfJzFCAvRAGMeZ9nyZh6JIKJwm/0jf9ApSJRQoKHjXqYHzfLOKfz
	 HxVlVHZN6oq0tt2Ssn7vNT7nnB6ZPCVBv+zyEZ2IsC2CiAZWER+Ae7nEz29GzDhsWE
	 IeodzHWfHQmHStonBjcHg/xyiZHIJhZm562XJ5vUGDLWzkrggTq+UlSS8QBOi4N5Kb
	 ZUSad9TrNZTGngRrcxWJJ643Ojkiq/LCOw42GFgpM3MhgzkAOhDhN8HSXOs5/nRoQq
	 mtZYsRKqbgC3Q==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20250420085716.12095-1-tiwai@suse.de>
References: <20250420085716.12095-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add DMI quirk for Acer
 Aspire SW3-013
Message-Id: <174560282104.225473.11289545993390589889.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 18:40:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 20 Apr 2025 10:56:59 +0200, Takashi Iwai wrote:
> Acer Aspire SW3-013 requires the very same quirk as other Acer Aspire
> model for making it working.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Add DMI quirk for Acer Aspire SW3-013
      commit: a549b927ea3f5e50b1394209b64e6e17e31d4db8

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

