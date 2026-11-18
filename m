Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096382;
	b=sPHqFzyzkquhkwaxZ95qsfe9OlL1D+LYFDqXhaS9eP8yOc1d2CovtJp1yjYPmtGXXWhY
	 A87eWl3B8my+Ns9A9jajc5Zh1/CDgAN40aOvW3k5ICGA+yyl0Ike9+6kqCjBPqza+DiYN
	 w2NWc+8tfFsY9yZ1fVwbWRfX4N86FUJGe5nYbUNi2N7k7zBYQk9a9w2xw2rGATNADT3nb
	 Vx2kuRM4fb8wnmGSb/ZlVoHlRpmMlcEyrOlTHtGsfwOXH+0mdVZ6hLc3Ptk85yLWpd1YG
	 dV5a937aem05n856XL6XriTORqv3JwiOHfEvGZNNQJ9rMeVBB0UIgA6TCsl6xrGG3OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096382;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mFYwC7S5026sT4zGEqnlhqSSFOX7wLB2eoVTwEHNIjA=;
	b=q6N5RoZcvP0o4gEt/hRqED4ohslATHgzU51aR/RNSrxAHX1EgYwgN3oY6NzJt5ymIj1q
	 op1kn/c45AzJzv2nj0uDM1BdPFWtytn0PQeeeYo+Kcur5zTcY3KBV6dUwU/Ov+UtQOKz3
	 +BYGQbhoM5GICNvZWnngcTm7A3pdmWC997/XzFowQm2ijUNMf5cq/2tixjHBV10yfJBIU
	 1ycpoE4UL94+rupg8ewneIdT76BCo6tZ+pV8eRVCyF9psoryir5DpKJugHYqboUC6gkwi
	 kTs212qjPuGHGwVayiEunflsRP/IholwVz7VcJQ0astfgj2qPJrpBFtArIvldx5z3Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGqmqODE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A77606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGqmqODE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023681F000C7;
	Thu, 19 Nov 2026 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096382;
	bh=mFYwC7S5026sT4zGEqnlhqSSFOX7wLB2eoVTwEHNIjA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BGqmqODEui5cnTIA/NhA9AC5o9zZow6XvUGi9fKMPaEmNavBZFzLAjTlSpwYyQF7W
	 OIMXnWTV+EI/f6MHrfd7O+NtFD9OVLrHOGWh13fGuUZTYq2yHNYRZM3WWTePEajEZZ
	 aIpXW70GYpUMCk9uccg0Ev768JosYJHtRE4QdqEQd6xAp3+7HONhp5Ln5LzAU/qAii
	 jiejkM/z7KA0/lOjmIbeuQeMP1XTILdMr7Duu59RVoj1KaWJO5tZls2nnLOn5SSNDA
	 1Vv5C7uBta0kkUAxELySxglkoFMWyfXGNfVj+HE/7pbHlXam4AQyDi6U21ktxU+RCQ
	 xgtnfF+9IfWKQ==
From: Mark Brown <broonie@kernel.org>
To: Qianghua Wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 bo liu <bo.liu@senarytech.com>
In-Reply-To: <20261110080535.870596-1-qianghua.wang@senarytech.com>
References: <20261110080535.870596-1-qianghua.wang@senarytech.com>
Subject: Re: [PATCH v2] ASoC: sdw_utils: senary: handle a missing
 name_prefix
Message-Id: <179501105478.349622.220319573459584968.b4-ty@b4>
Date: Wed, 18 Nov 2026 14:10:54 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=a4kNVRp2F4QKSFTBhmyJ/C9WR1Nwe8i/nRVyIQNRHtg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/beaWv5eKTI43lb53zKZ2tpPU3eIr59wZ6b+y9Uft
 //dIbNQtqOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATuXSc4X+dbndm7rVnlno9
 184/9rp57/CZwrN2bOY1xm+Zl4r3Ja9i+CvYkKbJJ6Q50fL6i13Npgp1z2WCXvmuuvArc4aT6cU
 v+5gB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Nov 2026 16:05:35 +0800, Qianghua Wang wrote:
> ASoC: sdw_utils: senary: handle a missing name_prefix

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sdw_utils: senary: handle a missing name_prefix
      https://git.kernel.org/broonie/sound/c/ca12ef85c968

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

