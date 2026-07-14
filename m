Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C33F2109;
	Tue, 14 Jul 2026 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784064249; cv=none; b=p6/Rkd25QdCMOvsmfWpGmUIc5MYET3EH/kdms4EwhG0eQZ6h57lFSpebTNgGIllzJWIgldhQWPpo/w7Ug6ekD0MP2UB3Yb0zDQdkk2KZTIDf8IUC0fHXmGSxgHKYwxq8JoVVYrMQQay86m+AooeIjsszgeBUCE4gzDCGhm5PJHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784064249; c=relaxed/simple;
	bh=1rlTdPVEJirmtaB3HgVUfJvhOsghnLMPPPjkkC1XBbA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vj19Q3hMVF/eAD8PJRnRlQGs2sYvOCz0zW+u8qt+//zIW/56+/nfwOjbtPPu9bYyba2xtNnhEnGXyagMocjaBXCf5S8yb6+43YCacJMvVeCA4SbamjXsKynDze7u46ILt/fJPE1HzezLyRfNvre3D3qy0Zbntm+EpXI+yYEO6/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vf7weHc9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vf7weHc9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145171F000E9;
	Tue, 14 Jul 2026 21:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784064248;
	bh=sm/C3/9RoriVv1DqhbJBNES+H3kJ5PkYRMMwKdFeWww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Vf7weHc9iI/62VbuZ5ZsoXrq3NVdMZxpqLw0+YnLnDaMXqOR0wkO0sPTVaSaYErbM
	 l2jhlJIROBCZZH7ax9pFkyEcZwiBFIpZuhs+zBKWeHwyv/WdkQljtBwzHNvXk+Kmtq
	 T3K7dN1xmATcc6mv+1hioafwqPMOgz9+7p2LY7EtRYmWY9OR2q2tH0zkq1E+0KXkk8
	 ALkzxHM++rYlwrtxSPm4X9rxzVIdGNkaUh0PD/1ERa+D/ZDEK8nJNHJQLKpx5WAq0I
	 /kQi8HKIyc12fdcoXMEzawbUjXPHH3NEbdyRpLCzkFaNgEg0Fr6Y/x9+7H51tsGr2U
	 w7oTeeuaQPkSw==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260702-fix-24-bit-i2s-playback-v2-1-9c008ff0b211@baylibre.com>
References: <20260702-fix-24-bit-i2s-playback-v2-1-9c008ff0b211@baylibre.com>
Subject: Re: [PATCH v2] ASoC: meson: aiu-formatter-i2s: remove pipeline
 reset from prepare
Message-Id: <178403353533.7661.3587699052288293091.b4-ty@b4>
Date: Tue, 14 Jul 2026 13:52:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1rlTdPVEJirmtaB3HgVUfJvhOsghnLMPPPjkkC1XBbA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVqj1h8DRXWnkwi8ihLSVZ4sFeF85Sd+R+80o2
 g43jxHVLYyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalao9QAKCRAk1otyXVSH
 0Kg0B/0dKBQP+1uaY1hHT7K10/CjBAlegYHUZVMuaxpZ3kjQH2+upsicYrwgsF4Kq1jnycwrBP+
 EV0lOyhDaoXqpYgHL1kMljpV3ZyOBEuCqnB3KYkj/on+hleHeR6zG9aFmgyiWxFdtpbQIU2NLiq
 G09KfvOAdEPHR65JzTuSzDuOEXnrEYUSn2n0tSRiQWnMRKpOCs+oQbr+RYXB0GXw64RTSRQu7J6
 C9K9mkfqXw1jP5GSiIhgaMNI4HZj/kqoFyU4yBn1gs6u+Zf7PmH64VKmwcU/cBgP43PcYkaNckp
 E099aKupcxDWyVj0nu9ijxtwp62S7qH13TZh2FsD7mx/8b3S
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 02 Jul 2026 23:31:46 +0200, Valerio Setti wrote:
> ASoC: meson: aiu-formatter-i2s: remove pipeline reset from prepare

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: meson: aiu-formatter-i2s: remove pipeline reset from prepare
      https://git.kernel.org/broonie/sound/c/72fe2ef11df5

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

