Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9D6426D12
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 11:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536812; cv=none; b=JcODTvc+E/KEbNKFR3wMZwauLLKxxq6gdavY41Cw91qdRDU4vbXjNShKdkj5YyukuQen7fA5Rbm8aUDJmxOWqvAISOhSzuuxbcm5DdVxRhHnBqvTUp7omA+111JNqHU3oDLyFiEFRq1ova+tGJGk0CUQh2ZyLZBHnb/1kQnxTsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536812; c=relaxed/simple;
	bh=egbgagJeXZ5bKbiqNj8qHmhiTxKsgutQKXjYEdy99xY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=efM30o9gso3ucbUP0mq5+h8jGcWxONykldcYmKyDU0qwmImxo6XW6DiYwB/zu6h/39IonS4/fqOkFFC5CL522pgY7YZODLkHNlUYryY9wZBKiMLXB78H28F06cHrXphAwsJTIB5galJyt+R09h0suD+j06AbitFpM30k5+H5CDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLiCWP+y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLiCWP+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3FDC2BCB0;
	Tue,  3 Mar 2026 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536811;
	bh=egbgagJeXZ5bKbiqNj8qHmhiTxKsgutQKXjYEdy99xY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tLiCWP+yujitx+MJtF6hTpcBQMyqB8KYFpbn88B6EZJC1HgGvA+fQohhBGqEYoMNG
	 LXl5JIXEcV43qUOKsSJgSN+F5cFluXZ0ARaSOofa0ZWYWbScJnPxQPHlZPLbPsOLEA
	 LHP37P/FtbwkaivUrrP+t+hXoqU/1AYzXeGuCWS7wD9Pp69b0jNfQTWQbaI85pyDFp
	 LZQ9O0lvyz92XNY+vhn4rdnh7zCHwXKAEpe0LzxhHiZhYw0bv7r/cENbcuErTZRHuW
	 mxdZe71bh2fy8OryluesXB93VKFXGnHZmGa3PrCvUfi+edh+IryvXLdGAVm+myyKY0
	 fZ02GhQpuQywQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com, Deep.Harsora@Dell.com
In-Reply-To: <20260225135004.2322987-1-yung-chuan.liao@linux.intel.com>
References: <20260225135004.2322987-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: partial match the sdca codec name
Message-Id: <177253680986.22767.6622192698211356683.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:20:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Wed, 25 Feb 2026 21:50:01 +0800, Bard Liao wrote:
> Currently, we set a predefined codec component name in a DAI link. But
> the codec name may contain an index which is not fixed. This series
> suggest using partial match the codec name to fix the issue.
> 
> Bard Liao (3):
>   ASoC: add snd_soc_lookup_component_by_name helper
>   ASoC: soc_sdw_utils: partial match the codec name
>   ASoC: soc_sdw_utils: remove index from sdca codec name
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: add snd_soc_lookup_component_by_name helper
      commit: 98eb42c7de6b0185c914df4cca61b49ff76821ee
[2/3] ASoC: soc_sdw_utils: partial match the codec name
      commit: c5ae3d8bc968a28aaeefbb772ec42e50cf3a15f0
[3/3] ASoC: soc_sdw_utils: remove index from sdca codec name
      commit: 34b4fc44e4f904fbb81335d53163ffdcb0180000

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

