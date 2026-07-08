Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FAD3BBFA3;
	Thu,  9 Jul 2026 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599549; cv=none; b=OL2ueAvldxX6d0O/x6PN9kR0OH0b7qZvUiX4cq2B3jiEr0RLzkOluiyrDge8IV0t4U99RRqQg03f85FiF2LayKDbpngJkYl8tcBZTfIsrDwD7lEp8sL4hvyN0gb+UZWTF9c2Zcv8Ll9ATbMs8gcPW0oBdtLvTrF7NsftwLuEMYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599549; c=relaxed/simple;
	bh=1fWWwAbu0oWWVqWQjpZ19qk3XkoH5xz2ecsx3ZehMKI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iLEc1sol2OUrmaqbiFsSF4kuWI4LpEgnQgMRvGpliaJfD9EXf4AddDbO/fcqrJEYtFNgu33FDf3YFl5y70rSGZ+8fy34Bl7/+EnT/jlgSH9Gl0pqwn7A8zGX+Xx1Do+glZWbuMBE01NsBzOvQX3Nk1LJY0HJTOiz8mHx8JQLNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AP4pbY/M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AP4pbY/M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D461F00A3A;
	Thu,  9 Jul 2026 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599548;
	bh=+Pv5Qfd0LIcNbXwBJCqp1PLxZS7qwOWqqZdo+ZVk7tQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AP4pbY/MbHV6fgmqFiAtdiRN5sJdqjJIt1WfqrEenRE5NepdA61wI0QosoBZq3IeI
	 vasMjLBwHTFndwlwc3QgTOcH3TyH+REjT65xglgHPpsiFGj6wJh1f9COSVosZ3kLBM
	 HptdyoyfC3cGKn4l0LKImZIgJXH6zAlJqU1fW6AebEHMBGV/GZjmQxP9qLUwixmcNO
	 VWEhZfBGK32TptiIx0Dvy9YfHuqqKkuh4oqvmzX1aroIHBYViE7qvqLqCM84bI4fWf
	 7pZ+8KNa+QZ+PssQgzmd8nozkfPC1EFtBxC9QR97dvWajm0AuPTdOmd8FwaKZq1K3x
	 dv2dm3NSpaP1Q==
From: Mark Brown <broonie@kernel.org>
To: Uday Khare <udaykhare77@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260706153109.10953-1-udaykhare77@gmail.com>
References: <20260706153109.10953-1-udaykhare77@gmail.com>
Subject: Re: [PATCH v2] ASoC: tas2562: fix deprecated 'shut-down' GPIO
 always cleared after lookup
Message-Id: <178355364260.26140.12660356995727389020.b4-ty@b4>
Date: Thu, 09 Jul 2026 00:34:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1fWWwAbu0oWWVqWQjpZ19qk3XkoH5xz2ecsx3ZehMKI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT5G5AbdFxbdErlSJamCXComBokMtZGIHP+YAp
 ZXWQet31fOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak+RuQAKCRAk1otyXVSH
 0IMBB/41bQPkzCa3gh7Ry4l7rACTOoleNqGWfl+egiZPWUqwpSZwWouUxgAJkwiHpEj/UvnFOrd
 PQNOsFP4Gz1EHa+yffJXVumD+sBg3MUTsPEESCdwImLJpv7yqB7STWW+Tg9vM8mFEZjhANZ3JsZ
 eAxipkwtr+d6L15x8io4RnDoB2AxfTBTh23IU+gNXnCzOjymxosJPtNv5QqXYln7Dj4rAHobyQs
 1Cvd5XFODzm9pAlCT0nWnuqKXY383RKr4/V13nRUX5umRxBSxlzaY/tIusAb0hG/a/O+fG+0RZY
 VYHA2lpdawfYw2K5nr87+cwwBz3oPsH86Lcxb1+HJ+HQ9Aax
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 06 Jul 2026 21:01:09 +0530, Uday Khare wrote:
> ASoC: tas2562: fix deprecated 'shut-down' GPIO always cleared after lookup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tas2562: fix deprecated 'shut-down' GPIO always cleared after lookup
      https://git.kernel.org/broonie/sound/c/3238c634725a

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

