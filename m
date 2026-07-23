Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D4225B083;
	Fri, 24 Jul 2026 00:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854709; cv=none; b=mNpEhXSqxWZTD2O+GNOFG0UblTdr2YjA3h5PbZ3S2dlcAD+5V7klzo8TvjC+NZeaMUr1wBWYOpupaKhNM/EupUyApO6/PO5TAAnvZ91awaKxAHH5ZPmivsOY61wdKJ0UvE+JZUEPBMp2HN9IX2OqnpdvUw86UzqnJeBl9umt0nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854709; c=relaxed/simple;
	bh=Z+DZXaVMkBJvppVuH05mkoVURmyRDBb0qJxSdWYGHJY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HosMdXOIfhTT7VrS2s394sQUoT6Kh67DQSHLzmF3SxbolqWy7HyNpPh8BbWWgx/8MQwWh/9WKrawWOtX7DhQv7nz3N98zFJASm+yS64mTU+HoOb8PHV88L7zRVNFYqRGAXy+quNRGtvCsKK4sLT6Hl6uoOgrEXHrSzbVGJfU5y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckOaAxvH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckOaAxvH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3401D1F000E9;
	Fri, 24 Jul 2026 00:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854708;
	bh=bcXw+uIE6W+aK5mxlbiXr2hjN6fRQj7fOTAKPEDEydk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ckOaAxvH6ImfAeVxHn6JpB+5j75OsgTrQXC9NZPpACvjgH/VnkuhHoC9WCh0I8f4d
	 mcGwbbnlNNHPRRYqQnVZT0r+jcFph/AIZo4rekx7j2Locr8S6hfNkXq1Imgq2sAOT/
	 lTxcMq59AksRdH4uboHxVVmIJAFouMbhWny/rxdlpj8s1TkTPIxADoRzev+XDPzoHA
	 rL7SIZESSH9QCcXzUtT6KJEztHwQhyuBnM2IhQCl6us47dyvletaqpHalo1TwCxFQr
	 NAHiA64bw2vmCqKmzu+f6nRKoUF2059A8Y6zgTZtE9ViVZSccks/w3QLqrp5Gr1pPp
	 uIOHMHZL+RsWA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
References: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
Subject: Re: (subset) [PATCH 0/3] SpacemiT K3: fix I2S DT integration and
 add controller nodes
Message-Id: <178482894045.53486.14996255355571230454.b4-ty@b4>
Date: Thu, 23 Jul 2026 18:49:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Z+DZXaVMkBJvppVuH05mkoVURmyRDBb0qJxSdWYGHJY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYriwtHQzGPiVMTAq4TXVnYB8E272P0kdF5zON
 4Tl55YNbL2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK4sAAKCRAk1otyXVSH
 0HOSB/4wOzhGtKviF7czKKjFRLfpx+au1bP8poyRbExsvd5h6bZJq2xNP3571T+7iiG46UQxo5T
 dzdaugQrRvZhQMUJQZ2frnSvmqUAcoeuwvb25RzOweTxG0mSNclXE26WC/aZa8pJ0KilZx3riwg
 ODiLabcKo2O3ZfP3uvGn0C8l/ItUne4sZXY8MMeUh4peYqogTGNA3sgrBWuF4mDDLLKnl70KMhn
 pe+1hMKvvIuzfPG0gHoE0kEqKwX/qphYu5BklY8VIw7NF8LfYV/jqswOGjdAirndJTvJavTFyA9
 jIT8f4prAy8zPq4yjYauRhb7URUZLc6ShG5aZO87+12KJg0C
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Jul 2026 19:35:54 -0700, Troy Mitchell wrote:
> SpacemiT K3: fix I2S DT integration and add controller nodes
> 
> The SpacemiT K3 SoC has six SSPA-based I2S controllers (i2s0-i2s5).
> This series fixes two bugs that prevented writing a correct DT for any
> of them and adds all six nodes.
> 
> Patch 1 fixes the ASoC driver's clock lookup names. The driver was
> requesting "sspa_bus" and "sspa" but the published binding specifies
> "bus" and "func", causing probe failures on any conformant DT node.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: spacemit: rename clock inputs to match binding
      https://git.kernel.org/broonie/sound/c/4c69d04958ec
[2/3] dt-bindings: sound: spacemit,k1-i2s: allow 6 clocks for K3 i2s1
      https://git.kernel.org/broonie/sound/c/ec926b3bcb49

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

