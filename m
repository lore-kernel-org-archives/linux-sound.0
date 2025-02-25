Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB02183CB0
	for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 19:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740511962; cv=none; b=mgh5IL+4jfNhGEiaMyeFfNnheLFoCmX5BN4wVBiteva+mybMaga16WpN5FzvshLoz/26rcxEkAQqZJHkNXVovyz8gbMwJZjjGkw4DJz2K0zbdpuxYuh8hvEgwW99/ZU2OXuAZJQS2SH2qV9S1E3P9YuQtiBWIwIzYH4GUIju+4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740511962; c=relaxed/simple;
	bh=VVAetV0FJAo2Zz7yiuhRIRip/0eIdti7z4izGMtu0iw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jH1tyHhOpMkpIEIzBeQNaZHaOzqA0A/zhwI7cfHf6GoIXgWHVjDY9h3zcGkhTImwfI4QoU1doXUE59cu2NSHY08xNy8t3QrtfWsMaoP2GRSu3yVvL+kJ1zOXaT/KYV45v3sRgaj/k87OoEwkrBSs1z8ultTSa7rfc68OJv1sSBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCWU0t9f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCWU0t9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753DDC4CEDD;
	Tue, 25 Feb 2025 19:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740511961;
	bh=VVAetV0FJAo2Zz7yiuhRIRip/0eIdti7z4izGMtu0iw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HCWU0t9fa8U/1cjuUigHhUr5+nqmjNe1DUlKaeuLDwkerlUnPAgtIo5itYkvZ+s51
	 IKSwTdTsW1om3xzmQ17gkiDViGNHJOQ+hvG14Mp8IrtPVD95jfkf5QShPJyxVvbjSE
	 DuofwxAcOJdY2v3XCi1/Y8YuwneeSA2Txe2MMWhj+HKC1QA0WNZsHScbnScDXfBQ4T
	 +VMI9WRnhs2gv0OGi30btR41fvXzVUKe3dncyBsNHBife0hWWeTnSIVBEbyZKLcWhb
	 5L3q9TFmc+ifDYANObDxJV4NNsGQAF0c0hdRraICBEoRJ0GN4FRaZmxc/Y6/zIEyiC
	 3+gFMVDjVM2Rg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com, 
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20250225093716.67240-1-yung-chuan.liao@linux.intel.com>
References: <20250225093716.67240-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: don't check number of sdw links when
 set dmic_fixup
Message-Id: <174051196020.229034.10193588209583066159.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 19:32:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 25 Feb 2025 17:37:14 +0800, Bard Liao wrote:
> Currently, we assume that the PCH DMIC pins are pin-muxed with SoundWire
> links. However, we do see a HW design that use PCH DMIC along with 3
> SoundWire links. Remove the check and add warning to let users know that
> SoundWire MIC and PCH DMIC are both present and they could overwrite it
> with kernel params.
> 
> Bard Liao (2):
>   ASoC: SOF: Intel: don't check number of sdw links when set dmic_fixup
>   ASoC: Intel: sof_sdw: warn both sdw and pch dmic are used
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: don't check number of sdw links when set dmic_fixup
      commit: 56a677293509b2a0d39ac8d02b583c1ab1fe4d94
[2/2] ASoC: Intel: sof_sdw: warn both sdw and pch dmic are used
      commit: 4bcef04ca67fa8c46591a211885bb9c37f25dbbd

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

