Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B283C3EAC9A
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 18:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255419; cv=none; b=W9qNNB2zbf4gvzEGtXvoAFIYneVoWTzuyQUBZq5y4VKikPYOVHJQUJmHEAaBxQvhfFGLqqO3fYEpkHj1yUVVXWjLAkNtaykNx3wELEmwd+SffPjSgF/R8tj7vcZp9VczPRmo1u9aW9c4LveCkOMywSY8IOIfNQHpGerBFnrKk1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255419; c=relaxed/simple;
	bh=KvGJh7wxosuAAW08RsMw44o56sW9UlNvti13LMHK7dE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qUFXE3Eqn+u9lb24ffkc2OfyA/AIgCR8cscUhDmbVcdi5+Q1aTNnSRElVLowpKK/jCt12il1As9DZ2AmhuoAY5Zy0fZoe/G4F2UwJfBR3ZW/nM/yJ+RMeLL15hG8Keyxo07pDRI4GYDDYdOSj+e0JTBHAPaIHNcvpeVG+IlnKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cazcKIai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cazcKIai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D3CC116C6;
	Wed, 11 Mar 2026 18:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773255419;
	bh=KvGJh7wxosuAAW08RsMw44o56sW9UlNvti13LMHK7dE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cazcKIaiz5wsXrFpL4zPPfR3QRaAAc/3740RxsytcJnLtNniBERfNe2lORBq4KPB1
	 59i298JCkK+lFcud9jnJ8c7+2Ok7+MQcq1blRg8kPaE+ipN9P8HaTMdpzJ1tU9fkmc
	 eNySPe0VvXHX43xM8NQXMnFHCdPw9IvO93HRXlMVrzJl/LL7EWM5ODcOJWZJR6dY8V
	 T5+t17LJ4fMhCGRS5/tighuLE0UEBqe4izb+p1awuVBHbFOIlX64MZ7GlQIrkVO1w8
	 DTyxv5wLN8PA1YkOF14/aR7Vsk4kjXUKtmV39nIOmye16xhwTQO8Sm+ww+d1pSlcuS
	 PZ9ii3EdpKELg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260309091605.896307-1-cezary.rojewski@intel.com>
References: <20260309091605.896307-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/5] ASoC: Intel: catpt: Overhaul volume and mute
 control operations
Message-Id: <177325541819.227645.9236589547086975582.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 18:56:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Mon, 09 Mar 2026 10:16:00 +0100, Cezary Rojewski wrote:
> Short summary first, longer description later:
> 
> - fix the return code for kctl->put() - currently the driver returns
>   '0' even if changes were done
> - lower power consumption for kctl operations by waking the DSP only
>   when some streaming is done.  No streaming? Cache the values and
>   inform the AudioDSP firmware later.
> - drop the existing code duplication between individual and master
>   volume controls
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: catpt: Synchronize stream access
      commit: b0b49c77bddac75db79f7c2c6ec0b07d61864f2f
[2/5] ASoC: Intel: catpt: New volume and mute control operations
      commit: d16b942aa7fa6135a44d156246d98e50b5a0aad3
[3/5] ASoC: Intel: catpt: Simplify procedure of applying user settings
      commit: 2464febd81e4c98f78466462da938ed2f8c37e17
[4/5] ASoC: Intel: catpt: Do not wake DSP just for volume setup
      commit: 150badf73e9a10cf646d07353b41117ea90f67ae
[5/5] ASoC: Intel: catpt: Migrate to the new control operations
      commit: 8a99ccb032d670eae2b1ea89174e06a60d2d3fc2

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

