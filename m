Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E96C4252B2;
	Fri, 10 Jul 2026 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684126; cv=none; b=IqrVEw7Ve4QZPPl8ArXjQXrBHu+v82kGooympUVH1TsS74zU9lk0mBL4YJAfsmJfCSUJOBlbbLKoByxKMSjJ+QAvQnnjg6jCSWreHVSTBjfprPNOHVVWP50ZPAgPtJ5N4oc8pFqjpmfmN89aKS3ki2ROrGwIjRJaVQxJlVtcQyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684126; c=relaxed/simple;
	bh=wQnT3QB+qyLKlF55Dg6WSywYRdvVoJwYtzlqJVVLOUA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BGBlChrNTRPSA99bwgzUkMAhbHs6tdY/V4DaPRIq4Wx3FVQE8Z+9k2FGCSNfyfffloI3X8FiZSSz55zjjl4nL3MqXOlifSxYr+jKMa01YTEtUFc9U6wbU5+GCznK37Wpiw0+AcW9eahOjaHmtoPYUJcEPe+LT1uDymiRJ7U8U/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6hcwDCF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6hcwDCF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92301F000E9;
	Fri, 10 Jul 2026 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684117;
	bh=rV826htMq3ARxo5ZOePy3cYRZpDJLTRHdHrGAJy9B+4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=H6hcwDCFZmc1lfO2xwuPptlgT7JuISW2Tcn+cR0NVdas7t835tANZQWizc5Hf4N3M
	 0of+VE6DT7njZTxIlrt4orrXgSqzcGFnubAaBoDPXN47BoscEaB2Q7IdgJHUgrPzBU
	 lF/dX6vVubjwWoE4pyRSnMKWXIfvyn9vUDpJ7rDCQV7p0BLuMuc5hh3jEZhjukJVwL
	 I6thmSZZ6gJkwPgx93HsMHQxX2oNZ+Ql8jsYRZFu2qKhBCsZFuVGrhdBZbVF4ZM8hi
	 BsXAIYjgqsWa3WJlTwf8uA67YCqpdLpUHtRqjVFASZ9qKUwrbdhPq4Hq8S/1SmCQPT
	 TfAXr0fcKO+vQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704072616.88634-1-pengpeng@iscas.ac.cn>
References: <20260704072616.88634-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: wsa884x: Propagate regcache_sync()
 errors
Message-Id: <178361271325.100558.5004202923769920484.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:58:33 +0100
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
 h=from:subject:message-id; bh=wQnT3QB+qyLKlF55Dg6WSywYRdvVoJwYtzlqJVVLOUA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNwSdDTi9ompg2rdyDNwmSbz/htLra988hfeK
 nhaadRfjOGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDcEgAKCRAk1otyXVSH
 0HtJB/4gUYcAx1625IoqZf7eGtEEkKid373gGxWppsM1Qb97OpCq5fDW9+acz+7hPiK/n5pO7uJ
 kzaRb9rrYD4Vs6cjcAgMoyh9bJ0w95o8dCIVxqdKexNxuWz76cWOhAYdBmF7N6ARpAX+HeFbebT
 6W5zrkfsVjng9Yauvi+yX3Aqn7gjBF6SnR+ekfXZTWvT8wj+ezHI43GhwG0K7JCu7u7/NbTNyLZ
 7669UwitkrIgR+GT+FawBzW0BOTJ7CZITkbMARgnTThSnJTUwmrYElB22rYpFHwVaV2HWm7J1aO
 on61PmOJecIM5GolMhW1zYLsPs1fN7ueBT+Es8NChVQDuTW6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:26:16 +0800, Pengpeng Hou wrote:
> ASoC: codecs: wsa884x: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: wsa884x: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/6ed25217ae69

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

