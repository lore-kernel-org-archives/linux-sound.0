Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B52334E777;
	Wed, 22 Jul 2026 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727229; cv=none; b=WhH1th5zdN/j40w5bPbtWpjS7kOh0AAuNdYoK2XWBJ5XjgOM1ABi5J9UiAMlaND1Gw7F/iVH077bGma1UCA2tQJPPt2BilBZGpyvWlnfoqtrfE0G+MSyNscGznTRipvBwekdFo/rXe9FEXhkGwZKY/LDXsW0VGg6NxmBuUdLEkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727229; c=relaxed/simple;
	bh=8x6rRwzLZljscGeh1GMnWpUSLGCKb53XGxR2mtKdh9w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h1+26gCAFGz9B9bTCy++VhxzDt/GmNf92CWfaXAGjmk01SgGgTeDITaGMbOPGpfc/wOaBOzuKbzOo22nX1ugCuo3EzFdBjf+40wwONPK/HVCIpz5OKRykjv3HeHk0SgzT1pfUmZakYO1Yd+Xm+9XQEEy3HvA4OqsRC3ltY0bVZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMdZ/kYl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMdZ/kYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C121F00A3A;
	Wed, 22 Jul 2026 13:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727228;
	bh=+lyWuxh7KyFVYY6z0oYO9aIMD3bufnhomREgX9JsfHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WMdZ/kYl6nZfDm9nL2chLomD6H8/h5TqQEtZxl930WQE8M1XvR4o6a07Vy7BOZrfN
	 SuHCSSPlY5WAYQ8wSYf8pSKYX3L5L8GS5uiPLP3Cd17zt0GS63PTPO+iFf53hSEjjF
	 1j/cxe4RtqZC5Mir4vOJqLj2A09O0gpmJKZ43VV8hEdHBiEKQvV62ugOrMPzXrU+c0
	 /JRsK9QK1Od3TcgI/w3pgfUC0SpBAzEQqu19e3+UdT9U76mU9orjewVFc1zNN6+hhu
	 eTUrSntZXA09MMy6C54iJIcYfnNCM7ryqk+wi+lR8+p5T6bkUHiA3PcJYWW6jwvbXU
	 535f9jSp/vooA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com
In-Reply-To: <20260713-ti-omap4-dmic-v1-1-3cc6e13decec@gmail.com>
References: <20260713-ti-omap4-dmic-v1-1-3cc6e13decec@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: ti,omap4-dmic: Convert to DT schema
Message-Id: <178465629709.123404.8188441744673788869.b4-ty@b4>
Date: Tue, 21 Jul 2026 18:51:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8x6rRwzLZljscGeh1GMnWpUSLGCKb53XGxR2mtKdh9w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYMa4jJ1Ib7NPwQtOnIKJhMdlSL+H3/p6TXOJv
 lFhBbWo0hqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamDGuAAKCRAk1otyXVSH
 0BoQB/9Ij2pqdrFxosSOCvHk3w2xzM9nQYQ8bPN/G9XGthnSddEgl4Sk9f9v3a72Ruocx5G60um
 caT4j3EQ+3nEfr4JZDh3Iy+8cLwF7iuGe+De+79J03nCZRJaSEYU3JvcZGbECe9ONty88/ZoZpp
 qBmQYavrYdV6b8a8vtn7UPkJPHo9ZrAZJ3cy3Yot4U0dK0BLMdP3AHRiDb3hUI8ymAqQ2urtj+K
 Btn+9xsULXqYLCIyH+WhfFzi+48poiXJ6ltcX1o41PfkVXFzMXbtFvRUwT5deilf936HQO2s35C
 gb99dnQ5dYtWyRSNpJjoZ1d+au6NRJheduIvyp3H8sq1kCOd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 13 Jul 2026 18:17:11 +0530, Bhargav Joshi wrote:
> ASoC: dt-bindings: ti,omap4-dmic: Convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dt-bindings: ti,omap4-dmic: Convert to DT schema
      https://git.kernel.org/broonie/sound/c/0f23ed0e117c

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

