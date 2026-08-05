Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13D34F497;
	Wed,  5 Aug 2026 18:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785952934; cv=none; b=a4uIHXlLoMqGco/+KeliCs/Q666jtvpO3mOJbPkni6i/L1visJ/IAPo3jFNLA4MIsnL8yUkk8gU7FjO2U4e6zfUr+T54aWNtS6Z1/kecQvK30s7khJXlIbhA8/Fw9v9Dux/xE0Eaa1YVKibd+40cd7s0BwNn4E0BNUq5rXV3FlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785952934; c=relaxed/simple;
	bh=OYkDKEazoOSDco0SJ/U0HF5tWvLH8OLvX0QrxQWEmjE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HQoupd8xgCQvPpy+W/0dDkaP1DUyhIAh1GSlSIQ1CWmCvienEqfB1UQGmFsFPQIW/hx6SRJ1Q+x+JbMozb6cpbFHbGoPVFdm+0a6Tnl72ASR0jX2kYO3XO//LEgndHIHKoT9uJqBKtxjIvaytjvlkjxSSwJ2vnPD4FCNOMTxWiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfM8dT/J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfM8dT/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E419B1F000E9;
	Wed,  5 Aug 2026 18:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785952932;
	bh=+bLzevt2uhBAht/K9F0me4F4JNAVzxAD+8pJDxVMyGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AfM8dT/JsZihieNzHjYT0NsaCIO9afQbuwL1QES1FhmYBYoC/ksnEzQfs+aaJYbvg
	 jvNyWzSjAkBEmQvmhFKh4fCyYWcw+qLphSgxmbezAWC6Bi7ynm2ZwT9+YtB13hawzk
	 D9v/SGI61PQRRyyqZKgOleZXsVr8vk3uOlErcrSvD8s1wHyLzavrfSpS0YvAUlV14j
	 n3xl8tdHKH0sKSW+z9NZZ9+HI2/vGgXVq4l4cPlmz+45Gvk02g8/5Yum8dgIS1dI/r
	 RNQCX3PANTxButdruMbfLYOkH/if6gF1XH9IbUk5OONmU0YcY3BdwHAhxh4AqWOOKN
	 vZlWZ2Pn2hbrw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260805105223.956785-1-rf@opensource.cirrus.com>
References: <20260805105223.956785-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Fix mock register default typo in
 KUnit test
Message-Id: <178593173043.199927.8140894449332160926.b4-ty@b4>
Date: Wed, 05 Aug 2026 13:08:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OYkDKEazoOSDco0SJ/U0HF5tWvLH8OLvX0QrxQWEmjE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqc3qizsUihON6O2pg9lc7M0I0USYp1q2gsa1q/
 gHkijZY2fKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanN6ogAKCRAk1otyXVSH
 0FEvB/9R5TETaeSxx9Zh0/iXY6hJa8HyQ4uHQ9bhLh7nvlB7jjW0I3NFLUXLTwTfv/13B+3fral
 p4lFqHCRMMh6J7bdtZq5/2BibSP3OSBK5uxMezs7nBpGOc+DsBFMEhCt06jtLRembLZvFZdhXZI
 C9qU3auOeIUg5kC91phZM0HkhCTooSFa/B/JmyVE+wZ0iQIq+/9CSb2b3QXMPP6Xzbmj93/61DA
 trezZsj4fntHbc+s/17pQMDu0a42MPTYTnIG3wokj3mtWodo0BPrghCz2AiAdUgt2wOFOh8gP25
 qqLlPr3Gma8u59FYbbRP/NlqROIxqwPlkTaxX9yoy6ZO8SB0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 05 Aug 2026 11:52:23 +0100, Richard Fitzgerald wrote:
> firmware: cs_dsp: Fix mock register default typo in KUnit test

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] firmware: cs_dsp: Fix mock register default typo in KUnit test
      https://git.kernel.org/broonie/sound/c/1a08e82ef6af

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

