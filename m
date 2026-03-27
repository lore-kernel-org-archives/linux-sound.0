Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60CC37D13B
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 20:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644048; cv=none; b=E8VLzeaGjXUrXo8+WwtlYqhX5xUQDYgrqMaM1RHh5we4SpIqpEv5U9enaSTz+6u3WRwS4qPXUx+e0Jna0+7XonCDK/6dXf69JUTyfiB1g8S6R9XzZszsep8Lx/7srf+yH9oCUwD3BD6l3d7Q2Cbc4Bd0TyX0oygS+O3ipmQOx7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644048; c=relaxed/simple;
	bh=20FKg2jN5AOEKZDjLShJANH9cTTEOSbofFssfjZdmio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B7WiPXLY30vUsXWbKemeK0ep5hzeOujG2WrortJZ6INJ+fOVjBRwkbU0H0uqrmZ0FmxG8oMfbfxXDW7DTLx35mYMK3iMzdCspR0BDMInfdzxaMDTt1jqIKzIHATi5luJJ3hWNC0xJ7uXEYLRHfGh3c8GE1DCSfsvHQ4Au5Al7kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DATdsHbN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DATdsHbN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E37C19423;
	Fri, 27 Mar 2026 20:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774644048;
	bh=20FKg2jN5AOEKZDjLShJANH9cTTEOSbofFssfjZdmio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DATdsHbN+gs0R98kZIYEaN1sLOH+l+KcK6Whsu/6Gy00N1Dg3ZxkPMWvOkkCJ00+y
	 5bGUxmdXdCSSNg557VvZkgrTWaGRrGs9cHNASFNTEs+9g6e9EHehziWEe1bfvHjgZK
	 0azXtr3P/cnmqSiGq4RWIaoWV5XkhRkknQ7aPA/fmDVWLzABKN+ibEglgoe51XS/8r
	 bLnQzkTEsepLi8qAUTsqCC0XS8I5hC0mvf1ZDz26XPXVLases9gDfO0V1jbHV47lLZ
	 AYDAlu/wzx+GjE26tnfu34CBO6AB/8eqkuJ9LabIiVHlzo/8gA1h430l/RieVLbaBR
	 GEw+ipqx46cQQ==
From: Mark Brown <broonie@kernel.org>
To: Sachin Mokashi <sachin.mokashi@intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, 
 tiwai@suse.com, pierre-louis.bossart@linux.dev
In-Reply-To: <20260324163400.1276247-1-sachin.mokashi@intel.com>
References: <20260324163400.1276247-1-sachin.mokashi@intel.com>
Subject: Re: [PATCH] ASoC: Intel: ehl_rt5660: remove unused macro
 definitions
Message-Id: <177463884254.777262.10318442447476766465.b4-ty@b4>
Date: Fri, 27 Mar 2026 19:14:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=20FKg2jN5AOEKZDjLShJANH9cTTEOSbofFssfjZdmio=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxutOVn+k1MLTReJTcijj3282dhCIQj7VWqUQV
 OMCgLFEpa6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacbrTgAKCRAk1otyXVSH
 0MzOB/9VxpAnWkgR1umkP29REQABPYZvge/15LwISZvRDut4uDcxqTqSgx/+gsjt2qTQKOcFnDC
 H3+3o6VZlbZo4E1in6JKEbargBUaDsINIOfrk8sEqv5bs3b21dQSfUPw1HyyUzrig7JJMoeUy0p
 S2gCv58Q8/fRgy2MZ8HFYaqiKHDwALnXonGMQqLcTeVPNcbhceea5OUYdHs/qpU8oSab5mDHG3h
 PdyCjwvCdSjoD9hAYOlrW+cANfG+get49W/kjACaEqtjSnHRAAWRvuQhuq8nkCeU4B0nLfRdCoP
 Ruy5aXXGcE5Jycf/jb8IvZN+RxWVdiCLLI/JnRD5+cbSbgf3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Mar 2026 12:34:00 -0400, Sachin Mokashi wrote:
> ASoC: Intel: ehl_rt5660: remove unused macro definitions

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: Intel: ehl_rt5660: remove unused macro definitions
      https://git.kernel.org/broonie/sound/c/ebbe5d957efa

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

