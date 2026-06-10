Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA333BBA0A;
	Thu, 11 Jun 2026 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169866; cv=none; b=l2I3ASmOo+hmZS5PrlEg8SKTZp9gGsZvnw2fi5vLl0TD2xz7zksAWq2FXgLhB2qM/pB59GMAlMH2aeW8btCAntkHFjD+CvV26CHa3JSF75uGU+gDyFMH8f1o7teqDJkahjIzleKY7mPZNnlocEPlDR8Ga0thcufsyCJWcp/8B3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169866; c=relaxed/simple;
	bh=/R54u+M0yy9tCoX9dAlT//+1+Wg0b9IgWPyrQY1YKWo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F4EZZ/d8aA3mXHZR8Wv6jMDUf6QJTO7A5EN2sNfzLZ6jTwMlKExYDkqozV05xSxFu/2O99MNXJpar41yNBMRAIxZeBbs+B6O3Ob8USv3LL/yQMIawRrfRmKxXJye/pRD9kzLVWM1mY64W8iR76h+1iD+UcQRgpKapprFPBAvBpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/y8iGym; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/y8iGym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2A91F00899;
	Thu, 11 Jun 2026 09:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169864;
	bh=OJgeuzSvaPIxQjCeg3+lPScR2eAvVtdAhLv9V8EqvJM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=T/y8iGym68dgrVbnZVdNOG/Py+Qf3pPVKPcM2usEfa7n0Z94JhbnQZU10c1ILzuWO
	 2tnwPEOUVAA+q7BR+lqcklRg03S2XPbVVG0jLBa51SGFP9TFPveA7tJG5geaGBS+9e
	 elBjfxptM4LfH6sNPGq4PN8X/i8xL4w3JyyL3TN9mwIjfTxD+W8hXiOZiSq0/qIRD4
	 TuXCNiQTWuYjF0DvTcFSXnxn6qUOtYRCNZy7/YyQCC+PD8IFFsu88hXjrmizZHSKMR
	 CdWc/bJ/o/EJQqm12z2zjjsE0QAdTKw0OJS4Zh6/1A+nvLy8YPkYG920mqbW5AjF63
	 5F+gj2+iz4xZA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260610105556.612830-1-rf@opensource.cirrus.com>
References: <20260610105556.612830-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Don't leave parent IRQ disabled if
 system_suspend fails
Message-Id: <178108950523.232889.7423592155223376003.b4-ty@b4>
Date: Wed, 10 Jun 2026 12:05:05 +0100
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
 h=from:subject:message-id; bh=/R54u+M0yy9tCoX9dAlT//+1+Wg0b9IgWPyrQY1YKWo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKn7FE22jcTYkzxFIAzaczyIxMJIZ8wIhDykkf
 Ad8prOKzoOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaip+xQAKCRAk1otyXVSH
 0FF8B/wJz1JVpaKWzzd5BM7RchgQk1hgrg7v5Y84iZ9p6d/dA7luSMeAqAcdn9cWrE71R6zNjKs
 6mYt4unjz7NzudRVAArD0zI+zhbutlPKFEhozMgav6S5b683336fjoz+CKAqanYO4V1xUdUP4v4
 8qsGU/a/LMNNN9FQweijPwdlzQ7iJPNcTvttL1z25wLhQ3yomsjzPEXFHq5UhKH6so8NW6LoyTI
 IPO3vF/NrK38Z2R4IKHfyeXah/bA0PyfpfwmH7D3DuhOktoIQf5eJKcmHyqOGdzbr0/mx2ERj81
 qdkWDWlkfpHfEU6GkAm1EMyv83LuhbF3zQMZbc+z3J4Glyeb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 10 Jun 2026 11:55:56 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Don't leave parent IRQ disabled if system_suspend fails

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: cs35l56: Don't leave parent IRQ disabled if system_suspend fails
      https://git.kernel.org/broonie/sound/c/53cebeb01716

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

