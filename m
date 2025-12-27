Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753C619B5B1
	for <linux-sound@vger.kernel.org>; Sat, 27 Dec 2025 22:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766874910; cv=none; b=BgWhoFi1PzO6hMlxH7UM4pJaOKmgjKT8huolE9WqbTXvWHuse8uYxr36vlRnGQOSyn6PNmnb4ByQ7Xgy9cBy4siV6jQywRaYOvceYnHh0+EHx+2lE1QCcfuVXYj2AVEwWQ7a/DCd7llKJnwiMr34RJ4RAShMuFDlLOfX43nqFZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766874910; c=relaxed/simple;
	bh=6om2Vv2qapqxbi5eIq92tvPa8WKLtWqwefILNxlI0u4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xo3DpGn0bx3MU6Ak9qbh83vmCsRaHx3uX5++NDM2OBBoCwAdnjT8RYNuDqzc3sYztA3wF+IegSajGvQzq5vbXh49GmliE+Ew1PAb2/jXMlUWCbBo7MJQvpNtEY14OJyzKUp2Eym/J6QPCot5DtjpM3hv1kZRfqss5dTgGUVryGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPzarTVM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPzarTVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03406C4CEF1;
	Sat, 27 Dec 2025 22:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766874910;
	bh=6om2Vv2qapqxbi5eIq92tvPa8WKLtWqwefILNxlI0u4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rPzarTVMgxiv4s68FFpkXo3uRzW0GvC5A2e4luqnx8ZG/qI4j/wykMbUHh2N4duJ+
	 /ZFHANhUzSmY6xPndLRgoCpDXaadB5ifMMWLaeCkW7D383+PN+5MMivknqRPkJpfCc
	 vBJsWfSqFwxArXpgikENDcov8Ly7eqbxvNXqQjFS7VWO+va9EqSbCP9aXikuSj6NlF
	 pEDsTtb3+43qkpkNSqfHFMlFMkQRsSFnkGh3QT2d9SBroLNF95GwJVw1IYQh0SpZ1k
	 H1VDPWKyIsAiZ9efgEnU2tBXcfQe8s240C7rcLxFk0EQp7CJxUnxAc3H9vOKFXmp0n
	 IVsQ1n7ZlL/NA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0mrtogw.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0mrtogw.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: alc5623: tidyup clock inversion in
 alc5623_set_dai_fmt()
Message-Id: <176687490342.464554.16197422910248302503.b4-ty@kernel.org>
Date: Sat, 27 Dec 2025 22:35:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 25 Dec 2025 00:05:51 +0000, Kuninori Morimoto wrote:
> It supports inverted bitclock (= _NB_, _IB_), but has no control
> for the frame polarity (= _NF, _IF). Let's tidyup it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: alc5623: tidyup clock inversion in alc5623_set_dai_fmt()
      commit: fc22dfb13618ce1ae5730840607733a50569a15e

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

