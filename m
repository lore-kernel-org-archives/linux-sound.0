Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086AC42377F;
	Wed, 12 Aug 2026 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529777; cv=none; b=HUNB8setZLuZQxXrnO/LJJWtbs8Y8J3lwaT79zRJGQ2fK3Ui/vGGOwJfWMfUYYP0tvboCtG3NrkHLDEd17HVAd+xnyOpbn9N3MfM+LIQiF+qreBWVdVDlAKbviwyJ8bpxD7eu7fVDG0nEaxFodQClgWJwbbQYHqeejau8oWOX6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529777; c=relaxed/simple;
	bh=28dgqgU6Mrn4iZrK0fHEdRR5qr1SAlvZ0sMBk5h45Gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FtG7qt7kxkc7ZXTLx5pFUCQxReFwr23IETHdRkEZCmfA2YbqqDRuB7ECq2vsWJANgit+HGoKx4xnQy9afpah1WGtZDjbXXqeXAOVhr1XWVOpMh9OqaYqSUyWYCtXkh9n0rSXItFBFPK9zVgo09J504ukdQeab2cFT3v/ea6KY4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1UHxS5z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1UHxS5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785B01F000E9;
	Wed, 12 Aug 2026 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786529774;
	bh=QSgsid+8hez1eXzeSA9Zg8D1TtPMJ8doQmZ2Cl+Bqeg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=a1UHxS5z5jBxxOCToXSw/QHvnbJU9YwoVJEdoUtaEcB9L+kzgEdgWT6P+bkB5CCQA
	 vnOk2lzFyr0j1jq4PDi/QIkhGzKEQY7PgXMgXy+AVTClzXgBxSKHtV1KsZNxWt4fnl
	 HfLgTOdDeZYV/YwehPH/oAx8OEDZW2gwt2MyVghVVJ0lOqUgMciWT+XJfHHtaad6It
	 djhw1eWzuk7B1+mG7CPRHGMyT7u724HQemuGoL+0zijYap6sGVDHjfzUMDNrP3S883
	 gB1kKEMEbteheMVjNnNrDQEZYJB6k354ur0tcipiqY5tQA+iFPylAKZ4+z5W66TCMW
	 VGsv6JkZstgeA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>, 
 Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260811185140.27149-1-rosenp@gmail.com>
References: <20260811185140.27149-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: fix stream_data leak on
 open error
Message-Id: <178648611303.430562.12738113248939857735.b4-ty@b4>
Date: Tue, 11 Aug 2026 23:08:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=28dgqgU6Mrn4iZrK0fHEdRR5qr1SAlvZ0sMBk5h45Gs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfEfrafuyKo+gdgT58s5KrWBhp2GVgPWiOpLFP
 5jWMxE+Ed2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanxH6wAKCRAk1otyXVSH
 0FfKB/9EH90hFGb4K9i6lKctJukLbBq/4T20chqUaLH7koaWlMwBj5GIDSLkvgqKlXivoQJ6N4i
 W4gXOtXEF4v+ZNDbugZqLUMcDlbjdGV1/KKzcP+0N6kgADKEsGplM5MxM3HKVsvR18sGl4hcpT8
 S8VYMr8/JpyXtwEMNRip5x56xX/vsqOyYMqzTLvEHhtEszddbARC97PdF6rDT5VTYWC8N83knjW
 ZMhJL/ZMsvUaBUre1p8Zh8h7t+Oo4/F07vEieGEXFztb2Ugjfk4Otf7ft3KggXtVSGwitCKzzt+
 34+8L7dPsYcSqkTAGyJfkMg94lXhupKXgFDBk5aweyvpHrg/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 11 Aug 2026 11:51:40 -0700, Rosen Penev wrote:
> ASoC: xilinx: formatter_pcm: fix stream_data leak on open error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: xilinx: formatter_pcm: fix stream_data leak on open error
      https://git.kernel.org/broonie/sound/c/b992511180e1

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

