Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5A36D4F9;
	Sat, 29 Nov 2025 01:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764380496; cv=none; b=qzlBeZQN37M+FNvEwJkE7iRAoeATLOXG1ONqiawS4HnchHVjJ1u4PkUdkloaRMrxmBJ+Gaz+MGByj7nogJCKAHZcRslCkLUop65l2u6i96pkVtL4MaaX5EebXL3KOMZ3Rn9bb37uACqd3fZ8a3LId+1i3L+YF4Tn4qi5TOkYUkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764380496; c=relaxed/simple;
	bh=ZwE+Itjkh+U8C3WMy0mxJYuCl+KFmCS8w8y77jCWL88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xg7nF9qWL2TRtBbvRV0JNyjd/lPyd1UnVETOkgW3ImvBOOhAfIhRHqdtrzelFwWtPvnlt5d4eVOlU6RIt5Vp3xACOqvmu/Si1xqNa0ZCuOzQT+zaGS+1jyaitmhSskNtCgDFgjXlca6h31tIR3x4toYdW6KmD/UO+Isz3CXYWSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hw2+U/bX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hw2+U/bX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03AC2C4CEF1;
	Sat, 29 Nov 2025 01:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764380495;
	bh=ZwE+Itjkh+U8C3WMy0mxJYuCl+KFmCS8w8y77jCWL88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hw2+U/bXfQvrLsJ0VvuNMeol0yle+kMjbqTy4UqPp4pxqb6KHs2r688MiNEoNerMq
	 c2pn8tpo1LSjoPTYlntqELrU1xsei2W4a+YIRMv6/KaTFhA3I7AYLbCvs/cG5JxWZ3
	 pjMg8rG/t8XiRJH+dZ2i9SUQlFOgY9737HNxwcD5CxPaVvmhHYee5VPe7v+iJ+DfF5
	 wLhjGsZoGQ7n01xISoMRm6cLu9E6a7gvcGL4tlCUiHJjvRnPIz33RlehzaTK4m59sw
	 SSe4g2chJgYHI9otc92TvVagtzo7NeUyJBTxOYPuwzAYK1NmXM+gGl/5ihqdhWtiEn
	 OnQMBcw5eSXqg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251128102132.1575177-1-rf@opensource.cirrus.com>
References: <20251128102132.1575177-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] firmware: cs_dsp: Remove need for clients to
 supply dummy cs_dsp_client_ops
Message-Id: <176438049472.294473.7137972891332960750.b4-ty@kernel.org>
Date: Sat, 29 Nov 2025 01:41:34 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 28 Nov 2025 10:21:30 +0000, Richard Fitzgerald wrote:
> Clients of cs_dsp can provide optional callback function pointers, in
> a struct cs_dsp_client_ops. The client had to provide a pointer to a
> struct even if it didn't implement any of the callbacks.
> 
> Commit 1 in this series changes that so the client doesn't have to
> provide a dummy struct.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] firmware: cs_dsp: Don't require client to provide a struct cs_dsp_client_ops
      commit: af37511305c0da1d151cc9a1ee6077c2cbde4f1d
[2/2] firmware: cs_dsp: Add test cases for client_ops == NULL
      commit: 479b1f8d416501cc3c18b743b1cf63776934ada9

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

