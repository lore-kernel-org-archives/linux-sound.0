Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7C544A71B;
	Wed,  1 Jul 2026 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903793; cv=none; b=iLW1eIkzrDmBAiXLrCNlJiCLbS0+/JReDV964Mw5TZyolS887k5OdggXi0rHaSts8MxWZsVfZuWaeySxDK04CncLDI867Ro26kwQodjjbLzZR9pAAIqtQ3hPJqvKexV+jJqeT10Q0xvjlFJ65sDKL3fyi7h4Qwk6rO26YLktzjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903793; c=relaxed/simple;
	bh=Rb2RC4AxRUlY/UcvOrTMxoX/3/pY7kAikrWd0IF0zRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F9qpAjBz8eGSf2q1kTRxgRMHNpJiAnmGGPClXrAdnL49o/cPYl2Gw0Knggk5ri0zFv8c4ZK3r8oX+Y7r4AI6y/rSwRUXmcpc5oi73MiwGe29qs4AUJqaXZ3ryE6cXIzXfLzLHMFL4hfg/UJOX3NKPm0fnSt7m30z/XTcims/5xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmxmG46E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmxmG46E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E37A1F00A3A;
	Wed,  1 Jul 2026 11:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903790;
	bh=riFYBnkdzsdygAVTq2DAGK/GD0BrRYy5LGBsyh9jP5Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FmxmG46E6NY6RnZcYfroSN+Hfu8L0RdS5SgF+VCncUkCZNqiaz4gbYRGKfhHZAqed
	 BBGib3GNNPaNZ/pIgJl85xhY9VcGvZL13deIAxWe8DVELd4vFqUexjynLw/BssuJ6b
	 EuluCd/a35t8upmuxal27/1U0z3DPTyVt34ZkRZWfvf7iFFOGEpy27NHYI3TxzQjRA
	 ZtufyB7MWcVEtc1i9XLCMrI7BfM6JEAvYL9bmCsOJkKecbngs5O+L3YPeGIaSwXx+7
	 zqvUDmW58nFFIFAutcqGP18OTLAE9rVirpD8l4rzIAWh/IIcfU65zMcMJE0LAA3xwb
	 h2gkeigcUNV6w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Julian Braha <julianbraha@gmail.com>
Cc: rf@opensource.cirrus.com, arnd@arndb.de, 
 srinivas.kandagatla@oss.qualcomm.com, niranjan.hy@ti.com, nathan@kernel.org, 
 alexey.klimov@linaro.org, nick.li@foursemi.com, peng.fan@nxp.com, 
 linux@treblig.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260630085249.380365-1-julianbraha@gmail.com>
References: <20260630085249.380365-1-julianbraha@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: cleanup kconfig indentations
Message-Id: <178284348911.368110.10913441967576864319.b4-ty@b4>
Date: Tue, 30 Jun 2026 19:18:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Rb2RC4AxRUlY/UcvOrTMxoX/3/pY7kAikrWd0IF0zRs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqRPPrl2ZRV82+9yEUGT4Yox6Rr5sRkC26X0aMd
 0EocACYEV+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakTz6wAKCRAk1otyXVSH
 0I3cB/4gx9Z2+cVGe3nmTHUAUY+gEm2Xw2Qy35yXHr0B8629jUWJ9xGUcFdSNFamBpqRxoyI41d
 62dRfBkHt9vyHTvGR8b74IWZcqdshdcRL49GMr0VnIAH68a7XCqiXZtSR03pafIcqWCAq1jAzrV
 NB/lcjOiFUIR38BzvFaeD+C3R5OBopwqUTWKe63JlPr4HQad5eolTsA+Ls4o70Ne697mN8UXfIl
 fXwIhPCIEmUjJbqnLbv/Qb8MTXpjU03SGRsdR+5UcXKFARKL6BBI+croBYqwEi0t0YCfmECNraY
 RDlDD1+uhsEee9q8D79hTOSCtKkMACV1Yndqfusbv5SPIhTm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 30 Jun 2026 09:52:49 +0100, Julian Braha wrote:
> ASoC: codecs: cleanup kconfig indentations

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: cleanup kconfig indentations
      https://git.kernel.org/broonie/sound/c/2f82d58a87d7

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

