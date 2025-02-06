Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EFE1DE2C7
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874673; cv=none; b=nwOt/xOvlZ4lljeMc/KJ+Y6EYZR91krVtSY9LaEDZ7aEq2i5e0Pk6Lw5vwBYLvo7jmi0zhuUU/5aHggowVkyndY/A4Ix/IQ4ilZiXQtoyn8QFlDJvXULKGdIDbfe3eGm8nJgXyJQwModE81Ds8NLK+2m+y0QsqnWox0BtRQIB0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874673; c=relaxed/simple;
	bh=Mq/aRjSJ0H3bW9Za8N98WT0U1d0sHRyfta5GAMn/uq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QL6VRSV3kPsvdT0WlMB+lwnSPErpCRvZIFThxlOaCETsNJuQ4RMN1o8ckMK0nmwQiWfisj/MbwFesSMJ4vndLAKt/iziVziJkAxi+Rty1I8UqzEFEv2V2/sSypQtENCGn3fV/josB/1w2/+Di5LoHL/IWFURlstQB68i/DydWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csTSR7IH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csTSR7IH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69AAC4CEDD;
	Thu,  6 Feb 2025 20:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738874671;
	bh=Mq/aRjSJ0H3bW9Za8N98WT0U1d0sHRyfta5GAMn/uq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=csTSR7IHb3Da4ZvqbuXYSjNK2Sm+C9OTV+6pk5n5U6NZXe4wITHQr7HZPAsb96iBG
	 uqiungjL9sYJVFdio9ybY14nLTT4edxgZ2LTsM33xjMCBkE2Ktg10YHOJh82c13e7m
	 IPbGrhSrKA7QwixMVu5EDScRUSS1YY4d6xYkCdrBwB3VEr83MQnk3gBWC56iZLWtH0
	 O+g5VqhH5CuRS8XmlkchKQ+s9OvgcLK8WRy15IFNHPdZ5GOkTZkomzkqnkUNCmgxYf
	 0WZc+u7QWm52d/gbecqozIaXnb6B/LgjsahSVRapaE0EW7+bBK+gPX9VJ1hw1NmMg0
	 k+Rj4yy0rDMow==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20250206094914.21135-1-peter.ujfalusi@linux.intel.com>
References: <20250206094914.21135-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-pcm: Move out be_rate initialization
 from for loop in fixup
Message-Id: <173887466965.363675.9146645364141744796.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 20:44:29 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 11:49:14 +0200, Peter Ujfalusi wrote:
> Instead of initializing the be_rate within the loop by checking i == 0 at
> each iteration, move the be_rate reference initialization from the loop.
> For BE single rate check we will have single comparison done at each
> iteration compared to two in case the num_input_formats were higher than 1.
> 
> We still need to run the loop from index 0 to check for FE-BE rate match.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-pcm: Move out be_rate initialization from for loop in fixup
      commit: 5ea46b4360791345bd0bf4c7bf8fff5151374ea1

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

