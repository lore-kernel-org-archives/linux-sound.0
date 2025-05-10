Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673661754B;
	Sat, 10 May 2025 01:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746841784; cv=none; b=AtVZGr/iT1bfcUu+AYv+QdDTjc6s+zz6nM6kazssOFKWaN+oaqfvTNBOTSBXBvRowmDarmtaAhdfduObjCekXVt85lO0pEGL2Iq9TXXqXAePgYLzO+1PNOdTgZE+JcvPIgs+UuW6qj083U4xr97ldPa65DKzNZABWGv1NTABSHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746841784; c=relaxed/simple;
	bh=9Z0i4m5JVGHuD1uDoV/vrR2Edy3N7x0sIvdIReaGiYY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pQ/v/fDGEy99O4CCwummzp1ohBvAKHy4cLeSpDHRHQH7S2VV5sH1tAtj5FeSObGDqC6zsJ/x3/B/DYarGQmaaHheprAsd/qM7xGCLvH4mjC4lOgfM/CXupeB9FNWeHe0yhmiF/72BN//6tFqyllE4KYfZU79+rOqMMnWkQdK8YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tx4A1I3f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tx4A1I3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040F7C4CEED;
	Sat, 10 May 2025 01:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746841782;
	bh=9Z0i4m5JVGHuD1uDoV/vrR2Edy3N7x0sIvdIReaGiYY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tx4A1I3f4KBIGtf5V3UPw3W6IUvD2hqODCQXr+lDSquOa7/FkI7e3YphkONj5/icC
	 9ipj56WhfwuEtUfCMODduntO+8pg5YC79c8M7MmaAr6+sdpEi4flg0kwP1U66vV77K
	 PoT6cc5EmfltWigFsD/kNKAn/P3KeJudvUxyUKUSQVIacrCTMzK7zuRRTyonttrxZ3
	 QPgtn3q3oGHD86H7paU2hzrydNqZR78i5IeGD7iV7Qp6VnHFyfCPRssjmQ+wNjJGDh
	 yhcr56n36+8TgefSVcwIec4XgSIBY3WAcg9W36LCmOxW7DFmpxLOY6khRXG84G4FbV
	 3bob2AWtZ9+3Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, stable@vger.kernel.org
In-Reply-To: <20250509081308.13784-1-peter.ujfalusi@linux.intel.com>
References: <20250509081308.13784-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-bus: Use PIO mode on ACE2+
 platforms
Message-Id: <174684178080.47320.16406655093101329608.b4-ty@kernel.org>
Date: Sat, 10 May 2025 10:49:40 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 09 May 2025 11:13:08 +0300, Peter Ujfalusi wrote:
> Keep using the PIO mode for commands on ACE2+ platforms, similarly how
> the legacy stack is configured.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-bus: Use PIO mode on ACE2+ platforms
      commit: 4e7010826e96702d7fad13dbe85de4e94052f833

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

