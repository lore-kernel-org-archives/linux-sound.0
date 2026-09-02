Received: from mail-m15572.qiye.163.com (mail-m15572.qiye.163.com [101.71.155.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B475B25F981
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 01:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311160; cv=none; b=lX9l3uzhho17Wfx8Q32K4pJej3uTNL02gqNB0kl8m1Bk3Gj+MwhUu2avfwYHv5euXpypdniqhWLWC/IXuYpUAyR9CdRi3p1OpRdVa+eOZc+cA6/uQAB/boXa6dQqvRvF09eG3JhnguXNu3ufcfV7lrgcoaaAosSwkBi0Gs4ItaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311160; c=relaxed/simple;
	bh=2ffxTm5WCdWFlBfgXOxdvdwtU+uUF0o1jxbrVKtaI8k=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=FFSbVsrNY07pX85UAy7bhObCzkzlE7lP/NEEjAM5ZmZ6632rUbn3mUxfXc6TtJurnPaB37+HDo5u/aIsc4jlr809g+Pdd/g+yprI/dL8qRSMTlzmowy+DlDb1uGYWwVh9kghk8XtgzFvOFAkgvL0rcgehTFMkm/5DvhEc4CAWuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=HyLiV0r9; arc=none smtp.client-ip=101.71.155.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="HyLiV0r9"
Received: from Wangqianghua (unknown [112.193.82.77])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c2c03e89;
	Wed, 2 Sep 2026 09:00:37 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: "'Mark Brown'" <broonie@kernel.org>,
	<linux-sound@vger.kernel.org>
Cc: "'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.dev>,
	"'Bard Liao'" <yung-chuan.liao@linux.intel.com>,
	"'Liam Girdwood'" <liam.r.girdwood@linux.intel.com>,
	"'Peter Ujfalusi'" <peter.ujfalusi@linux.intel.com>,
	"'Kai Vehmanen'" <kai.vehmanen@linux.intel.com>,
	"'Cezary Rojewski'" <cezary.rojewski@intel.com>,
	"'Charles Keepax'" <ckeepax@opensource.cirrus.com>,
	"'bo liu'" <bo.liu@senarytech.com>
References: <cover.1788230065.git.qianghua.wang@senarytech.com> <178826652682.33904.8839852166083364252.b4-ty@b4>
In-Reply-To: <178826652682.33904.8839852166083364252.b4-ty@b4>
Subject: reply: [PATCH v5 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Date: Wed, 2 Sep 2026 09:00:37 +0800
Message-ID: <003501dd3a76$7784d990$668e8cb0$@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad06dnPBcyFnxuYvRcmU6HtjMAcNWw==
Content-Language: zh-cn
X-HM-Tid: 0aa05fa1d7e709d8kunm5de066e4564045
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDThlPVksaTRkYHx5OGR0YSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVSkJIVUNJVUxMWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09LVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=HyLiV0r9SJhCzys4RZ01Hrb7pdU3m7OkgXCAUu+kYST4ZaQzGHMyvRNUAs3lA499cqHo27vbzhD3tpaabuuMGrg+JLOHjKr4r1OmG/gq28ylPM8zdPNb8o5Mb06IMuHleVaIolOihCgzNJAGSIR4zmgZJO/fDHSSqy3oaSW8beA=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=pavu/0fxZ4j76wKvFfLchHvHnZrElcs0erNNXQ0x4nE=;
	h=date:mime-version:subject:message-id:from;

Thanks Mark!

I'll keep an eye on the list for any test feedback and send
follow-up patches if needed.

Best regards,
Qianghua

----- Original email -----
From: Mark Brown broonie@kernel.org
Sent: Monday, September 1, 2026 8:42 PM
To: linux-sound@vger.kernel.org; Qianghua Wang =
qianghua.wang@senarytech.com
Cc: Pierre-Louis Bossart pierre-louis.bossart@linux.dev; Bard Liao =
yung-chuan.liao@linux.intel.com; Liam Girdwood =
liam.r.girdwood@linux.intel.com; Peter Ujfalusi =
peter.ujfalusi@linux.intel.com; Kai Vehmanen =
kai.vehmanen@linux.intel.com; Cezary Rojewski cezary.rojewski@intel.com; =
Charles Keepax ckeepax@opensource.cirrus.com; bo liu =
bo.liu@senarytech.com
Subject: Re: [PATCH v5 0/3] ASoC: add Senary SN624x SoundWire SDCA =
support

On Tue, 01 Sep 2026 11:00:46 +0800, Qianghua Wang wrote:
> ASoC: add Senary SN624x SoundWire SDCA support
>=20
> This series adds SoundWire SDCA support for Senary SN624x=20
> multi-function codecs (jack, speaker amp, DMIC) on Intel ARL, LNL,=20
> MTL, and PTL.
>=20
> Based on current sound.git tip (249bfb5d8897 =E2=80=94 Merge branch =
'for-next').
>=20
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git =
for-7.4

Thanks!

[1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
      https://git.kernel.org/broonie/sound/c/12d9c9f8679c
[2/3] ASoC: sdw_utils: add Senary SN624x helpers and codec_info
      https://git.kernel.org/broonie/sound/c/77272ecd96d7
[3/3] ASoC: Intel: soc-acpi: add SN624x entries for ARL/LNL/MTL/PTL
      https://git.kernel.org/broonie/sound/c/32f9c551a91a

All being well this means that it will be integrated into the linux-next =
tree (usually sometime in the next 24 hours) and sent to Linus during =
the next merge window (or sooner if it is a bug fix), however if =
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing =
and review of the tree, please engage with people reporting problems and =
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they =
should be sent as incremental updates against current git, existing =
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying =
to this mail.

Thanks,
Mark


