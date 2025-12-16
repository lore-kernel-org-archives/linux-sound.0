Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F300279DAE
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765914919; cv=none; b=KyUHV/tctZDuj2PbLd49RUnyQ1K0m9rnTBeU5jSkfdWwzlBOJlRgoNNueMQvSe1AyFQx+f2Wy41SjaQbuJJpm0obvf+Pqdq63vztY1KWXKISdTSvWcOXlQfELc/yD5q7von6FwhDMwL4rr29XOdka7F6/tunitnjK6aAo5UXgYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765914919; c=relaxed/simple;
	bh=ygHrWzRVINoS86YdYNtnj7uyaOkyD2Z7pbl8R/eHejE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HnNqKzbW+pxmy/KDUHaC5CJ6Y/UivClPmlXjxlWGwOuod3Srp2eSdIaiIaMoOHQL6BYR9purjdPZUcDmsAZhCaNcmsT5HhQVV1ZOUfJtB7qcdvB+6K73bHzJDrqUeuCSx3QD4YI/7kkH/erVWSO3D+AnxB03qXnh/atLyV6KHa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0pvxdi1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0pvxdi1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A58C4CEF1;
	Tue, 16 Dec 2025 19:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765914918;
	bh=ygHrWzRVINoS86YdYNtnj7uyaOkyD2Z7pbl8R/eHejE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B0pvxdi1eorXTDlPKVupjbv2rOEBrOAKr+83RtVxcYmGmgqL6Bkq2WkKbycjqWprP
	 NGF2MRBX7zbh89NfSR5+o//w66EU2AgYkA39MyBQUkhny55hItgq9MST2Nj8MsuRrE
	 ZxzuhvbQ2S+LlPfCTmiurihNB8bw6wf99gSB4DCDEGr/EG9RuRaSS6RU7HfQJsfyfY
	 7boS3jtQWX7Vn7tmH/4yR6ijLtTyxempigcYiHYjRxHC4G9mjQz22p0VXeGnU+AFZH
	 JtcgIShJIG/AtPom0dKUq/oYKD8InYCbQos3GDhSf9DcRhreWPA9wXDXmvtQDCO1fh
	 iNKYKHzM0EsHg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
In-Reply-To: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
References: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: SOF: Support for on-demand DSP boot
Message-Id: <176591491676.218242.13642755018656624745.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 19:55:16 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 15 Dec 2025 15:29:38 +0200, Peter Ujfalusi wrote:
> On system suspend / resume we always power up the DSP and boot the
> firmware, which is not strictly needed as right after the firmware booted
> up we power the DSP down again on suspend and we also power it down after
> resume after some inactivity.
> 
> Similarly, on jack insert/removal we needlesly boot up the firmware to check
> the jack status, which needs no DSP/firmware communication.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: ipc4-loader: Remove redundant rpm resume_and_get from load_library
      commit: b8e54b447cdec234f0e0d80487af9540063d17dd
[2/8] ASoC: SOF: control: skip rpm calls in ext_volatile_get if not implemented
      commit: 2c77ff200f59103ecdee60c00818a43cee38a6b8
[3/8] ASoC: SOF: Add support for on-demand DSP boot
      commit: c3e1549811747e4b4ff7e4bba691980d9dab2d9e
[4/8] ASoC: SOF: sof-client: Add support for on-demand DSP boot
      commit: 2cf7a9ced3c1a999f7de8711cb2a212557fbd800
[5/8] ASoC: SOF: Intel: hda-sdw-bpt: Add support for on-demand DSP boot
      commit: d4e34f4ef88fc48a09b654bbe1b23c6788e7844a
[6/8] ASoC: SOF: Intel: pci-lnl: Set on_demand_dsp_boot for LNL
      commit: 6780fb864d5b80f20694c9141036717b23190150
[7/8] ASoC: SOF: Intel: pci-ptl: Set on_demand_dsp_boot for PTL and WCL
      commit: aabcb01353013d38533ba4346b6ca84bff1b96f0
[8/8] ASoC: SOF: Intel: pci-nvl: Set on_demand_dsp_boot for NVL-S
      commit: f25c7d709b93602ee9a08eba522808a18e1f5d56

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

