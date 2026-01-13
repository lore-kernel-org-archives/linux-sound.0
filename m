Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DF03921FC;
	Tue, 13 Jan 2026 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312207; cv=none; b=QWU50XbFcNvgCOJATj0JIWrhzR6zWtpo65EucIhz71uy8SPcsfXcXnk4GfqECSQA9TaF+vVWdceTeWtGBSvTbXcC1eH8qe5h8UqfH+osq8hGl7aFwu0XelHXQmVhXswaN6LNCIZcDRXoo0Z0sJ4jGO6YzMsg/Ktbsa6LTRISHdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312207; c=relaxed/simple;
	bh=O/ufUS1ejEBbKS5Ea5alMxQF73hHCU1/fhBl/pMj/rg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pYKRY4f9/APKn3vYHLqt0DwzYCQ/cLbEw2TIca8D+cw5HXqzIPD5A2GfG3gHictT4u8R0RvVWr8JELPF5FCBr+DR0t1UwgAb7bk8TgPgSdCbC5TanztmYZ5tHYTtRWyGZf85GadeqaS0RrJDwsnbWX87NBF9bp1AMKLUw+WK+1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhnFJoJR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhnFJoJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9016DC19422;
	Tue, 13 Jan 2026 13:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768312206;
	bh=O/ufUS1ejEBbKS5Ea5alMxQF73hHCU1/fhBl/pMj/rg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WhnFJoJR1JVke1lDWfwXQxyyIDbHE3GG6F28e+GG86gbgmBZiD+m/KJ4D0ac5kqgR
	 7lZ6AF7XojI+BsR8iOSOIsSiPgZEJC3HN26RX6BRIYb3sH4OIJ1nO/gEvWXaLUQsSX
	 2sbY2L6GDPLxpmYPjUlrRMOlz5UtgpZcuR4YO4V/zn7R7QLYQWKIDIApD8k1HZV4oJ
	 QvjM4Moq675ZzAk+9XxxgRcKdVNL/Gw2Y2c/0MLOS/8N8lhGYBMmVzYkw+tPiRPJsX
	 03U1O2PZDWZxsA3kNcUa3xp5zVU8TkIiyj1T2GopIZJhjSQ6Ym8C0rKFq1UikPNQKU
	 Ex1OcShM8Y+qg==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, cy_huang@richtek.com
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, musk_wang@richtek.com, 
 roy_chiu@richtek.com, allen_lin@richtek.com, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1768180827.git.cy_huang@richtek.com>
References: <cover.1768180827.git.cy_huang@richtek.com>
Subject: Re: [PATCH v2 0/3] ASoC: Update rtq9128 document and source file
Message-Id: <176831220432.70484.10730103796055155517.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 13:50:04 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 12 Jan 2026 09:27:31 +0800, cy_huang@richtek.com wrote:
> This patch series include two parts
> - Update initial setting for rtq9128 specific feature
> - Add rtq9154 backward compatible with rtq9128
> 
> v2
> - Fix commit message typo
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: rtq9128: Modify the chip initial setting
      commit: daf86dcdbb40c4a0e4b8e579c6eecf148560711f
[2/3] dt-bindings: sound: rtq9128: Add rtq9154 backward compatible
      commit: b7d53fe53cb57db1ca5743d2ac2db28140c37647
[3/3] ASoC: codecs: rtq9128: Add compatible changes for rtq9154
      commit: 6be9ea62afedef0f976eb3dba4c117be0c1d3809

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

