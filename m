Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD163BE145;
	Fri,  3 Apr 2026 16:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235184; cv=none; b=FULUffidWAkIlnU7EjYUY0haCVvnuO+7BO2/k8RKY4ysiXMsK3VqMecznWQttGdTLYEM6Np2hYs76jLDp+D5I0BzHjCmxGU/DsxA83WXxxUTxgGXqNDAqt6NXGkamzWJHYHDfum7oMGCwFtUC44uN+5SiZAJcimPDd14SU+KqfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235184; c=relaxed/simple;
	bh=RdB2SVxzpdQx22oiXAGt4KGyT8oud16jXF8eSqmeZ4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cKYqd0sP3+NMupMdBCjX4ELYQmyfxKFLUz8X4BxehnbJKNFYs3iXsyQTbSaZb8cnswHQ/lOpOx9tQBo8ym2cqefcLRQqUWLjrZxk7wnW1bvUT9jYv0joCPsdN0pFflF8q3cP0H++HJKt4j8fsqQ7tfhXg9si5iWSw62V4PMxOUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVz+LSyg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVz+LSyg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF71C19421;
	Fri,  3 Apr 2026 16:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235184;
	bh=RdB2SVxzpdQx22oiXAGt4KGyT8oud16jXF8eSqmeZ4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DVz+LSyg6LybsmPPnLSpwUcPpVnoPT4Y6ZmOB3BXwNFFr5hWmn5gDXAvdEoIeTtrQ
	 ToTl/IDM2N7VtHspTRbE7qpkDzqgViHQij4OwvBbjBIlt5BSMFWSVBBE6ZXvdeL7HI
	 IVyAbTG2RmWU/xevB0k2U2rQAGRFReJDqg6263OnR40CuwCd+3sSxGeLIyOav/bEPw
	 CTJ9eW/7vddAP8onP4mbajOBJ4YQ2Nhyzp8eq0Q2jQhBIpfokHGaDstpd6Qi1y9Vaa
	 Pa6bJ5fptaGbzZP99GU4DyUPplMHC0R+sToA2BEL1dFdniN+qkrJwlVDX8ywcjNMj8
	 iZjGxMz9prllw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260402025040.93569-1-rosenp@gmail.com>
References: <20260402025040.93569-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: tlv320dac33: remove kmemdup_array
Message-Id: <177522551463.52946.7405929894168009648.b4-ty@b4>
Date: Fri, 03 Apr 2026 15:11:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RdB2SVxzpdQx22oiXAGt4KGyT8oud16jXF8eSqmeZ4M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpz/Bty5GI2ZjUMGk0XxUV+KA8GslzL6zsNoaNI
 R/Dgv2ScWeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac/wbQAKCRAk1otyXVSH
 0MWmCACFEL+sRfZhxZmZmvQ+ha4ogrm0CIcmB8o8jTjDULqOk9I3uImUnTuwT+g1OgTpD8ee38a
 esuMbefZOgmbbQL/gpostu390GSdcd4NPSShh/uPDkGRZ2iQb3Z6KPb5/j53/tkayRjjYPDQmhk
 0SrqCLIDkrjld3h3hbgsDhZ1P90VN3WgvDGSQiAufyfeCkSc+xkOylfKRnpu3/O9R25RKc1RZUZ
 eRlBm2uhOrFdtKvqbOV9NwVjE+vXGJCBcmyhBCFztGQttDftIzBjqthUZ7TcKiHrJzYbolDBR/N
 jrm0tWwRpnRsQXmJyy7vVMgIoew0NQKRrFdxy56+jLkIhFLx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Apr 2026 19:50:40 -0700, Rosen Penev wrote:
> ASoC: codecs: tlv320dac33: remove kmemdup_array

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codecs: tlv320dac33: remove kmemdup_array
      https://git.kernel.org/broonie/sound/c/04cc47624a33

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

