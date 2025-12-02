Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD7F7E110;
	Tue,  2 Dec 2025 21:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764711448; cv=none; b=kGVhp2BBEagsFvql1VMg4JrfNu2kGeVCw26n14u0TVMkDWZM5j2LzB1+2rVRnjECtC/isKNKQDHnLAZbTuuzS12a4/Ye5C9qmM32BZ8TWOmz2ziJTVQpowG7q9FzX1yPdgxJiLnB7mhSTpdseZg379q5G1+vMuSO5Axf4jvgAhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764711448; c=relaxed/simple;
	bh=8oXE2lAtW9OfH+A5+tytds5w/bJhvES9JtF/R/52vNw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NU6GtGGnW4GmEomkfho0tslyhFm5zRTYBWBunToNUEs4QWQs3e13gEce9TGOqS259JfhUaevl6aC905Axl12Gsa6U7PKUpAxwDq077wcLUwPKX3vQ7F/nn0mOT7rA4JwidHbfFmF049YHKXoJaC8+dBwIPmhdhqkPPF99QquaB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3VrrJmO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3VrrJmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2768C4CEF1;
	Tue,  2 Dec 2025 21:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764711447;
	bh=8oXE2lAtW9OfH+A5+tytds5w/bJhvES9JtF/R/52vNw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z3VrrJmOhNBsqXBn0H5pjoCG7Uo3dM0ogGP/ZWMcGyIf2bSiOBxn7RQsg8JgVpfk1
	 02aRRRpOb9Eswi2u7hLuCD22AT2yDcLj6HtYeStf2LULBu4BWRrSwvuZkSnO0FIWnc
	 zIjecvofneaFrMz5GdYjCBlK+OYim8yrcbqOoBxszWBdWkqLsYytMtW+uju00511Ws
	 Nz9bmyyQ1XNGuGtKPnP2XoxV360KClm39GSW1hpsbHdTF4Nd3cXQZl8NOf2yO0F7aN
	 I0Won9tFrPVtCq8l/0tU3T1X0mOcf7sw/qycQohG0MwhJWIhRFOwmkh6QosKpWPvVy
	 pw/5L0kfXBOzA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251201111429.43517-1-rf@opensource.cirrus.com>
References: <20251201111429.43517-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs-amp-lib: Revert use of __free(kfree) back to
 normal C cleanup
Message-Id: <176471144659.85842.16970571597637988500.b4-ty@kernel.org>
Date: Tue, 02 Dec 2025 21:37:26 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Mon, 01 Dec 2025 11:14:29 +0000, Richard Fitzgerald wrote:
> Revert commit 6797540c8b76 ("ASoC: cs-amp-lib: Use __free(kfree) instead
> of manual freeing").
> 
> Krzysztof Kozlowski pointed out that __free() can be dangerous.
> It can introduce new cleanup bugs. These are more subtle and difficult to
> spot than a missing goto in traditional cleanup, because they are triggered
> by writing regular idiomatic C code instead of using C++ conventions. As
> it's regular C style it's more likely to be missed because the code is as
> would be expected for C. The traditional goto also more obviously flags
> to anyone changing the code in the future that they must be careful about
> the cleanup.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs-amp-lib: Revert use of __free(kfree) back to normal C cleanup
      commit: 2b69bee5a2d07bc0583f2a8f17d262ddf7c58466

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

