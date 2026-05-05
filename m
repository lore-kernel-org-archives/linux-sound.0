Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B823128B2;
	Tue,  5 May 2026 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982822; cv=none; b=DAoFzvRRb8eyCPSDQuqiEJqWrMfpIDI/vecOm+hCJSPDdG8XFxfynGciIaCbbrqe43kOOuoNE8F9moMG7LNhdhw14B6F9ZsvVy6CA5xocxSBP6+58/57AcFyraH5vg0r93V2GUPbBu4XdzapkNSmQ7PxF8hn6f1AYFUEVWmiEfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982822; c=relaxed/simple;
	bh=xaD9mbizQd1b6UqDfyrysExa3VOOq9v3PcrVXzeeul4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i1pzcmQCPD2mkckaQyRQ1ZZyiMyPxJ6v+Rg/Sq0h+Oc/L6yLDKtxLd8n3ZRsBa2vZo4tZOVzwtcF+6SvpkUX4qWFGsTdu4f+qAvIPLnUIf+fYu2PqmS6Th1EjBJXwEdBUXmuOQEjy+6Oaf8I2u1rZq1YcNvIo3fuozgS/sv68V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U48m3PA6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U48m3PA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15784C2BCF4;
	Tue,  5 May 2026 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777982822;
	bh=xaD9mbizQd1b6UqDfyrysExa3VOOq9v3PcrVXzeeul4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=U48m3PA6GhCmK9QmAkHRB04UFQDeWZH+YaIV9bUO88lu3iNzhTDxlZCqNWzhcIrjd
	 8MPgpI8u9ft0B/C+bufe7g14mIbjhPKbW2wcHmugDMDmhfBeAkXNRAlQtoMEuhpRmA
	 sk99JeQhs2OC4W8sZyQ1VD5z8WxjsHiTQ4psuy5qAn6qclbC2ow9ZahGqG8FOuZP2v
	 254wvNs91FOLb4EuD+WtWyhDV+wIAV3u9HNe4KHpM5LmPWygdJKizpJAXDi+kaylrL
	 t70AOlKqWzIIiANuRRPylok8Phdjw1vOs5XOn5qvAmLklBPuePPPVdXM99dpnV+3NG
	 K5Ol018WjZfeg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <cover.1776998727.git.daniel@makrotopia.org>
References: <cover.1776998727.git.daniel@makrotopia.org>
Subject: Re: (subset) [PATCH v3 0/9] ASoC: mediatek: mt2701: HDMI audio
 support
Message-Id: <177794593956.568329.18111274443169699452.b4-ty@b4>
Date: Tue, 05 May 2026 10:52:19 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xaD9mbizQd1b6UqDfyrysExa3VOOq9v3PcrVXzeeul4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+d1hHL6mYRoSKxSPphBNCkaAAarrd9i61MRPa
 HBnnvBeGLuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafndYQAKCRAk1otyXVSH
 0GFDB/4oqRY8K8wC62idbdEwnO83AmEZxnDqPm561JFi65FHoufaBB98cTehbxvmX+CEy9wuXtk
 jV9DZIgZizHs5QxRGB577AHYXOFsfCnGPjqeCtXrb0D8mWyx9BWWcGRWAnZx7d7bawLwmzIyhD/
 xmtQuSw5i0+DZqh7mhyS4jVROuW5GYVaEYEpDtKxoxZFj8bzoKzTZlFRrX4ujwPdeWzzqNCO1NS
 HA6jNpnAi27ZInoG0x5b+lFZhSNm2Fd/USi8YDDpUBHolJjbnno/g9t7bvfC7/k12CtL/6CYQbS
 wAV9gLK1d8vHH0Whih4Ejm35HyUrdG8LULyduxmmPCdFzlZQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 24 Apr 2026 03:48:29 +0100, Daniel Golle wrote:
> ASoC: mediatek: mt2701: HDMI audio support
> 
> This series wires up on-chip HDMI audio on MT2701 and MT7623N, from the
> DRM bridge down through the AFE into a small machine driver that binds
> the AFE HDMI BE to the HDMI TX codec already exposed by the
> mediatek-drm-hdmi driver. Bindings, DT and a BananaPi R2 board node
> are included.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/9] ASoC: dt-bindings: mt2701-afe-pcm: add HDMI audio path clocks
      https://git.kernel.org/broonie/sound/c/7139d75a1ac1
[2/9] ASoC: dt-bindings: mediatek,mt2701-hdmi-audio: add MT2701 HDMI audio
      https://git.kernel.org/broonie/sound/c/069ac057ddaf
[3/9] ASoC: mediatek: mt2701: add AFE HDMI register definitions
      https://git.kernel.org/broonie/sound/c/3401cff9a9ef
[4/9] ASoC: mediatek: mt2701: add optional HDMI audio path clocks
      https://git.kernel.org/broonie/sound/c/06efb5f1b777
[5/9] ASoC: mediatek: mt2701: add HDMI audio memif, FE and BE DAIs
      https://git.kernel.org/broonie/sound/c/0e2f1d39c2bf
[6/9] ASoC: mediatek: mt2701: add machine driver for on-chip HDMI codec
      https://git.kernel.org/broonie/sound/c/4d9c6bbfed7d

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

