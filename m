Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639FF1A0AF4
	for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714487494; cv=none; b=N1Mz08N26XFJpB3KlZeIsoBDoStDUhSB9uNFLectLlw4NX5uNV8Sgkm9DJgHu675zKcVbEeJbuUsBu+9Iham1cUjgtto9J6pJ1GN9ONl607JW+pAXQbHfEdQSIjkob0FpOC27KJzoejOOLm2lLGIgkUo8QwhCc36XtjLGSWs3tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714487494; c=relaxed/simple;
	bh=P/HYWi/LV077z/N4A+ZZFfgcNLE/hTASIK4wgh7zsPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IKMwFYmdCu0ZwpZTzMkx9M2C46p1/raKVy/93go0gfDqIYwTbjL9mJMpRMHTaedRSUrsQs8JIpxIB9vQy00kX3ver2U/o69l+nhGTEIMDy7HDzEv+IYOEl1/Bn1f7Yq5nh44y3ptk7VKWEB75IyHI7WcQh8LhnJ+RBeC73zzbk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LK+YxBbP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LK+YxBbP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ADEC4AF19;
	Tue, 30 Apr 2024 14:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714487493;
	bh=P/HYWi/LV077z/N4A+ZZFfgcNLE/hTASIK4wgh7zsPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LK+YxBbPqxXLUdS2eBmf/gK0xn3SWu1zTu+GSvZ6K4hmjd89eFab2s1Vv1VtVFCFm
	 +DTyf/Q/X+Rya8uKNgdfx776lXc8tyQZK2vEPwfHtqyJbenDRX8QHNzkCFwrcIOLoh
	 u4fcQrB4W2uZroJfqMFX+ZpSnSy6qcPXApjeae3Ikeq4M4Suj0y3h2ULirXX7iMHOS
	 r1FVkPeha5HCkHKetmMyM4aIC+9RoppHFqHnBZFll3m0chIcy53+ViMbZttnNyuDOd
	 jOibllnSk9BGWrXYST6DYCd5e34+2f1hZTt6wgZiUYL65k3XKngd9rGTsMZVw72SlI
	 8YFCXkLT3sRWQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240426153033.38500-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153033.38500-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: da7219-aad: fix usage of
 device_get_named_child_node()
Message-Id: <171448749253.1870439.912738117860341147.b4-ty@kernel.org>
Date: Tue, 30 Apr 2024 23:31:32 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 26 Apr 2024 10:30:33 -0500, Pierre-Louis Bossart wrote:
> The documentation for device_get_named_child_node() mentions this
> important point:
> 
> "
> The caller is responsible for calling fwnode_handle_put() on the
> returned fwnode pointer.
> "
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219-aad: fix usage of device_get_named_child_node()
      commit: e8a6a5ad73acbafd98e8fd3f0cbf6e379771bb76

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

