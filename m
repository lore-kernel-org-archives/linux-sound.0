Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AB73B0AFB
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 16:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580263; cv=none; b=WydbOJvbSUZmPpQe6dlkMYsgdzA3YZHOK+TWm729OMA54WVhNx9Pug1OuSlnQlCtI4YbaICI3b+jU5QLHm3ARqzmoKImHfKDVeK5cmkTgIBtEvK2zS6VDOSv4GJbiJZJcxgHPsyC2EpK23ebL9+lN/GllOwv2cnZIuqgt2OVcpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580263; c=relaxed/simple;
	bh=smiULhZqR1kz920O6ixLyqey23aEs5vury7SV6ven5E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dh+4AigxI8P/Aqd8yIB1rXwPL6FB5H+bqg+cKJ7Wdx9XBl8IAz1QRxm0j/QRiAIKsUhjk6dlru3A6iHDFKJfDb9QWIWCybU44lW/3FTKsmdbZTrv37mfk4vj8dUZNHj0SVY4AkxJbQiMWvBjxx8tCsAquVNGNwuBti/5IhgFr4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4M3j3JA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4M3j3JA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298B5C116C6;
	Tue,  7 Apr 2026 16:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580263;
	bh=smiULhZqR1kz920O6ixLyqey23aEs5vury7SV6ven5E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u4M3j3JAOAS8NypuB1T1muJ1WeMnb8c7pA6RWn/3hf8C131ILsWcZLZVO7QyWm/s9
	 qfRoWV0RbghtA1QzCgzxpO+625uaPQX4KIkLdKzblyED5Ynk08p3RFHcmkN3kHsxu+
	 s2ALBKwev2K30vrdRSPuB5IGQXS1oJlT5wnK6roz5MRnCU1eAN825wGQcejhmnnRtU
	 aE/LreKxRV9kJW42x64i5b8QnQAWyv5nUWxkVtYPFZ58Ue19Hy0q+7a0Fk/S0rAkr7
	 AEfTc1mU/6V8s18yyBQMUcwTHGfxDBTN/JXDRN8Vwmtd21TaM27nzo0W0jVcq8DBQo
	 YaY8IvPNvuwkw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260407085459.400628-1-cezary.rojewski@intel.com>
References: <20260407085459.400628-1-cezary.rojewski@intel.com>
Subject: Re: (subset) [PATCH 1/2] ASoC: Intel: avs: Fix memory leak in
 avs_register_i2s_test_boards()
Message-Id: <177556325457.37897.12515945357438212446.b4-ty@b4>
Date: Tue, 07 Apr 2026 13:00:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7a3e7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=smiULhZqR1kz920O6ixLyqey23aEs5vury7SV6ven5E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1TRlW1ifDs2ZfsE8gMKNvotloCBB8+6TQVm6f
 pGETASfWs+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadU0ZQAKCRAk1otyXVSH
 0HBnB/925k6V4gDJxXUvNhk4XOZ6ScUS8T3UshPKp61dajIxRvo6xLDb0wzR5Vao9sqOGSXLWJI
 aGa61bNgz2TBU8gnQ/seWPvA+6KLJNPF/NMkK+IPueF5jb+53VIdRS5yRDSAtoGRUva+AK+jbbD
 8mmNBft6hErQ5/TjM2ByxWc8pxzqM8BTvTo4EuOzIShAg8EFcoQhV8wmf2YP61u0SursmTUxO8V
 EHDBLx1N6pllXQkbT5YxU/2qZWm4gNTXeX1LbeaItfiUUsqMX30XiDSMurnfwcyEkLaGUpE7CRu
 0/DtGy/wNHPlN4T3V8k5nxoe8Yp4GXb9e0rqte38Tzl4heaK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 07 Apr 2026 10:54:58 +0200, Cezary Rojewski wrote:
> ASoC: Intel: avs: Fix memory leak in avs_register_i2s_test_boards()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/2] ASoC: Intel: avs: Fix memory leak in avs_register_i2s_test_boards()
      https://git.kernel.org/broonie/sound/c/c5408d818316

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

