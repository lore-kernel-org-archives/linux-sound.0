Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E3C2F616B;
	Mon, 27 Apr 2026 10:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285272; cv=none; b=j6bkymciUxsWQF/nGhl/dS5TPiE3xxMvbRCHAziyPCNCvviIdcFGSMlLyPQxzJLX2Yv7ihlIXvvvU/ZD1JMpleQX6RjVI5QflTt2t8gddIq7isjjtPf9afA1FzfMCq4nVteLq5tA6+9Ip6i/xZcXRMuYRUCuoBEPsSCZsR6gTR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285272; c=relaxed/simple;
	bh=JEEK1PlEd4r3bMKfMiyyL2guGTqwy8ijppuUu/cUNAs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FYbvki59RwGjtoaFToKQfRmDo5c009pVwXzaSUeI1mCwaFSGYYqeot+t7VgQbturDxI2FwKWHnU+2hBICQxy4YWE+dDoOvReCew6jZ0DyX/9imS22V7l/dtINCZNs+D1FufK55Fwrbo0bEGk2yvP27KvWeUJsJq9+S0e2xt0Uf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkrTXkLj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkrTXkLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63C2C19425;
	Mon, 27 Apr 2026 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285272;
	bh=JEEK1PlEd4r3bMKfMiyyL2guGTqwy8ijppuUu/cUNAs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=WkrTXkLjQjX3XUuiiEHpKGV1+RZbjcc6p6/MX9rb7bVOVdIa+kkieLUlExPA+RHvu
	 AP5kekKssYe9SZn8ZKLjoGfnIqZoT7a+CYyMpAeSk9mtyLFyt1dlM6ZkRPKQnGS5rm
	 Z4v+2QClxq+wo+gw3foi8KpR+oEPcyN7tZDyFK0coXkRuAmaX+pKDTjySxlTex5VE7
	 RHagdbpoVRijO8vLniILGJZ52hGUZnK+CoGMJe8kjwn9KHq5yddze3ilAjgkAwgPc7
	 L9GfJ7SD+K8LVPDU92GVMDda8y0F73uee6PZ6+tM0OLaP10TtAfIKi20nSopEb6/hO
	 srdTQIRju35Bw==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Ma <aaron.ma@canonical.com>
In-Reply-To: <20260423101338.1040131-1-aaron.ma@canonical.com>
References: <20260423101338.1040131-1-aaron.ma@canonical.com>
Subject: Re: [PATCH] ASoC: rt722-sdca: add FU06 Playback Switch for speaker
 mute control
Message-Id: <177724578496.266775.11546935048323593545.b4-ty@b4>
Date: Mon, 27 Apr 2026 08:23:04 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JEEK1PlEd4r3bMKfMiyyL2guGTqwy8ijppuUu/cUNAs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7ziV145rTeHPb9JxK8ke2CW+igupCXm0Ws/zR
 AHLpdyY712JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae84lQAKCRAk1otyXVSH
 0CEnB/0ZnxOOTAqsYEPoaavhoMnnYvUZd7pIVDCrdIA+wkepT+AsyYem7NEmkpfeOO1Xp9QbgBl
 tRVpkr0+qnGvq6myI8ZPFxaNdYA2YnBxAwF9stiiZh0kdhy7etjWDB2XF5hBAigElzHHDjRU52u
 v1fmk6FStyBb3vh8l4YU0fwxo321ZIFJhsG4Lz9+ZHHJFXJzq66fYlBxzQay2ggHDM+S9zHpjLu
 Zb+Q+oytTONEybimXB0bqCs08Yp8Uovh7iBrIpV5re6XsUqzJ14QVYuO5NLXy2NYyFEO7VWpH8D
 tz6pJXBFkT6k2wSraGc23fkwkMbOh/W8OlUIaQW+No74QwDh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 23 Apr 2026 18:13:38 +0800, Aaron Ma wrote:
> ASoC: rt722-sdca: add FU06 Playback Switch for speaker mute control

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rt722-sdca: add FU06 Playback Switch for speaker mute control
      https://git.kernel.org/broonie/sound/c/bda41dd5e1dd

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

