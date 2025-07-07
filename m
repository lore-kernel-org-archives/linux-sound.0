Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4332123D282
	for <linux-sound@vger.kernel.org>; Mon,  7 Jul 2025 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751926113; cv=none; b=r4Wj9K572L97//eBU6evB4pgAUQ68j60fw6uIWznDbHKf0kGXmLNISwMIvB/gdR2QgMr+KBPN55VLfLjQV4H2S6jWyZtVQFfiYKRhfLZFHDbTaRePh9tUBkZ71ZEGjK/dNF9KBASZvppYfmw8da2v1+Le+pjADMLPeB2XX18uUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751926113; c=relaxed/simple;
	bh=5GMucsTHhiHN7CPe8GeQujx+8ZarZaieU+6wbFvGPU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z8AJ+lBmEaeZ6r+LJGmDkAyLHudTGhTE5j+UY6iNb4LQZxInEQ6QJ2UL5UpnKmIfIWYTKsXwF3zZX0A9mfqpqNqP2KTLqvF1fwoq0wexYeA+usuROGh+k218LfU//7mkBSVKjm95DrL6S5XFO+hrFtsufx0F1B8pqydr7Pq+Pc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUPaV9/d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUPaV9/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E225C4CEE3;
	Mon,  7 Jul 2025 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751926111;
	bh=5GMucsTHhiHN7CPe8GeQujx+8ZarZaieU+6wbFvGPU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mUPaV9/dqz+xMk3iNyuEC9a7YQdsT4F1xpk4z/X5eu35MHGH9GQRTJpXQomqG3jIJ
	 yt06xsH0BMRfzLuCnbFKW879yffycEPjqBtgu6NlEMqlqdY1HDbUtqIk03Rsv+NbCz
	 Qw+AXPJDJzRbNL1RL7GTYPUTZivNQzCWuDzTznkzf/vNFaBBlOyZQc18geezK5z9cB
	 WIhnnIQaLSvWcPc4Ff/UiXA1qIiyVFjF2dkfyrj3lFWjbsNLjnRQgdXoN1JjGOQHLs
	 ZdPGF3YLhjj5U9uEWxEqmh0u6KkFZRorZheeFQqgcSNi96ZwIru/77s9PQnCt3MKU7
	 Qct6jSRyQsACw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 00/11] ASoC: soc-dapm: cleanups
Message-Id: <175192611111.127974.13793228646182356992.b4-ty@kernel.org>
Date: Mon, 07 Jul 2025 23:08:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 01 Jul 2025 00:10:02 +0000, Kuninori Morimoto wrote:
> These are v2 of cleanup patches for soc-dapm.
> This is prepare to hiding snd_soc_dapm_context inside soc-dapm.c
> 
> v1 -> v2
> 	- remove EXPORT_SYMBOL_GPL() from snd_soc_dapm_free() only [02/11]
> 	- remove weak [04/11]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: soc-dapm: remove unnecessary definition
        commit: e199e85556bd83806baf4689cbecfa31c41a6cfa
[02/11] ASoC: soc-dapm: remove EXPORT_SYMBOL_GPL() for snd_soc_dapm_free()
        commit: 58baaea26659ab24ba396afd592c2423aefc067c
[03/11] ASoC: soc-dapm: remove snd_soc_dapm_nc_pin[_unlocked]()
        commit: 2ec1067d1e5acb9e7aeb1fe6d5178424fc3107ab
[04/11] ASoC: soc-dapm: remove snd_soc_dapm_weak_routes()
        commit: d6f240031afbd780431ef289357373e2bbf2f793
[05/11] ASoC: soc-dapm: reordering function definitions
        commit: 0d516af948536c3fdefadd465a516e1f1317f696
[06/11] ASoC: soc-dapm: reordering header definitions
        commit: f02ccc8c0b99382807bac0065918a90ba974e9ab
[07/11] ASoC: soc-dapm: use component instead of cmpnt
        commit: fbd09117a38e5ff477040629f7b5fc442883746a
[08/11] ASoC: soc-dapm: use common name for dapm
        commit: 1ac23653840f784d0f5846ac253d04ecef9a26f6
[09/11] ASoC: soc-dapm: add prefix on dapm_mark_endpoints_dirty()
        commit: 805c019fbb94795e391974f673c5b3e57b825f6d
[10/11] ASoC: soc-dapm: add prefix on dapm_xxx_event()
        commit: 9d33f9ca4404e532453a0305ce11bf76a9945c5d
[11/11] ASoC: soc-dapm: add prefix on soc_dapm_dev_attrs
        commit: 08dc0f5cc26a203e8008c38d9b436c079e7dbb45

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

