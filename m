Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E8C23B604
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647480; cv=none; b=ZyO5mSj6fwQ/0BseFyel0blE4VL7MLS3UVhVy63Sgbtu+/Tj5HT62akeF/JSYGgYQzAoOHF9peG0YHTS5lSg4EWt//xE76TAxIi9Hf3KBvHt27DH5S2HDbNGALgNpDHudA+4c1e8f7Ym9nYjriVI9qYDRuZ7/3bSmzHiUt0wa8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647480; c=relaxed/simple;
	bh=NN/3+vqiyyp0BF4TYI2l+7hIEueYV1HcsnIVhTQjBEc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V0q5f4NNqJm6aWmzf9UYrbEAXTW3S9j4jxaqrYv3KAI6Qg4G0KU3RbrhixoeSMl9hBYDmJ2CooxoCCETQBagVlXOEDVcfQ50zTdeND6Krx4su/Y2LNI7IKJTuaGt8cIgOZG85/XJGOe5dwEf7ujpmRNSnTZ8OW4Zx1lNivT1aQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUNbFpZY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUNbFpZY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7A4C16AAE;
	Mon,  9 Feb 2026 14:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647479;
	bh=NN/3+vqiyyp0BF4TYI2l+7hIEueYV1HcsnIVhTQjBEc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DUNbFpZYrcFBWFXsKIp5/46HHWgQne3lExCPqny1bCHRf+Y35ppulp98d0MLOtSpm
	 K/HnvRDZcVrd2EQqAX2WDf2KdphqcpCn6Vg8a61iJLnoweAQod0GgTwQxQj9gJXLcn
	 R5329oazgEdACR27A2HKDQj/VuIub0nvns3njGplzZCgsfEk4B+rM2xRx4LHOLLRmS
	 KjGHyNxtb5cCa0ni4I1enb1uKxFwfGvWwrQtEyMrPl1oe+Wc1Nncd6xBbOa1Vq43CY
	 z55siSUurNgtquokoWYYmNqRxme+f8K+nFoyFm104rgS7sS/a1spoSxccHtyG81QX2
	 f43t1LnrH6uAQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, dan.carpenter@linaro.org
In-Reply-To: <20260209120239.6066-1-peter.ujfalusi@linux.intel.com>
References: <20260209120239.6066-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-control: Set correct error code in
 refresh_bytes_control
Message-Id: <177064747648.790819.16946421098014461490.b4-ty@kernel.org>
Date: Mon, 09 Feb 2026 14:31:16 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 09 Feb 2026 14:02:39 +0200, Peter Ujfalusi wrote:
> Return -EINVAL in case the scontrol contains more data than the amount of
> space available for it to store in sof_ipc4_refresh_bytes_control().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-control: Set correct error code in refresh_bytes_control
      commit: f8f774913b4b599169381073f6674e20976e5529

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

