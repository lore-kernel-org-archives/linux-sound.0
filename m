Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8962F270ED7;
	Tue,  7 Apr 2026 16:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580256; cv=none; b=WIXMyA0N0u6bKzd22zYDNaGUCidOBVe1FmDfr+10CEvqiEe+b47qvW7oXzyV9TE8Z7gyOZHbUoSTtiA3nBchoXDgvGiX+v3YPWRuynIcbdYySTpKmLPcopRlLOaqFB64VYROZ4pRbW1mJzEWyn65xRQMN/rsI3uQV8s7olChcEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580256; c=relaxed/simple;
	bh=25Ncd5kpv1sA1XWgyiwrIH7vTaD+meBEk1YFmGwgvjk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dEHnrvmi+1XXuGwRTjj/MvadBBdGsO6vwp+9bZsOfYUsNdSJtoFmM2JOcXFua4EOqygQkxNvmivZ69SKfw0HrY312zCCVzR0p+ZyVno1TeNteu0ErNEG3ifU/41K/5dR1o3flQpLr67mWBV8g5+29L5FKyLY1SaPLY4EwqsmjwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5lYCbnx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5lYCbnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0B7C19424;
	Tue,  7 Apr 2026 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580256;
	bh=25Ncd5kpv1sA1XWgyiwrIH7vTaD+meBEk1YFmGwgvjk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I5lYCbnxh1BDAoUyLNb+AK3cie3HfQ8Y+IzHNGaBx/8REhCsdxZGcwNx1LYHXFXj+
	 f+tnDx6FGXSp87LzpuAcEtnJfbZgSqWjFEv/iFhai0PfG4y3UAsaj4XNQkmuucjUmS
	 NK16p2WX3J+VW5zz3zyIfhRebnnn/yPaOTva0WTl9rQlud2HOlhC06mdY6up92Gt7X
	 1EW1F+zzoXgkDUNgtAgO+EH+Ui0whCQH8nILaNTlQE5B0lquvBft2gOVh3sjGwHM1Z
	 T60ZmgXzFzprwktwJyobvBpYzDf+nJgOfTjOSNeCwM16NkA437/aH4e/aANMBSHaps
	 +zR7Gjw1uLTcw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, cezary.rojewski@intel.com, 
 songxiebing <songxiebing@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20260325021752.238203-1-songxiebing@kylinos.cn>
References: <20260325021752.238203-1-songxiebing@kylinos.cn>
Subject: Re: [PATCH v2] ASoC: intel: avs: Fix type mismatch in variable
 assignment
Message-Id: <177556167662.37897.17148763540859461864.b4-ty@b4>
Date: Tue, 07 Apr 2026 12:34:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7a3e7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=25Ncd5kpv1sA1XWgyiwrIH7vTaD+meBEk1YFmGwgvjk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1TRerTZErtoTuNLsWVjQO08TtquUoKEnK22Mi
 ZQyM8L1+2mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadU0XgAKCRAk1otyXVSH
 0GpRB/9UQr7i2kBK4wRDdSlWOj9NVCMEh7cDAuJmxOESvaRwncsOtuUi2kHPzY1QyUS5vdmpfiW
 t1q+STTg9D7Ug9u/MIG5QMn3GCCH/mfgwKGH1iwSrisTXAfX0CjKh1HIGbRx7TLI1SLMJB6JK5w
 4y5Wm3v2wc8twL4wEvnNQQwP56m+1l4hWNioa2pE3o6YMBJLQ5LmNsv+x77zGzYqre+ud8kuyrf
 8DWIkxXpjjt7uJgTMHyiaN67u+FoNSooG/vTtkaI46TgCpH7mJ6U4YC8a21QZf6PbwohJ3E61yo
 dR8lgskVxb5ZFE66R7cm/HWFh7mH7gFXZXi6Nl0v9p8I53D3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 25 Mar 2026 10:17:52 +0800, songxiebing wrote:
> ASoC: intel: avs: Fix type mismatch in variable assignment

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: intel: avs: Fix type mismatch in variable assignment
      https://git.kernel.org/broonie/sound/c/fd495be8aa19

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

