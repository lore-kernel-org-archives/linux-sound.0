Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35793FE65F;
	Mon, 27 Jul 2026 22:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192909; cv=none; b=fzRROLgqUVG2KfQ5vf+/UsR5B/BkHDTDTaIL+Z5LoNwWYSy4ceMg6sfR+sPmla6RvlIU0oqfRbvD/cU6DkLVibrDQrPUmRlpVklBkYCHZ/C40pWXotQiPiRsZ4IvnJa9SUYaYGlkc8ADs8uLKwfSxkju1+++D8RIVylwJWfwrgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192909; c=relaxed/simple;
	bh=sEsBQ7OrcQr0EUeJExtF8+z5iUjPhUvZqZzIiG/2tGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B72c8TIqgd0xy7yAdJcOPLD1T9BA7d3+mYvjJ2/OnV65UmbazBKpEG0kbflvf0pl/ZFo8SgOpbIglcfghneNocKNbAajwbthHl81EBu2d0PbUurfJX9er00YjjZk09yG7qruYXF7qqQb4kM/dXjV8wVUQ2n8iRu0ZfsLSDS/jQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctZGkzTd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctZGkzTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DDD1F000E9;
	Mon, 27 Jul 2026 22:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192908;
	bh=R+0zo2sKEMbTOn867f8yUqajPeiSFMK0gWhNzhNsYPI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ctZGkzTdE7MMi/Ps7xla3bKKy3tzlev38pmGEUMEtbEtaSD/afjap5nY5BImh0Ogh
	 ayfoZEnY0g4bIApQGOSwSqUC9WCMVHgCypHdRiHD7kpvBv9AMQ7pnmr/DPBwC8bBR5
	 xC2OvpWNLnWYe4dz2NfOKF5eS5U3AzOmg5ZlRPa/8dIxPjlPJRflEDED3x9Bzit+kJ
	 oVDKB1k3jYdSqhvJVOJQY1D0kbMvDL1qeViVpnvUvo500Pu8Q3EnfiY2yanBrT+1xL
	 af+XmrfKVOOsNgJVDxurBs5tJRJ/rjdRdol8+HYBmRDDIynhD9JsM1LacI2+QYOFY+
	 eiSvGIGhg3Hrw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, shumingf@realtek.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260721143636.361814-1-ckeepax@opensource.cirrus.com>
References: <20260721143636.361814-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 0/7] Fix races on creation of SDCA jack detection
Message-Id: <178517447302.50339.1499803314056469107.b4-ty@b4>
Date: Mon, 27 Jul 2026 18:47:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sEsBQ7OrcQr0EUeJExtF8+z5iUjPhUvZqZzIiG/2tGM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqZ+HKLXcdaSRmyIVCEEmxsRNxh2C30MxKYAKqw
 VtqRcvPg2qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamfhygAKCRAk1otyXVSH
 0H+CB/91A+POnZNrCsLc0AokXXnK4Zu32nKA2J7m7iZBM6kC+48YkaRetkrEHpHPrAPDLqG/PYF
 wwAagcNA69i8nDW+8rHKMVWML4wUT3q9ym/2v4ha3ugFD/fQ4kJsaxnEnwn0FQ3/4ozvGaQ3NdU
 R8YkGVTuM2v3lfIhkwxwlPS0WrT8QcTNV3kGMVDCM4FpkOEdyyItCCJwjkOmVykOjOFHVQvLQXC
 XgURMMKOjilhAO1S2SwzD1js0qrPK+BA3dfVhPtLVnEQC3uFgwtwCCyb8J527cIi2uH7tsoarnZ
 y3cwSSbTcURlesDJJiYmq4LpbSuU0n0cxkeUNdgj/A6fae5q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Jul 2026 15:36:29 +0100, Charles Keepax wrote:
> Fix races on creation of SDCA jack detection
> 
> Currently there exists a couple races that can result in the DAPM graph
> coming up in a state that doesn't match the hardware with respect to
> SDCA jack detection. This series fixes these up by adding a component
> level fixup_controls helper into the asoc core and shuffling around the
> IRQ requests from the SDCA side.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/7] ASoC: SDCA: Rename sdca_irq_allocate() to include devm
      https://git.kernel.org/broonie/sound/c/4ecef577d1ce
[2/7] ASoC: SDCA: Add sdca_irq_cleanup_late()
      https://git.kernel.org/broonie/sound/c/f18e97fa7f12
[3/7] ASoC: SDCA: Remove devm from primary IRQ cleanup
      https://git.kernel.org/broonie/sound/c/0880082c27b6
[4/7] ASoC: SDCA: Populate IRQ data earlier
      https://git.kernel.org/broonie/sound/c/050406cbd676
[5/7] ASoC: Add a component fixup_controls callback
      https://git.kernel.org/broonie/sound/c/3e81e2fb2163
[6/7] ASoC: SDCA: Switch to fixup_controls callback for IRQ registration
      https://git.kernel.org/broonie/sound/c/b8f71f16134f
[7/7] ASoC: SDCA: Move kcontrol search out of IRQ
      https://git.kernel.org/broonie/sound/c/bf1b7821f853

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

