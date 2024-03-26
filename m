Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690CA6EB5B
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711458190; cv=none; b=L6zPQ/X3tcvAyKz1S/1/JOA2gAiKgwUN3xZ4XwDCjgtZP9pImmmF7/86YpScIdFyPXdbreevr65nIxNPmLD6Sdk1/BlQimCR72rbezwokeg6eJxYp/qNYZF1lyj5aP2ZoARHZVpUd06zXruR22vZDHQnhbhgWv76+tFmSJ6utCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711458190; c=relaxed/simple;
	bh=cSjaZbPLR1fQ/eUfBQ2cemr+zFkzT1K8arROWQiRWLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=URbl4WkcycGF6G18FdrDoeerjEmzaYFiSXMOq/PjyRoLlxM3H0R3lL9R4TxuYfsPm4SO5aedd2nuD98qrMzodY1S/v7fU/Oq+v8btabKYrFbNY9yWScGecHALx0c0aKnpLFC61SOLyTcJr+4RDmM1GhcZ1cRJqTPnu0tFLW7uWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzIyiKjk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzIyiKjk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E8CC433F1;
	Tue, 26 Mar 2024 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711458189;
	bh=cSjaZbPLR1fQ/eUfBQ2cemr+zFkzT1K8arROWQiRWLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KzIyiKjkwxNi0/djMaYyBukoVoNYhmHV+htRm5MIBzkySyfWG04sgm966SpB07lal
	 ZtNnXJ6xRvSNp/OaFw9d8EjmJwibbDfWndV1uZfGtk7FcypTAPIU3XRlFizoj6r9kR
	 CI3W9juVVjFVoNFK1r+zpR3IdBMUsLOnwK5usyEkg9BORarr6pcz/Gebyt7c2QER/P
	 E28/3eNEPy+5qI5xCTDkyYvZVVMy+ynMh0ADDVcBhLduoOp+d5EJXy8ydD3jvZ0VX9
	 CqU17LIIXnKZauJtn0WGBQWrBw2URyhy0+5fAPUGtm9y6xedU052GMp5Ek2OZLEU9i
	 taWwzYwmaMr7w==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
In-Reply-To: <20240326105434.852907-1-ckeepax@opensource.cirrus.com>
References: <20240326105434.852907-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Correct extraction of data pointer in
 suspend/resume
Message-Id: <171145818853.73919.2525513604875844696.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 13:03:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Tue, 26 Mar 2024 10:54:34 +0000, Charles Keepax wrote:
> The current code is pulling the wrong pointer causing it to disable the
> wrong IRQ. Correct the code to pull the correct cs42l43 core data
> pointer.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Correct extraction of data pointer in suspend/resume
      commit: 56ebbd19c2989f7450341f581e2724a149d0f08e

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

