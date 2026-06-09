Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C9637D133;
	Tue,  9 Jun 2026 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046353; cv=none; b=DJWITvB4A69shIxhKZwIBQRk/BwWn++rmFY6bcLfw7+QS8Kc7499VrsQwSM5v0MXWSa8oXvbbWqQF6Hd+HzAwE1MGGjLv2DhXltZGGLkXPoY+Kn7Ejs2IHcTJ//OQTGkXOMiX6zqgNxd4V4g4llHJE8GB9kvjDelTDHf+gOo1j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046353; c=relaxed/simple;
	bh=rV1XUG1iJ+2A4gOMWO4YpYzjJWumO6L+RGqbTirwvCw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TGIbayMXPgAC2gumWatuhCENw5JHh+yN2LQJ8RyO1/1WYhId471HMzMt/1q48tAEhCnbKr6ZWWgtuHUT9xBy/t/kGZUNMDEXCS4uhistwgShXfQlvzgqrzeF8W2qJqBXJJMYMZopvAlrt2VmE3F0KtC+u4nhSE1RO98PJmVPoEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOrimnst; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOrimnst"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906151F00893;
	Tue,  9 Jun 2026 23:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046351;
	bh=k8A0/D5S7f0q4b+jzbPdRc0FrGTTueFhMvYFRrbY0fk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NOrimnstovrryUmDlGYehs78YnxMbG4LxC7VM4sUSdF6sYM28KDsmP5EW5iJYUFHt
	 Bu7k+IblIJPFtq++rzc9KRh95cCy/sdAh3Kj3ZP3EEd/z+MYIROQgj3iKtQUenll7Y
	 QXmGU/sbvgKouFiflSPYMyQFTuuNyJFclGek5+Vg1HV5QTlbi/Gd++a3DIneCVQYM8
	 fcHe3cwYLwSrGLQ0sGyqXyJN6UM67SzDLAHtddLXZ2tmqFoubFdbHFAHOeeZ3W5UyS
	 rI7ZyXK8i5JqKhuS/bVtjuXT1lybzZcSQd+cMxOQSBlvgwry24f6MpDNhrIkFZlS/A
	 HrEFtIr+1m2Gg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260609122946.288103-1-rf@opensource.cirrus.com>
References: <20260609122946.288103-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Increase pm_runtime autosuspend delay
Message-Id: <178102162459.34323.6395120658891272568.b4-ty@b4>
Date: Tue, 09 Jun 2026 17:13:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rV1XUG1iJ+2A4gOMWO4YpYzjJWumO6L+RGqbTirwvCw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKJxNRnPu5WawNegAuEuFyeViXx5dlUjyFdJr/
 +ZYye8cOuiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiicTQAKCRAk1otyXVSH
 0GZ4B/9vFhCt5jeYUu/eflBWHthhlm6w/mUS4AHTi0LVzsRu5HMOJYnYhpWwMX7zK/9RO66MLjg
 KBmeEdfCODCdJU6uG2yHSrD3jvcHCu8BwB8BNBec7GygJg3CwT7pqSTe96/51G26sB8MbwGyf3L
 sPl3W91negldnomaDHlt0sLPK51oDguCfgnl4MfYAfOUm/7KC4F/PRlvQQCVOpQXOUOePkiDcyk
 oZn/aa3VPhOVFywFoOxMHEtHxtM9sUxFqHMf0OLmcBh8sO8UOLL5+v9rT7aWXP0diO3yILaLyNA
 qdB5ts5v3M/T8MxrgY7UW/3E4Pb4QDPwGSPYznNkIrPvFlB6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 09 Jun 2026 13:29:46 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Increase pm_runtime autosuspend delay

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: cs35l56: Increase pm_runtime autosuspend delay
      https://git.kernel.org/broonie/sound/c/60a1646b38d4

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

