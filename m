Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8ED3EE1F4;
	Mon, 30 Mar 2026 22:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910583; cv=none; b=i4QW9A1yxtQmNzIiaDdejE6EEwyGa2fhpKQRfxFgA738WzJLnhaH2pQ0bvD9NISt7+X7MuNmXSjnXcTbjQDkPu28T5hnClTLrL7qphwDNm5K9fKehDt16VGTbv5ykGjNyadUfhAH3XrxKgf4ScXUD2Mss+eVN19Othup5cQaQ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910583; c=relaxed/simple;
	bh=ESkdswaCDJdyov5LevOI0S3ODhwQBAdvuRCap6NVbmA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NJ06cKpmbFEq9rEwBg2Fn5SPR8S+S2PsW7qLYVjTal9N2dFHKRCaBTjvf5f/XcUukMsx5N1Q+bnXbcjfBO6eWxDE/btMpShXCtfna8wt4KTTMet387aKzitszjqZtU+z4863gyUZzjJ06CWunvxIyPtWWP9H68wlTjiLUjmUUT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hmo+5TzK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hmo+5TzK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA24DC4CEF7;
	Mon, 30 Mar 2026 22:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910583;
	bh=ESkdswaCDJdyov5LevOI0S3ODhwQBAdvuRCap6NVbmA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Hmo+5TzKQftHygmwYBPlERiuGQhVs0eksFKgvWH+K0W7ZxTH7tRvJSB9RzRFcenrl
	 xdnT5k8dkhHOolq4/jPX64LIB01aZu2w16+askFZ00RbpYN8om8QlOAA8Cy/8O7eo7
	 B7dgbKrcj21Mh9Fz0HOA9axwTAJ3t7mhK0ur9oiZHxzKQ9ZFIC3WHkRRaSeuepHw2Q
	 uqgqSYuPTXJoyVJ9HAYM8IrdiyLatiCpIHNV7DTq+vO50VAeyyG9CwL/yOC2r+FOHu
	 n4JnzRzjJO/pEGTG2fPAGM5LdC+l5O+KIIbSZ37WBG7/DLr8g5YCZUBTuydZVEhFxX
	 6gja4c9rLZSSA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Gilson_Marquato_J=C3=BAnior?= <gilsonmandalogo@hotmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260330-hp-15-fc0xxx-dmic-v2-v1-1-6dd6f53a1917@hotmail.com>
References: <20260330-hp-15-fc0xxx-dmic-v2-v1-1-6dd6f53a1917@hotmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
Message-Id: <177488075660.162232.5647708733909097116.b4-ty@b4>
Date: Mon, 30 Mar 2026 15:25:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ESkdswaCDJdyov5LevOI0S3ODhwQBAdvuRCap6NVbmA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvx0bVeYbnEOddjXLcSlw7W5kpNrWigel9TtH
 hv4iIZZCfSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8dAAKCRAk1otyXVSH
 0CPXB/0QKDvqR+TubozhiV7QE4QdQ1NsOorV1WjU+wTfStb1uBlTIcKs+BAS4IIl54YXwuOfIBj
 eUS6b+FTSleO4TjB8tahCku+XPTg73oQLQXVN4B6nk4JROuKE2BYXyMa5k3PE1n1eZAP7YpjTh1
 XB8SBYQXIuFjnPtrZQ52QOvt8vKPLA3A5MHk5ZL1VENM7Yad/7vVNfnYQamMKndMU8wifuEJqik
 RqVuI3zesarZ2jozNlrMaELUJo/tXBbLPnUq3f22sr9dfDFRJ49tjAD1u7QJocySAhvxknIkRcF
 lcyJZxLt41K24h1G30Je863cDj9Grt8yx+TmNLpZhmcAM+XY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 30 Mar 2026 02:43:48 +0100, Gilson Marquato Júnior wrote:
> ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
      https://git.kernel.org/broonie/sound/c/8ec017cf3129

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

