Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440871F76CF
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733244998; cv=none; b=C3jWjiUrseNiYwvitNQhe/IGLF633CQe+3tXldvpp8A+JUjmO7/M7Pri1HsdVD97mk/RFtpDXeiVC8eqJ4KkzOZHGmAIlcNLSCjP+zUfHbQf8G3zGyfcKMUrTuo/e/6PxPV+OOJWCJVV3WmQxlKGeC0r3f49Gl0O/Re+J3HJGao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733244998; c=relaxed/simple;
	bh=AziPVXvM/AieZ88D5ReKLVLDH8wD77pwJ2tmh/rLwkY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Mt34RU4+NslbP49jKhM2N9RLDR7RaWbAxG26JK6GGKZ4IzAyeokNQMt9xDZeI9Rox0eK4XT7OLjPK8fxvvQq7kyQPzMfA43tiGLX91zPW81rtbbLCXzo842uM2AcuRpdmv439hNYseNgmL1J5nfPUu6rNXZe5z6qrGYCCs5UwhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKA6vJV6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKA6vJV6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA53CC4CECF;
	Tue,  3 Dec 2024 16:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733244997;
	bh=AziPVXvM/AieZ88D5ReKLVLDH8wD77pwJ2tmh/rLwkY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gKA6vJV6/Ou1w+ye8hlBBIt9O/R1X4ulgqn4vjqxrvIVzpWUg7b/XG2Cb0a+5NEJn
	 g199jyWxc/oFoSnAWBRlZvaesr5lyxUtQCFScokrraDfrFmVwDNwncuVJ1sBozL/jq
	 j4m0NklTQqZAnlOP86PFRfj+VV6rSt574y3EBmujT8nd01VbEB9nQx0zK+U8ncHb1h
	 XJX7xpSB4zyogMCU/XbKweQH+cclQI6LV/GBXT0MPEgHLduGNPbduPt8zxlyB/TSqK
	 UYaaKKnQBNtzqClnBVSoJnys8CUPzsB/Sbq08R2ZLzDHf9582/Cfsgdm2hlnooYFDN
	 K+k+Fnz1RQdcQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241203104853.56956-1-yung-chuan.liao@linux.intel.com>
References: <20241203104853.56956-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-dai: Ensure DAI widget is valid
 during params
Message-Id: <173324499649.445589.5892637686983493874.b4-ty@kernel.org>
Date: Tue, 03 Dec 2024 16:56:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Tue, 03 Dec 2024 18:48:53 +0800, Bard Liao wrote:
> Each cpu DAI should associate with a widget. However, the topology might
> not create the right number of DAI widgets for aggregated amps. And it
> will cause NULL pointer deference.
> Check that the DAI widget associated with the CPU DAI is valid to prevent
> NULL pointer deference due to missing DAI widgets in topologies with
> aggregated amps.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-dai: Ensure DAI widget is valid during params
      commit: 569922b82ca660f8b24e705f6cf674e6b1f99cc7

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

