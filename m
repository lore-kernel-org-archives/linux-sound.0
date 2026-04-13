Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D083EDAC6;
	Tue, 14 Apr 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776184121; cv=none; b=KtTA2tviwdHDqM5bA3rBRJs7+JUkW4FIuon65XzKKKuN7w8QjjCwlQcPj5TWVTZtUK8bPfHSE0EtceKzVcRWg7yFvhrZ0+snPLOJ6QU17HsJdbkn9p1bOmpF/o7mS1uRzSdNU+ftrzLAzzLYMl1Hz5tNsIN/n+/yHVXxys5mf04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776184121; c=relaxed/simple;
	bh=OFSdJpqdSLdjFYy1TboR2Xdt5obXCYiv1wGzfk1/LSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aJnQok1Il7dwpVCj5EDqHTTy4zwa9cqCoMKII1RQ1aQ+5rINBWTLm8FFD8dHd90/+aJkc8bGU2DyppyKhijG3zlfhsm83bbgHe3p+DYpS/56COTpuOfIJm1BJhBvg/VAkmqVdBP7jfGagAgbTdulfDyEHK2h0vOe2ws99NXXZik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DT3RjiWR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DT3RjiWR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0A8C2BCB5;
	Tue, 14 Apr 2026 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776184120;
	bh=OFSdJpqdSLdjFYy1TboR2Xdt5obXCYiv1wGzfk1/LSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DT3RjiWRjsqfaxBNdTJE04skIY+nQhnLZtMZ/00DKdIbdvQ5bUzejIzXfnhSt0h/E
	 NBuMEo4bsEQGIyoPOhKu9EVSNGyJzw8bEyfTS3YtgZI/AUkIzt5oBLzucwaXUEtkiB
	 KVKbygnhXUGxzfvm/vKLsd2EQ3Poy34wFvI+HXKM2VGC0jA/ds8wH0L6PsKh5iwq/j
	 7u3L8h80S8deue44Tc6EndjyZCv7UtaXngtjtgtnE0/PiCMpc3p9otYjm9msKG8nGj
	 26//0egKwWwB1fWmLLb6suoor+qaqq+4/TMXSvXUrBDtuxhiF+qJl7ku4xoUGtEiXD
	 aXaYdCr6iXrag==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Colin Ian King <colin.i.king@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260413070059.3828364-1-arnd@kernel.org>
References: <20260413070059.3828364-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: tas2781: fix unused-const-variable warning
Message-Id: <177609855931.111092.4093458487372077766.b4-ty@b4>
Date: Mon, 13 Apr 2026 17:42:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OFSdJpqdSLdjFYy1TboR2Xdt5obXCYiv1wGzfk1/LSU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp3ms1uJRBUBd6zLdAvSR+IulVZfWHgaXAPlcoa
 uxkDroJsIyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCad5rNQAKCRAk1otyXVSH
 0LGVB/9oIhT8gxw9AlBI2F/+xqEBvSZg2f4kLwkOOxBgUunxFxBedblJadfOevCkubzFl6ou+lo
 TaOEVW8u/PNVW++KMwpZoDpYrymo9n/YPBsIVwHnRJ3AUJZ5+eTOYIfTNbXHrQ6QkHPFKnxbNWH
 SlTUPYJ25ylkPU2rgwlrjZKChbNShaIzLXs2LeCPWd5guCIAdLD+p0NShCD0VB383+1LTFlzU+/
 6N7N8e4ayw9uTcul6kuqY8U69id0Y2vRQhQSoAzBNWaEloCRX7E1J1i9gGBOHBsnvWMdsE/t+we
 gqffx3gdu5/UGIenodm1THorCxihbqtlZY53+CvmzL+TG8TI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 13 Apr 2026 09:00:45 +0200, Arnd Bergmann wrote:
> ASoC: tas2781: fix unused-const-variable warning

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: tas2781: fix unused-const-variable warning
      https://git.kernel.org/broonie/sound/c/bc9b1ebaa762

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

