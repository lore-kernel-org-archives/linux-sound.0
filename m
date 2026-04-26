Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D133B2FF1
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285242; cv=none; b=soLwBvRq9gXqQ523jgrJleCmzyBJDArPBphalz+YrsPBoIbfxEIvYoH5vEb+fg7b5Hqe4ajpjiGgHTT/hw7GrVjHbzp6qz+vvrhPgcndOdhcR3ibGJfmUe1GDVHWaE74G40bKTQWlfkYeaqtYG4GFisWvoyPEkwea0Qye+E/dzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285242; c=relaxed/simple;
	bh=rrmmfx9WESSOnlMPboJvM1inGXOKfZgf8WjHTC3S1/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TC5GMtPNatmW0/u00Z9B7nGmmZEFD+6a1GM19493kNknkjLZCAuRM4vMATcW81fUREbHKQTiRpx4tKiGagtXCDs896cUdwPe30qRlAekyD06eAvilmpast82VmuxC0UEjF2KVCRRX0a6r3TeaBqCrWyXpUScTTnMcBpDTg/l6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImX89wQd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImX89wQd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778EDC2BCB6;
	Mon, 27 Apr 2026 10:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285242;
	bh=rrmmfx9WESSOnlMPboJvM1inGXOKfZgf8WjHTC3S1/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ImX89wQdyqYytHmSTJ7gNiZlqu7vMkuvNYGzJzpD1Qho5sqynQQPEEMRqoqlko0rt
	 2uhKQMPiMHdLKOYVc9w1+w8wm/9UN1idX4xH19a5uiWRAq/T7zTumVts+/UbeK6zZN
	 +ctIYRpPdpRFGcpMQbZJLL+2fkTkc9sDZ46HZFg3K8w/wfFS1NW5b+uHktvUAP8dPc
	 6/PUovZXcQdqrUKVj1AQR5W/qTcxGCjIicrUUFIqHrynYZTL4aP3gN9iQ8nIOILQhZ
	 NVa8C1Bq48GOJvbJ+A1VcjcCjIEfEGzMVLeTOAo1h25GiLCMlwCR3o8k7V0z+LlUHh
	 d5OM2+HhZoWLw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260421091351.4056377-1-yung-chuan.liao@linux.intel.com>
References: <20260421091351.4056377-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v3 0/2] ASoC: SOF: topology: allow user to add
 topologies
Message-Id: <177724614654.266775.15116164847672581113.b4-ty@b4>
Date: Mon, 27 Apr 2026 08:29:06 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rrmmfx9WESSOnlMPboJvM1inGXOKfZgf8WjHTC3S1/k=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7zh4s5BaXjGxMXt4CvGg08+Kn9gbm+DfZRNl9
 gZCIB915v+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae84eAAKCRAk1otyXVSH
 0B2OB/9NnGF9BOA5xr/N/ji1T5Y0NzyrhnrLnq+OGhHwfEhBoMybIihEJ3K0zkwmcNNZ0xtWC8q
 8x6aWD+N63ciDw4dv/2UfrwVQb3egIb8SL8KPnKr94l5FpBummaJfVzbyBjllm6KQb3qJ9adz4l
 5Hb46RaP3dA8Ir94iUXknjgbcmN8NuO6zQaKTcuR1lKiqGjq3/KPKd9p6+FoON1phSzI8cngIQj
 UmKNrL96Wb5rTMgNYAG4X6rYEz7URQtjMv97/Ul7B3PlScBuXPPwoQE/uz/xmUhyL7RwxhsMZ77
 4w3d/WM4k9LGSUwF8Sf9jefunpnwWsySbaLplJAIU4O2WUhv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Apr 2026 17:13:49 +0800, Bard Liao wrote:
> ASoC: SOF: topology: allow user to add topologies
> 
> This series adds a module parameter array to allow users to load specific
> feature topologies.
> 
> v2: add a out of memory check.
> v3: fix the module description.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: sof-function-topology-lib: add virtual loop dai support
      https://git.kernel.org/broonie/sound/c/0d0e98603f9f
[2/2] ASoC: SOF: topology: allow user to add topologies
      https://git.kernel.org/broonie/sound/c/d82bf6af6213

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

