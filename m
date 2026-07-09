Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560741CB57;
	Fri, 10 Jul 2026 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684113; cv=none; b=UFCNA6fNJkyW74qEA9ebIJFNEbLGrJOkukyzICy+hpKh9eIOKrY8uZDUG5e0ukQbgJx4UK3OOYEYQFRu5lThkTIe3wld2HqgCeTfegd1bWGTK/RZRLYZtQnNsctfYMkNawbhiV5Gw5pJ3qFUPDoG2X/JTJUsYYMUFNKPkDVasYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684113; c=relaxed/simple;
	bh=5iCV04m5JdiVZTIsQ+X37ZgC4ojqKKp9WVuad+cCls8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=utAmVzlVMnk3B0OLBne74Bx28aXcBmV8OYKMIaynxFh5HpmmdF4qI90NWEEHfRoi6L1Z5llx790EHhMbFKMKY4oDsvaFTJA+1/MZwKPrEe/oVZ6UuS1KonWttIxF+EMdn40vj71Il3jkmdPt8nSdSA8BjXOBeiZLKJj2Pi0H9L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uv+L1nK4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uv+L1nK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49FE1F00AC4;
	Fri, 10 Jul 2026 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684104;
	bh=kIXYwGJ1rOhL0/zIjaTiWhDSEv6J/6/lC5/5kTE5/Z4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Uv+L1nK4FeDHUdr1qAHMk4RaypOYwDSQEh1z5Zu/xFXaT+jFrR4BY6RvxupPsfi6n
	 yL6Vy1EkIsGWnp980w6b/w7P7vY7v/667PgmxpNZVydXcvqyUaVFDifnra58sSbx0Q
	 h9NWDjT0Kw0VbEpGMEAMT8SbrMzlkCytJrTnccktOCns5JHWFtsV+q7nNT93cHuSqP
	 5L1nbFAP0eUl4I0FZaVq6PCtnK19Dy8QIbaWm13qUVrSGwoKZw6roYZOSeRo5gHw6E
	 C7MoId9t1oHbGufkBKuuKU9BNwL/xibKnPZfnTJFKziCvmfRbExnEUkahxrohlkSJv
	 Rh/rl/dhsdOzg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704072347.76000-1-pengpeng@iscas.ac.cn>
References: <20260704072347.76000-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: wcd939x-sdw: Propagate regcache_sync()
 errors
Message-Id: <178361263263.100558.10753000002601774337.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:57:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5iCV04m5JdiVZTIsQ+X37ZgC4ojqKKp9WVuad+cCls8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNwFNulPbGU/gJKSl6R1WZWmi2/Lmpkyx4iRc
 mq9N8eKcG2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDcBQAKCRAk1otyXVSH
 0LipB/9HFO9FGf3mUW2wkA9pBWGzXvrs6T66s+vMvEGccOQw8Ziyt5j9r/lxxGkn/I01H1k5Btt
 C664XQ6prJ6M4Lzz4N8RrNdM6Y3i+rGvohysk45aBZOjNLXFdm7g/o4LZjE36mOcC5z2b+xvXHS
 tPptuEK0+yESUb+RkoiCKFwM1a/mhFyi1HTUpVu5oaeEta2w4CjopQqyVf39uU231A5fCCrJ/BC
 qgitOqFKE5umPWjtWXtxlFgaUmSJI2vi02JP+IkiBUFBpUunZRRgRrhLlhK94nR1U3MfJtbNG2y
 taCrWTE3Yt0Tn7zu/96mK8FCQtmI7Z6xK1vzOPnWbBFV9qEB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:23:47 +0800, Pengpeng Hou wrote:
> ASoC: codecs: wcd939x-sdw: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: wcd939x-sdw: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/495d266f67f4

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

