Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F874225A38
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 21:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502846; cv=none; b=Usl1mTGUqVWhDMBY7ysy+7qJIC8ycD42e4tmgSznmvfjB7w6vZ5WxCDoXJ1Q/V5sM5h/E6DCMegS1oX8sfzBIzEJ1ctyi1fZglZvINFwtu3aniinH7u0omKvr+IFKdGlqy8tDIpU3tH5gJNwfnbY0FJfcoLqiG9YsORTk/obgOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502846; c=relaxed/simple;
	bh=Mh5l/V77HaHnzYTSunzUd5DVADx1a40PTib3uoMrIag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aSHaYbtO5vm6Pni9VrNKH5Le1jnFErYZVZ1KkKV4gqDnVaOpWy0EeOxw9eYBZDushOPnx1DvNVLzSuOOHktTa2wZqAYV6ok5du0l6+dtGUNeTHbHAeM28lbWzswjniNmWJ7e2tfjow9d8CqJYtAx6EIH2Dpn2PHjfq4stEcDZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1CfC1EF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1CfC1EF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CD7C4CEEB;
	Mon,  9 Jun 2025 21:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502845;
	bh=Mh5l/V77HaHnzYTSunzUd5DVADx1a40PTib3uoMrIag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y1CfC1EF4D3YsnngXs8nLbk43PzvNo1BwnZotM49lv1ceB6+/FOOFnuyjyh/thtCL
	 6P/qXZ+24a4+2UwtEVvVHPVEsj6NZ/Pmmqgfu1HyHJYpaisG4cVIIgs5m2oTPeEAb0
	 RBRENQLsKe7+fABYV9kYzKzTJoC08e6VE734QkNyZXR1zsAQ08/c8jNT/0hms5dheq
	 cpQwdvJoM6jXha3v4XT1Cyd2Sd2gZfceLo/d/IFmTMTNzjt4bIc8cer+wx9tJYq1RT
	 xvDUFacNZ8Q2QV7hzpRcaj82jNbnlNSq7X+JQybyyAskrPklLv7cd9w8p1xIDkRRnB
	 okOP+f9pXmqrQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250530142120.2944095-1-cezary.rojewski@intel.com>
References: <20250530142120.2944095-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: avs: Add rt5640 board support
Message-Id: <174950284466.277844.5615049542712323574.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 30 May 2025 16:21:17 +0200, Cezary Rojewski wrote:
> Small set of patches intoducing two low-impact improvements to rt5640
> codec driver and then avs_rt5640 machine board driver. The board
> behavior is based on existing boards such as avs_rt274.
> 
> In regard to the retry-device-verification change, there is number of
> similar "fixes" found in the Realtek code in sound/soc/codecs. What I
> provide here is verified with tests, the delay is not mentioned in the
> spec I have access to.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: rt5640: Drop dummy register names
      commit: cecec195b2930fc45d71e29f66a66f0c83e41468
[2/3] ASoC: codecs: rt5640: Retry DEVICE_ID verification
      commit: 19f971057b2d7b99c80530ec1052b45de236a8da
[3/3] ASoC: Intel: avs: Add rt5640 machine board
      commit: c95e925daa434ee1a40a86aec6476ce588e4bd77

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

