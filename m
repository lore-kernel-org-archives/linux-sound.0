Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26582D94BA;
	Thu, 11 Jun 2026 18:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201843; cv=none; b=EiCNFEy+0f4BscnQC3trSL25y77k/9k5duycztkJBMH/L2KI5YiF9Kcx+UAOZ1NE3UrIgQzuhwkSSHntL3ju33F1n1cfaxzPHKyu8RLisF1QppAUG4Hluq1eCCFUG9OokgzOmHTj7qevUlXKFrDNuDzW3JWIX1LxTwoL2WPpEcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201843; c=relaxed/simple;
	bh=tO7/EjsMQm86AaRt/f8utKAb8c8i4NYMVHqud/Z09Ek=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Eqgu+636WRK537r62gRrD+Bmm1g8JzrYgStcDdetiRTE7v2XMUq8yEO7mfzQ+T4q3gpCBPrCR59eXJPpzXivLod/AceYFQFjoKNN8c3YAU16tqzQi5rbKRlu5FOIQZBnBdJd1p3VAz6LZNQjoaN7WUX+8CukF87wk4sYXNr60VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsiCwC+S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsiCwC+S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36481F000E9;
	Thu, 11 Jun 2026 18:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781201842;
	bh=QFgKRTdIwrU6rfs520f5cSsXBx3dGBPc+7sbQWwBgeE=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=SsiCwC+Sl23wCSZVmlY+77R8VC/dQkyhLAjn1FT7ZSZChjAnRieGGXqi+nnhVEQC8
	 ySsjq2e8obJ2PR3kVoM1bfjtqIW+S4q7vPkiSvcMiVVvCUYN0iQwmxSNdnsXG9I1cP
	 RSqWqEixAsdYWISpv/0JrVGb/v20k84jvlu3IzDAcAXZ7BSXFFuE8qX0pB5toxN/ik
	 2434BDGQftzNuyIi5/D3DUWRVNoVcIuCe90BBukmI6qrVxupHqa2EFVEUqpjM8tupZ
	 XDzPiavK2oJTcq+WWHuTYLQOSX2LgxJQeNlXu6vMU4GNIIOx1XKKwaC5amJgqM8IYB
	 Phyg+jV5spwxg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Li Jun <lijun01@kylinos.cn>
In-Reply-To: <20260611010045.3668574-1-lijun01@kylinos.cn>
References: <20260611010045.3668574-1-lijun01@kylinos.cn>
Subject: Re: [PATCH v5] ASoC: loongson: Fix invalid position error in
 ls_pcm_pointer
Message-Id: <178117328814.385863.13217909476069164391.b4-ty@b4>
Date: Thu, 11 Jun 2026 11:21:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tO7/EjsMQm86AaRt/f8utKAb8c8i4NYMVHqud/Z09Ek=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKvunfLtWvvfumnTRVzhZaCRzjrAuyR0QiDKOV
 cEN8k7UCReJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCair7pwAKCRAk1otyXVSH
 0OinB/9U8COyJ/lGYwjeXLD5SVW74cIqueMtuYS0g5Fi/iwTmK7SLVAXgz/HEJliMWZQmy1jMvy
 e42zYcrfAZMYtQVbXbQntl8Gijq5+Arf+cofHJ2FqKDwr6rAqxfPWNP8PIz9q27pSJo/PTMutcw
 IY2rkzz86Elx9TGd34DpO3o7RoyNGB9N1DKFQENUigTmkKav2Lu82M7qP68TyeW0ymE9aQuj2ML
 jOYyiqnvQVTBRydfdtLB+fKv4qnD1Mz88zaWUFpGncxlydx0GMLRLkGF5asestby1QQZKsZcS8G
 L488h/cPve35ySqYWsSTyY9zsX2eT0NErnVXCX1Pw3v/oQhm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 11 Jun 2026 09:00:45 +0800, Li Jun wrote:
> ASoC: loongson: Fix invalid position error in ls_pcm_pointer

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: loongson: Fix invalid position error in ls_pcm_pointer
      https://git.kernel.org/broonie/sound/c/6ad3914e06a4

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

