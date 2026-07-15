Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0D83B7B76
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 11:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201900; cv=none; b=mH3MWFFONgem4u42UX067AdgOF62izZxNXf87wYophrKEn5BiwpyT1SnQGuk4z7ASkoWd8m3bm4ySyiIdaQashIjj/GbG5LqhXL7WNJ5TGrZlXJSQqG1Na2QHa7r2+986adNNggiy0fqOsahM2R58oULAxclu04Rp6g65tPc8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201900; c=relaxed/simple;
	bh=F+PG077YbPFNmrnxWZFS0CZTL60bwO2r/pbZ3mFSx2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WFbOw91fF1l4CJHN4aeo3UYoK106fR5zNU0w6NtFW1VOB7Pl2xGf0WBgpNDv/EQ7Xf6UMomsug3G4Kcn5gRwCdG0A9jinaB7NBo129rWISTQPaBYsu5slrdKuYcIh/cJrSPJiJ6llIpSs3ug8a9THjeQgpk8NS1pxnBlK6M7Nog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QrcxVPLE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QrcxVPLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9B41F000E9;
	Thu, 16 Jul 2026 11:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784201897;
	bh=CAkkmpSUixE/5H6AnJGqwehpWsBpfkcJOfeJRymtW8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QrcxVPLE9hqQ2iiUgxnkl1AybTfcVb94HHu+9wjV8/x8QLSxVTtCrR8rQipPQ0L0N
	 efnxdfZCPf9sHxaGAnlWA9bYraGwMUOYdD6ek45HwMLYVts0RwmMhn9z8hysGqhdhr
	 h7IHapaqBHC8o/gPwKUoBfKmzvNM8gOY57T5VbE6pTlw9AXDKe9KnjrjRRnH0bLT73
	 P6LogdKqMeNDzsaeLPakkHFgO2gk1XZeeBnVK+4WIo+CSDWo+XZgOs+0jc43nwh+Un
	 BgYpQOoTcWg0pk4pvxhNnGnhHxABK49zNLpIhsNInE9awoSg//KiO1OIASf677QB6d
	 0Gqkn6xyCXdkw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <87zezt0zlw.wl-kuninori.morimoto.gx@renesas.com>
References: <87zezt0zlw.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: generic: Card name parsing should be called
 after xxx_for_each_link()
Message-Id: <178413874802.5968.10520110910320829521.b4-ty@b4>
Date: Wed, 15 Jul 2026 19:05:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=broonie@kernel.org;
 h=from:subject:message-id; bh=F+PG077YbPFNmrnxWZFS0CZTL60bwO2r/pbZ3mFSx2w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqWMKnwlZCHG0O5YOqfXobFp0yhawIyb5/E6cIw
 GuJIUxr6FuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaljCpwAKCRAk1otyXVSH
 0D9WB/9sL3XjCCDGlQh0Mj94j+9KEUvZGSDRIIpUlF+6sXfj33r3Ux5CnMVe1jPBhltcwbvKIgP
 Fh5pfCC7oLiFpdxNTyEkrW0dF6/MS/q1ADrp6bLlmtzP4/24G8aiTl22pp0f9Z3eoUIz5O0Gpdp
 R9V6s+iNH0Pn0e+NKmoaNIVlA0BKo6z3JRDnYCzKdfA4+7FERXWhzhgUSshJQfuhdemlBAnKC4G
 XA3x9lrVEOchZ91hQ4N2KmkfePuSqUjg/3xsjcS2372uBQVNzfecsfQTaBVjTB1Wah5sounAbJL
 IG9/gYW/gCY3DfKSkZ9cJLlQHvrOSDglN/YFysdF4Z6AYQn3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 15 Jul 2026 02:13:15 +0000, Kuninori Morimoto wrote:
> ASoC: generic: Card name parsing should be called after xxx_for_each_link()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: generic: Card name parsing should be called after xxx_for_each_link()
      https://git.kernel.org/broonie/sound/c/73080a7976ed

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

