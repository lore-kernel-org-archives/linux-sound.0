Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F9A287508;
	Fri, 21 Nov 2025 22:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763763106; cv=none; b=DHJImFtAS5OY0Kov1NhnjS41EByssEVlQnuogPWKJAX4dvSc+bbAj95X889iQcoEZQh7DoC1uz8hVpa3eNwGZDi9NfnxuvT9GrTetleAFkuJxtAJgix3hipOFBDCklks+mg0Pd8bLgW/Jve3+SUF0xQmZMPlcGgGWTSebggVqC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763763106; c=relaxed/simple;
	bh=Xlhjbst9WjDC7tZ0g3ZhCvl4sZhaU2vsavUntDsWhI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I4E7yEK8ckBeGLegoyrA9VBGuo8FMbblr7Soab6PYaJ4b6l657jwHhkv2ASe2mug7Y+jKSntK07uA9mNxnbYF6j/FB255fB2u6IVJdJvq73C5h/frU/wnZNfyYy5uYSPQjqL7Zw2MPotbx4AoQmIPAl3i/41ALqrfFJRVEGYP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fO3UJW3m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fO3UJW3m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B38C4CEF1;
	Fri, 21 Nov 2025 22:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763763106;
	bh=Xlhjbst9WjDC7tZ0g3ZhCvl4sZhaU2vsavUntDsWhI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fO3UJW3m3MXsO5alpebQOxQcFCXzHUZNSTdaIqpXsW5OZn7FJXT3WXroxIU1bou/I
	 CWs/OCnfWBz8o84h40OaQICwdHEyw4aOj97oR2hNz8qku6EjOmF9AlSAuHEaPjdXJ0
	 r2Yi/+ThgbQEDI/dNTw96xIxcUoULr6t7fckhLsCS7PIKhlm4hUkonCj1/yZkvdBD+
	 o5ypT9eeYL40l/xb8/6gT01pRfFUhEpJCjAnxVnPZKzpnO+D76U/GDw4TEw8OIlSra
	 0K8kkvAvxKWNFjwjGQo+xqXkY1bGbyQevUWlyQTNgdSF4BNH52pfbrAjqzjPmxQzz9
	 8/VmMERQIS/EQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251120134437.1179191-1-rf@opensource.cirrus.com>
References: <20251120134437.1179191-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] ASoC: cs35l56: Set access permissions on volatile
 read-only controls
Message-Id: <176376310489.101329.15595955476202390538.b4-ty@kernel.org>
Date: Fri, 21 Nov 2025 22:11:44 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 20 Nov 2025 13:44:33 +0000, Richard Fitzgerald wrote:
> The CAL_SET_STATUS and CAL_DATA_RB controls are volatile and read-only, but
> the existing ASoC macros to define controls don't allow setting access
> permissions, so those controls were marked as non-volatile read/write.
> These four patches fix that.
> 
> The first two patches add two new control macros to soc.h. I really don't
> like codec drivers open-coding a kcontrol_new content for a control that
> will be managed by the ASoC info/get/put handlers. If a new type of ASoC
> control definition is needed it's better to have it in soc.h so all the
> dependencies between ASoC and the kcontrol_new content are in one place.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: soc.h: Add SOC_ENUM_EXT_ACC() to allow setting access flags
      commit: cf6ec18ea6e12569b83af2709d0bd0cc09da198f
[2/4] ASoC: soc.h: Add SND_SOC_BYTES_E_ACC() to allow setting access flags
      commit: d7a82707f19c7a11ce42dd46cb22ca34a58cc9b0
[3/4] ASoC: cs35l56: Use SOC_ENUM_EXT_ACC() for CAL_SET_STATUS control
      commit: 4dd7f8aeed4c85234f3855ef3188ed2202f2c947
[4/4] ASoC: cs35l56: Use SND_SOC_BYTES_E_ACC() for CAL_DATA_RB control
      commit: 33822d795ab93067d9a65f42003c0d01c65d4a9d

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

