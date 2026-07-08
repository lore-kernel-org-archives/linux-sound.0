Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264A23F9F2B;
	Thu,  9 Jul 2026 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599560; cv=none; b=Dwovs/ZS/LR2UenAaPHWBBWL0uh8kLM+0OQ5GumqCQCoaP457RHVjRtaJsAGdiicYJDuAjAXYxpOIrvx6lzLoMSCDYeSH/MKBQEzjA0NcUV2KeXXYmTOW4Ka5Khe3PdzCg+P+6br5/oEJR4KoyYr87O4Vrt8Dn+TDMMzIwmFB6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599560; c=relaxed/simple;
	bh=vlPUTcGzxlMUD3k3AyOxrB6G7qRoJw4Q46sKR6E7FoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S52lugF1EVjhQFMwsT7VXXlODP0rgndC5SWKgxE0CpuU8PBK+v67d3Xhc2kqPHtrSGB7EP7g6TkCkijAzAaY41oNeSRpwl0V6U5a9B9ZEeOX43z13r+VWV6CYuFk7N5j3eAOwkvqNzSy6xoVPBttXgtTZE6n+JqOJ7b1EV9nsU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2HLKx2T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2HLKx2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFD41F00A3A;
	Thu,  9 Jul 2026 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599558;
	bh=pTKbBgXBY4UPnNa8ng5W41cURWrnrZC5zN/zl9qP1WE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n2HLKx2TbcoooEsQJgjn9821DeUjv/CzgEOFwNPMG0dRC+H+weKeEsS8PWTZjpYfl
	 YKgrbOEL2RTdDOJt26wqiparSt+ZftLsZGubD0j/BspyiFwP97z68ywJ8P1VUcdUbe
	 Tk68jnZRhsA1gbIUHZOLFvhtHAqnKFS8/kJ+bTyt3cT2m7NhVQjAxDwNgQfktM2YBV
	 ZuI4ltt290iqVXotBVOCCoI6rw1KUmazaQbtaLCD8N3AQk3GvMpN+1ZMa4p3B+9ISG
	 4fgjcQNx1+YNAjhyFPaI+yZFNCYuhfRoAzanl29mhEuqU7A0tIauwHXLIH0Rzuw/AZ
	 A3IZN/yroHNlw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 mario.limonciello@amd.com, syed.sabakareem@amd.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260707060130.2514138-1-Vijendar.Mukunda@amd.com>
References: <20260707060130.2514138-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/3] ASoC: amd: ps: bug fixes for ACP PCI driver
Message-Id: <178355451432.26140.15336452910757545939.b4-ty@b4>
Date: Thu, 09 Jul 2026 00:48:34 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1787; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vlPUTcGzxlMUD3k3AyOxrB6G7qRoJw4Q46sKR6E7FoA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT5HDmOmecBbDyHD8LMZObGd4m3Cw0Ycn2qCmA
 RVkE3kFWpaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak+RwwAKCRAk1otyXVSH
 0DIrCACCGW7eJf3VI2/bFc1ALJuPUqlpA9oWQ9G2faWm0idAqYmBB0kahsE/Ko7lAiWzx4g6Kwi
 T2Kp5TVYflFtqmb7JB7Mu3hGCWfTK2j/D4tqVMpevei0QX+iQHRGyQTH+LHihqIGDeQWxbGXBlv
 F6vqx9ALL6y7YLohbhu1WFaFCuQm9nnNAwDvspZcQcaqyCN3QfCpN/ds3ljjluwGZuXMYyezj+w
 uo6SnunpCp5PwbrsTFd5Td7iFm9SPo06Wq9x+FlwWQKfwXjEaTrc6WRUkjiXrjM0SjKMRH74M4o
 YVg2TwK8q3kWLpJZEjcJLxHuAfsJf/2HeDNL+oTh+mI1j35M
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 07 Jul 2026 11:29:35 +0530, Vijendar Mukunda wrote:
> ASoC: amd: ps: bug fixes for ACP PCI driver
> 
> This series contains three bug fixes for the AMD common ACP PCI driver
> (pci-ps.c) covering ACP6.3, ACP7.0, ACP7.1 and ACP7.2 platforms.
> 
> Vijendar Mukunda (3):
>   ASoC: amd: ps: disable MSI on resume in ACP PCI driver
>   ASoC: amd: ps: fix wrong ACP version string in pci_request_regions()
>   ASoC: amd: ps: replace bitwise OR with logical OR in IRQ return check
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: amd: ps: disable MSI on resume in ACP PCI driver
      https://git.kernel.org/broonie/sound/c/5893013efabb
[2/3] ASoC: amd: ps: fix wrong ACP version string in pci_request_regions()
      https://git.kernel.org/broonie/sound/c/f7697ecf6eab
[3/3] ASoC: amd: ps: replace bitwise OR with logical OR in IRQ return check
      https://git.kernel.org/broonie/sound/c/dec5aaa27603

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

