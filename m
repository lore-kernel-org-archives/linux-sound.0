Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8683D25D551
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102559; cv=none; b=YjjFZwpDMW35a+fi/MhuRdTFzQiTavWtzYYwM+Vxhtx9TU5ADMQACQNwoWvW7Qerl51M/Z41JiRHXO95fAOMW3YLLmkXCNQBrM/nRlQZtEtcp/jjgk1X9dV3YdjOpphoG8XzwNI5d6uVnvT5swTVsqwEJbuxB19OG2AufhnrY40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102559; c=relaxed/simple;
	bh=C7IGxxqv8OX/ZPgbtVx69nTTfoO+g6pulJM/ByAPGdk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HAUBAmwZgzwICja83WnkEw2/GqOT2HjInTqB0PK5zzIQaUqqJC4HZjrX9yIvy9QoJuZFXvIWf3qLG89JNI1vHysAo7rmHzMd7Z+0jL0fl3iGtmLt9zBYywg5nNEuqSmvQ2RkOffCEhOM+9wbxozgnjdwlOm3STT3Ksek16vY2C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKMUgxVL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKMUgxVL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF13C4CEE7;
	Tue,  4 Mar 2025 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741102559;
	bh=C7IGxxqv8OX/ZPgbtVx69nTTfoO+g6pulJM/ByAPGdk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IKMUgxVLl2/ZLfKkzosgrP5ywfvBnFzTbqOAapP5Dzhqlg73QZylqH/ynKLhkGdGj
	 9JkhHriMwas0vnHHJlKrVPPb2ejDhJn9WwkEc8MRD043sSmsIItKbax0HaXJrhvSag
	 hMSZxM2oKUynjNTPb+b8FcWPZvQurIBD8blDTRJBEa+LHc0Dtb+5npGPkCqy3ls08w
	 OFTWf+5xHz+4eVLnMIFylmSkYhXTZM0cM5Q3cmbXVbo1Q6SqoOYFDxz3+Vvp+KYi48
	 zn0420iefGPg8ETjARYH5u+oZ79I12ZFogXlCbdJrUkx98pumQ/RI71vDZ9SLYOtrE
	 a/7yb6n76hO7A==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 andriy.shevchenko@linux.intel.com, flove@realtek.com, 
 oder_chiou@realtek.com, shumingf@realtek.com, linux-sound@vger.kernel.org
In-Reply-To: <20250226112612.166989-1-cezary.rojewski@intel.com>
References: <20250226112612.166989-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/22] ASoC: codecs: Update device_id tables for
 Realtek drivers
Message-Id: <174110255706.87345.1828141625088495648.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 15:35:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 26 Feb 2025 12:25:50 +0100, Cezary Rojewski wrote:
> The series aims to streamline the formatting for ACPI IDs so that a
> single pattern can be used to identify the device.
> 
> Work implicitly suggested by Andy Shevchenko - reading and learning from
> number of his reviews on the Linux mailing lists.
> 
> Several formats do exists, however, after technical discussion PCI-based
> format has been selected as the recommended one. For Realtek devices, it
> is going to be 10ECxxxx where 10EC unambiguously identifies Realtek
> company whereas the following 4 hexes specify the PART_ID i.e.: the
> device.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/22] ASoC: codecs: rt1011: Fix definition of device_id tables
        commit: b686559772d1baa28e2ad346d5a9932863d9523c
[02/22] ASoC: codecs: rt1015: Fix definition of device_id tables
        commit: a859d2383f66002a442218bf5083faaa674bc4e4
[03/22] ASoC: codecs: rt1016: Fix definition of device_id tables
        commit: e7795c17b82684afb9390b8788f781c07be1a368
[04/22] ASoC: codecs: rt1019: Fix definition of device_id tables
        commit: 689e4d5fd8a76c676f04bc8916d78ca5db3130db
[05/22] ASoC: codecs: rt1305: Fix definition of device_id tables
        commit: 0440f938aacf54a3e7dc67cd898f76bbd371da49
[06/22] ASoC: codecs: rt1308: Fix definition of device_id tables
        commit: 30e03871146129acb75adac48405c203f5bdb3c2
[07/22] ASoC: codecs: rt1318: Fix definition of device_id tables
        commit: acac29fa62a8b738569a99da2f6458bc21aa55ae
[08/22] ASoC: codecs: rt274: Fix definition of device_id tables
        commit: 5a84cbb03094fd903ed79ca6c06e558821a69be4
[09/22] ASoC: codecs: rt5514: Fix definition of device_id tables
        commit: 1c418cf146380031b13b6fde02f944830e5b9155
[10/22] ASoC: codecs: rt5640: Fix definition of device_id tables
        commit: dfc6b8ccb1bb8d591cd26571e554208fc4af7d0c
[11/22] ASoC: codecs: rt5645: Fix definition of device_id tables
        commit: d3a37a664ebe57471bd7ab2486dd3072a9c07378
[12/22] ASoC: codecs: rt5651: Fix definition of device_id tables
        commit: 85188e3bd7cb4141181f24a59f9057c38ffa37bf
[13/22] ASoC: codecs: rt5659: Fix definition of device_id tables
        commit: 24a4302478118ff1caf39fb48809c0127f608664
[14/22] ASoC: codecs: rt5660: Fix definition of device_id tables
        commit: 4d34ea6709894243d55ae6a6b63834851f9c5d6f
[15/22] ASoC: codecs: rt5663: Fix definition of device_id tables
        commit: e9d9a43e3f00b9313013b78d915a1f97dd215bf5
[16/22] ASoC: codecs: rt5665: Fix definition of device_id tables
        commit: b89d9d26fb6cbc9f6e0aae72a2a76b5d8e5f1023
[17/22] ASoC: codecs: rt5668: Fix definition of device_id tables
        commit: a06ef7754b8e6f45d78c0015c3edb2117945adfb
[18/22] ASoC: codecs: rt5670: Fix definition of device_id tables
        commit: 9aa85f433bb1f51b599278b29b3d6224ca5147cf
[19/22] ASoC: codecs: rt5682: Fix definition of device_id tables
        commit: 6de7c4def7a6bf967d6603f7e1abda5231ccc312
[20/22] ASoC: codecs: rt286: Update definition of device_id tables
        commit: 7f15da9a55d3ba9f8c3af545246a4588102a38db
[21/22] ASoC: codecs: rt298: Update definition of device_id tables
        commit: ed4bef1d52ce0d6c96a86b6a470d6777034c564c
[22/22] ASoC: codecs: rt5677: Update definition of device_id tables
        commit: 739db0529c2a3ac5a0dc3e5a76a46ce80735dcfa

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

