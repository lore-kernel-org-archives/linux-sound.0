Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCC0266B52
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750419154; cv=none; b=Gj8035eRDP0KYVFejCouxvytTvAgVpuw4bVOP9yj3qCCeWsV7IbLEdPeBr0HwZ6eGIH7A5XlMKM7huPMo8OlJO/nLhwsAto2ocOCrr2lrjOz1AE4x96tvEGqmdLi0gW0H3t9+aQ8doEn8XuDy5JXjfC2XAxs3IJt8h702ySL/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750419154; c=relaxed/simple;
	bh=Ir2mcXVoAvfH3YL8g5loVbH+kTfF9ORLEBDBXVtPj+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RCjum5J2udkqR4dK0th4liWbvr/9F3Qae/IQPooInPzgA66c450jVXBkHkCSLyTlSuldbBYfuR73bgOXx0Jx6NrP58ska899tsHRuVz892UtW2ryKviR/ZiagJbdraqJU2m8UlAnvh3oqEtw/aPDCXIb7ooUQCJaSBnGgGtLWEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmGEneML; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmGEneML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165ABC4CEED;
	Fri, 20 Jun 2025 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750419154;
	bh=Ir2mcXVoAvfH3YL8g5loVbH+kTfF9ORLEBDBXVtPj+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HmGEneMLpoESmeedxQNwSAQD2pX8zIotNmyhtr88zWjYj8oUx2+EzAQVcQnpaWVvF
	 QyFM3+RaqK06n68nXm2W3CT8R+tSA4ZwD/LEGxNgZe5BaVcu2AnhymjddaEVmXp7TO
	 hU8A35U2Tgu1kx2RwIMiLiNT/W25qJsCsbl2O1EpYO/r3B+NwmUbhdPv4ngxua9c5H
	 N5bHKlvhsFR0yP9icorKMgiOAI61mfpO//nuEqTnA03xgCUbfGjt6AW6S59vns2Xrd
	 mLHkVGv6m/J2GGgdxmg/IPGAjNi75inZKH38QRN/hFaluttJfMM/0AHhoP3hPlp1bW
	 z8t3FKJu4TwXQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, guennadi.liakhovetski@linux.intel.com, 
 liam.r.girdwood@intel.com
In-Reply-To: <20250619105623.4546-1-peter.ujfalusi@linux.intel.com>
References: <20250619105623.4546-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: ipc4/Intel: Support for partial context
 restore
Message-Id: <175041915283.41098.2329825317228918261.b4-ty@kernel.org>
Date: Fri, 20 Jun 2025 12:32:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Thu, 19 Jun 2025 13:56:21 +0300, Peter Ujfalusi wrote:
> The firmware will be able to only save and restore the context related to
> library management.
> This means that even without a full context save, the libraries do not
> need to be re-loaded to the firmware after second or consecutive boots.
> 
> This is reported via the FW_READY notification, where BIT(15) indicates:
> 0 - the library restore is not done
> 1 - library restore is done
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc4-priv: Add kernel doc for fw_context_save of sof_ipc4_fw_data
      commit: cec49fa47bccadb288fd984ef2a5c45e8a2e2099
[2/2] ASoC: SOF: ipc4/Intel: Add support for library restore firmware functionality
      commit: ace9b3daf2b4778358573d3698e34cb1c0fa7e14

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

