Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E63B432304
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377840; cv=none; b=jaUV0g2lPiYPNd2cgbECeFxoNcsddv1BeggmbWZvpjbVOhbrW7+GwEd5XbDzfaYihaY8nr6tUk5NeO7wBHmVm2CBbR8ymiMNKgK4YY8gnxeVwfmIO1YNdzYcr7wUuWhNcYIErV5mcQ59yBeaSTETty7poPJ9onJ3kI2J0MBbA08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377840; c=relaxed/simple;
	bh=4EcPBYD2JP35XR0jaOs05ukWGeoxYDRIOS7emNzCJBw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hzW8iD/3Zt2uUNwHZI7lSMrdkFG8wJuRtR6e2d/qSmbgT+IJ9c7fOwk3d0xxdRZTECIujw8YgwNVJnajQwuY3YZT7UuKUGnDz0e4XGFyeDNy4LqasoU5D9lVocnG3TMYZqTaY2buWl+4juWQf+h9DZBSjgZF9vxleUzo31xI3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/pEJdbr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/pEJdbr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A101A1F000FF;
	Mon, 14 Sep 2026 09:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377830;
	bh=t8en2427eyjSeEf7hmqPiidd6B966/VPjfQIjKvmdQ0=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=I/pEJdbr3dz7RmMxg+kCCSlQJHfr8nb/COw8LKo7lqY4afh4LBb7enaFaZKGieEsy
	 qnCWJzF5MESzaGvpb66n60Q3gk8kED5WCYIRE14L5Ndd/ZP2aVp79DOq/9umrGcYmw
	 FhVj7Xc7k9A2/Y/WXWUqYJnde9eynY2woWQaXszYu9r1ZjXYaeFw6Qs4deGDiYifiA
	 a8fJRYZ9kf3/wt4wvkxS71XhNLuMW/QKnlrnRfdbRqQHE10KEQFIDQsm9T918qpmZm
	 Qajm3fUYUKbO/mQ4AI0zgO+ZO9sluKCfmKcAbGoC8BjDUO+7jCc2MD5yuc+CFEOp/j
	 /7sKsd0/zjJ1A==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>
In-Reply-To: <20260912082422.331962-1-pbrobinson@gmail.com>
References: <20260912082422.331962-1-pbrobinson@gmail.com>
Subject: Re: [PATCH] ASoC: pcm5102a: Add support for optional reset gpio
Message-Id: <178934323644.1239410.14592356929071519663.b4-ty@b4>
Date: Mon, 14 Sep 2026 00:47:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4EcPBYD2JP35XR0jaOs05ukWGeoxYDRIOS7emNzCJBw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqp70hMIrxPOn0WQOCIxtt+5tUiICrtKK2sZjqa
 LLQTOfdCkqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqe9IQAKCRAk1otyXVSH
 0Ei+B/9rFyttaxhrkyC+M1wA81Sasu/MjK98cljTD3eNVWP+pvTgu55kgmW3eLVqCJWRNmnVCl+
 JZ0GmUeG0JpG4vaOlFRruSxSeTARLEfDxdDmQwo28bIc5lHRJyH0I2B3vAK+evb2JGRSp+E9lc4
 uK4q9lYucfhU4fY4DsJEHlvQsd6KtUbuI9TK4w6Xydq7pal74Byz+pkcHBasNwRXKAODoswiqSa
 G81zoFjBjDERiAUbP6ZVvmtYkPeynAYQqqcgbpJcspS+aq5vlz/oalZvKgajYZqDd3HIqhJqF9N
 40x9+zGvgsgNTJKoGRxFZSBusy744PzFbBsUTsbJNOKHOMvo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 12 Sep 2026 09:24:18 +0100, Peter Robinson wrote:
> ASoC: pcm5102a: Add support for optional reset gpio

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: pcm5102a: Add support for optional reset gpio
      https://git.kernel.org/broonie/sound/c/81d2ec6f924e

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

