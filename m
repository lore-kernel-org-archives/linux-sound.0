Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BFA2F549C
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500966; cv=none; b=gCCekAqIuv6Ygf+DQVummoIZ0KXJfpUDt/1n/SiIEuV+/bYt2s8+6YOsxqhhnP9qyQMStt+kLxgaMPdgxjzqJ+iaOMmaqT28X8lM8CTnqO5c3upKE8lgqtJGnV26P2h+UBvquk7sc+7w6qFn+G8uDFg16oOMik3naWVX3tu4NXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500966; c=relaxed/simple;
	bh=TnxTo6O4Xzr6iXj2gzdZkgCLcc8pwgEwtnVYV/5PSts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S9uIJRZYczH7SUr0fLlxZaWaiGg2kqCJ/dwz9rV5oCECuZ6A3ZG8R/+orDDsv3mHtdS18JhwIz+vnQoKJHyw0lJD4UFpwv+jBjzuK8syZgMLfcbZfMhWK2JwMoKB0yrdQI+0VNWhVQpZBTz8fjYNolHyMmYKvX9cAk8//XW/4jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ztmn84ji; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ztmn84ji"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5F2C2BCF7;
	Mon, 11 May 2026 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500965;
	bh=TnxTo6O4Xzr6iXj2gzdZkgCLcc8pwgEwtnVYV/5PSts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ztmn84jiUELmq+71IwvklZ6rnfC4BOuDHlvKbF4NU4cWvCDw376wf8oCpYSr8WigA
	 wG8WlmiU7nthlieNZANA950qUIZo0Ao8nybYt5H04+DL+y9FpQ/NSnZ4dZuF91x9r6
	 MpDHQxtElu9RJbs8N+5sNUZL6CUrw257lYV/ZMh3E3ODR0xKbVxw6tAPG3BW6wLe+J
	 cg7t6TzjvL/WG5wjLcN1NQm7knwpgontTVGl9FofAdkg1Bb0ciFk17de5MrBXiEeTq
	 uNXwC8hdpAMoUSnk87MBTvv5pL/B7G99nvd8WTn0dNoUuxSPJV6HxStY0Vj8UZPrf0
	 VM/aDBjWqWTPg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com, mac.chiang@intel.com
In-Reply-To: <20260508093224.1246282-1-yung-chuan.liao@linux.intel.com>
References: <20260508093224.1246282-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: sdw_utils: make RT712/RT721 CODEC_MIC be
 optional
Message-Id: <177846145399.988959.16413936913320319561.b4-ty@b4>
Date: Mon, 11 May 2026 10:04:13 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TnxTo6O4Xzr6iXj2gzdZkgCLcc8pwgEwtnVYV/5PSts=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAcVjhIP2Z3tBgwfn0XsmVmooho4VxMQ2rRPVI
 I+lY7QYmdOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHFYwAKCRAk1otyXVSH
 0GnIB/4oovArXlrjeLTNH4gBEjJVuWnkluqR98UuSFR6CpMsLzILUZi5HLJHxJQ5OlzgSQJaO4b
 rs7ZI0mR0T6cPoqp4leKIMW0cGk5HZwVX7Dt7s5ObCNzyl4xj6gIKxbhdswqPDIcAIoWYnNb76j
 6WTe8AV18/wz5O8ctGRlyBrOqYaNOdGN3rruG8z6PP5JmaEXE1oRG8Ux1I+nm+udqd+vKIw0uKy
 3Zfm94kY14NyaOhOU5dJmoiEgsYozYjdQpYB3XGlUuv0BwCKK8d3wVDof6oYGFd81LxZeHQhGUp
 +lfL+ai21bvTyEzgQFrSpRo8Nd1Q5XhhwSZD2KxJG4eFbWSB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 08 May 2026 17:32:22 +0800, Bard Liao wrote:
> ASoC: sdw_utils: make RT712/RT721 CODEC_MIC be optional
> 
> The RT712 and RT721 codec mic are optional and are not used on some
> products. Add a quirk to make it optional and skip the codec mic DAI
> when it is not present in DisCo table.
> 
> Mac Chiang (2):
>   ASoC: sdw_utils: Add quirk to ignore RT712 CODEC_MIC
>   ASoC: sdw_utils: Add quirk to ignore RT721 CODEC_MIC
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: sdw_utils: Add quirk to ignore RT712 CODEC_MIC
      https://git.kernel.org/broonie/sound/c/9c37daee7c17
[2/2] ASoC: sdw_utils: Add quirk to ignore RT721 CODEC_MIC
      https://git.kernel.org/broonie/sound/c/fa749a77bdc5

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

