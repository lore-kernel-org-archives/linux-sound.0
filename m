Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA78233158
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616385; cv=none; b=mkGt4tPWwiHY/OUoM6VGW0dZKynV2NsuM8IzczeWGorED7Hdv37P2bt9+h/ert9q/4sn9cUDhUFzLIm02uywGJicQ+jEgXZ1wxFySoADF9Fh/mvf7w+1bfB9jxeNUqKpgfXvNFZhrkjZgTp23xVbMMEQIsZqQnFMCl0IbISSNDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616385; c=relaxed/simple;
	bh=KOWgKU4XR55N4H+w44ttGZljkI73zSUfd9PSeAYNLVs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BRUSA/uCVUC7i7wbjTzVOMAC2hbE9yQ/UnAsaoIYtsX0XD5Ol7Sn/fQA+AJGOvCR+LOgJ/Oostm9Vrld9jNZArRtt429bX6fNgqPc16HHJ3ySkIem1sIFrmYHDPPNqI1BPllKe7DhcMpc8Vp195vQ6AQ1ypbBsbMfkDVWaffsQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKoIdHW3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKoIdHW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87CAC4CEE7;
	Wed,  7 May 2025 11:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746616384;
	bh=KOWgKU4XR55N4H+w44ttGZljkI73zSUfd9PSeAYNLVs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nKoIdHW32GEfYXfhfQ5UnHN8yEuY42jykjHWNUyBlXCmdeHwKNyh//fwOCAgmym68
	 KLh+/F0yNP/8H2Rha16M008mtn5KQXMPJAVQhOpYOyZef7TvCCdSmJyVezPezK3diV
	 as7B0hGzTD7mCK7cpTLBLBj+P+3eaxL3ex7kA5JcpX3CBfumyPZtb5E3nsZMrOYfEA
	 H8nUVF/PuTc94W/ZZcD3RSMUl3lz/0OnxRG+JVSjdwdHMpmWJevoJ7XEuM7TrVHREW
	 cyUsDtzSXF/3Refrvisk+fNM31bhWRTbZmn9ipWRjftyXe6jzK4b6c7Be6uQC0vZAh
	 pj7Yst60fAP6A==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250506113311.45487-1-yung-chuan.liao@linux.intel.com>
References: <20250506113311.45487-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: add disable_function_topology flag and
 module parameter
Message-Id: <174661638348.4174662.8833728985085299940.b4-ty@kernel.org>
Date: Wed, 07 May 2025 20:13:03 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 06 May 2025 19:33:07 +0800, Bard Liao wrote:
> SOF will load the function topologies by default. However, user may want
> to use the monolithic topology. Add a flag amd a module parameter to
> allow user specify the topology or not using function topologies.
> 
> Bard Liao (3):
>   ASoC: SOF: add disable_function_topology flag
>   ASoC: SOF: set disable_function_topology if override_tplg_filename is
>     set
>   ASoC: SOF: add disable_function_topology module parameter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: add disable_function_topology flag
      commit: e48a906af6b3cfd09c50af14a8ea7a5cf45b39ab
[2/3] ASoC: SOF: set disable_function_topology if override_tplg_filename is set
      commit: 92b5f92d1128e108c583d63fab114601ce04eced
[3/3] ASoC: SOF: add disable_function_topology module parameter
      commit: 7b400c9ab879a86aa4b9bf5d9fdd3df558eed9b5

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

