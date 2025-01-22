Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E391322E
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 14:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554581; cv=none; b=sHPafRYNlLVlZqB1vmZLYpbt+4328XqgrsWJuKCJITY3aiEJnH3EoyPZIbgscN9PZOSO8xDnFdwdekQ9z43Eitv8AEDmq6D782Y+qY1g8w5qsLXrn01ovNTLnnxD8QOy+vpGA6isL89hoA5CG10Ury3EMBUSjR+XEgGJjOnbC4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554581; c=relaxed/simple;
	bh=jIeMoxzgg4au54oz2/VlPkPTW9XnFznrq+X5qFWwZk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p37sGzU3EcTrjc4hrVcctiQK4XLpH8xXKSyZUjEWhnScXXcQ0K2ihZy40kVmCdDUkU4kbYSdu9RZoMDDeQ/ZBWEiY2im6mizf2aGtitbq0mG62oU6oieegPIlBfkmeWlUa/62KkLCJF1UV9JgrjN4xTVQN7wOjKgkaKklYbUQHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJp5FwYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJp5FwYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA57C4CED2;
	Wed, 22 Jan 2025 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737554580;
	bh=jIeMoxzgg4au54oz2/VlPkPTW9XnFznrq+X5qFWwZk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vJp5FwYLt4vgeLQCuvY4KSqdzQQWinnJhnY//oZ/0r3xQ9E5muThvdKU7VoxoacyC
	 MJ9o5Nr7PsHxAlbKY2fL82mWXNy3/fWY9bneW+tIvb6MCT8S8XmnvWklKcRLrGbTSc
	 rG7ZeecrwnGPac2sTMba974YLJwMiAF0yu/nq8H+2LS3CwwI3Lopmi6AqzOz+ewKL5
	 DdpSe46TjqYUbQPWkutn2bfq9La12Lr+1wo2K84XJ4hjJkIMHsQ4ZIhSlSHMzr/k/b
	 e6dHFOo4By/rAPGyRoqFBuxVm1Z/lOlksw+vvT+XtWl42eULMzdX+7SvpWBKZPDMcm
	 7OKxaUcdYRhKw==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-sound@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Fabio Estevam <festevam@denx.de>
In-Reply-To: <20250121155747.3740995-1-festevam@gmail.com>
References: <20250121155747.3740995-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: ti,pcm1681: Fix the binding title
Message-Id: <173755457895.34622.4637065311171131425.b4-ty@kernel.org>
Date: Wed, 22 Jan 2025 14:02:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 21 Jan 2025 12:57:47 -0300, Fabio Estevam wrote:
> The PCM1681 is an 8-channel Digital-to-Analog Converter, so fix it
> accordingly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: ti,pcm1681: Fix the binding title
      commit: dec6b006f4cc13968d75ed28673ca4e3633de96b

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

