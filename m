Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B828DD0
	for <linux-sound@vger.kernel.org>; Sat,  5 Oct 2024 03:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728100282; cv=none; b=GVi2YWXkmyGFCPh1XfhtZ3q/ub4AdyHBDgqTGhMHD5tamQexy9gi8pEysIFFQLmluH/9dWYWDNEwMeudF5HOOex+1ZsXCxm7/rnY/YT+mDmFLsjwfOzDN7AB9Fs81Buv4HcCrB6ygm/iFRmFsbJJrZqSsFEo+y7xe7z34hqvIto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728100282; c=relaxed/simple;
	bh=bNn/QBpodekePm5KFYgxmgd7eE6ENvnHgXuWL/QoTNo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OZ0v/BML/mkoOyOF/WNWi/fDsJRO3vNZTqfNUwA3vHzU/9ZXo2qPu4ad3LlBE0FvVx0QdLI+HhyxRsccIB7gnafEdxukSCTNf+mNoHgWISUoWXYJNv0xI1BUAI+iR27TdZkcQHImb1wLLZCpeF6n8hhFexAome+7IexkGGPAD4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=revj7i0A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="revj7i0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C08C4CEC7;
	Sat,  5 Oct 2024 03:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728100282;
	bh=bNn/QBpodekePm5KFYgxmgd7eE6ENvnHgXuWL/QoTNo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=revj7i0AWAhiFTx8DH+9fuMH6Xnmtzq/YoWA9dJncZLQBNvEJOo791zYqzVP7oOG1
	 0yDHpzDmOKt25CDtF7AjxHUGLJcwqDq2jFm6QUtPmJVbgOxBUqYxKgLzmOhTifsz6M
	 Ddorxqvd87VODj5TiMcU9yL0TjFXMZbQ4DgxGDz/iq98vc8YR1B7i0HvVE+W5CbheP
	 vKeTu4p4cPPYXSzwWlOLWOJUWPmVXuCvM/YsNfwYpFqshO0rx7kwerZR5hE2Ncg64c
	 3/xbs2AWZbpMrgOwnMymDzsJnh82nVD30nGWG0EZtzrWc7MS0xC0TLFPDFgoL77cXK
	 jUJcB81MpgzMg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Advait Dhamorikar <advaitdhamorikar@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.orgs, skhan@linuxfoundation.org, 
 anupnewsmail@gmail.com
In-Reply-To: <20241004141046.61265-1-advaitdhamorikar@gmail.com>
References: <20241004141046.61265-1-advaitdhamorikar@gmail.com>
Subject: Re: [PATCH] Fix unsigned int compared against 0
Message-Id: <172810027926.832098.9733222670620513486.b4-ty@kernel.org>
Date: Sat, 05 Oct 2024 04:51:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 04 Oct 2024 19:40:46 +0530, Advait Dhamorikar wrote:
> An unsigned value held by offset can never be
> negative, so this test will always evaluate
> the same way and is therefore redundant.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Fix unsigned int compared against 0
      commit: 40ba40fa4e054c62507026454529e3d530e10456

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

