Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184892139B0
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730993743; cv=none; b=PXbJm7eZiup9rlJHPPy/iO7Xa8MKZb4WcfnHhV+8X8KRSVf5S7X4nGjln3/WBqZ4TheJWWsPtt7AzYOVYsYOkXOHk66u7rgmxyig8uxD/xJ6dPK3y1HXNhDFj9esiXiIfjUkQ1xBvSSoJmAhrQ+af4a5vDKUBjNbPyUGDcdpgNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730993743; c=relaxed/simple;
	bh=i8oiJn3H8d+sxL5H5+P6o2ENMZhfSiWlHzjOf9PVRoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LxQGvewDFHVNEdRyqJzyOxXAXx+YBoJ1l0wsbEeSbLc9c4SMxUTNCu39ra0kZNGinG+GW0kU4Y/WNCa4GBwgJdLYxW+PT3lmouFxnJB6UE5CqNUWK6xEIZHoLzrEghRYmBE88bj4MJ1lm6VuWe8CRT9WSP/sGAE/IcdJzrTK2bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPje/pTW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPje/pTW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D135C4AF09;
	Thu,  7 Nov 2024 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730993742;
	bh=i8oiJn3H8d+sxL5H5+P6o2ENMZhfSiWlHzjOf9PVRoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gPje/pTWeb1987babt5gbmSflMSaxKMGGm/8ZnVq5JADZAGK+QeVhaPQJQKx0kGRe
	 XdvsXYGkKE5XRLy88UDzQTMKGaLR3f7CdtZuTNT0QliDtYHCk36Jkv2hi7wIjkdGLA
	 FBRpUvcUIPMlzc1kVVtAtSn30G0y/3OJI1dXNruumdFN/melQNUlF9e3MNARhPKbKv
	 gClSgLrj1sw48jQoIhn4UfZ2E2tKHpLb40fafYe2wOmmavcOrgzOdQcSQXhYYFhFxd
	 qyy+4PciWGriYUNQZRJioKRGoLpakpe1BYj+PVQK4Uw68hXlHT9UMfJB9euOLsk6yJ
	 2OBDDZEnRW3tQ==
From: Mark Brown <broonie@kernel.org>
To: Markus Petri <mp@mpetri.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20241107094020.1050935-1-mp@localhost>
References: <20241107094020.1050935-1-mp@localhost>
Subject: Re: [PATCH] ASoC: amd: yc: Support dmic on another model of Lenovo
 Thinkpad E14 Gen 6
Message-Id: <173099374178.145735.5279319598882437433.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 15:35:41 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 07 Nov 2024 10:40:20 +0100, Markus Petri wrote:
> Another model of Thinkpad E14 Gen 6 (21M4)
> needs a quirk entry for the dmic to be detected.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Support dmic on another model of Lenovo Thinkpad E14 Gen 6
      commit: 8c21e40e1e481f7fef6e570089e317068b972c45

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

