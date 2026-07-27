Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E7142378F;
	Mon, 27 Jul 2026 22:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192925; cv=none; b=OcDPiKkclWmq41+sYJ6pZB4EMWNzUa2W5kauc0C9mG9JH3qJ/xv3EWgv0IElVipZtnntGwZOLUROSboBrIMRiy60AwdfUfaYAqlTiXLZ9q/dkdC7DsstbjvtuieQZYV3yG77Of3Oz8rAFwsxGgs5BYDPbV4ueCgChh9H5Nj7Slg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192925; c=relaxed/simple;
	bh=dF+l7H9/xo7CP+sc89qF3gu31aXJPEOXsCC/5xVVBRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aenOw5Ed+XVuRroNFACqi5jwZEwXAqTUL+4ZjdEBI4O1FRN3MIyEcDszoEsxrVofr5wzbYU+v7f73ukLWx2TuFjradg07Tv+enI8QXp+ANBgORMcy5h/yCNMw6lNXgggGfB2C2ofmXs9QtzeWy+KyARfMc7Hro+c4iPqszx7FHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePNoKO1V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePNoKO1V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E9C1F000E9;
	Mon, 27 Jul 2026 22:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192923;
	bh=Ml2Zu8jlqturZUODdnVdE0AFH9m8EwSin6YBqTA6YpM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ePNoKO1VAcrN203clECACeMD0TTMapdGvlVtRqavj86B/puaWvxbkl7iaNrSQtkpt
	 ap5cDO/L0qYbJUIRimHdR2vyrGbJreURTelmyiE2PJmplG1NlAootGZsx7O6RD8hP4
	 0Jn0KIrFNHogPxuskyCtH2UhLULwPcIxunIe2iUisJADubN9wAlwiOCK7wOp5v4RrP
	 ENqqmOpnbeMRD2UhM3QSBrbe8IPDl5M4+blNO3ozxVM3Bhldtm+F0JunpPiWGEgLQh
	 auc+T7pHMGynyyUHZuZqUM0HrKfy3sW7CcGE0zJrF2IwmiX8j7MqXA+oxXdJ2NEfaJ
	 9w6327FqW+QLw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, wangdich9700@163.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 wangdicheng <wangdicheng@kylinos.cn>
In-Reply-To: <20260720081616.631413-1-wangdich9700@163.com>
References: <20260720081616.631413-1-wangdich9700@163.com>
Subject: Re: [PATCH] ASoC: tas2781: Use correct calibration data for
 SINEGAIN2 register
Message-Id: <178517451345.50339.4661294688450949714.b4-ty@b4>
Date: Mon, 27 Jul 2026 18:48:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dF+l7H9/xo7CP+sc89qF3gu31aXJPEOXsCC/5xVVBRs=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGpn4dnIC6sIUlQrXx6j8vOp3HmKilPrhqGD86Lg/GzqYUEJL
 IkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqZ+HZAAoJECTWi3JdVIfQpiwH/2xO
 PzC2lEvP7r6Kr/itHpv3DzfiRwfh4zjKZ8EVegnmhGZHlvzA52sOw61KJZ1oYST7V3X5e6g1Qdj
 nj0WoaheGtSEqjVBOVeRWcce4lilkI8c/8AqGFuPPqVsXneiPgD3JG8IBC59m0NVim9vuRzaa3/
 0Hbs+idF0nmva7+6sPfNVKxAayjtEATAJQNxGtZ4PzVcadW4vBnXOOhQucXqi9QZtB0rH6gSMcX
 iArtOBf6c9Z/R92xI9iffrTzEWdhnBw2BL6VfoqlV8XDovy/EfPz9eCNewrtoF87+ZdJiHuDUxc
 rFsrYVvajaG6T2xUhrTZqTvKPy2BnXvBRXJ2hcg=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 20 Jul 2026 16:16:16 +0800, wangdich9700@163.com wrote:
> ASoC: tas2781: Use correct calibration data for SINEGAIN2 register

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tas2781: Use correct calibration data for SINEGAIN2 register
      https://git.kernel.org/broonie/sound/c/dd88cf6273de

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

