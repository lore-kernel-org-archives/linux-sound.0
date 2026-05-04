Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60857346E58;
	Tue,  5 May 2026 01:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943350; cv=none; b=X70ds06B7lvGsp/DKnpqkGtsDWp6HxM0Qk4iT+6TSKVX8cePk1okFC6U1S19qNRoPsIdJnv6u13ydQJZ9UVnaGhDSqrgO8sbqnhA7/JnHBGZ2kVJuCve3qKsO+gCsTl4By/3GBVxhUyIIbQvqyq5KvnmlkrbdxM6OlemB+x19f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943350; c=relaxed/simple;
	bh=ds3Ce7Oe3L8UU+n+eYT7vTri75RQ9yXKIfx+enHu90Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qXEMLp3nIEVbYAc13Zq3vXRKtUGyN5r+LAR0hyEzb1FQv1foqcCj2XDU3/VT0aL71NoMoKyIIkNM7qsne/e6j462CjGzjE43jiSFsWhWC+D9p3+ogK80cFt6TeSTwS1DLcFYG9h2RhncYAftOOoMonBMc/YsmHU8BkxJRKJNkXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZ/usPgC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZ/usPgC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E9EC2BCB8;
	Tue,  5 May 2026 01:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943350;
	bh=ds3Ce7Oe3L8UU+n+eYT7vTri75RQ9yXKIfx+enHu90Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eZ/usPgCIhYMOmJFAeWOm91+ZHm3IekkhGvgP9I3XR81x0tcfyyKLSZYvTd8C6xZ4
	 14XLuOqsnR2RtJopbRKrFEooaFZrtmPw0l2DLNGO65h58/Uz6+ULljg9u3auwVyeZC
	 6poAKWNfrWTwzpRUV1aV2HHdwfvV9efdxJIQ/M7FyMd9m/65VQxv8+6GSV+gs7t/kG
	 k1eSgn9LN0NKLSrX8AbNYfKppkYsC3FucR7qbgwwmk+oJ+4nIZewnyFbRADPHiMgRt
	 DFis5VVx26M6pCRLqO80LXXZD/3i6smKNPCSMyAcdCfhD6odGpvNJveWsP5alXOLGQ
	 rA6NTOSpKPu0A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Joris Verhaegen <verhaegen@google.com>, 
 Miller Liang <millerliang@google.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260429091614.96667-1-phucduc.bui@gmail.com>
References: <20260429091614.96667-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: uniphier: Use guard() for spin locks
Message-Id: <177790010949.458539.14090210071637590758.b4-ty@b4>
Date: Mon, 04 May 2026 22:08:29 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ds3Ce7Oe3L8UU+n+eYT7vTri75RQ9yXKIfx+enHu90Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UMy4/Q6Dst9XziZJJ9bC2fFI+Tdppt0Jy+u8
 UWwoJYfR0iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDMgAKCRAk1otyXVSH
 0P54CACEJci5K5sFZdJRf2eWX+5x9OAmFtt/36l3P/5N62K/ZKUBsvnLeTSWkLec9XFjOXC/jHc
 jafiPNchHsS3kx97cQFkh90p3eCeiiEErw5y8AnOQviT9i+HXYKOA3I7tIzrxYceA8i4B9Cm3gX
 oNJI6fF/hy5yT756VESpbNVYed1nm4SxPRGPgmdnFPRo0toNFlJfUI5Zbqr9oHBhNdyNKPErL9g
 v21uO8943jemNtlhKAWERd4yS3beTgvMF3Udj1zkXHW+i3WfavGJjqiGm8YqWpsdND0nNN8ADYb
 5m8nzPSL5T7ErXkcGSrhVmQ0jZEG8C5WTJbHsCN9rFBvr9ts
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 29 Apr 2026 16:16:12 +0700, phucduc.bui@gmail.com wrote:
> ASoC: uniphier: Use guard() for spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts spin lock handling in UniPhier AIO drivers
> to use guard() helpers.
> The changes are purely code cleanups with no functional impact.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: uniphier: aio-compress: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/55f8c382858d
[2/2] ASoC: uniphier: aio-dma: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/8f7e9d3c0cca

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

