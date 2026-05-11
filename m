Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CED337997E
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 12:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500993; cv=none; b=LXUadb6PVm1N6+JQIw9XrUD4DiTauQlMvdAHm91Ym3Tj4+r/JmGo+jSivN4plycR913pgj7xy5H14Dt81A4U9xrKU3T69KEjc6aBovgXuvlg1WYVm/Xm5lWlIdG2r7M5cozxy6SJ2jkhcZEsJodYpXnh56FnrJcFR1ByBiYRzgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500993; c=relaxed/simple;
	bh=18vMvczYxiSe6MX3Yp1bCrP2TgCgb/kbHOn+mWdpdyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OCTz5yt3qMOPbP2q/J7OUaW5kdGjY6Wne8TUZ025WCtauZpad/mjFDQ7lJczORC1PaNz1x75w5oB8KgD/3eGiwoARjjnSJ+spsz9zTP+6g8j3Bt0fSuRuYCM/TBZPjyJh+ReynG/ox+Z7xP7bd5C1wg+KR3TQ3S/j9aDvaO1njA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWW+r0ZR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWW+r0ZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7832C2BCB0;
	Mon, 11 May 2026 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500993;
	bh=18vMvczYxiSe6MX3Yp1bCrP2TgCgb/kbHOn+mWdpdyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tWW+r0ZRl99dw3xifKv+77JOB82bPSRYPdHopWMx3e1YK08hHpHoLZZ3m2cBhqsNc
	 nXaZCyumhZ8LCooFWnhLH9ZSGwX5VGzgW+RZYUmTfJpOzqQ0S+fDyAxEMPbWcWoe7V
	 W+DUf8BjVnzMVqJvEPQ9CTixc+GzTC8DDPAcGMnx7kP9cILnoPiW9ky1y/dt0z/3S3
	 m5VK7YLnKXJwIXe9u07HXzL/4bt5A4274mDiklj/h0gw+tWkkEPcoevDnyjtF1STQC
	 lwSyPGqnQrfBVrhv98tUVTCUSRJLpqO9txbwxKhJ1NTjh+S/qpWW40vq9qnKxJZKG7
	 kYCDZxP9eeseg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20260510221403.11283-1-enelsonmoore@gmail.com>
References: <20260510221403.11283-1-enelsonmoore@gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl: eukrea-tlv320: update board checks to
 use the DT
Message-Id: <177846056071.986162.11979413088190657380.b4-ty@b4>
Date: Mon, 11 May 2026 09:49:20 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=18vMvczYxiSe6MX3Yp1bCrP2TgCgb/kbHOn+mWdpdyY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAcV+eo5sfYFPjcZKXK4/IAh1Ub7bduWnC2lDu
 6/Sa6oICCeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHFfgAKCRAk1otyXVSH
 0Cg8B/4sIUhSvQsiOmPYEe4VZKreOMnpkyxF6AHYdFk1oEyCxeDksRLA7xAPGnBu8v8H2YO6lBV
 S/UhQSEWQ/LkN0QoT/rYn/Y3vnQOMvbe56/p7xc+QYKkzx1f5zeGPU9l5zhD5lJTYxO18uIxbVD
 RklO07NSrSOdPMbq/9+bnjHMPs+uivdZ8bGNMQfI4YZ3G7rCgbXgfyQKh4kXTJaVUweV4w3QWID
 5bA6XpX2kbGsM00o08qgB5YbU1reXuPaKYfyD8rDG8jHwFGcBpgsdODTBJyKwesFhFpmwYBa/1H
 badyXh2S/6eDbTpS3V/SA3ddtPUj++vHIxynF0aGOVTvTDj4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 10 May 2026 15:14:00 -0700, Ethan Nelson-Moore wrote:
> ASoC: fsl: eukrea-tlv320: update board checks to use the DT

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: fsl: eukrea-tlv320: update board checks to use the DT
      https://git.kernel.org/broonie/sound/c/3760befa5c08

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

