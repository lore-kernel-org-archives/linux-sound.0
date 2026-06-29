Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4383F9F5C;
	Tue, 30 Jun 2026 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818228; cv=none; b=m8p6zEVX5zUXtvYK1tvFw0BG4VWfBDpvvZdWPXDIL2a2JAwvzTZABOsn7zFOPZB//VU2G2T0Rdj27ztJoMyplhM0YdOXf45L3gWY0Z7JmqKSWWuQ8OHASCjxtp1TzOKVWJdk8JKHQ9GLaGYEtqFwImqKsbUClIeOGnJbibFZaJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818228; c=relaxed/simple;
	bh=7o8T46mUWRP2pOFK6GQovQtsAMPl+zcFQr79cEg2xv8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S+NmxCZ0qYGUSWDgqTU+cUxNhq4NWSfUwyekLmEFQxIeB3EA+ilBTKHyv74Gyzp2m1i4KLgnExwoV/cGZfYGfSffCDTD2yLvRdD8tV2dIlHPI5pnLTi5quqndkxyu1EYTYlDJYCtJ55DK9EasMxc0TVprg9mFAApxZfLYcrt2LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8l3Uk+N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8l3Uk+N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A395C1F00A3F;
	Tue, 30 Jun 2026 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818227;
	bh=UPVCsAw0BBo9JnaZGT2RHjdd5iq8diD/Vh1wORBXAzg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=c8l3Uk+NYeO3M/gCUelq7dDqEgG1RwdbDXh1XlQXPvo8GIahATRkdxiXUnrNHFgnN
	 pWZbU/hsC64dEt4gvWGsAl0pXFr6FQhTNBqzQZ/zme29nJwbiYQonuztzFSnkKYNvk
	 E+nC9csbcqpyNhlUAcEcTULINBsb+2sbM7QS1U6O2291qyz+IeK19KRb/oub9btxEI
	 I76hBw5FIw9RZ7BzN+p22pahwrwy16Nti7P+jYh6NACygNr+eumDdhoaS/+PXnl7m6
	 kQfgpHPI9bpVmMb0K2AmRWKM2K35Ot9H4L3j2ALMzCZDr6v/g8zhICVwVc7ZVRU9gk
	 qMe7ExVlytJyw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260615064549.34110-1-pengpeng@iscas.ac.cn>
References: <20260615064549.34110-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: tlv320aic26: remove keyclick sysfs file
Message-Id: <178275419988.47562.11107424536946605364.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:29:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7o8T46mUWRP2pOFK6GQovQtsAMPl+zcFQr79cEg2xv8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6WweEU4aAAyoJqnHvV7JUZDr2vwJD3ttf0eh
 5DkkLknU1uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlsAAKCRAk1otyXVSH
 0OT7B/9I6FDlaMaFXhDDKfzrwYLvcuXjqna2lIqozjAvisqxF5ZD/dBYqOgolxc6DOic3tf753F
 RbXjLy5AKw+c+PigOlzUxXcNu0eJC7fvTRvwYfQLhXVVRVH1ny+kJxEQ3cKY59KPRhJ8o2jpmMB
 WsMHXGN6uFYpvz0qjmqbTLrFKAMixw5Qa6Jgxx0vF/SP2ZfFRWgiH3pbbPEUFiGBH0uyNqzGlKI
 EkPYLBLFFMmqKFBSGLZW7loxpfNNy1HKZB6byGfie3+zmOWK71QeixAiV6GYQf0MdI6xBmGkbjN
 +6byhwR3EBB2mORA2ozR8DMSKp86Sn6GafFT6xQ2ijbP+DRp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 15 Jun 2026 14:45:48 +0800, Pengpeng Hou wrote:
> ASoC: tlv320aic26: remove keyclick sysfs file

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: tlv320aic26: remove keyclick sysfs file
      https://git.kernel.org/broonie/sound/c/ae375f8d063d

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

