Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B77283FD9
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146378; cv=none; b=SNT5ySsLt0HXUxEe71bh9IXJHySD6p6/MhslHV7qzXvE6O030vVzviX8a3dER93sC9sri9oXyjIGqGHjp1UpFeCRAa2RlhyaW64baPJcXGg11LbXCgiPyfoOq4o+abJCla2enZRv8kx3BjmgE1OxFeLCLUeLJtyrrAQprqP/gRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146378; c=relaxed/simple;
	bh=cxPyBc6Q1teP6tpsww6F2aWv2ysPDdNzRM7kKZuSp8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IqaOmZx3s4oeJICvSnAzOlkztoQdOS7ntl/iuG79RI0fIrthwnlXK7ATTYoFxomqHkfgkPUgSXfeYLILBLj5ncKlLbcXoWTYMJl7Pw4f03K/bJn+qlsaCHUPxjOx5TMfRB9AW0DGKb7eAf90y572xqeBWT59RL9yILp/tyQFzqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSXwmlJu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSXwmlJu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BBA1F000C4;
	Fri, 16 Oct 2026 10:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792146374;
	bh=TMNw2QnYhNXIk0IH7mEftB0m5M0FJDBZpTZelvks8j0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GSXwmlJubdEdS2pPey0WqS3b6ZnV6VXY+/j4tYnomv4nSf/xtkDmXk9DHCcM/IqGD
	 Ye3ksNk8Witss18MAa4HJWx9k7VxA/QSvPjQNQxTIler/thL4F2Ve5PqSDPWRPHr7r
	 yOtX7AaEoZeJeC5lN7dFWlA3+sSQHo54hSrRAXdQwSMJ29iARhUxlnzLRqIUOSSja7
	 UErQ07Nrkgo2PXGsVUkzm6oeuwiJe8A8upr+/gm85IjCsjSvOQbjvq+ZAQK9uf/vvF
	 DXHZe08Rgx1qy08DSb0UuFQ4fxN0jwGHKKNl/iEi47ZPvbTU5wSivb5ftfEbdmN2Nq
	 6qNOVvYjUmw2A==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 00/13] ASoC: soc-component: move
 snd_soc_component_xxx() to soc-component.c
Message-Id: <179210244504.134795.6815897194553571348.b4-ty@b4>
Date: Thu, 15 Oct 2026 23:14:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3017; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cxPyBc6Q1teP6tpsww6F2aWv2ysPDdNzRM7kKZuSp8A=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIu/j5yfMOZaVe3MM69x6H5JXnKbPYpJ80aVrD6Lkjhl
 jtU0++Y3lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJbO9k+KeQ+C4uUURXWnhn
 SYjMHLMZFu/dX/GvXnr0I2/E+efKnf8YGeZy3Poc/+Km7MTJAWdirRN3rFx3IedadlDkvCW3jy2
 u+sQPAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 14 Oct 2026 02:58:27 +0000, Kuninori Morimoto wrote:
> ASoC: soc-component: move snd_soc_component_xxx() to soc-component.c
> 
> 
> Hi Mark
> 
> I'm now posting ASoC Capsuling patches.
> Current status, and this patch-set postion is below.
> This patch-set moves Component related functions to soc-component.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/13] ASoC: soc-component: tidyup be_hw_params_fixup() define position
        https://git.kernel.org/broonie/sound/c/3901d17c976f
[02/13] ASoC: soc-component: replace bool member to bit field
        https://git.kernel.org/broonie/sound/c/0ce431a9fc69
[03/13] ASoC: soc-component: move snd_soc_add_component_controls()
        https://git.kernel.org/broonie/sound/c/ed2c53c841fe
[04/13] ASoC: soc-component: move snd_soc_component_fixup_controls()
        https://git.kernel.org/broonie/sound/c/ee0daa7a3101
[05/13] ASoC: soc-component: move soc_component_to_node() to soc-component.c
        https://git.kernel.org/broonie/sound/c/81db2fed151e
[06/13] ASoC: soc-component: move snd_soc_is_matching_component() to soc-component.c
        https://git.kernel.org/broonie/sound/c/78a856d727c9
[07/13] ASoC: soc-component: move soc_{probe/remove}_component() to soc-component.c
        https://git.kernel.org/broonie/sound/c/8b1121c5dff0
[08/13] ASoC: soc-component: move snd_soc_component_to_dapm() to soc-component.c
        https://git.kernel.org/broonie/sound/c/5c904834414c
[09/13] ASoC: soc-component: move snd_soc_component_cache_sync() to soc-component.c
        https://git.kernel.org/broonie/sound/c/3f78fa38938a
[10/13] ASoC: soc-component: move snd_soc_component_active() to soc-component.c
        https://git.kernel.org/broonie/sound/c/614749f16e94
[11/13] ASoC: soc-component: move component_list to soc-component.c
        https://git.kernel.org/broonie/sound/c/8c186bc6b77b
[12/13] ASoC: soc-component: move snd_soc_lookup_component() to soc-component.c
        https://git.kernel.org/broonie/sound/c/1fec554d55aa
[13/13] ASoC: soc-component: rename snd_soc_component_async_complete()
        https://git.kernel.org/broonie/sound/c/19224d29ffb4

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

