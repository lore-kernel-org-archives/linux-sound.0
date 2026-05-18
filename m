Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C4C36DA1B
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116925; cv=none; b=hrsyIir9+HYkycKimJGY9N50IGZaZXcy3268LAQ53YOS8GcOu5dzWjzQWYsQPPpf3MVF8WWC1AFprZ0VI1qgcPfwGb9swOQycggUd12UdecgPY3GOabH7jJvsZyJm8HRUOjNKpvgGuvb+yYG0hYzqy/icLgv1z/dBxeAVxzD9UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116925; c=relaxed/simple;
	bh=VoY2F98Ja47w/lzXBH/qmAGmR8ha6wjHoj1/4jZebFQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cH7Y58edtHJIZAkBmg8iKhpcmV15JD+cW2uKAPiLD4D3pr+Q6v57+D6UoDXFM0gWaJCAqMR9xq3xBbexlVOG5kTtktuROxvoqFVviqZTOchWDwsjUbgYcKjJYZys4usd0pqcN2QaHS47EEDZgg1eroGtyiGbqZ19pWZpYCr+Xpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdEHmA3E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdEHmA3E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254F8C2BCC7;
	Mon, 18 May 2026 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116925;
	bh=VoY2F98Ja47w/lzXBH/qmAGmR8ha6wjHoj1/4jZebFQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RdEHmA3EVrovYK5R9kTUNhPh6cv/YfY8hjQeMXUSQrCScYsAEAaD+kjW3THG+Flyb
	 3+FB/zhqDEAmKL+9ojXjP282IXM2adabwCJN25uFDdPvnwiexKirpczjMIDC7JVAgE
	 eBjR8S5Wog61Hfrw/ORXuWUIzgBXDu4+r1F05qbVD3hcL78mQgbFxFmpoA27T+psYC
	 8JUMh9OP2YS/gZy5bqkx629ZPM2Uk6cqB/Ii2m0fa99+dPqSYyQOgR0aVSuZJmlqJC
	 4nXBclyxS/9WueaAygTmCnQiq4Z9o6jBMfd2o/7+GWHzsULA5YDsx0R/cODqq3jm/I
	 ZkxaVVRMcf1Yg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, linux-sound@vger.kernel.org, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
In-Reply-To: <20260226073534.3347-1-zhangyi@everest-semi.com>
References: <20260226073534.3347-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v2 0/6] Add es9356 focused SoundWire CODEC
Message-Id: <177911692389.295433.2232158303889570346.b4-ty@b4>
Date: Mon, 18 May 2026 16:08:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Thu, 26 Feb 2026 15:35:28 +0800, Zhang Yi wrote:
> This patch chain adds support for the ES9356 PC focused
> SoundWire CODEC.
> 
> v2 -> v1:
> 	-Adjusted mutexes in the ES9356 driver
> 	-Use macros to replace certain values
> 	-Adjusted some ordering issues in Kconfig.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: sdw_utils: Add ES9356 support functions
      (no commit info)
[2/6] ASoC: sdw_utils: add ES9356 in codec_info_list
      https://git.kernel.org/broonie/misc/c/4ff4fc6fea57
[3/6] ASoC: sdw_utils: add soc_sdw_es9356
      https://git.kernel.org/broonie/misc/c/5d03a4f35710
[4/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
      https://git.kernel.org/broonie/misc/c/5d9cb740cd38
[5/6] ASoC: Intel: soc-acpi: arl: Add es9356 support
      https://git.kernel.org/broonie/misc/c/25b905940832
[6/6] ASoC: Intel: sof_sdw: add es9356 support
      https://git.kernel.org/broonie/misc/c/f1e35606d618

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

