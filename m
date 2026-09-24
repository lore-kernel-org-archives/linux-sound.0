Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929F3C1D7A
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 16:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268437; cv=none; b=VO203fto08nRxN3l46+0kJFd0K8uE32pWm8Xc5XkoaN3qzakhDRvNWmXhAYYrh5pIdveSjEy9HsypUb0FtojXIjLbcDbjUAW6Zt2kZAzpszNE+PB13xUfWMKq67JzjWKrYj7AiImVcXEaqurvk5+h51c89iStJqKG5dW5oHwGHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268437; c=relaxed/simple;
	bh=n1O+AkSr/gdaUkiEvNyp7YB4M8/bR4qS/KkTHjgTUxs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nFI7iaoaKqXaRHai2mdYVZPR6noPTdjwaQ18vXVLshDxhqsyT0nhqKvUWzyX7hTCLKseeFgY3Bv4fWENLx0bLTzSjh6/udq7vS+HrNJPny001mkOrbCoN1LQxJAM+uyQUJiQiw5EzXBGM1wiB4Qfp7VB21FVHK6+GEI03WKJl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+MPrGRm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+MPrGRm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4486C1F000FF;
	Thu, 24 Sep 2026 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790268436;
	bh=tDmaVWRDL+AVLov10bgZjB02Mkn0mMaF4sxUDN+VFaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=m+MPrGRmoeIvJnOzzHrxOYOiTqa0FVPldmjy6MTHZtc2W/VnS7CrrprNgitjPx62d
	 MZXveIjGmZZYGACIGKO1wPTaRPl6ySmJqQmIn4XvwG7L4yCHWkHaGXE22lHabQpGyk
	 yhGBfYguMYkDbvvL/cALJclXFdfIcDg2j+hTN7kuj6L0tWblszZcpmc4iYA5QhA6M/
	 sM1zNrm6yfXN4pS8OIcNBC6Zp5hHxooyonojcjNyKkJ7xU2caaHOSPNqSAnIA8hjpf
	 +DUHWL6Hjqs5tjPUzPi7nUTKWXUXf65a3zdaZwMVN14fmBH2Cxc2P0M6uU+E08ksL0
	 NT+1nUpWGwmNw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260918111530.3589280-1-cezary.rojewski@intel.com>
References: <20260918111530.3589280-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: codecs: rt5514: Fix the pm_ops constant name
Message-Id: <179026830529.149798.7926957217625895590.b4-ty@b4>
Date: Thu, 24 Sep 2026 17:45:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=n1O+AkSr/gdaUkiEvNyp7YB4M8/bR4qS/KkTHjgTUxs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtVQQq+d2gBn/v6bj1FTkxCPWxJCE2fyceClkd
 RPiS56w4LOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarVUEAAKCRAk1otyXVSH
 0C03B/9jlTZ0uHRr8Vx6YKXYJpGL67bU3HiIlB8oN8qBF9vLyGoj7LCvpTggrodoeXDUicX8FcD
 jDJEnXbO9Lst2lNbu4LWgUH5FOW73NsEFMUucZqoUtaLCyHmF83+GJk1WqE5ThGhW7OWbLISrrj
 5QSdHa3hggsQSUlgG142f9TXTQiROKq0sSsPvztxE9gTNyESMkqrOICbPYr54LlmYj3V1LkhyBf
 0wER9XgECoFpj0MK+dxLFaLnjJvfz8zwPcHja8Ohs3+FimLID5ncBYi7paI9aFBnT5nRqMhSygG
 eHOs5XSSdUD9DctzbOrsTcvYqHZArZF9w1C64tNEc8BiZsgF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 18 Sep 2026 13:15:30 +0200, Cezary Rojewski wrote:
> ASoC: codecs: rt5514: Fix the pm_ops constant name

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: rt5514: Fix the pm_ops constant name
      https://git.kernel.org/broonie/sound/c/d0814ef71903

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

