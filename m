Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523236;
	b=oX/nLLcKbRA7mAPZtrM/XLh1Mhz8sJWHJ+lYbLXhnlDbQR+i2hXoJsn7J8BYl2+0MCQh
	 /dV7GGMUi4SkzZ5Bb+DYZC2BT6a6+3wjSLAMhtJ0oXAvOVdtUojrw2qohnLp1qDsJ9k/8
	 MdZJvyDvZbaGqxnNQ0wAJxxaGHAep/Wv41Q3A826pYYG//CIQn+m6CKpcrtFu8NJ7pkkU
	 OLe/WRzY5VnokPSlTde5S9Y9l4nfCSRer2bwwWp4Vf9PgIz1dfAuKHHRyTuYe2+7ChQnR
	 t5LDO9v+ypg0VP/u+TpHI5u6Mm+gtS1F2RJ9IiR9apMyJ3EH6OhP2Ck7s46U05Wvzxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523236;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lXl8o5kpnBe/pp1M4QfO9+h+qR1fGwayCzOVxqkQD4Y=;
	b=R+5rAVkKVanChi60fGD6+1ManKJRSPzDNq6h4JVBodukm2HDmTBaG19UUeDJzO74kvil
	 wBeX+QOyeM7ienm1E05t9j+a/JTZkqC2/Fu+JxSeeIJvCcZ5J4b+MwF/loSdTSGhEL92c
	 ka1Su/07K4Bq9jG91SdTXDCRiX7aoSMpBoCYcKlwjP/fbvj6yrkP2thAOy+K9HT8DJNZz
	 UCyiRa3J5r9KOu92Txsed1bF5w9isfYJE8Z/1oedZoSkDnalhfqk5fevo8ffGXpjPsAVu
	 6sXwZVw1M3sa5wnkdQXWge4GQZ59FrXxdhkMbL9BLfUG3aXT313qqiZ6pYEp+WBPDaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvVmsL7O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D91606A31E;
	Tue, 24 Nov 2026 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvVmsL7O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4721F000C0;
	Tue, 24 Nov 2026 12:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523235;
	bh=lXl8o5kpnBe/pp1M4QfO9+h+qR1fGwayCzOVxqkQD4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NvVmsL7Oc7MkyxHEkgC5gH6ZmGiGP6WozWdLkRd6DKpzsFy1Ifqx81Kxut02E87SY
	 wc7oVN4XeBbb9ZYXhwx+KjSi9/klICjFSG4iiZg3enUGNOdhyQkVeUqFWJwYzC4+uR
	 gbQF/EJg6y3XokQ4hIUNWem1rXhqXsgFhgFlGWC3GnyjBRhJvWlx1Rfx38Fz6Gu9Gi
	 oho3sg6QQannapzYj3maG3GLMrz6GFAcfkWEtWnIWd4RJ57XLoDKQgVeHLXVo6YTiZ
	 HcGXqqXe8Io54GIcZ44+PMbkC5XPmrmH6h2PGpwWfkPZowCboRjVjtqLh87oVhEkAs
	 ztH0S0tc12C6A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 HyeongJun An <sammiee5311@gmail.com>, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118103129.113970-1-kapoorarnav43@gmail.com>
References: <20261118103129.113970-1-kapoorarnav43@gmail.com>
Subject: Re: [PATCH v2] ASoC: SOF: control: reject out-of-range enum values
Message-Id: <179545991797.25092.9609763117589963291.b4-ty@b4>
Date: Mon, 23 Nov 2026 18:51:57 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H/GVdDLfsC8xzGGk1kRDYKyF65OlEKIi35y9aeyh170=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZm+b/ifo2Za6yYUtaStkJraBNdQ4T4va+EA1+aiLqr
 1N5ac3rjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExEcCXDP4OsS90yZ5j+i3Ly
 pPXc81RYZnKpIzNUOOsOw+u3NxPOWzIyLI+ZMPk/u2KD9M03lYsLzvtt+mB08WLv88MzHOOTpFs
 sOQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 16:01:27 +0530, Arnav Kapoor wrote:
> ASoC: SOF: control: reject out-of-range enum values

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: SOF: control: reject out-of-range enum values
      https://git.kernel.org/broonie/sound/c/3092b9e481fe

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

