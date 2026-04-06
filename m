Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CEA386560;
	Mon,  6 Apr 2026 15:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488997; cv=none; b=VqyIv/4Ez4RBAc/9Z9Oa9fC1Wrz5JrxX1/8V0i9Y6mcOziVYVybBGloo9PXHwYlBqraZkCQ6/6nzItxdL1qksQO0Qt6MKvNbO2ppxzOobMXxYJUTqu0rNTM2H4DAAJsxRfX0HWGomerdBkK3K3Kiy9/UxFJFlQRpymBHBwiBxiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488997; c=relaxed/simple;
	bh=bvFoonxCf8WLzymd5qml2n7ctrYkhx4TliqKM3gW/QI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LOSWMipZqybPkwZcg6evIJIGO6NV/Jgi6+O4IapGu9GcKi2iPLuY5GWRUv1XT87FtKp1IV4x0QXneXJVxVeftiUpf8LMkxfNWPjZkRNJUkD5bduGA22byGwaBqXVzSoFDKmEk1z2ebQ1mpyjuw3TjjJhPz1fnq3BmY+j9lWBOww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbMenJFe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbMenJFe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85913C4CEF7;
	Mon,  6 Apr 2026 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488996;
	bh=bvFoonxCf8WLzymd5qml2n7ctrYkhx4TliqKM3gW/QI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nbMenJFeEz+Z/Zml8dcWX4LEU/Z88D4LxBofGRb9sdy7MyfiYgxIE1XYuGjqzd29H
	 4veNzf5vgkMQ54JwYuC4SWiW7HMKh60D0P4n5OMwXQgvawJOqjDzs9Qgyf7kGSDS6s
	 FENKeDqLfV0KaA/6ihHB5hkBQgcXa4lYA0V8bNIJkDGQ0ZYpZ1OH5QksFc4wcbswKw
	 E2ig6t0VrIj82rP+HKfBeU9gzIAFQmI8jsWWuf9yXDY/eTeJisaAJiamqEYMl6444W
	 c/UQ+OxtdSR4qKyOCiDHovl4cHilgWLas29eJxIwKlt26YrMe5jfolDwhY/nvNk8aa
	 d6m8+TYDdcb2A==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Marek Vasut <marex@nabladev.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 Kevin Lu <kevin-lu@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Shenghao Ding <shenghao-ding@ti.com>, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260405234502.154227-1-marex@nabladev.com>
References: <20260405234502.154227-1-marex@nabladev.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: ti,tas2552: Add sound-dai-cells
Message-Id: <177547742376.46304.5180387312715335840.b4-ty@b4>
Date: Mon, 06 Apr 2026 13:10:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bvFoonxCf8WLzymd5qml2n7ctrYkhx4TliqKM3gW/QI=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhszL5x+Gf3vp5BJYmKtYE/7+GOvyjk3brRqis/kqWfe8e
 jo/41ZDJ6MxCwMjF4OsmCLL2mcZq9LDJbbOfzT/FcwgViaQKQxcnAIwkf332P/wbUn5dN4hyuxE
 pIJQ+RNe/i6htXyLd2nuqeOMee83+1xzXNfGcJMPab+1jkYYKwQmb+dvYbc+23jU7833JJ66NSf
 rT+b5rvxvvrBP7IXX3j//3vYs9NiQz+Y/6d6hJUfz+UvV32mIlRr9TcibsfpqWe4UfsGu14tttw
 eIG1j+avUTaW6Z2GSyz09HVv9Cf46Gxrt0hczDpsW/vd89/Kjo8LZx9VRBUaaj0axeIvLzNkoy2
 mnsN1t4c9+Hjbd3vysMrctivcwmz2jJlvZz8Qn/g2yhceUf+LYIupgpd2vYpi68IfLovkRuecBJ
 y32CbtGKgkrtNd3f2pL8mcKE/a+//HXfrn1S1IRUR9UwAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 06 Apr 2026 01:44:35 +0200, Marek Vasut wrote:
> ASoC: dt-bindings: ti,tas2552: Add sound-dai-cells

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: dt-bindings: ti,tas2552: Add sound-dai-cells
      https://git.kernel.org/broonie/sound/c/5075d08e72af

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

