Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51B9134CF;
	Thu, 18 Dec 2025 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766081869; cv=none; b=urZtSmRQSZviXtY1pdTjZVT2sikmHDykNtxTSRg5ZAwghnt+8WVxrkD5vRCRfL6Y7+j2q3dl3cau1raJ2KgS9jTwpEYnFgD/raZsBC0JFzLydN/gMy0xnifx7oajwXD5v/kECzPWwnN9U297St4yrolX7wswxO5t9M0s0DH1Jy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766081869; c=relaxed/simple;
	bh=6ySNi6XK++fEIBHrYyI+0sg8GNMuv8hF9Un7iQAeT5g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oC2lA8Gz+NHOQITPEK0uBLxE6CeTxHncOaaFTl6AMZAgvz9RSqT8h0fVTXenUALM376db95YLzDz15fFnOyIu46I2PA9uuX9obQ20qoLLvV8Gakv7e2z8lsy9ocRlzPb0lpo2/9UmdmioQEjaeQLZ3Y5SflecUD/wOarNBfXcNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BR6+Y+QM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BR6+Y+QM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C7EC4CEFB;
	Thu, 18 Dec 2025 18:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766081869;
	bh=6ySNi6XK++fEIBHrYyI+0sg8GNMuv8hF9Un7iQAeT5g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BR6+Y+QMLl75VmQjA/M1LYhujuNhRvNzy20+WTY7Pzz6rl24GmjPOlI6/rLQd/dJA
	 j5aXGvllMT+awUXA71zEV+2Rs5yuhhaCv4XXK34j6fTnc+iMOjwOteNdV91KjZAeH/
	 25MicZ1IOl+xmF0VxqWUzhfolPz3VEyOrclh8LOXbOgcPeQCx0kuWGbftCZVysV48a
	 24fwC9q6eil+ISnAr22o6uGFlYOlbjmAfR39FpU8EX29emN8aHqzVTONgClSuQ8z+J
	 qX6OLMMgl/FjYSOSMGfTqujVI2xmXfWIDJDUWoQAwKEjSCQeCWIk3TQ4ZPmH1QrZvb
	 5Yov4DRVc4Hlg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216102246.676181-1-alexander.stein@ew.tq-group.com>
References: <20251216102246.676181-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_sai: Add missing registers to cache
 default
Message-Id: <176608186693.237766.7370584798182861413.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 18:17:46 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 11:22:45 +0100, Alexander Stein wrote:
> Drivers does cache sync during runtime resume, setting all writable
> registers. Not all writable registers are set in cache default, resulting
> in the erorr message:
>   fsl-sai 30c30000.sai: using zero-initialized flat cache, this may cause
>   unexpected behavior
> 
> Fix this by adding missing writable register defaults.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Add missing registers to cache default
      commit: 90ed688792a6b7012b3e8a2f858bc3fe7454d0eb

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

