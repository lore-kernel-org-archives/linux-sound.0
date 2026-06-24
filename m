Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A3D22425B;
	Wed, 24 Jun 2026 15:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782315228; cv=none; b=Za6UrlBY8BMz/lR2757MUscyIvqqi5mpL+lU5UOhPtBjvMgweOzlrpYvR15S4WBKA/xkad1tIhVTAGl/KE0roZl8makwEHirANd540AZjoICad+J7kPTsSuUouKi8fcEfG43Rn+FPJcxA3pMY+pzL4zKH0LvDVl4cQgarZTRUVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782315228; c=relaxed/simple;
	bh=T3HsoN1RXlYhnBv+yF4N9p1cXEDvlxe3CBqydtMEywQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KM9jJeHPF4QPq05JcXIHSv/K2rjpE1fzqi5WF/tY3W2rSQ1prQMiw5U/SNyNwa+0Do2Kb4/JGb7VFMBCDc6/xuiR840DW64gIzdScLktG2OnxjsewqLVqGPoMxPQf07XbVmavV0gxLNGiHcl6bIa5SYmqbhtChAazI3EPZvb1M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEAC++bD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEAC++bD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C223C1F000E9;
	Wed, 24 Jun 2026 15:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782315227;
	bh=5Pbkdg8CxGrTMdISG/ZeL9HyppC5k7WySbHQJhihs1k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QEAC++bDkxXBzyfD0/mr/n1HZ2S13Hag15DhAJ/hyMSKw7BmgMcrwcFcCTk9819Vb
	 hjRtWTgLNr/P6SELq5uuvInkN0zP6+FsJ3Q8IxoQi7ZXa6Eirx/AM3F7rpELyemncC
	 tDbHAyyvFKSK+2MaeTku0RjIMYJWOV4AdqVHKtByRuXFlnpJ/20Iu0qNE9xqZwP0q4
	 XvyC8voJDUvzAuamRpNJ+m30SlCMnM3XuaDqNBPE+CR5ILR9ZuWi3cxwIdzaN/JlVv
	 nJD6JdjvhjueyHu2tarrM/GEDowe/Uaibh8CpMmY/17V+tbfFmiUOqJlrNsqfsg6gM
	 r11xiRoDyRzcA==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260624083708.254517-2-u.kleine-koenig@baylibre.com>
References: <20260624083708.254517-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] ASoC: rockchip: rockchip_sai: #include
 <linux/platform_device.h> explicitly
Message-Id: <178230246570.43395.16324097796241355703.b4-ty@b4>
Date: Wed, 24 Jun 2026 13:01:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191; i=broonie@kernel.org;
 h=from:subject:message-id; bh=T3HsoN1RXlYhnBv+yF4N9p1cXEDvlxe3CBqydtMEywQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqO/jYR9G4KfjUX1bCR95i0ikgV8DhcjnBLMjAZ
 C1W3Zs/RVKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajv42AAKCRAk1otyXVSH
 0LP1B/wKWONCKZnjL0UA4GC5KKjXW6HczL7qEGMPO2bIM/NPtLNxJoVRS4Icg3FG6wtDp277l0K
 5+IWeJEvbWJuJuLn60UE6tGqqL6fXsF5l5G3si6lKcnzANwvA7x74GuJzJarvLwDmGpnCjrPC+c
 PKrFwIRBtqZwPhfiGE7ZzKTRnXG5ix2NKwyP7owKzI2iZeNOSyjTvhMSyL8UO8WdMgFkqEfxpAZ
 uKClMIdHTybEdrOxKu1QC/eAiaP/I+iig8SBpoAdlfvAne4e7ifImQyc35nVSdV+lf9BtEhc9nZ
 C5OmixPrzWWzsCOBQzYQKB2FBFsj7gLfA5njqKRT91AR4VoA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 24 Jun 2026 10:37:07 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> ASoC: rockchip: rockchip_sai: #include <linux/platform_device.h> explicitly

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rockchip: rockchip_sai: #include <linux/platform_device.h> explicitly
      https://git.kernel.org/broonie/sound/c/83d53eca7e55

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

