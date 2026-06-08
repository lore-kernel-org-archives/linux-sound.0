Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A323382E1;
	Tue,  9 Jun 2026 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994460; cv=none; b=Ka4KGUZUYD/IfvTAdmbGWpmg1ZM5oLP2BQxKM/YgDwicp9yWBPQFcnVE0r6bt0Ol+QQmKq2PqnyP7ekZ4i5ibF9S9utqzLUCpQ65wrp2GdHJ8lfrXAscWhQxxFY7fTkkIxqlFDJtH0rSbIeUwONPsatRFJVrFuVEpOnelzBcsxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994460; c=relaxed/simple;
	bh=hdVrRALsMIREIn7ihjdRcpf63ae8p5If5LNwop1xDLY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G+/fYcDFd8H60InKQNlNCiwcRlRJdrKTBRhLPAT1EE6gfPdI8T2GJ2gBW1hkBdlLQzf9+FGCX3/utQ3B2cqwaVx1fmGZlk4K6y4/pKuZtxaCK4+iX+UJpZGOG9ofEj1k4EkK4CF9o5/qOcRs09RvonnaKqzaQCKyg0SaXOI3Pt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ij1vg7vx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ij1vg7vx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64AF1F00893;
	Tue,  9 Jun 2026 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994458;
	bh=g9i0x40H0Bbrg9uecEkCuWCtLH9BINZc9mE+DeLnqEE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ij1vg7vxEvcR9WYtXKnQf/yeFdbd0zGHUgK2MdXiigTL1LiYZ1xOJlGcEPC59XFzI
	 X5RBVF/qt4XQNRvYZXFOv1us2rFM0MplYp55aZQOum9ZyErtYGDjru/cxQ5eNmKwKI
	 LRVsQLi3CKgeHqNdwy8Bk7xD13LmcIGzPfWz+QojmnxwusdIZLlgj5/gCQiDdGjyWY
	 pNay+ls+JThjcx5M8QLKJlwsactzCwVol8C1Ac9zExlz1Om3ttrYcup8lIJmhymSMZ
	 ILuwVHXIR8BczmZ5uPP7mFvYu3MKLJpa/HwO9so9eUCS+nxKVdFFYGs6s5KrPe5OCS
	 AxfKidMWSUiAg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 kuninori.morimoto.gx@renesas.com, ckeepax@opensource.cirrus.com, 
 vulab@iscas.ac.cn, Tuo Li <islituo@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260528064107.470824-1-islituo@gmail.com>
References: <20260528064107.470824-1-islituo@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8365-afe-pcm: fix possible
 NULL-pointer dereferences in mt8365_afe_suspend()
Message-Id: <178094172524.20828.3703159455539806775.b4-ty@b4>
Date: Mon, 08 Jun 2026 19:02:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hdVrRALsMIREIn7ihjdRcpf63ae8p5If5LNwop1xDLY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqJ9GVeS8SPkknehPnNp/lMxjPcs2Rkx1z3iMMJ
 8ws6nDdpz6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaifRlQAKCRAk1otyXVSH
 0H4KB/9FcdWXR1D5b0263Y9QjXLLjoaw69Hw1ounRpAGnrMqZ7t3Wu/tZ1xZdjqDpyw6OeUny27
 xc69A8TOvRKM0SkvYxQNbB6UejDP1X6JuzlxigNyM36C6twkGR5q0fwuKwQ302YBAFfiW2nWq72
 r5jhRMFZZdx+Dz76W+hXtIJ3/qFqAERwLsNw2Um6FeqaoPWEf0ed8oZTAmfvEF4EmZRbwx0+/oy
 mQPxx8pev7ZJOMrMbUe1cL829ei7+vv74ZBvHTsmhPmTO7CZifEwjsFiq39WYU0uwHjA3ix650s
 SJncaHJKjMll2pD1LYEYZd3+ac0wSwYvdLzdbvWUAL3Koylj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 28 May 2026 14:41:06 +0800, Tuo Li wrote:
> ASoC: mediatek: mt8365-afe-pcm: fix possible NULL-pointer dereferences in mt8365_afe_suspend()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: mediatek: mt8365-afe-pcm: fix possible NULL-pointer dereferences in mt8365_afe_suspend()
      https://git.kernel.org/broonie/sound/c/b8948ac26efc

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

