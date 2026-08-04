Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FF93C988B;
	Tue,  4 Aug 2026 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865693; cv=none; b=plLrwtqOMyw8rhWIkakq/b5x9CZBgONTS4dPdkDfWLWpXt0jF2czy9OvP+jBjs4DPLyuApYgcxAgU4TVH1sfCFeVZPMMdT9AcVfcxG+ea5xVHuNWc/VkDeX1zgRTY6E8A6rnPTWDkuozUxEXuKQKjH970lDtOSh52Ci2GxzXl94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865693; c=relaxed/simple;
	bh=ho8u0P9N+PUrlnUnXHPqllGRnuJxuyvj9iECy8NLqRU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TBql4uh085ucqaBc+dCQv18xhHmwQ34KDpZ5ix+iXCslplZDBRYROkWuLDRAUwGMFtApgXqJknvUEK/1OT+0UaTYcVBaP8laJpe43mcYPFngF9fsJY4WrTSwMg9cB41VpFC1q+tfSRMmeF+orRJLhiOK9K5R14lRlckRJJilTQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeSr5lZv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeSr5lZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60881F000E9;
	Tue,  4 Aug 2026 17:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785865685;
	bh=TptjCFbDw1ueK5aKeayfQ+mfYjGqPbKcCpkk6qSAUOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TeSr5lZv+/q7v+SmkSbDZGh8J8Fk18mNflflhNsl1BXloQCdUmFl7XL1Md4obyLoU
	 J0BfyvWpRdTGuSgXfcmeaUBcl1zvr24hF/XCYeYU0boPcQ73m4at3s7IMY3iS2J3t/
	 T2xmPU9td+7K0s/XV9uitHToVBGhHuNwEmTyr7xgUFVARdPl4c6xZDaf5OHqv7W5Mq
	 Ps2KpANPmlqduJUYhisGcqXasS5LMK3HQ0MTZKhc3zJrJqhkx/cWH5dbYDS7mLIkQX
	 RGLUsCMIF1YW3OE9iouPTaclfbTTxM5UM5agoPNLLJGqr+1x2kJhKg2T8XS8zbbDHT
	 oA6hatSYPsRvQ==
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Yixun Lan <dlan@kernel.org>, 
 linux-sound@vger.kernel.org, spacemit@lists.linux.dev
In-Reply-To: <20260804-spacemit-k1-k3-i2s-maintainers-v1-1-f19ac47e3a7f@linux.spacemit.com>
References: <20260804-spacemit-k1-k3-i2s-maintainers-v1-1-f19ac47e3a7f@linux.spacemit.com>
Subject: Re: [PATCH] MAINTAINERS: add SpacemiT K1/K3 I2S entry
Message-Id: <178585084476.111355.2202274019201516751.b4-ty@b4>
Date: Tue, 04 Aug 2026 14:40:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ho8u0P9N+PUrlnUnXHPqllGRnuJxuyvj9iECy8NLqRU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqciXTYH1ITaBhdXsAqESFyHqqzK9dWqy0Ii5ci
 JeUkVGvVLKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanIl0wAKCRAk1otyXVSH
 0AX0B/9OeA+kXjwHRzXs9JXVeZYjU0n5QAcsLt9jyDO07PABn9FpYOpGmtoofDVoLDRubn1q/Xr
 P46iT9M05IcUXcA7yENKVr4nifwKzVqB3kV73/aAdwb78oAkQiVpaitovqgPv8VNGpzDNbyuGbf
 kmaxl0ygJuLal6fnzJDPiEk7nzqYrRurA2acQ5uObap5UYuJ0esZ0zYar+vv4el1XQGvao+GO0x
 yxnWcU6igiPrjSXbEd1EyEpagoCoacRIMvVFteKlzdosP8pVDFw1ZsOpQe633Klts/HpFbmAk8z
 xmlVdfZkSbijNH/v73NS5OLjeZ6NNkbhONEIHxBOUIK5DLDB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 04 Aug 2026 01:06:24 -0700, Troy Mitchell wrote:
> MAINTAINERS: add SpacemiT K1/K3 I2S entry

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] MAINTAINERS: add SpacemiT K1/K3 I2S entry
      https://git.kernel.org/broonie/sound/c/05eebef3c7b2

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

