Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0D918A6AF
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 17:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111169; cv=none; b=lMDxtAFj/+iklT0yt7vZ1fIcP+gnVmVc8Z5GOJet3k8/4lYW7I+jZtztlxXk974Nvxb2lLWrJ5UPC9Yw3slBdMDlMO1W3Xqe4PN1+BOFXuEfP6n+bBOvk0d8/W8nkcEgRJZwJIOjjyIqheBm3hZJj/HR0rryigCYo2LZqz5SJjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111169; c=relaxed/simple;
	bh=zVdSZwdE8eGUZjKb3vIq2wuVOXi2kvhnaZpTpec/IdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xvutohw+d3QbBRf7Xr0WlHLPC0n1ubEGDQoCYL8JFwWCGipR88ZonE3+qXVbxirU8vCW8/s0g/ofseNLO+HSz4p1UbQOl/wLD6CZwJR7Ka52NCgVHGFxSOe9Xo0QeavRsQ1HYyUTeJsB6RzLU0KX87wwNvcAzNASAuXfqUB3cfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZYMH2QA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZYMH2QA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4894C4CED1;
	Fri, 13 Dec 2024 17:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734111169;
	bh=zVdSZwdE8eGUZjKb3vIq2wuVOXi2kvhnaZpTpec/IdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gZYMH2QADa+6f+sZmZXj24kipI5MdZ0lM7SRHHC1ihbIOsolJ11wmPRhidYR5JhR1
	 +8eVAdRqhr9VWeqCnz2By2ZduxX8z+fGhk9/GuCtyA4I4YBZj3U45gPdC5R+UK3f8U
	 vg585OT6mMk8e0/o8+qwNINOvJgq5U51IZmr6HiMuZVL8mhsMhRhCZC8U6/KScIE1d
	 9iFT8MrKcOb2eCCitm08xqrae/vZYVtc2cFozxEKCOeKJ/PMfVL9qZxWKHXSA9RFqv
	 Vqe5Dtsiv2INtkt/0hVQ2iJjtcgXTDeQTZqBO9jj56h57INGxcR52/bi8S70m2ISel
	 N6lssRqyXg/lg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
In-Reply-To: <20241213132110.27800-1-peter.ujfalusi@linux.intel.com>
References: <20241213132110.27800-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Use macro to set the
 EXT_PARAM_SIZE in widget setup
Message-Id: <173411116741.268962.5771733513498536678.b4-ty@kernel.org>
Date: Fri, 13 Dec 2024 17:32:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 13 Dec 2024 15:21:10 +0200, Peter Ujfalusi wrote:
> Use the SOF_IPC4_MOD_EXT_PARAM_SIZE() macro to set the param size in the
> extension part of the IPC message for clarity.
> 
> No Functional change as the PARMA_SIZE offset is at 0.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Use macro to set the EXT_PARAM_SIZE in widget setup
      commit: e4b3a8456447f0e10223ebaca81efabe8a71f3f2

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

