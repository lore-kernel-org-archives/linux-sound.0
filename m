Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF86E3BB9FE;
	Mon, 14 Sep 2026 22:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426425; cv=none; b=PUP4fOh6XmKxrurOVN1XFF6m1TWDi54tN0iP8ef7QBkKiu48WsGPOOSgIEfNUtVpK4eIVSNVRwQwvU5zS4kiZDGyVTssnHix1bns+lKemObe1aq9nUTuxCcJxMU3LInUOKxcoSMeW4uA67Z6hz3Nz9Ips2takNhmcoBCuAVy1YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426425; c=relaxed/simple;
	bh=2FcZ5UZqIjVillaDy/Al+qiBeAJfUNwIUD6cC4hbKOg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NyLzR5RYNHS1mjJeWTUBnaNRCEkRbnu5RfX6dExRD65dybYk49tMwZDsxjCxxgz8vAN6NPJK/OF2pnXe0jadpePuDvunamxWcE+zm+N/17Na4pPR7w44XKGz7u89NgckALEaEOb3uH9HJOD+tfZffsyP+X0fUov/2X4occChn6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWKOWbX3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWKOWbX3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68FD1F000FF;
	Mon, 14 Sep 2026 22:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789426423;
	bh=4FlgsHZGZFeo8HdlThrqiIcKPLiZF8Hx79n5WIDnYgE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FWKOWbX37KnyXJ2yRZ3bzNoSM5Lt+Nsrdi1pVZDLIBIJoNTBzYe834m1nX6DSbBXC
	 YS/gvJEm7VtWgihUjAWkHgeiG3BKAJui7J+p5qQC56gYAg8PY6I5qGdam1/4xyAYrL
	 rdQmrywaEP6+1RqJ6vRPpjkwKuz1ZUe6KvALDVVdVEX5Ld0AZcTkJ4NFAshJMTW/Pc
	 tk5HcbUpgWrh3jSrx/+aaKR92Bb7H7BHdCS/Jxmq5s5aQwqXCEMZm0v3UjOGSjEWvb
	 tzJVn4aii3oJ37o/bovRFAXkHmbiXlgfQYUlPHjym1GSmrJue8Wqtw6XtaA9Gd/PSr
	 zIjw7sm7F7oNQ==
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: error27@gmail.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 alsa-devel@alsa-project.org, neo.chang70@gmail.com, kchsu0@nuvoton.com, 
 sjlin0@nuvoton.com
In-Reply-To: <20260914015648.311986-1-YLCHANG2@nuvoton.com>
References: <20260914015648.311986-1-YLCHANG2@nuvoton.com>
Subject: Re: [PATCH v5 0/2] ASoC: codecs: nau8360: Fix DSP routing and
 deadlock issues
Message-Id: <178938378715.1239410.2210412179676360057.b4-ty@b4>
Date: Mon, 14 Sep 2026 12:03:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2FcZ5UZqIjVillaDy/Al+qiBeAJfUNwIUD6cC4hbKOg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqHrxh5XZbciWZC3hbOxYu5LULjT0kZie6Qcts
 NiHMhyfu+OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqh68QAKCRAk1otyXVSH
 0GgNB/9vrC2fx/H/BaRiHMgDJgGOaQsQlylqjM3md3zPFoTcSlLz7fsK60GyvJNQA/BB5PnW0DW
 KqSLhYydsaWQvo75pe0aAZYwyCenQKG0qz9WNg4JfqPqRZn7xu6lERQv6LkenDvWTS44j2LttLa
 g11rl5NVYat6mxpJdmn05wCrgAWi92Cph77iTFyotJwD7oekD7dH6jEzYmeECdf6aC622gPO0bx
 PPQD5pOHFbzqEc5GXVIiUF42yIP5tUOl/9PnNn0q+RnMcb0JOef+U6H/MEN/jQ0smmCrsaEx6hv
 3dA8A8/zFe1QSgzVcTnWL1/VC+sDEj5xl3HtnVVSQsMdFyn5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 14 Sep 2026 09:56:46 +0800, Neo Chang wrote:
> ASoC: codecs: nau8360: Fix DSP routing and deadlock issues
> 
> This patch series addresses two issues in the nau8360 codec driver
> regarding the DAC mux control:
> 
> 1. An invalid hardware routing state that occurs when the DSP firmware
>    fails to load but the userspace attempts to switch to the DSP path.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: codecs: nau8360: Block DSP path selection when firmware load fails
      https://git.kernel.org/broonie/sound/c/9231c12286ab
[2/2] ASoC: codecs: nau8360: Fix AB-BA deadlock in mux update
      https://git.kernel.org/broonie/sound/c/9b4647233ef5

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

