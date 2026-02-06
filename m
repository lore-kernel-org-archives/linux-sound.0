Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D47EAC7;
	Fri,  6 Feb 2026 00:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770337742; cv=none; b=FMald19mFUlcWnplg1QvpoHkJdhsjXp1jljmePzHnqkDgDd5VNUBNKDTzxzkb19pVAg8huMOL56wc/LszivE3ka21m0BgM2ZHqH0N2iGy4aOsBWUt8H5r23oJtZyLUQgvlmWVKjtfSoWoea1T7bEsUFS/8GoWClMKVTS+u0v5tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770337742; c=relaxed/simple;
	bh=apBmKVMnwTAS3R0uk13bUBoQgoQDSo3+VEuXU97IqMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ltS+EeGSJekhO9SdAsVuHb1UhguG8licAmC+pigjT5noMtW27KRlMoL8ueR/xNRPGOOqaiFicfy7eCCsD7dCZ7XxkjPH+0FZAzxr+5woEX9kB5FBnLWrQLh2zus2mRHFw7+8G4EJBkoB5uyDtUzeOShI4NSfaiuuKm0eJx9vvwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Im5BJplu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Im5BJplu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E86DC4CEF7;
	Fri,  6 Feb 2026 00:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770337741;
	bh=apBmKVMnwTAS3R0uk13bUBoQgoQDSo3+VEuXU97IqMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Im5BJplu4iNPz6yJY488GVY+zYsWlySGUhf5cOH0KXAFVAxxLHpuP7TJZLYjMw4V3
	 Xv2S3qFosVtzrWS13RYWSWuBwQ2WZ1MdTTPYOSOy7XwlTAw+Hqm1YCCl0SQR+/LKgR
	 vTVQ0rXj+em/EPXcsWX8LGvbYTsTO3konHV7kX7b8QQsxlvPOG6AwOIeDLQVf6ghOn
	 Ssp5EWhu1DwFf8H9rYQjJC1MdE/RTlhvEfA00+YAC8S5IyIw6q86ngEFoPfimjd5/3
	 5o0A1RBYA2eHUbBEosoqWQX6lIMXJw0zHU6X+09l0vpURA7oiFBWqmk96ZuCUXvJch
	 Mp2cj9wd40x9g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Zohn Ni <zohn.ni@rock-chips.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
Subject: Re: [PATCH v2 00/10] ASoC: rockchip: spdif: Cleanups and port
 features from Rockchip's BSP kernel
Message-Id: <177033773886.236064.14543193521688333504.b4-ty@kernel.org>
Date: Fri, 06 Feb 2026 00:28:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 03 Feb 2026 17:46:22 +0100, Sebastian Reichel wrote:
> I'm currently working on DisplayPort audio support for the Rockchip
> RK3588/RK3576 SoCs, which preferrably use S/PDIF as DAI source.
> 
> Apparently the upstream Rockchip S/PDIF driver is lacking a couple of
> features right now, which are necessary to get things going (i.e.
> setting the sysclk from the machine driver). I found the missing bits
> in Rockchip's 6.1 BSP kernel and ported them over. This series effectly
> brings the mainline kernel on-par with the BSP driver, but also contains
> a couple of cleanup patches of my own to bring the driver to the modern
> age.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: rockchip: spdif: Use device_get_match_data()
        commit: 27b5096ef0f3a78441128b993f0353a77f2f5f53
[02/10] ASoC: rockchip: spdif: Move DT compatible table
        commit: 45df1f66b99340e1d6e90501f1e938400a3e9768
[03/10] ASoC: rockchip: spdif: Fully convert to device managed resources
        commit: 7e2de68e4dbaee65864b0c5972e1b03037243632
[04/10] ASoC: rockchip: spdif: Use dev_err_probe
        commit: 730b0af2748a74528e0ad25f2bcd3272e96db10a
[05/10] ASoC: rockchip: spdif: Improve sample rate support
        commit: 72bcc223032cb71e640e466eb644537e369959a5
[06/10] ASoC: rockchip: spdif: Swap PCM and DAI component registration order
        commit: 7bdde9a2fd6577e18cd99e4f0e71e466ba626e77
[07/10] ASoC: rockchip: spdif: Add support for set mclk rate
        commit: 298082783a0d6d07109f8ce09ab410a1de12876d
[08/10] ASoC: rockchip: spdif: Add support for format S32_LE
        commit: c43ec509019842c0b836e858dc486c216b51b087
[09/10] ASoC: rockchip: spdif: Fill IEC958 CS info per params
        commit: 07a791020be9b190d4a57b5ee823ede1e98df493
[10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
        commit: d94ea902462ac39846d878aa67b78408727e0674

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

