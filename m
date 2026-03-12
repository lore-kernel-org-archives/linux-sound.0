Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B4E3F99DB;
	Thu, 12 Mar 2026 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336887; cv=none; b=ozRkq0VmRIcHvUcdeFbpgStkU9s88sQ41+tIlS7GGyzifiXmBAlDBLlkozSEcig3P/6ROibCyWfwbm3f8a9fVZY5BNJ5QHwUryvBJEKWfzriDtUkNZ7IqCBcw4zntmxtfc8vEdEGD7wQzRznX1WDMqGjH+2PduSWMQMSC3jjE7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336887; c=relaxed/simple;
	bh=+sDX0nZTz7G3iewP7byXnUpGAi/xcHABbYOl+PvDl7w=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=feuyxdlGCP+EyB36R4RZyM4dElBkHylf3W4fUV+oAldqpBrIfyG7Wc7k3+D09av7OLWcRKtfvHb154It4Q8KvS4et7COiV8+DWSxG8wDTiB6G+zieWTDG3gIVH6h5910CLz0myFhMuWTCMnY0lGeiXdbabpRYRnQTHsrJi/A8AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKb+WTyh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKb+WTyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BCDC4CEF7;
	Thu, 12 Mar 2026 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336887;
	bh=+sDX0nZTz7G3iewP7byXnUpGAi/xcHABbYOl+PvDl7w=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=WKb+WTyhLLO226hEa7IxsGIegwpL6r5ihWpMvvgkVAzW5WEHXo/TZn5EDmvOJNHjp
	 TQ3IuMXMwWZ+jKzPTNhKB90YJ7yKK8pRFnIj5rlLISZT9aG+gjSIgx6kArfugmX7qX
	 yjVPVF1BqoUntZVDhrlgkEKJbyvg5mHKyL70fCHnsWgk/OXiZLY3ld3HnSE8ASr/89
	 uqy7OCwcDHQS1/buno8xP0DCUhRbTrvCn239+Q0DzUiE9zWo8yKDwQV6CT4F3UBCNW
	 kWBrFM6FsIS/tuFrgygguYgO8SSUAGa/B2+0IpSXrBnRR1zKY92ZlM3w9vtMIsEkhz
	 +nxEda8vB2ACQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260310104235.1234569-1-shengjiu.wang@nxp.com>
References: <20260310104235.1234569-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 0/3] ASoC: fsl: add bitcount and timestamp controls
Message-Id: <177333688509.302961.7348877736206320073.b4-ty@kernel.org>
Date: Thu, 12 Mar 2026 17:34:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Tue, 10 Mar 2026 18:42:32 +0800, Shengjiu Wang wrote:
> The SAI and XCVR have the timestamp counters and bit counters, which can
> be used by software to track the progress of the transmitter and receiver.
> They can also be used to calculate the relative frequency of the bit clock
> against the bus interface clock.
> 
> changes in v6:
> - define FSL_ASOC_SINGLE_EXT and FSL_ASOC_ENUM_EXT, which are
>   SNDRV_CTL_ELEM_ACCESS_VOLATILE.
> - return 0 in fsl_asoc_put_volsw, fsl_asoc_put_enum_double and
>   fsl_asoc_put_xr_sx to avoid control event notification.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_utils: Add snd_kcontrol functions for specific cases
      commit: 819cf1dc01ce66b6906d403a6925c4bd754a7a1d
[2/3] ASoC: fsl_sai: add bitcount and timestamp controls
      commit: 8e27987a208029c39da7a787bd9f1217d42011a5
[3/3] ASoC: fsl_xcvr: add bitcount and timestamp controls
      commit: 7b3f8db159f710d432c4edc024fcefa9e62e8b4b

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

