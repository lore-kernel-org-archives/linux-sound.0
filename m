Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797F637DE91;
	Thu, 26 Mar 2026 16:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542090; cv=none; b=fQMovvNVd0lBenEy97m3sWmS2PLOzhIPhMCy4q33GrOqF10uuyg7YblhaJfqWtV/8CcBobCbDyfBDj20knxG3gB1r0y11cksQufNtI+p9/6E7xi9m0b+SP84nvdqxmU8p5/DGdZuRJ8w7BfZrgCeQeDMVH+tjZAy9ylCAGEXYlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542090; c=relaxed/simple;
	bh=bq9UdSDzBTnUWVtmt2i96QKRv1J8YvjNDcAc4VCAYBg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DX0LJhcf+mUxAu018GWzWOPbRGHcKGupQSkDhQHec1EIUdIgjL7Scri57jbcFbsFUmAXMjmsfxXlbFZ7oKH6l4SuceKEdJsuTMnZHvc2T4Hfb8mzfeEMG3qd/0537cQwpVR/CEZ2+LEyfAwAn9Bc7uGrl+aEx5ElNXPFkwNdQyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENcwc7KM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENcwc7KM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B73C116C6;
	Thu, 26 Mar 2026 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774542090;
	bh=bq9UdSDzBTnUWVtmt2i96QKRv1J8YvjNDcAc4VCAYBg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ENcwc7KMks4sMSuKukJRR97bEYH/LmDgDjV785gOsgQCF+SqFGXXdEAEZrv4NnIKS
	 aiXiXB+Yt78sd/6DoiDE0zhJqC3/uRivoE0LgYkUdzX2+r7J66cLHqNQejxZXegI9Z
	 m/Ko7+reDFwXwAmixYCsAT6KNFUXBLr4MiS0+P8mfAC14Z/vL0PhJW60Fy40lxaK/I
	 /rYRX49DBd5PY4321yW7Hpxn2dPbhRUhiVQm3xiLRk+8k1oDKVRozKmSOvIQ+bz6Vb
	 jVPM3Ws8DokMbwrbz8UKcW2+HzkGwvVvY0CO4zu8EVKASuuzjSQ9+UX7FoMsFtckCh
	 DfoWdTwtspkpA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260326100853.1582886-1-rf@opensource.cirrus.com>
References: <20260326100853.1582886-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp_fw_find_test: Fix missing NULL
 terminator on file name list
Message-Id: <177452189760.60124.14984676077707484487.b4-ty@b4>
Date: Thu, 26 Mar 2026 10:44:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bq9UdSDzBTnUWVtmt2i96QKRv1J8YvjNDcAc4VCAYBg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxV0Ijh/h4nHHyf9SGnr7tRJqDf5AyrKN/yzpY
 P/7JwZP5HuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacVdCAAKCRAk1otyXVSH
 0N3CB/9UcOOFkaNdKH/4FMl/TFC0akA1ltXbjtqu1hx+oauPMiDyQxr5L+zVtn6FapUI8nraPgH
 f+EI0NfndSs7Bi3ipt955eqLNDAoLjzb+LpBXsaAjLFKKhdwPYpiEcYImJpBprq3Epv0fBeX4Cn
 Hb3pKOW747uxxl6JCvW7nWfp4ob/F9bas0CHB8YHUVLgpoEKysszuc2/oiNAqaGPrsAY3mFERyW
 tFOBggVqiHY2BTn2x2DXR+kdMD18us9ZUz3A03rcBeoXBWzhF/dxxDu44WIX0z91K9WPo5j5wkF
 /zYW3ANcpCRWGxXoxu5ImOPLw7QROjsqxITwi99PbBzbRfM4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 26 Mar 2026 10:08:53 +0000, Richard Fitzgerald wrote:
> ASoC: wm_adsp_fw_find_test: Fix missing NULL terminator on file name list

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: wm_adsp_fw_find_test: Fix missing NULL terminator on file name list
      https://git.kernel.org/broonie/sound/c/951a4e8589b3

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

