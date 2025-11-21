Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B02F1FD0;
	Fri, 21 Nov 2025 21:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763760478; cv=none; b=S5EJ73UhiWBCjyyCVAJfp6QwDlSUGEbu4Vqfh7uBZsteSUbQiH/z6GVR6HrguiWOCiDV6Huss9G7xt0z1AGeUqDxSkz/Rx/UhUrfirh/3QZx9pUVJDY0U13RSm6QbJlwlyr1Rb0JV1GO9+WkTYbT4nwxkER3Z2ZcTgEppG/HdX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763760478; c=relaxed/simple;
	bh=nfIx3d7WlEV7LUso+sHT0skcS9Wd8wtO+6i8XRioCdc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XyxCOZejXjgLC/8P1xUvrXW/2uO2LS0lUoA/jQSKJ4zSTdGcfwPXHSSTpSFCTA9TUxSMfHhU2dgah2H7pdrxxbgW+Ce9p842mG94lBBJf1Te+9XsvFEejUNggJD/F3SiaUcvaJrc9/1HtIIOlpGxoF4txn0C/dRsmmh6PE/XvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMcsgmRV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMcsgmRV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91396C4CEF1;
	Fri, 21 Nov 2025 21:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763760477;
	bh=nfIx3d7WlEV7LUso+sHT0skcS9Wd8wtO+6i8XRioCdc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LMcsgmRVcMjKtFQHCKRkYktiUh6csUa7s54mUrY7SmYeQziJmu7eQ8XU00PdKp3po
	 ABn98zKcbP9X168fq8w1RMfFJBjEpWQTxK7EuG8uVX+ZzGj5lHbstWzSfE1VJFaeXV
	 WFSCBCZ1ZXWYo5a31FWFgm0fknWwV7taSkTUckJjs3JBrwwG0ybCc2WvzvIgHWhSPc
	 p0LcrUynkf+OAc3Dj9cH6J0Bw5vZHitijSOrxbotv8sKMrz49xROYhPWOEIRz5UPsn
	 eP5LSzEbNBjgt6VHtZFVE6CX50eSqENatw2xH5XanQVoRRdyV7MpFj8DYuGGreeUPw
	 Ia0b/164ajrbw==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, hariconscious@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com, 
 sakari.ailus@linux.intel.com, khalid@kernel.org, shuah@kernel.org, 
 david.hunter.linux@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251113142637.259737-2-hariconscious@gmail.com>
References: <20251113142637.259737-2-hariconscious@gmail.com>
Subject: Re: [PATCH v3] ASoC: Intel: avs: Replace snprintf() with
 scnprintf()
Message-Id: <176376047433.92510.14995128280410162390.b4-ty@kernel.org>
Date: Fri, 21 Nov 2025 21:27:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 13 Nov 2025 19:56:38 +0530, hariconscious@gmail.com wrote:
> snprintf() as defined by the C99 standard,returns the
> number of characters that *would have been* written if
> enough space were available.Use scnprintf() that returns
> the actual number of characters written.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Replace snprintf() with scnprintf()
      commit: df919994d323c7c86e32fa2745730136d58ada12

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

