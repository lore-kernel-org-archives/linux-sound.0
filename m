Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EDD42DFEA
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 21:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784064274; cv=none; b=sWh6fCjWL4Y0jWTJZth9eApa2T6oZVNrEBhZc6XytlwjI+3mW5Mp2DDVZP/WvRd0qwHAilu4jXTPOL8aXGan0JLALduPM3QY9xBRha2/Wa/KqMC8beT/68gXSK4ze0ZJBKRYfrB6dUcahDs1Zp2tbO4bRktoHxwqQGTYYMy8jJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784064274; c=relaxed/simple;
	bh=cxQDbqSFXQqBLNYXKx1eEcQFXhIxLCGx95c4x7j9Cjw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=APTvUdQxbaWbZ1QuFxvpEBHrx0A23Z2Pfp3VHqx5ZlvgzUG6frYmEi9OFidGpHhnH7z1PuXK4PKcqrznbSHSCT2sm0aSDB/zfXglToxWMr6Y2GByl0vqfJdRuTIABTYl8wDSBYsSxv/hbpDeM+o9duFcFshFLTw68EY4zKsWR94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtXXgqEw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtXXgqEw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1086F1F000E9;
	Tue, 14 Jul 2026 21:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784064273;
	bh=M0U8I7lyLi1CHdIYgwYFkKZ6iayUIelMSnxAv1cUSh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TtXXgqEwewOC0ny0c+7ZDyyMAFJpSaMO5bq/FeIEH6OGkxQGz1SPe4OvcUjARrHI8
	 /EgFGos0uDNYo0153YoEU0ZZzmacDjdua5lo6RiaREuv9PPIPpol0sMRDOODlEXzsl
	 X79iFt139ZGEpcEYXvmHCzWLbR8w2WgOmKh2hoA01prq05XZghZwoWYJqOVzl/XmTd
	 EDvYNoExovB7tlUhb5ZFBwc82Tq6uz7W0R2k9f5KmS8KhQCUp8PE1RSf2ma0K1oTLm
	 nUJuEB/npSC2cChm/C7A40e5GUHdt1VNv3NwhfNdY4UF7e6JJh7/MjEIM762F9oh2W
	 rkhPXKm7wYV5w==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260713084650.4138172-1-yung-chuan.liao@linux.intel.com>
References: <20260713084650.4138172-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ASoC: SOF: Intel: reset spib_addr in stream
 cleanup
Message-Id: <178396945376.7914.15561296176529484172.b4-ty@b4>
Date: Mon, 13 Jul 2026 20:04:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cxQDbqSFXQqBLNYXKx1eEcQFXhIxLCGx95c4x7j9Cjw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVqkPbk42Qe6876hv3uMzbl90P9bwIllO3+7sM
 GIdGHdro5WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalapDwAKCRAk1otyXVSH
 0LwuB/9GxV//zObtsDhs0J9l3kvnAqXn9/QWDD21AeELdL1kYm7WOnsJrm7O7anf/Zo0lOOFUJS
 sqxzg1CpfjnBQ/Uof7cg3vFvm1EK9zUJ9svUzlqHx857qCqGs10AabPrMiXsKR9geg1gmWNm0wO
 bJ8sTyqV3FOCBCFMOqolvBWiwCd5Es1+fuPt+KiFWAR5fZ3WjWOm39nV2ePLyg0e3tp/zNeJgeV
 UfcsKBQ0OwDHEK1ECEPButJLwk4lrDN6TaTZhUOJfRmF0QIIMEZ01gORS3ANZKwvKqMG+NTIDm2
 KQbEXtf7UlFxvT027KUCwmBP7GD4crgO0EYtezM47ma/D+Ht
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 13 Jul 2026 16:46:48 +0800, Bard Liao wrote:
> ASoC: SOF: Intel: reset spib_addr in stream cleanup
> 
> The spib_addr register indicates the current position in the buffer
> being processed by the host software to the host DMA. It must be reset
> before being disabled. Also, add the missing disable call in
> hda_data_stream_cleanup().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: SOF: Intel: reset spib_addr before disabling SPIB
      https://git.kernel.org/broonie/sound/c/552d9559cae2
[2/2] ASoC: SOF: Intel: Disable SPIB in non ICCMAX stream
      https://git.kernel.org/broonie/sound/c/0507d956c4ce

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

