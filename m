Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF401378D88
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 18:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980945; cv=none; b=ZtC5133Ml/8Il0vUyz838d5Pnhpliu897nrF50QVqdG0BSmqld7E+UXp5H0zU8BtWDvFQjZnfHzCsiYAYibXG/LfKTSbQFlizOZPgkgASWg6z0nmHBKDvP+mXkQwAXuUr5DZaLAoAV4VTN+DsG7rrRrpAbwrIT+k0HG52ROUMAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980945; c=relaxed/simple;
	bh=xOiP0lud008ojMh4QFoQ4yVNzGDCxo1UEoF+CN35Mzg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pUqbOqwI6WC1176bM7Rm01GS47583swRrBd1xRScNKnr31zPwx1OkYXO8DD/VAQ5BVJ7NnWJTwyXJ+RAdHNVwH385ecStzbJ18eSlw4aEpNvmq/Wz4BBi4PwSgIxDAt9MReEY0REwVoBK2etcubUHdz/XC/kaU4aMLQyyxN+Jrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFz4gclv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFz4gclv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4D5C19423;
	Tue, 31 Mar 2026 18:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774980945;
	bh=xOiP0lud008ojMh4QFoQ4yVNzGDCxo1UEoF+CN35Mzg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uFz4gclvUuGvyhy6powMEoc/NfZzNNo2fotcxSzb2gTzd9853ZhlUII+GmrXIbusD
	 v32oARa9UPy61J3M3nVmkNkTSI6Opb6M/+XBKcvISPLZsgan0tjeD1s96gjRdNkRHZ
	 KD5YXzKubO3uJeTJUK6tEvF9W87M6wSauggZ1scgIa4ScdlFt9z6iWDKT98IcATER4
	 gy4QWQkHeJeErCaZORST19freHKOy8RFfwSKUrlhcpz/WEZzN/Vm9T0nfR+otrBI2U
	 yOStj5I3teZXaHmlAVb4pArudi7cYjbj0lSqzadePsE03lbBsP+SV8BX3DJT0eQJcS
	 2EhC9JqDrqLmA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h5pwdc3z.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5pwdc3z.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core: remove duplicate
 snd_soc_flush_all_delayed_work()
Message-Id: <177496614054.39905.12212999454743481729.b4-ty@b4>
Date: Tue, 31 Mar 2026 15:09:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xOiP0lud008ojMh4QFoQ4yVNzGDCxo1UEoF+CN35Mzg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzA9QHC4XnUsJpTQq3ohUvjdmx6FKaSCooQ/cF
 s0OCZjUwQOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacwPUAAKCRAk1otyXVSH
 0HIeB/wJs8LewBXp7f0NcVTRk6KFBnKQW1qqwgQZu43JcxCKpkmKZ3mTcBHi5M/5XZuyXtUUUs8
 xKX7tQt4Si0Yn5ZVU6oSwqcsey4cFos9aLc2GFb2MCWvme1FlUJDtOfYJq2OuEZEJzxVwjwSIea
 IF+9521xYfVsPVTWFufMkuq2a5xx5EqPtHcjUVM++UQKtY155AozF1jQIRxusMsKmbfvo0HEAp8
 wX9ta5U6GYo5EcRIvlBJxNZFVfBqW3h+3EA312rdvUE6JyfNwb/eIzgFL7q+rJ+H2SEAIdFy4/H
 O807UmxOpatSyw8F+DEydiG8wIcTpYAvp/7VCXF50c+7bQcQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 31 Mar 2026 01:25:04 +0000, Kuninori Morimoto wrote:
> ASoC: soc-core: remove duplicate snd_soc_flush_all_delayed_work()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: soc-core: remove duplicate snd_soc_flush_all_delayed_work()
      https://git.kernel.org/broonie/sound/c/9968aad12f36

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

