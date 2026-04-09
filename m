Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE7C39526D;
	Thu,  9 Apr 2026 22:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775774150; cv=none; b=s/aKdapqUtiShiabSV70W+0PPj/BGHzPVpr9+ZnRsYXjWEY0iAbw24vkfuNQAObr0tA5lYOwLsmWCz51Xt71KKc9qmX06rp3OJpOprZAxaa77k/7aadZIUXJIg6mh9O5kpFZGAT7fiYNVcy6gUCszYTTNvriZ68At4j0LwuckQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775774150; c=relaxed/simple;
	bh=fZpeJZdokXjWQ9DP9yqhfdU++LHb1Vn5p0/VmEMkfYs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EV0EOualNrNxdYEtsGUJHKoL4gUKTaXT1adOeqB067Ktl2ncfDN+gvMWf+LcEok43x88amr7bmNJ5J1+4NPMgS077HDKSBRHAir5FV2xDeqklvCCMDcHBKNDbS+EE7ieOLsg5bPw0psdJUkq0wT02mlEh5b6yOR4v4+JtYP6b3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONULGz21; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONULGz21"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09737C4CEF7;
	Thu,  9 Apr 2026 22:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775774149;
	bh=fZpeJZdokXjWQ9DP9yqhfdU++LHb1Vn5p0/VmEMkfYs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ONULGz21jtASv3U/WScjKjUOb8Z2SYKE+HOmchKLtwTK75WYrHEd3ll9r3gaMiyRz
	 wbHZDU+HEM0ri4DW6uONzB/W8haD3pnWbo1Qpy3TAVE+ENnmSRzGHIwlu10WF1H4+h
	 xroqwMdldTtGRYxqMX1MRNvVU9deLZPRIHm8z5b4zUu+D/NuTauHpTXzAgBf6TPqCn
	 0RnM9VvfjZTDnsx560xeSWtE+MN5lkp+dc6ZaqEsGziBli4tqJ9OYbjd8cul3Tq8YA
	 rETbOr10jOBW7fBxxrVZr/elL7lFqmSsyky3T/sZN0Xuc3X3c1hljgpOqUkPu+AanF
	 x6cGissHn77hQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Qinghua Zhao <zqh1630@126.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <20260409135213.16558-1-zqh1630@126.com>
References: <20260409135213.16558-1-zqh1630@126.com>
Subject: Re: [PATCH] sound/soc/tegra: Fix spelling error 'recieved' ->
 'received'
Message-Id: <177576006954.993260.16810896674288832411.b4-ty@b4>
Date: Thu, 09 Apr 2026 19:41:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fZpeJZdokXjWQ9DP9yqhfdU++LHb1Vn5p0/VmEMkfYs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp2CnC+OTocyLj3XFF5nLL7pUPyk01pujRFdLjo
 Ibfusig4v6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadgpwgAKCRAk1otyXVSH
 0FNfB/wJmxgqvIayNMIgoqJTJbpd7zrtkbHqfYnbEFHGMRsQfDV2iWxD8x9exjN1/jitybXncsR
 NWRAVKwYE2w9oFL78eCsz5rOSfUFnMvWvBt3YjCU7882k6CxTr6QpiA4RReHP00eQM/63h+iFuy
 18ejjBB/U3bNavgT4BX1oYKXNQ7PCxbBpmldYlCs8pc44Fm3JnycjK5ygemc/kcrkgIDVLwgcwE
 sfLiaV1VA6gqHFQDkT/hVJ51KwLOUMELKN7q3bcIFgQ3i6UFSbM4h21asfBAPln+8Kj3ullNuMP
 4nKWgdu66S5J0wWXKfZyp/tCM9x/hHaxKjZurt5LQIFziHsr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 09 Apr 2026 21:52:13 +0800, Qinghua Zhao wrote:
> sound/soc/tegra: Fix spelling error 'recieved' -> 'received'

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] sound/soc/tegra: Fix spelling error 'recieved' -> 'received'
      https://git.kernel.org/broonie/sound/c/833011cbe663

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

