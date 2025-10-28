Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CD33469EF
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 16:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669761; cv=none; b=IXFNcfTnTXcgXX9GSuqhakaWMARVv3bgVezegrAwlHhQW3YNccrSO9ybzZtrQVPLTiBpJyV57sMkeILnYTzoiBAwfDv3VUIE1kUGDh3RiRrIb+4nhfq+67Mx2yxKZTCa1Ge7fdgU3XLVcb1h1vsY97kGMPnebKczmyxTAdyZnjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669761; c=relaxed/simple;
	bh=csypAZB+FLjuPdw/Wyv5YD1HjDFwVjmouxFDu5slgS8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uOn0tYstavwpDc9lYzr2Vh03lRHVb9IR52ba4l8BGDDvjduXWjygXnEAvq6E5GgLB8OgmT3xcXeM5LJVDhGsKxEiuNzCYahamPGYm0yQwxWwlZG1FnVVCy7i8fiB0csZjrNNq2aJVhWPGgAZtfL15d+vKzoOlhJA/0TqWNwy7Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsQxboRp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsQxboRp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40D3C4CEE7;
	Tue, 28 Oct 2025 16:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761669761;
	bh=csypAZB+FLjuPdw/Wyv5YD1HjDFwVjmouxFDu5slgS8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OsQxboRp/UnVl+tk/ytzaTh3wwaxuzCONVQbhV8zlRkuSEz/cowfr0+NzMDjLXRrG
	 /hWmuDnQhBDGZ0QZIXvaqD7QN8WzDzRL5MaSSZEDTz+blscjJgH2ryQ2yuI0kgigB7
	 wZs+9scvFlv5I/+kzG7wEfQVKQbGNUjs11NOaRd/2ghTx9K0is9KKwEMUKcmYrrJxj
	 Ngb+iNAZvrXFb6W8L/x7p/1AYPOOiX+TTLseXPVyTgZmgKDrkX24BaOp6sk6cHfwDm
	 aPL51dPfVuLOBqELSgE0dKuIfXk2DEnog+vyT23PsCoiw57AJufYAzgdgTATIt3nbm
	 JNRaqNy4o1LCw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
In-Reply-To: <20251027140012.966306-1-yung-chuan.liao@linux.intel.com>
References: <20251027140012.966306-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc_sdw_utils: remove cs42l43 component_name
Message-Id: <176166976038.152863.6283181909404563808.b4-ty@kernel.org>
Date: Tue, 28 Oct 2025 16:42:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Mon, 27 Oct 2025 22:00:12 +0800, Bard Liao wrote:
> "spk:cs42l43-spk" component string will be added conditionally by
> asoc_sdw_cs42l43_spk_rtd_init(). We should not add "spk:cs42l43"
> unconditionally.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc_sdw_utils: remove cs42l43 component_name
      commit: 45f5c9eec43a9bf448f46562f146810831916cc9

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

