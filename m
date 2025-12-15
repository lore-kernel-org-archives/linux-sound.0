Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAE02FFF81;
	Mon, 15 Dec 2025 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807115; cv=none; b=UOrMSYLZymzVPkq1DnFnohVV7BfYadppONPW+lDn1dx8xDx2dTIJMvt/FslChOYhES2dncVxEd7tY0ZD6cdi2t+aYlvnSLWHAsIGLgAAwUUUw3uCvYhFd/3hpisG9cUuR1De58IJPlW9DBBS1OVpnFpNQOCNsqfbFtvjEgRefEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807115; c=relaxed/simple;
	bh=EtqfHhN2mJRcG6Mpdu7gJS6bGqWYeMqBDKbUTfjIG94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PT+Y65+pnL/mcANtn31Jspgnjsd9vK03FL8KPQ2PKqU1H1rN4rMi1jCq9U1fWbGJHO1gXNIlduvCbDXdenHTeWmWydHW26U3RKYG/0cl1FbI5Y+kiLfnAGE4R6yo6zisIYZ08Dky/cv2Cr3ynr4W6QFwezpqqhxAD389bg5Xh2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLGjV6W2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLGjV6W2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B083C4CEF5;
	Mon, 15 Dec 2025 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807114;
	bh=EtqfHhN2mJRcG6Mpdu7gJS6bGqWYeMqBDKbUTfjIG94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oLGjV6W23UuzkhD8sh6dmDCE7g7V26FM3cOweFq12ld3NT+EHeWxR9V9yPuDnxzrB
	 XxhvKou/UeY0VwNX970uTZ1ad898+bRlg7nZtGXd3E9DTCpJsZNPTtY045ITLJbOH5
	 8gXDCmSyTtHkRZfy2JwT1/9teUq1PdTtu65/B3cUE8bM11rySn72wje17CO5XguQX1
	 hV6nqQ5IYGc8iN96S21mo/aLy8eiFkt8mbjZMDImavSIot7FiPAny5YeGr1FvxF6aD
	 79AJy88XmzHunzEv7idCQ8oZG2TD+EnpteizQgl+xW1P/9k3uPLzY1dEcvegr+sflS
	 D9peKvqITxxVQ==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, hariconscious@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, khalid@kernel.org, shuah@kernel.org, 
 david.hunter.linux@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251121140940.40678-4-hariconscious@gmail.com>
References: <20251121140940.40678-4-hariconscious@gmail.com>
Subject: Re: [PATCH RFT] ASoC: codec: rt274: Use devm_request_threaded_irq
 to manage IRQ lifetime and fix smatch warning
Message-Id: <176580711267.161056.11098886235946588933.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:32 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 21 Nov 2025 19:39:43 +0530, hariconscious@gmail.com wrote:
> Replace manual "request_threaded_irq()" with the device managed
> "devm_request_threaded_irq" to manage the IRQ lifetime and also
> it removes the smatch reported warning.
> Remove the manual "free_irq()" in the "remove" function as free_irq
> is tied to device teardown.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: rt274: Use devm_request_threaded_irq to manage IRQ lifetime and fix smatch warning
      commit: d00e80606e76233f4ae03486a9809c9edfe8b27e

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

