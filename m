Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C283C2F;
	Tue, 10 Sep 2024 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987746; cv=none; b=Tv0tzEuDVdnQLQN6oNZBkVIn1SJrLSyl8eOQtfhuJnH5aSwLfFWziZjaLO06wy2UzbDxSYFL5Sw8mhxrXVfAUG7LxsC9OhiZndqpuuIHZrCOTrZ/Dv5opmiFlI7yzHNXrqX62/0JJftfhyhy63tkmpcr2ylp6ZfQYTwRe2X55PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987746; c=relaxed/simple;
	bh=OVBlCq7wdehsJYij7F5jGJpGGIG/63DBMElonJ8+ksI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iHpuvQHvmblmrZaafZmnd3xVjwPgrwugrm6j5kCITXQHafgoPXATigwBxymxXwhSC9vZIuTtRsdhP0hxdL2fcsbZap+MDuxCLpb/pRJRhrRm+dpgGXD3A/RX9l1YqB9WwRXUt0fGrSVjnQaYtPidDTVhNcmvYEIZRxoQFhkWTec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASc5+0TT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASc5+0TT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD78C4CEC4;
	Tue, 10 Sep 2024 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725987746;
	bh=OVBlCq7wdehsJYij7F5jGJpGGIG/63DBMElonJ8+ksI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ASc5+0TThmRIqMYhqhCpMHdu1Ak3qN/Spnrm7XiTJZQklStsq+fgu+MmFnfK3eYUl
	 L7hF3/4piwmCI0VvWwZuRu1jOafcXKJbIEee60ne+R++0RjB1aWeJTFI5haxoRkM1I
	 Ztpwt0Fn9YWlBoYJpTYZKxHfpSSmth9PH5xhbQlO8vKXYiKMLho8zQznlBHejucKhY
	 SGiP2SVdQUpa0o+lzEjtwrSRn+l1x0mQhG82/X00GmM+DV9liNgpRxrZPDcEMqt+Pl
	 rkSvDrSOOo63Agc75ODkOyVh6zuE3zZCGDLIgBJ4zQ+0SgUP8fKlu4ZQWCz6t+yjyS
	 zz8o09OL6Ls0g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240908124124.1971-1-tangbin@cmss.chinamobile.com>
References: <20240908124124.1971-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: soc-ac97: Fix the incorrect description
Message-Id: <172598774446.662466.4403563522756157528.b4-ty@kernel.org>
Date: Tue, 10 Sep 2024 18:02:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Sun, 08 Sep 2024 20:41:23 +0800, Tang Bin wrote:
> In the function snd_soc_alloc_ac97_component &
> snd_soc_new_ac97_component, the error return is
> ERR_PTR, so fix the incorrect description.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-ac97: Fix the incorrect description
      commit: 86a7f453e99c3c202ac1623557e4f57bd73fc88c

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

