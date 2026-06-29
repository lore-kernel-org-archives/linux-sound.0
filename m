Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C2C40910F;
	Tue, 30 Jun 2026 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818291; cv=none; b=Oda718M0Zk4k4bcGUZOrC5x5cRiysu2/nly7jxsacOlNp1iF9oMthmjxwcpSLLL83GdlGrX5YfFFoJq9eLFy6SBqb1SG0yFyagdHPKD3jUO4r2M9gap3OQhxaL0bWWaQui5A3aDE9c8azOMsUY/AhQDUkq1+n6amWkBkAw1v7Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818291; c=relaxed/simple;
	bh=ZH7bcux/gd3h/TDIQyTW0KOTX2yAuo4SZbH5ZwOf+vE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E6ukQiaAdAPsfqVhOj1MJ87gF77OkAJPvJo7lddg5vG5y+fsmRp7caYSAYdzM1lz12nRq/V0Ety6Zbs99O3/ocZYwnbSkCkjRp+DoH7diFgQICueZZidRzeOuLnVpn96/PoUOhWg6GeCPBd1TyosLRhNZFxEhXGcqy/h8nkqNxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3DtDuH2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3DtDuH2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6DF1F000E9;
	Tue, 30 Jun 2026 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818290;
	bh=PkQxpMbPscxl6w32bRCwu+Bi1OlD5m/JU9SPBbDdGvI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l3DtDuH2RmP32m16YZndgexEaseqs9n425FG6eRGa6HZrexhWvn1BusdR0lx33B2j
	 Rx/QVNs6F2O5KB5BBBHy+crLfzxSK8UvGaN1bgLYXOKsrC7OUrzzXSmBuAZE0TgKfb
	 xObC7a6d4/Xsvle74Qc6iYEBfI7WDatR+yryYsOX+W7wgwcJcwzedKBINtsEsbhfMJ
	 RIX31ZiqLDKE6hY5Mw8OBM7s/FZdyRFRkWndZ3jS2CuuXWeGnTMqsumebeCFF73gpU
	 A8uj/cNrjsM4Q1TFfatpj01rpwJePy5HI+/nw/aoNfiag1CkoOUiXQrHM8gpLCa1xY
	 NCqjYGDv944hA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20260629025722.1982120-1-yung-chuan.liao@linux.intel.com>
References: <20260629025722.1982120-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: ASoC: SOF: add AMD reviewer for Sound
 Open Firmware
Message-Id: <178275593761.47562.2431884277415965473.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:58:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZH7bcux/gd3h/TDIQyTW0KOTX2yAuo4SZbH5ZwOf+vE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6XwkM7jz8iYLTMmKyYAHpoQO9SZ1EnzhKMkR
 eBWfnBDvhGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOl8AAKCRAk1otyXVSH
 0HlnB/9y0En9lIzPDGke9zQyP4MVySThXiOlDCw1Ze0FZRWc5PPviDeeenXahU5zfzEILQGAzIW
 WP1Ih92eDglUCKdxmz1CLSWai6Nez2hPHztdKejVO9ER0DM0tDjlJB0ZIdjfAJW97JKIgqIkD+6
 QjpJIRN/NAyKFalKghqTjyW8L7O5KKLEuBTFAiK3xCqZvCRP7Udt8V9V85Yqhus8tTt+QXgBuof
 1w6sIV9eOOMkfADcLn+5yiA9NQBdkykP24b1QIGEF+iOB+1x5x5uQbWLvDliV5PSb42xZBmb8gQ
 4QwSlGi98AQGCyhfnJt/mG94Lcdx6ywAourNDvzh3usIrrBx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 29 Jun 2026 10:57:22 +0800, Bard Liao wrote:
> MAINTAINERS: ASoC: SOF: add AMD reviewer for Sound Open Firmware

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] MAINTAINERS: ASoC: SOF: add AMD reviewer for Sound Open Firmware
      https://git.kernel.org/broonie/sound/c/91a6dba5183d

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

