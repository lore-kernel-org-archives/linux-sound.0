Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBAF221DBD
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 16:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736440808; cv=none; b=svF98b4/liufDoOYpS17OqWVwRw+/oK+84Q73NUzM19gogBji+MUeGw7MVMhvwBaSLIheU2QekR5wPVP9Nc6B9U1MShWlVlWyImK1dpmDKBmUECW/savMUuL49vRqvZkdK6b/+1OoMvNyHEgq6H7V+jvPwMYpcfPVNyt6uyFTYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736440808; c=relaxed/simple;
	bh=MUAuOVP4AStDdSTdzm+8a/gkQjasVep6Q7P5uvwoftw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X311aOMnmnYIUOXGNMTHaEiYkAuE3JCxXvXjhkbBL6vb4SnExgyquRQTxxVOwNrjGJ08S6SQJXjAm7pgvchRizfQM68edN2AdXZHO+QHcToh5s61tVhWaNZWY0ZjIoZuXUpAiiNceKpUJXQW6RbFtZmg3+m4bUUmSeQmBQUUVt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnUKtE0T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnUKtE0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4B4C4CED6;
	Thu,  9 Jan 2025 16:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736440807;
	bh=MUAuOVP4AStDdSTdzm+8a/gkQjasVep6Q7P5uvwoftw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TnUKtE0TsJnuTySI7aJ39aTuf1QMggjsdZ2Gapt7Gty9enj6yc76eaZYm5Xx5Avmk
	 AE9XPnpMOhqbtiCuajf/d/hEkYI0pSYjuet66zTWINGMWE0kHvLC2UCCsTIrtfDYqo
	 hi7JBQ2V/FSlShRxXXSSJdq1gq2V6nlk99sw4YQASSDyqy7COfTZccw2LJNgFE4kT9
	 KUfVdFihcfEX4g9yNiw0ytwTfAx+Evr0efqAA3HC2cSa2itn0TCp6+n0amXWhHkw/J
	 jTXUs+ln1dM0H54pBsQtZ8Jg/DAIq4JYz9TacrKYQXNJ1YIOjvdCA7ARjRS/9eMmHt
	 ZNVwDCWfZLwww==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz, 
 amadeuszx.slawinski@linux.intel.com
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/13] ASoC: Intel: avs: Fixes and cleanups
Message-Id: <173644080664.472379.9376105421350205896.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 16:40:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 09 Jan 2025 13:22:03 +0100, Cezary Rojewski wrote:
> A set of loosely connected changes, fixing few outstanding issues as
> well as improving readability of the existing code.
> 
> The fixes lead the series, first five patches. The goal is to make sure
> proper read() is used when accessing the registers, probe() and remove()
> sequences for HDAudio streaming are synced, minimal AudioDSP firmware
> version points to correct values and recent additions to the topology
> are parsed properly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: Intel: avs: Do not readq() u32 registers
        commit: bca0fa5f6b5e96c03daac1ed62b1e5c5057a2048
[02/13] ASoC: Intel: avs: Fix the minimum firmware version numbers
        commit: dbda5c35b88794f6e5efe1b5b20044b0b3a340d4
[03/13] ASoC: Intel: avs: Fix theoretical infinite loop
        commit: cf4d74256fe103ece7b2647550e6c063048e5682
[04/13] ASoC: Intel: avs: Fix init-config parsing
        commit: e9ca3db9f01a7ce91ceab35cd5fa52f0c5aca174
[05/13] ASoC: Intel: avs: Update hda component teardown sequences
        commit: e3146775f05d18c667a2e26082da3ac105f87d9f
[06/13] ASoC: Intel: avs: Print IPC error messages in lower layer
        commit: 33228036ff655ebed1bc4bde9c9b6329b569b27b
[07/13] ASoC: Intel: avs: Add MODULE_FIRMWARE to inform about FW
        commit: 94aa347d34e079859a5378272c9452c728e4183a
[08/13] ASoC: Intel: avs: Clearly state assumptions of hw_params()
        commit: 0ca529926c5d9d0a3c0b1609fb7034ab870e4770
[09/13] ASoC: Intel: avs: Improve logging of firmware loading
        commit: 480d9bb9cfb7b774b22cf82ff21903eb50d64cb9
[10/13] ASoC: Intel: avs: Update ASRC definition
        commit: aea305d28551bc213aab3a41a0f59412247ae2b4
[11/13] ASoC: Intel: avs: Adjust DSP status register names
        commit: 3eede0fc99c684df6f3f35866761036dabf89d05
[12/13] ASoC: Intel: avs: Adjust IPC traces
        commit: ef724707788325a53ffa4cf58fceb94654e4793a
[13/13] ASoC: Intel: avs: Add missing includes
        commit: 0b12850ddfb0032376ef1be10b5b46be00bba4d4

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

