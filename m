Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B1E1F0991;
	Wed, 11 Mar 2026 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773226042; cv=none; b=Ldr1Lhfy0Vy63sCk3WV5we7th7RDYLq916RmB1EFgcodW9cUf49ylnS3rEZR1BWHRD9vM/W5F3gQOCCa9w0y1DhhaaqccegCnKrMmMPw7k0aPA7Hh2GWxQ5OZdPX3C6D4XUmm6SlGBpVIndS/VyHX+JWm6GnzCIRypkVYZAViJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773226042; c=relaxed/simple;
	bh=GP1B1ZYgX1FnQaD4YpBvnLBXU6XwdrvHxpYOTRfNQxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l2m2MvaNQ+DyMzOfizhwmxnPB1umYMOik9wwzaAOg+uyzz49VQlNZw9TcKVdfU/ewDVvpFuh1VDzqw91XRPoR8p6e1l+V/YMaJ0UslRt3fM2UrIL5L9CUpTI3KU1alSCS5GJq/3k8DOMqNsvihzK5lD9ljaOE2NB73Xj/ukHfdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0HfqY1U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0HfqY1U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1144C4CEF7;
	Wed, 11 Mar 2026 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773226042;
	bh=GP1B1ZYgX1FnQaD4YpBvnLBXU6XwdrvHxpYOTRfNQxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h0HfqY1UE+TqiiCwKKe0rosUqYQ3pqVYaaUiBP/FFQ8e02esunfgsUqJHjdsnjGJe
	 1vU+ET9ir+BnoGjnsstF7er9SDFvoTDg8XWq8gyEDfhxN8vxOyt8UmjZnlN0OwmGJ2
	 NsdOM1qSKaR6EKCYBaGc5LNVY8Z7udwEcBjiGzqxeJZs5izkMBw7qEHLTO1CYo9Fd3
	 aRmYGp6GAajQ5MrUIeui3LKh65324NZDPRWtx+BHSaQWnLPrucaGRK/0HZxatLSosr
	 l8NXFj4odsOH+rQWxkHoRRrqANUWtbvmCr5rTsilHapL9/LNK8/yYI0k28xZF7Nv2J
	 kMcwOm5l91fOw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 18291782795@163.com, pengpeng@iscas.ac.cn
In-Reply-To: <20260309082824.717012-1-pengpeng.hou@isrc.iscas.ac.cn>
References: <20260309082824.717012-1-pengpeng.hou@isrc.iscas.ac.cn>
Subject: Re: [PATCH] ASoC: da7219: scope AAD suspend and resume helpers to
 CONFIG_PM
Message-Id: <177322604039.10345.14331262388046644191.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 10:47:20 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Mon, 09 Mar 2026 08:28:24 +0000, Pengpeng Hou wrote:
> In current linux.git (1954c4f01220), da7219_aad_suspend() and
> da7219_aad_resume() are defined and declared unconditionally. However,
> their only in-tree callers are the component PM callbacks in da7219.c,
> which are already guarded by #ifdef CONFIG_PM.
> 
> This inconsistency leads to unnecessary code inclusion and potential
> compiler warnings when CONFIG_PM is disabled. Match the helper
> declarations and definitions to the callers' scope and provide no-op
> !CONFIG_PM stubs in the header.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219: scope AAD suspend and resume helpers to CONFIG_PM
      commit: 4ba5c63778e5cca15b1408f012d00b441f808f3d

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

