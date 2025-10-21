Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C40721578D;
	Tue, 21 Oct 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761048697; cv=none; b=uHf3EP/qybKaRmUpTa8DXOyV6Eh8+d3TiorbsBIPcRaPAsbdZ6pa1+qRLlYbLeauvqDiWb/RJmhNYk9htTc9oz7FZQLse2IL113GWBfd8jB29wEn5snAPajFHY1roA4d5ku5OqF7DDteVlc20fIzTr1zhJimn9eC02NWt+PIeqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761048697; c=relaxed/simple;
	bh=WIJG6HXzMbhoODf8tiMj1+pGpyaJd1x8UAadvLJQZRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g5UkyQPZAZvvF67RSIS5kGEGaAtBFbAZC2cWRyTxjEBaXRm8YcFH6OnP6D5GiMQ4BWjVEwuimwpa4dv1/GFld+WznbQHQV/VOJgUQdrEB7fJK0RnMibjAx3WyNWN/1Gs1RHkqU0hBG+1yfZypFuzz80IDe8RmurzJJ8VfNCLIbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ti962CsV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ti962CsV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4D6C4CEF1;
	Tue, 21 Oct 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761048697;
	bh=WIJG6HXzMbhoODf8tiMj1+pGpyaJd1x8UAadvLJQZRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ti962CsVrDAthmcWm+4ITzRJlLShl55+H+T5ZjST+BmRtvpfeHPu2sY3lr943vdAn
	 obnYJC8TwLyjU47vnMZKKzCFURI9+96gaGiOb3BvTlqvPOq90JZywxZNPxokGSA4Bn
	 P28lZm2YNIc8ist+wsFlw+GfjLQAHYFb0UpEAx/MKHSO36Q7Kj0FO0KJKj80WT2D+D
	 X7erw7WbG0PqyovAr37imlmFIikgavdggLota6YwxQyXcO8KnsVniOcAALgLKXU8Cj
	 KrjRhcwe76tNxFBSzkQUZmy81oZdIyG1GTH/nLJVi1LWwC1q/R0kzT7G0x5obNAIKp
	 g7lvJjbs4cVyw==
From: Mark Brown <broonie@kernel.org>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org
In-Reply-To: <20251017161543.214235-1-vitalyr@opensource.cirrus.com>
References: <20251017161543.214235-1-vitalyr@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v4 00/11] Add support for Cirrus Logic CS530x
 DAC and CODEC variants.
Message-Id: <176104869443.31596.194072100832387720.b4-ty@kernel.org>
Date: Tue, 21 Oct 2025 13:11:34 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Fri, 17 Oct 2025 17:15:27 +0100, Vitaly Rodionov wrote:
> This patch series introduces DAC, CODEC, and SPI control bus support
> for Cirrus Logic CS530x variants, along with general code cleanup
> and resolution of checkpatch.pl warnings.
> 
> Changes since v1,v2,v3:
> 
> - Signed off all patches
> - Splitted "tidy up" pach in 3 separate simple patches
> - Fixed commit subject to much preferred subject prefix for binding patches.
> - Moved dt-bindings related patch down the chain
> - Added all relevant maintainers to CC list
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: cs530x: Correct log message with expected variable
        commit: 248adfe32bfd75afbcb8f6d4b68f7e0a9fb2c438

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

