Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180053368A4;
	Fri, 10 Jul 2026 22:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722073; cv=none; b=g3PQ0eE0fzpwQU7fi/WusTLWkkFnrm7WEK5slZBK0bzB2QGy11xpxhq4FxwtBwiSa4hefTKhPcnOsDGoESMqBWg9NEKLe8TZQfM767qiI18eztenjqjCRn4d1w7ppzjbBNYf/be+Zg9dyzRaBtsjbD+z+W8egfEHbG2tPurrd0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722073; c=relaxed/simple;
	bh=BvQ+8218l2tLEMuGKuaWratUA9xqpyB1WqDIFp13u7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d4uX0IWWSnRH/QKlNKe2RSENwcvFbTRVZUB0pEQ8sX6ZG9RKTZeos01XKN49+xQFKF3Sb95XJr5jsdalbHIFh54lYc9xqh/AuNuGIxW30zPAgaUCJGlTSTGPJw9o7itDIpw0ggAw3+6LKVGuOuswq6GbIqpaGj533nBCC9JVB/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+aOYJLO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+aOYJLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186D51F00A3A;
	Fri, 10 Jul 2026 22:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783722071;
	bh=XYjtxUuAFRH1Xu5jxD+FVKEKZLEU9WGZeMcxDxCL6D0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=H+aOYJLOUVxrG8MgP50FmBYqSZuw82BZ8BUyL8CD+ZYqdhK9/FO6c3RFZbNWJJz6B
	 Yi3ukK0qCs5wv2PQpveRaoN0j/k1Eez15GDJjMcM5zBtqQdHKRUIsV1C4pdDK49UAt
	 lcnUoULUNxH9Ezh5Su7Bd5F/05vslD68pC4h3pF1FA0y0xl8YWtzohdINXhKP/cGJK
	 byd0nEdiuMj9AhOll9j9fweYHNqzbfoPVDfrDEK3scYvMZpidFDFJCsYN4Fx1gjPBr
	 MEywbvhJ5AZ21PFoKJ/LuhyhCrIpS9sVHDXp7A6aixzJ3rnrD3RacNMrYmz+muggek
	 corY/GoGDOeUg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ravi Hothi <ravi.hothi@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
References: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] ASoC: codecs: lpass-{tx,rx}-macro: switch to PM
 clock framework
Message-Id: <178370541923.82617.15858730110068150413.b4-ty@b4>
Date: Fri, 10 Jul 2026 18:43:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BvQ+8218l2tLEMuGKuaWratUA9xqpyB1WqDIFp13u7g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUXBVpZiRNUe/mVn1Wf2c91yJe+YWHrGi3X3Ao
 92J3WNM6uSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalFwVQAKCRAk1otyXVSH
 0Nv3B/9QHDalUlbuaYzFO/z5D11KBDyyFTBxHGOSkwCv54LD6TCueBq8uAg6IDw40HC/xMhMHKY
 tzVB9DyfN2bJvZvlhqV7OqdrBOFuM19ZXrmgtXWYkqDGKxZNKTr3y5M0aXfKLvG+pMrMvjtuRof
 INmiNi9ws2NiSa5PrhXBbKhKMa/Yiifz4fNt9K+mtNwQY+8ExfCZiV2piZniVGUHWL6uIjmKfaP
 VIkOZ3FCvhUtchW/lTqiA1Lv0Ym2ZRyHsteazrD6cGpTaiXvgWLdGXKm9yqFNyKI+w1ZbA+py7H
 gJcBw6Z7Ou5cP8V/Wn8Exzq5+F+3eF6AowuUuVp95TSRsm6d
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 07 Jul 2026 15:13:10 +0530, Ajay Kumar Nandam wrote:
> ASoC: codecs: lpass-{tx,rx}-macro: switch to PM clock framework
> 
> Convert the LPASS TX and RX macro codec drivers to runtime PM clock
> management using the PM clock framework, completing the LPASS macro PM
> clock migration started with the WSA/VA macros [1].
> 
> The conversion follows the same pattern established in the WSA/VA series:
> - PM clocks created and populated from DT via devm_pm_clk_create() +
>   of_pm_clk_add_clks(), inlined in probe (no helper wrapper).
> - Runtime PM enabled via devm_pm_runtime_enable() with 100 ms autosuspend.
> - runtime_suspend: regcache_cache_only first, pm_clk_suspend, then
>   regcache_mark_dirty only on success; rollback on failure.
> - runtime_resume: pm_clk_resume with regcache unwind, regcache_sync with
>   full unwind on failure.
> - SWR clock gate prepare/unprepare routed through pm_runtime_resume_and_get
>   / pm_runtime_put_autosuspend.
> - Probe error paths tightened with dev_warn on PM put failures.
> - Empty remove callbacks dropped (devm handles cleanup).
> - PM_CLK Kconfig dependency added.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: codecs: lpass-tx-macro: switch to PM clock framework for runtime PM
      https://git.kernel.org/broonie/sound/c/b9b23e72abef
[2/3] ASoC: codecs: lpass-rx-macro: switch to PM clock framework for runtime PM
      https://git.kernel.org/broonie/sound/c/b05482e7ce1b
[3/3] ASoC: codecs: lpass-{tx,rx}-macro: check clk_set_rate() return value
      https://git.kernel.org/broonie/sound/c/b8ca90fafe6a

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

