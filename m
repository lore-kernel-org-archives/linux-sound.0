Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9046C421EF3
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 18:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820653; cv=none; b=nOr7vk2RXAFrL63oUqQ2L1A5LbSYG3ogemq7zXtVheY0UWgN9BDkXtmqClB7ZqND3+K1zTB+zVc9//90stxc8N9RcW4C/dBjdEht4QCN/IMrQJvYddQ6prwW9oBUhbXhXqBDUv7wWaPd9lN+kh+C5fBN9QKrJfgUgbckIfJaHcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820653; c=relaxed/simple;
	bh=48+xPx0suENCrOhv9zrXpWaKBdQ3HQmiwe5S/vSjiqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ug5dUQ/Sxug+9Cu+zSmTaoU71oXREcsYn3rWpqphw7TLtvamR58UjPYMq+pcgRjDIr39l/KIuWWxfVXUdLZe+iuljc3RFoc9gD0hO4d1KApCqXZMMNcucayslXd+cVt5G5vBW2/R/WEbIUq6EY9H1QAuiAUYT9Cpsf+c4Pcjqqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yvg9AXs3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yvg9AXs3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F341A1F00A3C;
	Tue, 26 May 2026 18:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779820652;
	bh=mLSYwTJIdNhtw8rqWD7Lh5hyIxm2yBtrLnFjV5602uU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Yvg9AXs3AHJ3iIz8v0h1l7nWNl0ABUI/HywTOlTtQH2OYKvdsUzHZ3fI+ZelrSiTG
	 w8d7RQEhxskypGpD2yJ4xneCfn8vYGyvSewDGqvDFv8C6sAzUQlgy/mlEsaCIsK6U1
	 sAFiAOYKviBsIylQiTb5fkwVfUazjQVoVwkyXU5i8K51pAy2ZOkDWDtSH8Y44zOy4A
	 KwIDo6kunGPkTGYKjiboc+Atc1QIeX0ZXqJkHZe0wbDB+7DkXY5g7ddNOZ7l7fS2xB
	 nOZtbt17CBxCdCm5jb4O3MWXompQdzhBot0Y1fXPJRspflrZDeHe2Z/+T0qG0PLDFt
	 6y0aJjtOe7FPA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 seppo.ingalsuo@linux.intel.com
In-Reply-To: <20260526105748.26149-1-peter.ujfalusi@linux.intel.com>
References: <20260526105748.26149-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ASoC: SOF: ipc4-topology: Support for multiple
 src output formats
Message-Id: <177981425750.88748.17149183408527981640.b4-ty@b4>
Date: Tue, 26 May 2026 17:50:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459; i=broonie@kernel.org;
 h=from:subject:message-id; bh=48+xPx0suENCrOhv9zrXpWaKBdQ3HQmiwe5S/vSjiqE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFehpSAIKtjIjIh9rScBk9KGPVLZMe+syzHi70
 mFQHMh9xm+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahXoaQAKCRAk1otyXVSH
 0C+OB/9O2JJixo4CiHBoz6G5I/1k43Y1h/+pKPNtAdxZ7zZVnOYylpaR9/rRHljGJeLQhmziA96
 O7hsFBYL9/55JYqtpHRJJ2jutMyh/oDoiNP/DnzyfhhMqbIuKjUusz2hmd//PkGrzB6s1BT1YBa
 lAccNf+8Fts7eZJHNTftwETFsOEftRnlXVjUY5hYwHQYM/Nwm2pVNpqnw8QM6gCWhDUYw8/tn8p
 vnv0cJ+aRo49zpMJIWonEU+MQ1+Mp0HmlPPwmt07Bapq4p38Dd3DtJEJlzWceBTqGWv33/8HPSE
 XKg27XQSDosPramtfnnWzKXWc7kX6UzAmBO8VVLVcf1mVxUq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 26 May 2026 13:57:46 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: ipc4-topology: Support for multiple src output formats
> 
> Hi,
> 
> Changes since v1:
> - new patch to validate the number of input/output formats to make sure
>   that they are are least one
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: SOF: ipc4-topology: Validate the number of in/out formats for src/asrc
      https://git.kernel.org/broonie/sound/c/21a5adffad46
[2/2] ASoC: SOF: ipc4-topology: Allow the use of multiple formats for src output
      https://git.kernel.org/broonie/sound/c/3c3ce66b65c4

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

