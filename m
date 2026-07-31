Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BB636B931;
	Fri, 31 Jul 2026 19:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785527663; cv=none; b=qCqtHUIXHtI61AWoQn6vrDRTMbGqFuHbYKD0LPVr8gmvwcboEeAcprKKpmAyvtxCsYfgs7sU2lr4LmC5mPEFGSBxyGHbkVw9J83huYzX1NNNdoptKS5Q+remLwcZdWckZ2Grh9aEyZDF9Zljte5RPuhvwdatJwy5NbO+5qA488E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785527663; c=relaxed/simple;
	bh=RCrspKnas0bPHLELE+6b5Yn+KCCg1h1ao21nyGEirN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=krErcBDBrS3a8DxX+Ai0DaPZlOxGXtb2pICzX4YAzNO9d1WY5sMulk3MbnddUikmZqFHOF3oP3qg3WrGP2tP6lYKLY+dVMUqAkFRD03xe9h8eosQGnecvDLEFrlnL2W3t7GYrwzr1jPG+gEoXWhf5PjADnIP8HSTtNUP7M1oBmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLJ38pde; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLJ38pde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFAC1F00AC4;
	Fri, 31 Jul 2026 19:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785527662;
	bh=kNd7yCRQCyUy33P48M3I9zZWFi89s7+hG9/3eE8gT4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RLJ38pdeBUPcDag2Iloxl+7rsXKZ/XRHqBZmNpRzg1pw6EhiuWRSfzotQrVvO5nn3
	 Na7gjkN8cYgGIe/MvNv/g/5M2g2hsSZspH4MLNdwPt5PsFVfarRCWV5llR0+VL7GvJ
	 GaQmx3DrXZLcbwD1mLHHr7jJXYeoYvzw0m7cDHwk3L+TWJCmbylpESnSf+lCMPSCUw
	 jJEzD2ewpTEBWLScC0d8PPFb6Wk/fb3HGvjchfTBU8HvURzMJ5Hq2AJSkPDZSXufP+
	 GcBb28FvkeZ/EW70Z926NvGfsTW80wVRfU5AJGF/I3/BPWwdlGZSmLvXETfRRAkpOy
	 z+KRb3HqV3P1w==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, tiwai@suse.de, vkoul@kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com
In-Reply-To: <20260730012518.2180906-1-yung-chuan.liao@linux.intel.com>
References: <20260730012518.2180906-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC/soundwire: Intel: reset the PCMSyCM registers in
 hda_sdw_bpt_close
Message-Id: <178550070237.136247.6235141972590838656.b4-ty@b4>
Date: Fri, 31 Jul 2026 13:25:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RCrspKnas0bPHLELE+6b5Yn+KCCg1h1ao21nyGEirN0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbP1rACezswv/c8AK9HUPR7G/VAB1iGjS90IPh
 vwti2uMtHeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamz9awAKCRAk1otyXVSH
 0MCqB/0WlP8W3AKqhz6ZtS42+q1yThprPLMRRP70xCbA7oZOB82hRkp/muV7tl+zdldm8lzlxKV
 g2KAXLGOaj13l4+6F9XgiGBW10S42y+qxQOEiinZcliSL73mrmClNQwr4WFCwePtlhOdpvj9QcK
 AF/BRZdZ3NREyM3VHwO0lZvyBHgjrtt2RT8lY7cVkmDuyK9tbA5H1e9v/I6HzR3S+VtrfIezDa8
 MWBiB0g3FRuIazkknZbb/EeUsEXVkkn4033lOz0Z4trsXq4EGnF/y8opOVAy7d37wVunoXMhVJe
 j+C8ce6rpFBZvXiQrrtgSJLBUrEn+/sKEyVcJcHhCPlJ6R1c
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Jul 2026 09:25:18 +0800, Bard Liao wrote:
> ASoC/soundwire: Intel: reset the PCMSyCM registers in hda_sdw_bpt_close

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC/soundwire: Intel: reset the PCMSyCM registers in hda_sdw_bpt_close
      https://git.kernel.org/broonie/sound/c/992eb0dfbc4f

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

