Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA5332694F;
	Tue,  6 Jan 2026 12:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702072; cv=none; b=DyUYvcrgal3UtZf5slmLSv2VpymqZhrreOFCyW5r8COp18BYVhLSxWeFvFVXQ3rqSkXM0zQlWd0oCBkJ0jf5TtUyOqOybbnh6o+OmVxXI/YmK6HQf3z3RUAB8i0JzfVTg+ETnDXDy9ajQHsL7S3wx2Qtsmx+FvmToizNpRaIRaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702072; c=relaxed/simple;
	bh=iLdxEVrw/3cB1RuhjQb435jyFp04ZeGH/9nfJsTpA2A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Bj1AZq5UrUhQ7A/rm2bsgZ12rofCoziVVVn96EpgNffWT9q2fCTAKLYJsJvFUj+CxXgmks8cRSsbv4E251nrWoRpL28+1qs8T7Vd482rEipyoEGA+3ENKKkbCyZ09G5GiSTBS5D6hSuHhclyTXu3MG/34OnZFhk+LbiB7RNorx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHsyzk2E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHsyzk2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABA8C116C6;
	Tue,  6 Jan 2026 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702071;
	bh=iLdxEVrw/3cB1RuhjQb435jyFp04ZeGH/9nfJsTpA2A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EHsyzk2EdTHiQmRXI//6UgO06Z7FndAnQHo/6g6AqIJG5uFu2GX7OthAo5nIHOg5r
	 Wx5Nz7kA8piWoF/les808nZ243nHEaVwJCTvN7uPA/TImRau0TeRgXdNCJZ6OpAVbT
	 /NPAAbtXeaz9FKQo/qnrNJTA1vZgf+PBsDNQBteO5QIj3h/gR6ku0Pyq5O3Byz3uiK
	 PwNbU52pd490zOK6Lw0sxTWKvrz+g9X2pF8nq2sKPX8Oc+h832SOVR2tgpJMsFYXA6
	 Z1AP5c84UeR84zBS74FtgkmeujJx1xXQ7ovGZjFhqMFwKN9/mZwAOnMtoQcJBhI44i
	 ANBVihUJXbRsA==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Deep Harsora <Deep_Harsora@dell.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260102152132.3053106-1-mstrozek@opensource.cirrus.com>
References: <20260102152132.3053106-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add new quirks for PTL on Dell
 with CS42L43
Message-Id: <176770207043.32636.2734929974846348501.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 12:21:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 02 Jan 2026 15:21:24 +0000, Maciej Strozek wrote:
> Add missing quirks for some new Dell laptops using cs42l43's speaker
> outputs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Add new quirks for PTL on Dell with CS42L43
      commit: 12cacdfb023d1b2f6c4e5af471f2d5b6f0cbf909

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

