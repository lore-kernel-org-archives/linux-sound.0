Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024517;
	b=smtmd85LbAj5+3Z4sK9yzP23uhFgEriPNJtjaE/07BvgTp6PLzmGCVghb/C8cdu/yI/6
	 P1VEob+md/cz0UjEySf4bOt0GCx+CLR2Wy5Y1lshIYTCarfvRle2BKyAzk1bHMpkGPBL/
	 TnD0but6cbmab5sn569sJMRaqgrdiLMvnhj8jc9V4FfYr02BS44FWuiF8N1woMA6/KVzr
	 noE3Hk7QkLc5kdpef0/CtYGmY8voeyjiSxtWYQ7xM8DR1X/lxTuVpHfgtrlHp5aADuM0w
	 a2qXbfJ4gyeaoKQNc+wnJziHRzU3rCwLA44wXkYpxJjVG3UzygtHxoiKnyI1TjpQTPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024517;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=I+R69OX+YtJ1apcUeZndnlxtFbAMqW4naUJ3p3r/QEc=;
	b=MPi97Z/hjfqSejP8xWUUG/RvoRhDqcTMFEhPTNQj9HC5NC7/X3wmirVKDJV2wZM9NCd/
	 CCaVLPoI8LLw0+rHp+OJLcDWFMtnHxWHDThAcPjmYkkVOOQIw+1J7ctrxFv6fqmN0m8Y5
	 T/qpVk9L3Ky3AGvts9LdhiVNSYUkBloPRa6V3FCNMot1BFKYBkQekKfzioWLBGR0rByAk
	 l4mnMQ31ITalwO3WscfOu0O1hp1EinOplDHi9aiZWFmpeagYGZY3jYsb2eDTQeGuCDspA
	 qb6oD8c1dIdCpuagJub7eYj2U2nISefbuFyt6bZMbXziA09V4Faw9jAHnW0xNHwQJ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uo7tQmZu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A30606A320;
	Wed, 18 Nov 2026 17:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uo7tQmZu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D141F000C5;
	Wed, 18 Nov 2026 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795024517;
	bh=I+R69OX+YtJ1apcUeZndnlxtFbAMqW4naUJ3p3r/QEc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Uo7tQmZu1J3LNF1xCdtwd22kwxLGELB4ljR5I106/1Vw03Kw0vCl8w5C/QpZHQeIn
	 WnDWOllbIyxPZg5m+QHuSqz+irhcPvAgOCqYiGhfflrBaUOKxP3Z6fo4+EC8RNEZBh
	 g0R1CvRBlb5IdIGcscPwNd9zrXNEBF4Jwxo6xBA6RE9Z7vvfcOC0jY9cw+EynRjLae
	 cNxBnGnbUEAkYPyNJ8UZzO6Cjdc70e73TNgSR+cqhMM1JdOYY3mCAC+qhst+s0hc62
	 QIK2vkSfy1w5qo5NCuqMTGLF8k+Hu992EeIHvT5fdaJsIhd+w4/dcIGv9xrrqF+NuS
	 XXVdxeY8DGWRQ==
From: Mark Brown <broonie@kernel.org>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <4E11793720037898+20261117062253.3611273-1-tuhaowen@uniontech.com>
References: <4E11793720037898+20261117062253.3611273-1-tuhaowen@uniontech.com>
Subject: Re: [PATCH] ASoC: ak4375: Power off the codec on probe failure
Message-Id: <179502451028.349622.2399521834730740812.b4-ty@b4>
Date: Wed, 18 Nov 2026 17:55:10 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3TK6sjDW33zp5h40SDFba9+9yHkU3VFMvyVr6hn2cmk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+Pmv6m7J3ecXnh4lycwLiGZ7oyb1Ut8w+q9IV86f6Y
 HCZvJ1uRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbyOISRYWI5n7B9UsbPoNuL
 lycZ3Yr0vBwe8DVY58d6/Zu+PQk+XUAV3BVh2av21epMUGF+olgRP3vLb9ujJfPDZk9//fHTeR8
 +AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 17 Nov 2026 14:22:53 +0800, Haowen Tu wrote:
> ASoC: ak4375: Power off the codec on probe failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: ak4375: Power off the codec on probe failure
      https://git.kernel.org/broonie/sound/c/723fd896e486

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

