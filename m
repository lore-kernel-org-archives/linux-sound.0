Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155D43B2AA;
	Tue, 24 Mar 2026 00:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311095; cv=none; b=lMxKnw4sVuoyOWzk0jKHYi5GWl8QF1bUN4kqNA02WrDZiUpyqNEj7uvwthLN0nDDOH6ItO0TQ1uLK789BukRYW7VJrL8TlIOf/tMqqNHLH6w3S3g1a+7vUhUPLwk7cjko7cvgaLzf9/kxJwKMP8jpo2x22DecHVDK3oXEfXBrFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311095; c=relaxed/simple;
	bh=aDhS18/ooBwJxSQKZf126K/JE08/oc/XX13srDAwido=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u8g0/MNXqtz/KgQV35UDbWUqmcfEtLu0YlDsX5eW9BvUN8Td4/gPOWipFcgyRiogVKKJQ6u8PptkS9AMwsptER8JGtHKcNcJrNDpNnWk9UNz2W8EPxLKLXuTiatgAppDAmS2W+mfeEdEd/MvtvrbSNg6d446r0y1UVNoSdOkrG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNL6cZbs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNL6cZbs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D945C4CEF7;
	Tue, 24 Mar 2026 00:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311094;
	bh=aDhS18/ooBwJxSQKZf126K/JE08/oc/XX13srDAwido=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=TNL6cZbsJ0QHJdGIAdx/bFDKVlTB4LAdSFA0GN9iuNiI1R+L5M3BpDcCg98nqwo37
	 VrZSsun4JfzYkS1g2skvnui0gQO3eMcCaDfKy2F3bdKP+BNGPifAlhHgvl7RHvH2RG
	 F+V+sClh/22WkEn2HMAyXiWKJiRTPwq2hK2JloQ9mu7HJtRDjh3ZVgPsVm7naTBhm6
	 4H/dc4J4yQsJKepk4r3OJ6K4V6tDzu43LelHm1n5a0aA6az9SjkvMiWmJDbbsKMoqu
	 dXSIqnrZeVGVBMOSN6Utfr0qsBisyPYUFVfn8SPfbK8hbowqk5c0rt68wuFLiixIop
	 2EG+praUDWGOg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
In-Reply-To: <20260323175604.19315-1-ben.dooks@codethink.co.uk>
References: <20260323175604.19315-1-ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v3] ASoC: soc-topology: fix __le32 conversion in
 printed values
Message-Id: <177429434223.757727.10404862807665975679.b4-ty@b4>
Date: Mon, 23 Mar 2026 19:32:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aDhS18/ooBwJxSQKZf126K/JE08/oc/XX13srDAwido=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwda0YQU0Ogqa98q4E2BIvZlgkIkbjlzwwMQJ8
 3gd2FS2OfSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHWtAAKCRAk1otyXVSH
 0CMAB/9PIQtXANbJMp7U9D23jYiWov3zeZXIaualPzqxDbFYJ4nuX5i7Q8+8O6LsdagC236d4OX
 akB7q50Rvv487TczSZpbnUtvkXSYq4QN2Yc91+ciQu9jjIqh3ALrjQPQAR+01JR4wimoQr8Nh3/
 HiZfx0W7FgZjvXZEIEIGvIP3cYVyji9oHdiDq251QVi3qwKpbIo4ZLsDph46sQZOGafibI/Hs76
 UrCE7Ts5K7CtJjpg++8pGsTDK8KYuvT274X2y0e4S1BcrM33xvxQJMCae3BzKNU2v03BuQIVlPB
 T7Mgqwbk3s54+qS2GngvSn+Ty3xsoLXyn35cyj8knt2NFAFz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 23 Mar 2026 17:56:04 +0000, Ben Dooks wrote:
> ASoC: soc-topology: fix __le32 conversion in printed values

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: soc-topology: fix __le32 conversion in printed values
      https://git.kernel.org/broonie/sound/c/1001b4735137

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

