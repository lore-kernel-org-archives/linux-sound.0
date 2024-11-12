Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3FA433C0
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731416890; cv=none; b=nIvizcdbpEvcqneFk19Z9h6+NVy1/UecgpnXwGJqn6x0iwMpMlFkT2Q9bSEPUWthssGNtAxu4zaejzCVpP8WpgErP946Z1GsiydH1Lu1kp/bvTpvRkjDDL+Tec41QMx6PxABs6wNcb6fJhbqUdRGHViFR5SmMtnsXbPaDegtXCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731416890; c=relaxed/simple;
	bh=YvknVqyrbsjp40/+1thFmNCA2O4XdpZpZfzwzS1EbEA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hr6T6eb6dNELZ9wTW4Mxr+3im3Q/JS5/Pvks6NaVAGkIdseq99TnaBphjV5EgcJMVnwFAzY3FLASvsaXVd2b52CsWkDiZKAi04DeI4rZ96RaaG3SRv6nJs8t/9BmBNU45qAYrwvDyHgUPbRHF0ldXIDkLxBNzFAgl1j5nSplDR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzzChgRG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzzChgRG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C987C4CED0;
	Tue, 12 Nov 2024 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731416890;
	bh=YvknVqyrbsjp40/+1thFmNCA2O4XdpZpZfzwzS1EbEA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BzzChgRGBWchUxr8sCyhfVh/NOXHLSCkuEQAL1OMr8CXuVSoCje1UDCZZAkE5Jcle
	 Px3cOjFb5BZ5WjTqXxR8AZSWp4ZPLGkaku1J0wLF9YqV0hLF4XDgIWvprozvbW7vHr
	 3aOFFq/kGZGo1uwDEoZUTKKfjqmg44z1J3eyUBIYKWgkWCXHlQoOqJAbYa5FSeofFs
	 HU+aP899mp0kFxJ+AkLezJAyJmymHiuVcSoRUy/x5YKRppj8lZXwpoTimjh/0lQ/+8
	 tWY99RpM1nseIfuQo3BiEyFRMJGabsixk6Gqg4F8a6sw3zSzKlH+v+0F26tTQH5QFu
	 kuD/1fDMr/Bsg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20241111165523.113142-1-marex@denx.de>
References: <20241111165523.113142-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: max98088: Add headphone mixer switch
Message-Id: <173141688813.388630.6367781195497125901.b4-ty@kernel.org>
Date: Tue, 12 Nov 2024 13:08:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8

On Mon, 11 Nov 2024 17:55:04 +0100, Marek Vasut wrote:
> Add enable/disable headphone output mixers knob.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98088: Add headphone mixer switch
      commit: d0621105eff307408ceb3d0eb61ca2a23c37fcbe

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

