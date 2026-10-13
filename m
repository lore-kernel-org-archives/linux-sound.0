Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D335172CB
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 10:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060334; cv=none; b=sw30g6GWQKBc/sjm+B5rcPA+KpgPVsu577x2ezAg26GCQ3PUxXjkYYUOM+vTt0Z+AAC/Si9BWYTVgnqapSE5/Wi/+c+fKdV6FhTpieW/QzCjrsVJU8oLFdaStA6Ub64gKW4rK1hjiaKKx+oeHEU2Hg5dqEKajO2+qfodrIaDxCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060334; c=relaxed/simple;
	bh=KlTMbiYv35pJcswD1cAELYKwIvwL0JFmbas6qvmfwiY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aCZCV10x09fR+EOpe1yKkjrWLm85lwZ4O/mUcelhR9wWQB5yUZOsAGFApv/0IBrIFN8FEZSsyWJwsRIJ94SUXZSffCoohrLJupWtntiPQonQjVnedLrN7KcsgQMo1D/4K7xCb3qkgMeR7sz4iS/7HjI+ENfulkVlDGhrHdFkc44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlvWTbug; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlvWTbug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5A61F000C4;
	Thu, 15 Oct 2026 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060333;
	bh=OM9ugxevf4ai8lKXFWNWgruuV0Niu9JpIDO+WA2J7Y8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QlvWTbugKshfxcoRU6wCunrxQHpu24EQb3vvfOubC4YWkZfdQO3H3QSDf4Mg3RX5n
	 6zIVQpXHHFGmEX3giI9918G76KE5RweR/6TUnsOdApWCK5jji49QAN3r6LISK3F7/x
	 xnDq7aSWHr2ADdZtAhUVSBYmGtoPEqrhpwCTsYHnx2vZ/bSnHafFJFe/2W+Mcg2b2E
	 GMdE2rQY9yR+aYjhWXO8WEQprYeeBEK/h1af/errIk095CI6+NKCjnRJBNiPkTALNe
	 VK+ieFPLqdAW/tGoc+pp7uZXt+4D746ntn6n2EKvOugP7Bql/njbS33fA6N4PpPC4p
	 67+qvjd2DGzqw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Zachary Huang <zuzhenhuang365@gmail.com>
Cc: linux-sound@vger.kernel.org, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, zhangyi@everest-semi.com
In-Reply-To: <179145019931.16888.9682263186729943710@gmail.com>
References: <179145019931.16888.9682263186729943710@gmail.com>
Subject: Re: [PATCH] ASoC: es9356: add missing DAI rates and formats
Message-Id: <179192020840.1606900.3493516090502904433.b4-ty@b4>
Date: Tue, 13 Oct 2026 20:36:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KlTMbiYv35pJcswD1cAELYKwIvwL0JFmbas6qvmfwiY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurF4Zar2/00swct3Wa4ozT5S/eZov9en/Dc+QM466F
 92177Ue6yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEQisY/hn3lXkF2WjvWtal
 sLXD47vB/Cnrb8+Ji1fb/OroflXTWAdGhp3eEw/t2SR4yVxtte+DmTnsmd0qGitFfsZM/9cxZ/3
 8Ch4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 08 Oct 2026 17:03:19 +0800, Zachary Huang wrote:
> ASoC: es9356: add missing DAI rates and formats

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: es9356: add missing DAI rates and formats
      https://git.kernel.org/broonie/sound/c/ea83a1103b18

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

