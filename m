Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341E335AC37
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 23:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477093; cv=none; b=kW4MGI43cjbsSP/q3JAu9KAGdlOM4+fFaCGIpIBIsk3Wb1ps5+PJ+beubtrychTTPa5SZ0F+us10/PAV7/AfEZtTlSGPKX/gsBXc3NHQ0NTh+t7WwrMRIdaFoRzG8gK/3dz4gUs9Sumr5MMLGoM8ZQZZyC0apm7UYK8/+EpELoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477093; c=relaxed/simple;
	bh=k0IW+mY2/JygPRUqV6GSO2JiZOwY2lMdo/oa/h7g8lg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aqcp8ErJcJi35GkZTC+tA0EjqWEPopoDHr/lrX5XKGXQmM/2ffVlYqx9cslrsYEqINbVtZyhd6X7SUeEcJYRVA1ZgwMDLIyNW+bU5/HRiNjJqx4BULdMTGm/kVbwKOIWLw29MaOmoNiuC152/NqGV5J5yEZk8+XDkOduAo03MfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLEeHXaz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLEeHXaz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB4C1F000E9;
	Thu,  3 Sep 2026 23:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788477091;
	bh=bYhowluoyXCjHMsTSKDL9aa8XbCYYgpOErWu4/52cNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dLEeHXazA/nzVTUnqL1s4Nzikgm6GKQbz9B60dr3M85nbIzdtAG5RE+jD15dmYeUu
	 /ufe8TSktBcQBej6n4GNlg8qTJgx6rkMjcm52szHyc+Ym6u2faNnFs8pbkj0HToW3Z
	 /LVGaE8lWAT7YvOHJkcVrr6qRadm16TFvfPdjOO8VUEWWXlZaDwYzzeX0erBJ0uiud
	 DRBGiNNVTDbSuQ+hWQcfRfKsbwyXGriAMFVbhNdyi4MPgNTWJMz6FVW9J07we2c8u/
	 t5npm2de23qJOpIIF3C4z5OGq/55ItracKs6A1/N3AZNiAm4qrqHKpjtfqnI3+QBSz
	 HBQtFCRI6cd7A==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260902081814.1590883-1-cezary.rojewski@intel.com>
References: <20260902081814.1590883-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 00/10] ALSA/ASoC: Intel: avs: HDAudio bus and
 general fixes
Message-Id: <178847243596.628640.9842496803122323788.b4-ty@b4>
Date: Thu, 03 Sep 2026 22:53:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2588; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k0IW+mY2/JygPRUqV6GSO2JiZOwY2lMdo/oa/h7g8lg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmf6gDNpDIO4UZXGHnVrdmzgR1BerYfVALbVrM
 WK3wXCqp36JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapn+oAAKCRAk1otyXVSH
 0NerB/9huUEVyYTzmEBGXKjbKrZwmttAGmkxhYAqiBrp2KxpnEoA8atXX+bA/pnPmcZmbmiMU23
 Ck95Lp5blOk1TLs8ja0A38FQ0W50fCs4T7WUE6R71Jspfkd3uQXdxkkMlVphRHpcenteH4pAexU
 1QjM3T3mJXVraO4znqmaAoJ5znZwGyI1l7XuteU+glDbRhFKb25I54qie7XjVYw1gqLbc+jUYjT
 2YlpkYLuVC/vKZ6FAcXjK+DTQfdtksQdETZ6i1ntjE80BVkEFlT2VxVplQG59jRKFWngOwgQCsL
 9AOpfDwUR/fZZK377hgCTUbXyO6jKLEIm/EWv8UpiMwG41oM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 02 Sep 2026 10:18:04 +0200, Cezary Rojewski wrote:
> ALSA/ASoC: Intel: avs: HDAudio bus and general fixes
> 
> The first half of the patchset concentrates on the driver initialization
> procedure - a number of steps do not clean up after themselves when they
> fail.  This is for both, HDAudio bus (ext) and the DSP part (avs) and
> targets following procedures:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/10] ALSA: hda: ext: Clean up links if their initialization fails
        https://git.kernel.org/broonie/sound/c/35af118326b2
[02/10] ALSA: hda: ext: Clean up streams if their initialization fails
        https://git.kernel.org/broonie/sound/c/48afc07c4f1b
[03/10] ASoC: Intel: avs: Clean up the bus when its initialization fails
        https://git.kernel.org/broonie/sound/c/ce4d7356660a
[04/10] ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
        https://git.kernel.org/broonie/sound/c/559ea14b7ae7
[05/10] ASoC: Intel: avs: Clean up streams if their initialization fails
        https://git.kernel.org/broonie/sound/c/f4ba00bb56a8
[06/10] ASoC: Intel: avs: Do not ignore -ENOENT when loading a topology
        https://git.kernel.org/broonie/sound/c/c6dceca9f78f
[07/10] ASoC: Intel: avs: Cancel d0ix_work asynchrounously during recovery
        https://git.kernel.org/broonie/sound/c/363a6969f7f8
[08/10] ASoC: Intel: avs: Fix unbalanced module reference count
        https://git.kernel.org/broonie/sound/c/d4fa6f94b911
[09/10] ASoC: Intel: avs: Refactor and fix init_config access
        https://git.kernel.org/broonie/sound/c/681e91035dc7
[10/10] ASoC: Intel: avs: hda: Constrain MSBs on startup
        https://git.kernel.org/broonie/sound/c/99f5566a1a88

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

