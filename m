Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A72BDC0B;
	Wed, 25 Feb 2026 19:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046415; cv=none; b=VsIXoqXG89bwbQXwllpGE0HqxD5yzhWUg5tAd73JF+ERydBmUX8jnGPrF59iByWfv9jqefkI75UWTFNh49BoYU89A5BCVeqwJg+DscGfbUx+gNTSnp8e3Sq1DXUnkqJqKhqwt6smbcNfSUGbbQBJhv+xTpY8APnVCAEe3VKBSlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046415; c=relaxed/simple;
	bh=fWyEZqip8K7jn3+ho1mdD7U6eRbhI41to6ECzaNSyAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LOEBepdINKvOQEYfaozJqhMSXeM7MRxMytUWwfOohC7MbsTsTc8FfLQJcznpQFH276jNnSnI3Xpy2DGR+yfoIVxE57e27rxFSn0s6KoiKUPTylWeH++5tU0iUqbAqpRFhc18qS4PeVUDPYkGNeabho9twdVYNozuyMNBaxPsBts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNfWSg48; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNfWSg48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A50AC116D0;
	Wed, 25 Feb 2026 19:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046415;
	bh=fWyEZqip8K7jn3+ho1mdD7U6eRbhI41to6ECzaNSyAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sNfWSg48ZFAvrJ/HNewkh2uZYeTMChVt/kL4pxR4fTXvSaLfzOwYxUaWboGqfNu+I
	 bPBIPqzh69sv1rW5oNwsZ3S1/SkC8MB7/ugLcl1yb+7MwCrtHGl4bs5uJCbJcd0CcK
	 ZnwFccZNVdb6rB9aGgbAsEdX39tQdbOAudTG611+aTCx79UTabn1dZHfcq72rGmFtr
	 DLUfSPOzs4rwhne3jrBuvXDrQ4sUxiGmSJ7rG563ejas1V2X9iZXIRmAjbCiLryTmF
	 8Xb4XSAqCoj/5WUjwEn9MZ2cyIlcXo1gb472GuZN0py6WiHP93GbqOG2hqa86oJ9kU
	 z0N9e3NxYKuEA==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xiaopeitux@foxmail.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <tencent_D7DDB8B646B471AF50B541DA7AC99FBCCD0A@qq.com>
References: <tencent_D7DDB8B646B471AF50B541DA7AC99FBCCD0A@qq.com>
Subject: Re: [PATCH] ASoC: rt5575: Remove redundant assignment to .owner
Message-Id: <177204641324.168100.559517723659515864.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:06:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 20 Feb 2026 10:56:40 +0800, xiaopeitux@foxmail.com wrote:
> The coccicheck tool reports the following warning for this driver:
> ./rt5575.c:342:3-8: No need to set .owner here. The core will do it.
> 
> The manual assignment of .owner = THIS_MODULE; in the rt5575_i2c_driver
> struct is redundant. The i2c_add_driver() function, which is called to
> register the driver, automatically sets the driver's owner to THIS_MODULE.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5575: Remove redundant assignment to .owner
      commit: f817c6a21235b503e68c50d0900d66cb1e1cf7bc

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

