Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD593D902C
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644765; cv=none; b=eRTJG+iTeaUjd7lKD9mCPi9DrDxHKxP4cKsd7U7kBfTzzt8QxaMPK5B8f6OlMKp7K5KhtER/XMpyVPi/kRn16eXRKXBESjeqh1q7Kzyl+TC6UeS3DNAF7/OQm3zefGnLI3VnYgkW1JC2IN1sgaPLnRDHZ6bR0YUgnG8UZvIpD8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644765; c=relaxed/simple;
	bh=Nd9sxNtQbnAXN3g/zg0Cf9U0J8273RD9FzJvIm6RvYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YuQD4bUrZII+k+7vfYk9QuFgv8FsVP43BEVsNoiKIn1W8E4wdmo/nglGCu7L1d7AGYaZHcYV/3SgPPEJw1IIZLFLmOZoLDx3TFvrf86DM2yt07G20NCWd7hocHKIEVI6q1/byOcs72Qal5Ft8xiJTGlkLAKEGLQRNB/oIINwIHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5KzEeZN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5KzEeZN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25AA1F00893;
	Thu, 17 Sep 2026 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644763;
	bh=kWk515TMgCitR9Jnhdh5FizV/JbHPu6vtUCIOtnDYZ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=U5KzEeZNYFZUHxq7mkEtx45Zmcya6f1gP3f0PCTxTgE+FSGMV5Xy2i1CKj79+SMdw
	 rBfCOiJ9CZJxmDb235mgrOUyv9Yih3qQszKqxv5LvHBrNRYuctdriC4EFN8SFYJimm
	 ifu4Ip/LmnlRAoKYyi1wv4WsfS9lgM2l1q4ekkN+S9sJeOr5YbGAyRsXJlBUUUmD4e
	 BKNWkKycXmI+J9iWjYT7I5PeS/EvswCA5YaCPGxRyDT6summ5RC3apdjjDnj0ez21x
	 oucUgq+GgubRSIPFpCpLKIbynoU+U8h7I/f3cot376aX0zCLZczIh/yA7R+dF+v/hY
	 uF8Hn1EpVmwyA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 shumingf@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260916101803.2301508-1-oder_chiou@realtek.com>
References: <20260916101803.2301508-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt721: Reset codec to fix abnormal sound
Message-Id: <178958542375.100121.10281934755916297289.b4-ty@b4>
Date: Wed, 16 Sep 2026 20:03:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Nd9sxNtQbnAXN3g/zg0Cf9U0J8273RD9FzJvIm6RvYk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqq8/XVxw/d1YkyTlkKp8GynoYr3iLVEHhdCSx7
 AZxstdXNieJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqvP1wAKCRAk1otyXVSH
 0A4NB/91zlqKpABwQ8nkjmLV4AnovAy3F18eg3WFhWUSyE/lWL51CU/HT88/2At4fIyBxW9zKXo
 W3YIreE+9cqYIq5mP9RtauhXdFD1dm8cJxEua6w7cVuP/uhKWEBKySu7ZPqRPF8j0sUGSn6szfB
 ns1Xbv99gUpz1GwsYZaq0q4YnNjJgnQqvTwj51VSMfNvROmo5UUn+jMbp2NZiNHcx56Xx3Z0Oop
 EonG400WywoBYs/rhlqKD6Gd6EJKxNcc9dE1GnDbGI9BK26pE95Qx8qv/0NhIsK35Cyvo3+XW/C
 WeCpudy9p4Ky+nP3Mn01cxCVp5cG8AAKrh51FZAtBu7wJmZB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 16 Sep 2026 18:18:03 +0800, Oder Chiou wrote:
> ASoC: rt721: Reset codec to fix abnormal sound

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: rt721: Reset codec to fix abnormal sound
      https://git.kernel.org/broonie/sound/c/a5e22cba3549

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

