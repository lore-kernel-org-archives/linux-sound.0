Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3CB2D4B61
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822540; cv=none; b=GcD7OUjwX3AoEbuRX8NZK0ZttcvLvuYIh/OQ83dnY6cchXHJHpqo7rG1XhfHd4CpvV48m4nOlCxbHSGaCkcGwZqDkUf+DkbSLLP1jO0Jp4Dp8sjoInOwiURoLDnp/rNZ68mRLUOKALDVm/GSZ5NJqRvAahM/haEmC8zCfyWdiUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822540; c=relaxed/simple;
	bh=mZgOfDQ4SR1uo0DiKaYtH2o5JmThDJJrrPw+Gg9pQ+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EphczX2YAKz3IftfVtF6llbs6sDWUrqz1R/45Xx0czvwjC3fQRqP2rivBzkse3QlkbtOKi3j1+iHxOVhk+CCjEMoHSNPQ0JSE8PkL/byDTNL8XSoEhLSFv3NTuuMTPIjfwpfLvhWulERyhLvjoOYVOIQSHpXY0hG0DpKpe7WKK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsvg1nB5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsvg1nB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9383C4CEF8;
	Thu, 30 Oct 2025 11:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761822540;
	bh=mZgOfDQ4SR1uo0DiKaYtH2o5JmThDJJrrPw+Gg9pQ+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jsvg1nB5XwliVyzx2xlZ22ul5DY/5OCMkTN+58pwAJfK9G4Sn4h7FsEwcXpXpXDGg
	 dv9EI7NcPLn1Ei6YUmk32esWABo9/PuD5pIll1oUzOI4a2iVqI2VH7WY4mjgoqv5JD
	 QR5iay0RbKF//CfWqrAvbKZhMCk64TOYkR1PujUD2+uzztbtVH5Mai645dvDt+zRDo
	 o4j39/V0dq6OtEpKU0gB3XLJb+U3QJCOQuPXBsygP8P32skPzuWaT71qjjlDcFeEOn
	 IpBYISr0PuruxDywifni11OqEYBlRZ75zCFS/kSZpP+PvELoc/ZyRvkENpPZhFoFk0
	 8TtrWjFAuN6ng==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20251029040344.1116201-1-yung-chuan.liao@linux.intel.com>
References: <20251029040344.1116201-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS in
 SND_SOC_SOF_HDA_GENERIC
Message-Id: <176182253861.10093.4445070627387019115.b4-ty@kernel.org>
Date: Thu, 30 Oct 2025 11:08:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 29 Oct 2025 12:03:44 +0800, Bard Liao wrote:
> The "ASoC: SOF: Intel: use sof_sdw as default SDW machine driver" commit
> uses asoc_sdw_get_codec_info_list_count() and codec_info_list[] in the
> hda_sdw_machine_select() function. Select SND_SOC_SDW_UTILS to fix the
> function undefined issue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS in SND_SOC_SOF_HDA_GENERIC
      commit: 2b4d53eb5cf32c5b7b7616f23f08471fd8b3708e

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

