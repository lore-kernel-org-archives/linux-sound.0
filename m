Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06714423A83;
	Fri, 10 Jul 2026 11:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684230; cv=none; b=sECxasX+0oZi1TlB7U3K2AE1KWcY0jOFkF090UVrWbQp7sAP1m0EDWJexKDaSBUMyctt/QfdpfQu+lN6jDimdh2CP9OCyAzPYaXh+BaFVTCBRMApa/68BIp9/NwOGHzbTRLkbMktxtdN19vBsYPAgeX3mHj9bzlsTuhm3XspaHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684230; c=relaxed/simple;
	bh=UZdUmoodhVHHdoHFoRCI5rBy+M6d2B+yAh4jb1TjnRU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=auDyWr+nW2Q9ppKxEyBIMkAjaypuPkEqccH/mA/LCsEJjpXqkID7/StgK1QEtMbbgeFW2beT4nXe4ioPrmESQ074vqaRDTOPlzUxs7mslYpAuIiZvU0OfMtHRgxm2LeAyaO79m2nYeEFfX1G/FFikuFCQermBjN59Nvsn415O6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dyyvw1So; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dyyvw1So"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361241F00A3D;
	Fri, 10 Jul 2026 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684216;
	bh=d7GFtV0zLRbboREeGcfWQ3oteZEyDJuFiRMjPAzsWNY=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Dyyvw1SoIHdqxpq4GPO9n9piIiDu3PRvuhr0PnIgc+9611UCYjLXNnjAaplT1tQmt
	 q6Ci/PJPgLVdAjCffIYanceLHp1SK9psoKYjJ1gCxte7G6aH1U0lI8oNqw9dOCzokL
	 deA9tpG7ycldtvreEajXagsdXwiguzpfZ/gp+7gE+zI/mg+ERVJMGIn5EBqhugmWRe
	 6cAtBxyuRLIIEMVJ1IaFLoD4mxkadH1dTnG8ZJMSBXD/OHtMYO2Sy0mlpkICFphmx6
	 Z63unWGSWB+e9yS7sqkYgDqsR5ltXyudzbPMv8GchfFam7iv6epyGfWbDaTXuVtMQC
	 doZXQC3H3U/Vw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704073758.37156-1-pengpeng@iscas.ac.cn>
References: <20260704073758.37156-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: rt721-sdca-sdw: Propagate
 regcache_sync() errors
Message-Id: <178368417372.82617.183770414196863834.b4-ty@b4>
Date: Fri, 10 Jul 2026 12:49:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UZdUmoodhVHHdoHFoRCI5rBy+M6d2B+yAh4jb1TjnRU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNx23pnaPMdP8DJMSBE/MJzlS6bxCdvp6bbBY
 BKPsBHUunKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDcdgAKCRAk1otyXVSH
 0PZ3B/44AV/A/CJ6e6u9uySVh4qiMJ2pOQsdCWvjHNRS3OhkKOu4iNhv8IZksZXUpUBZXY4OAFb
 JBfG9HfylLGOyBdXUC7xHYRcH0pX53dnWE/QUvlj0h8ZnGUMEY3RxaGv5EY2BS0aGw7m6/vSIj8
 a28Ye9OOompJbaVMoTMyHOeRQJli/fdHVBa/DA9MfkfnK0ts9Uh0AEBo3lKIiyHxutVvXHwjabU
 uKBARlt6qoW+VA5fguulBKAFQeR+ZzIZ9UvPMskfqcovD4HdQxtMn6xNw2byvcLQK9LNSrr3xed
 bIyEFFo6YhDYKZHnEPpgHWKI6CZIJlGkIK4cpt4yg42s5HN1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:37:58 +0800, Pengpeng Hou wrote:
> ASoC: codecs: rt721-sdca-sdw: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: rt721-sdca-sdw: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/7a0886826308

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

