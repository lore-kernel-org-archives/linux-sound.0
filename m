Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2273B261B91;
	Tue, 28 Apr 2026 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362322; cv=none; b=gSlDGtzkasGy6IF5wyB4eLBMy8YYVWDGIBkZRReD9QIL4WPpwfXYvfZUHbiB8HnI7abQyCG7s3AgnhBMdGOzsol63M8lhXR+gK7WBWG5OeVLOMbvEIaRwOpRaG5WCBVJ3pewTayVml8D/rM0qKHaLeonb65oRQjFLSBPLM6F00Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362322; c=relaxed/simple;
	bh=hdbyEibUGH5nkNGUnYk0Kv8G3DFcy2ag89mrqT+Sa/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=do1znDAl2E8jhbes3ywEtlnU0pjIWAkfVkWdDqWR5nZFjIyzlvKUdYd/5+BvF/F/JdiK5/RCvBS2rV91aQztNwykAnh4ZnqbiYUw33zYdsbn4a+hjiOvZ93tDxAh4ljDhxOrrzPuo7d/7KxNnFoNpgF6VnGYILHuDjrCEcUhyDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGBapTGL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGBapTGL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A304C2BCB7;
	Tue, 28 Apr 2026 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362321;
	bh=hdbyEibUGH5nkNGUnYk0Kv8G3DFcy2ag89mrqT+Sa/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QGBapTGLOZoqt3cIb6vYbJ1tzxVyX/UJ4bI80+KUqKjJHdx1fXc7GD8M4BYA5nwsq
	 xn25bearoWFqsiubBwfZjW5JEfrBm+C7Tz3jR9HeGWhrpAjjs0Z4ovZHSx0FWPtbg4
	 Uma0ufk7t8rcF7QJzmKHbEnbbpYlhYEVYzyO5COtKae5ENJkCPlNEffOcHlcFrm1nU
	 Y3T5bO8n28gsFPdzzBvhADqOzNJr4uFLY1X1LgZpmLtyI2E5Gdz2LNxclIf66vnPFn
	 xl5ROZ2LkHfPEfV7IHztiRh6nadbG51Q9Bk1LD6ZRfEC16k5MTXzrZryLDSrfCs8em
	 eRWWhTYDHvyNA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, wangdicheng@kylinos.cn, wangdich9700@163.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260428023408.46420-1-wangdich9700@163.com>
References: <20260428023408.46420-1-wangdich9700@163.com>
Subject: Re: [PATCH v2] ASoC: aw88395: Fix kernel panic caused by invalid
 GPIO error pointer
Message-Id: <177734763806.324244.6566863339252941601.b4-ty@b4>
Date: Tue, 28 Apr 2026 12:40:38 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hdbyEibUGH5nkNGUnYk0Kv8G3DFcy2ag89mrqT+Sa/o=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhswPqf1sC23lNxZdTt8oGhR7KrjGcL9IjsLt5WJflshKv
 7/RlCHeyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBMpNqJ/Z+Z/D6HnJrlZb+P
 6N20cN/II7CwllvrW6zHRsnrLLm6OzICOSZellbeb7tu5zSz5gzmezXn3kx6eshkXRX/8SxluWW
 qBofOfZ8YFFGrdrOve0qDOt8ah+vry+sepAhOmGESt41lhkhbX6fF5kSJ/Vkrp0puNPWarcgmuV
 mdrc3Z/OqHJa8XJb5neSs8S7oyuWKyaVrQb6kWKUM/q+jwuyk3Hp1K7dOJWdP9uqxj8+HzK9Q+c
 qxi8VPkbti26WuOrrvaqlf3/PYr1Pa5Tbzmesv/LJNh6FVf5xPRjOU9nxlkEl0TKouEwwsW2q4N
 WSV9+cljlQscK7hqtK7ssq8L6rm5i8nZremL7lwPWebzAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 28 Apr 2026 10:34:08 +0800, wangdich9700@163.com wrote:
> ASoC: aw88395: Fix kernel panic caused by invalid GPIO error pointer

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: aw88395: Fix kernel panic caused by invalid GPIO error pointer
      https://git.kernel.org/broonie/sound/c/241ee17ecb6b

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

