Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAAE3D47BB;
	Fri, 22 May 2026 10:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445307; cv=none; b=SS89nqKnpEDluUcA0kNtrAOLSg767xGnyFbTxmpd6u3oL15POfRBrKmtHgwRiTHpULlqh3dp5I2/071+rxGqGTep8kdhvQG/heROT2G8XNe9kWJG+Rmq1HYLN0roaK+e/PvfrQvZxjmOZiEtgsv2yIWbTkQ2irf64lUv+naS5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445307; c=relaxed/simple;
	bh=5ZVaWSjfDYV8xFEG2qHRcRpnpfYwZGaYOU2WyjAd3VA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N6MFXve9h3eyPG8w0+GPD+7L4JKiuxdx4CaF4fbFXaIFYIUYTUEQYHwFsuXavOKG+RiiGlyC9zWl54osAZwGXW0yPwmPr4KbXvh19vwmNxksj1cuVCo8WSWp61gMAZd7V/TR/9uGemKxyWFH3GVzylsP5B7NcrTcN+OK39wtHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJCAQjSj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJCAQjSj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90C21F000E9;
	Fri, 22 May 2026 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445303;
	bh=v5hG5ljo2yEbas7N/t9jsu08GA8nFBFOwWsnzFp/4F0=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=OJCAQjSjVDyBLcKibt6kKzsl5FcdJH4CU24VcEGayWXiZn38GoqWQ5shUb36om2et
	 23jvjnBn3A++Far23IJrsugZfZfesUnRrKW4UrrgkdZXBbgd3mYW403sfor+SQuH0b
	 KmKI3960FzW0z4eu4o9s+2D0hh+RdmSqJn5zy+6HK09yA2e9qkiPLAZ8mAfcOddBON
	 yz94YRigmmm29ROsTd5hnKHXkNWX0+yYWUeE8P+AhcK9x6qp/C2KFPgVNc7sAxmoUy
	 LTyEVSz43hi6E+q8mdQGknAo0fJVYrmXaPOc5EKkxTjoj5ixebLWCsLL6v67xEE8Qs
	 KMjXPmJWzkGfQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260512065252.75859-1-shengjiu.wang@nxp.com>
References: <20260512065252.75859-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Eliminate possible interrupt storm
 during probe
Message-Id: <177918448823.6167.7164201834938027833.b4-ty@b4>
Date: Tue, 19 May 2026 10:54:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5ZVaWSjfDYV8xFEG2qHRcRpnpfYwZGaYOU2WyjAd3VA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC40SrnHckZVbEky/P7ocAxP+K2BJW/i9tLmd
 FCQ7nEsg4iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuNAAKCRAk1otyXVSH
 0Ep8CACFYtYjQfnZ/W701ctqn2f/S7gjAAUoclcQFx8vbu9CwZr+9XEFiAKl0CsoZYKCrY7eQUH
 DwJnc3xGcchM4/Rpy2xRyT5dnfsZzU05F0hYj+Oy/KMYyMuS2v7k1/fuFgmVuVpQ6WfKmwkW2jq
 J71bPc+9SqR9rnAHJuxlTSYaUC3aCe6rz68xxMek7bBtRJnoG6PyiL6JSXoEADpBAeoFJZSQBQq
 2Xzg7I58gExyEDm/ofVQkqITMqC6F98ToppFahOoI8fvAH+fmlANMUO9e5FlBCVjxuKF8Il/MO1
 jza7u/eFEiKvaiMA4lSu/bqAD1GqwKC8nie7Zqn2lQlh8S5F
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 12 May 2026 14:52:52 +0800, Shengjiu Wang wrote:
> ASoC: fsl_sai: Eliminate possible interrupt storm during probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: fsl_sai: Eliminate possible interrupt storm during probe
      https://git.kernel.org/broonie/sound/c/fd3b95866d86

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

