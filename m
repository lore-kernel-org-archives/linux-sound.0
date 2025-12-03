Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A52306B05;
	Wed,  3 Dec 2025 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773660; cv=none; b=ZHG2uWmE96AxK/Z3u1ZS7t0BLZXt+TvQo9+ABkJ9aapuqq6uFT4k+q24MduJJkMbIriAI/Ap0aWXdDgAgA+S5P0q8JRTta0SKoWLARLX7LjMr3rXNjk5pyivaeJYla4lU+E1GHfdun8Tfkx15UXBtEluti9UnPbQmQo7Y3FkjyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773660; c=relaxed/simple;
	bh=HeybgVLMsvtOtNd13l6lDN8nCio/yFx9Gd97GBGfuqA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xuf/qRxVpBAXvvVi1WsbtY+ivdR3zRzTXpqDbsSAAPNrfi/VqOPY4sMq8ZyjMhTAMWNKDYzVj0DrWyVdDYMJpqfNkrBKMxCsiYnpzhzl9It1Rq8XMvKOKdvtvGl/q5VrEzwS6kHphFZZ6Nlr5dDfpLvlbdOyHSpLFU4+o/G3WcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0eCiZgt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0eCiZgt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C31C19422;
	Wed,  3 Dec 2025 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764773659;
	bh=HeybgVLMsvtOtNd13l6lDN8nCio/yFx9Gd97GBGfuqA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=O0eCiZgtAvvbs5FM6bzZvhaEBoG5oFjEROawUke8S2T6uopus6PJs7XKruG5dusqp
	 oIWX65RMICgGVIyhqdmif04qUsIkDPyVT5WGitUQaYX17QBYf4bCF+84aJrVd72PHt
	 cjlkR/zpjnm70Mx0Yx0GqCimAIXFhr7brOsiLlN43+JlypT4YoatGlOX5Y7iksQTW3
	 jppgfK0N+Azd/xzdaNbYgK0PLA1mr6hupPmSJaBKPGWPopMV+xmuMsmHIbKHPEOYT2
	 EMU5qGCstCoPGMHgXxLubcUFkUpuCRksJo4gqAN0khBG0mMX0QqF9xxUfABCbs7DKe
	 0a6Dnk0ozY9ng==
From: Mark Brown <broonie@kernel.org>
To: david.rhodes@cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 shengjiu.wang@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20251203102836.3856471-1-shengjiu.wang@nxp.com>
References: <20251203102836.3856471-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: cirrus,cs42xx8: Reference common
 DAI properties
Message-Id: <176477365699.48347.12992645251061713925.b4-ty@kernel.org>
Date: Wed, 03 Dec 2025 14:54:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 03 Dec 2025 18:28:36 +0800, Shengjiu Wang wrote:
> Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
> "sound-name-prefix' to be used because cirrus,cs42xx8 is codec DAI.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: cirrus,cs42xx8: Reference common DAI properties
      commit: 270d32cd0efc2ac87584883c0c2f3eb0f47f1415

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

